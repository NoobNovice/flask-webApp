from flask import Flask, request, redirect, url_for, render_template, session, send_file # web provider
# from datetime import date  # time stamp use service app
from flask_modus import Modus  # methods provider
from flaskext.mysql import MySQL  # datebase
from functools import wraps
import calendar;
import time;
import os

# web config
app = Flask(__name__)
app.config['MYSQL_DATABASE_HOST'] = '127.0.0.1'  #real '35.240.227.205'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'mysql_db'
modus = Modus(app)
mysql = MySQL()
mysql.init_app(app)
app.secret_key = os.urandom(24)  #use in session
dir_path = os.getcwd()

def auth_required(f):
    @wraps(f)
    def user_activate(*args, **kwargs):
        if 'user' in session:
            return f(*args, **kwargs)
        return redirect(url_for('login'))
    return user_activate

@app.route('/')
def default_page():
    return redirect(url_for('login'))

@app.route('/login')
def login():
    session.pop('user', None)
    return render_template('login.html')

@app.route('/authentication', methods=["GET", "POST"])
def authen():
    if request.method == "POST":
        con = mysql.connect()
        cur = con.cursor()
        cur.execute("SELECT * FROM system_admin WHERE username=%s AND password=%s",
                    (request.form["user"], request.form["pass"]))
        user = cur.fetchone()
        cur.close()
        if  user != None:
            session['user'] = request.form["user"]
            return redirect(url_for('index'))
    return redirect(url_for('login'))

@app.route('/index')
@auth_required
def index():
    return render_template('index.html')

#============================================R chat_log table=============================================
@app.route('/chatLog', methods=["GET", "POST"])
@auth_required
def chatlog():
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM chat_log")
    log_table = cur.fetchall()
    cur.close()
    return render_template('chatlog.html', logs = log_table)

@app.route('/chatLog_info<int:id>', methods=["GET", "POST"])
@auth_required
def chatlog_info(id):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM chat_log WHERE log_id=%s",(id))
    row = cur.fetchone()
    cur.close()
    return render_template('chatlog_info.html', log = row)

@app.route('/chatLog_empty', methods=["GET","POST"])
@auth_required
def chatlog_empty():
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("TRUNCATE TABLE chat_log")
    cur.close()
    return redirect(url_for('chatlog'))

@app.route('/chatLog_export', methods=["GET", "POST"])
@auth_required
def chatlog_export():
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM chat_log")
    row = cur.fetchall()
    cur.close()

    ts = calendar.timegm(time.gmtime())
    log_file = open(dir_path + "/chatLog{}.txt".format(ts), "w", encoding='utf-8')
    for i in row:
        log_file.write(",".join(str(x) for x in i)+"\n")
    log_file.close()
    return send_file(dir_path + "/chatLog{}.txt".format(ts), as_attachment=True)

#========================================CURD restaurant_info table=========================================
@app.route('/restaurant', methods=["GET", "POST"])
@auth_required
def restaurant_index():
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM restaurant_info")
    restaurant_table = cur.fetchall()
    cur.close()
    return render_template('restaurant.html', restaurants = restaurant_table)

@app.route('/restaurant.info<int:id>', methods=["GET", "POST"])
@auth_required
def restaurant_info(id):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM restaurant_info WHERE id=%s", (id))
    row = cur.fetchone()
    cur.execute("SELECT * FROM restaurant_tag WHERE restaurant_id=%s", (id))
    tag = cur.fetchall()
    cur.execute("SELECT * FROM recommend_menu WHERE restaurant_id=%s", (id))
    menu = cur.fetchall()
    cur.close()
    return render_template('restaurant_info.html', restaurant= row, tag = tag, menu=menu)

@app.route('/restaurant.delete<int:id>', methods=["GET", "POST"])
@auth_required
def restaurant_delete(id):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("DELETE FROM restaurant_info WHERE id=%s", (id))
    con.commit()
    cur.close()
    return redirect(url_for('restaurant_index'))

@app.route('/restaurant.create', methods=["GET", "POST"])
@auth_required
def restaurant_create():
    return render_template('restaurant_create.html')

@app.route('/restaurant.create_commit', methods=["GET", "POST"])
@auth_required
def restaurant_commitcreate():
    if request.method == "POST":
        name = request.form['name']
        price = request.form['price']
        time = request.form['time']
        contact = request.form['contact']
        address = request.form['address']
        score = request.form['score']
        con = mysql.connect()
        cur = con.cursor()
        cur.execute("INSERT INTO restaurant_info(name, price, time, contact, address, score) VALUES(%s, %s, %s, %s, %s, %s)", 
                   (name, price, time, contact, address, score))
        con.commit()
        cur.execute("SELECT * FROM restaurant_info WHERE address=%s", (request.form['address']))
        row = cur.fetchone()
        cur.execute("SELECT * FROM restaurant_tag WHERE restaurant_id=%s", (row[0]))
        tag = cur.fetchall()
        cur.execute("SELECT * FROM recommend_menu WHERE restaurant_id=%s", (row[0]))
        menu = cur.fetchall()
        cur.close()
    return render_template('restaurant_info.html', restaurant= row, tag = tag, menu=menu)

@app.route('/restaurant.edit<int:id>', methods=["GET", "POST"])
@auth_required
def restaurant_edit(id):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM restaurant_info WHERE id=%s", (id))
    row = cur.fetchone()
    cur.close()
    return render_template('restaurant_edit.html', restaurant = row)

@app.route('/restaurant.edit<int:id>_commit', methods=["GET", "PATCH", "POST"])
@auth_required
def restaurant_commitedit(id):
    con = mysql.connect()
    cur = con.cursor()
    if request.method == b'PATCH':
        name = request.form['name']
        price = request.form['price']
        time = request.form['time']
        contact = request.form['contact']
        address = request.form['address']
        score = request.form['score']
        cur.execute ("UPDATE restaurant_info SET name=%s, price=%s, time=%s, contact=%s, address=%s, score=%s WHERE id=%s",
                    (name, price, time, contact, address, score, id))
        con.commit()
        cur.close()
    return redirect(url_for('restaurant_index'))

@app.route('/restaurant.addTag<int:id>_commit', methods=["GET, POST", "PATCH"])
@auth_required
def restaurant_addtag(id):
    if request.method == b'PATCH':
        con = mysql.connect()
        cur = con.cursor()
        cur.execute("INSERT INTO restaurant_tag(restaurant_id, tag) VALUES(%s, %s)", 
                    (id, request.form["tag"]))
        con.commit()
        cur.close()
    return restaurant_info(id)

@app.route('/restaurant.addMenu<int:id>_commit', methods=["GET, POST", "PATCH"])
@auth_required
def restaurant_addmenu(id):
    if request.method == b'PATCH':
        con = mysql.connect()
        cur = con.cursor()
        cur.execute("INSERT INTO recommend_menu(restaurant_id, menu) VALUES(%s, %s)", 
                    (id, request.form["menu"]))
        con.commit()
        cur.close()
    return restaurant_info(id)

@app.route('/restaurant.deleteMenu<int:id><menu>', methods=["GET", "POST"])
@auth_required
def menu_delete(id, menu):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("DELETE FROM recommend_menu WHERE menu=%s AND restaurant_id=%s", (menu, id))
    con.commit()
    cur.close()
    return restaurant_info(id)

@app.route('/restaurant.deleteTag<int:id><tag>', methods=["GET", "POST"])
@auth_required
def tag_delete(id, tag):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("DELETE FROM restaurant_tag WHERE tag=%s AND restaurant_id=%s", (tag, id))
    con.commit()
    cur.close()
    return restaurant_info(id)
#========================================RD system_question table=========================================
@app.route('/sysQuestion.index', methods=["GET", "POST"])
@auth_required
def question_index():
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM system_question")
    question_table = cur.fetchall()
    cur.close()
    return render_template('question.html', questions=question_table)

@app.route('/sysQuestion.delete<int:id>', methods=["GET", "POST"])
@auth_required
def question_delete(id):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("DELETE FROM system_question WHERE question_id=%s", (id))
    con.commit()
    cur.close()
    return redirect(url_for('question_index'))

#========================================RD User table=========================================
@app.route('/user.index', methods=["GET", "POST"])
@auth_required
def user_index():
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM user")
    user_table = cur.fetchall()
    cur.close()
    return render_template('user.html', users = user_table)

@app.route('/user.info<uid>', methods=["GET", "POST"])
@auth_required
def user_info(uid):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM user WHERE user_id=%s", (uid))
    row = cur.fetchone()
    cur.close()
    return render_template('user_info.html', user = row)

#========================================CURD template_sentence table=========================================
@app.route('/template_sentence.index', methods=["GET","POST"])
@auth_required
def sentence_index():
    con = mysql.connect()
    cur = con.cursor()
    if request.method == "POST":
        question_type = request.form['question_type']
        sentence = request.form['sentence']
        cur.execute("INSERT INTO template_sentence(question_type, sentence) VALUES(%s, %s)", 
                   (question_type, sentence))
        con.commit()
    cur.execute("SELECT * FROM template_sentence")
    template_table = cur.fetchall()
    cur.close()
    return render_template('sentence.html', templates = template_table)

@app.route('/template_sentence.delete<int:id>', methods=["GET", "POST"])
@auth_required
def sentence_delete(id):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("DELETE FROM template_sentence WHERE sentence_id=%s", (id))
    con.commit()
    cur.close()
    return redirect(url_for('sentence_index'))

@app.route('/template_sentence.create', methods=["GET", "POST"])
@auth_required
def sentence_create():
    return render_template('sentence_create.html')

@app.route('/template_sentence.edit<int:id>', methods=["GET", "POST"])
@auth_required
def sentence_edit(id):
    con = mysql.connect()
    cur = con.cursor()
    cur.execute("SELECT * FROM template_sentence WHERE sentence_id=%s", (id))
    row = cur.fetchone()
    cur.close()
    return render_template('sentence_edit.html', template = row)

@app.route('/template_sentence.edit<int:id>_commit', methods=["GET", "PATCH", "POST"])
@auth_required
def sentence_commitedit(id):
    con = mysql.connect()
    cur = con.cursor()
    if request.method == b'PATCH':
        question_type = request.form['question_type']
        sentence = request.form['sentence']
        cur.execute ("UPDATE template_sentence SET question_type=%s, sentence=%s WHERE sentence_id=%s",
                    (question_type, sentence, id))
        con.commit()
        cur.close()
    return redirect(url_for('sentence_index'))

if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 81)
    
