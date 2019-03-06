-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2019 at 05:06 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mysql_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_log`
--

CREATE TABLE `chat_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_question` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sys_answer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sys_question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `report` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recommend_menu`
--

CREATE TABLE `recommend_menu` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_info`
--

CREATE TABLE `restaurant_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_info`
--

INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(1, 'ส้มตำอุดร ซอยทานตะวัน', '100-250', 'ทุกวัน 09.00-21.00', '053-222-865', 'https://www.google.com/maps/dir//18.781850653789633,99.03052266687155/@18.781850653789633,99.03052266687155?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(2, 'Karin & Shor\'s Dining and Ice-cream House', '100-250', 'ทุกวัน 08.00-21.30', '080-995-4557', 'https://www.google.com/maps/dir//18.749158992624523,99.06444447763874/@18.749158992624523,99.06444447763874?', 4.3);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(3, 'มีนา', '250-500', 'จันทร์และอังคาร 10.00-17.00 พฤหัสบดีและอาทิตย์ 10.00-17.00', '095-693-9586‬ หรือ 087-177-0523', 'https://www.google.com/maps/dir//18.784864563631338,99.04597567274527/@18.784864563631338,99.04597567274527?', 4.2);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(4, 'ผาลาดตะวันรอน', '250-500', 'ทุกวัน 11.30-23.59', '053-216-576', 'https://www.google.com/maps/dir//18.80072898725521,98.94207132754332/@18.80072898725521,98.94207132754332?', 3.6);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(5, 'ดาราเทวี เค้กช็อป สันกำแพง', '100-250 ', 'ทุกวัน 10.00-20.00', '053-888-834', 'https://www.google.com/maps/dir//18.778809289201806,99.03901669842526/@18.778809289201806,99.03901669842526?', 4.3);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(6, 'โซฟูโตะครีม หลัง มช.', '100-205', 'ทุกวัน 11.00-23.00', '062-172-2270', 'https://www.google.com/maps/dir//18.792324956908086,98.95621956502964/@18.792324956908086,98.95621956502964?', 4.2);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(7, 'บ้านเปี่ยมสุข', '100-250', 'ทุกวัน 9.30-18.30', '085-525-0752 หรือ 085-708-8988', 'https://www.google.com/maps/dir//18.792780763867842,99.00186024606228/@18.792780763867842,99.00186024606228?', 4.3);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(8, 'นครา จาร์แด็ง', '100-250', 'จันทร์อังคาร 11.00-19.00 และพฤหัสบดี-อาทิตย์ 11.00-19.00', '061-337-06466 หรือ 053-818-977', 'https://www.google.com/maps/dir//18.779389788446622,99.00564238161473/@18.779389788446622,99.00564238161473?', 4.4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(9, 'ชีวิต ชีวา ศิริมังคลาจารย์ ซอย 7', '100-250', 'ทุกวัน 10.00-22.00', '092-626-9965 หรือ 085-362-9461', 'https://www.google.com/maps/dir//18.79526642939376,98.97114361838533/@18.79526642939376,98.97114361838533?', 4.2);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(10, 'โอ้กะจู๋ หนองจ๊อม', '250-500', 'ทุกวัน 9.00-21.00', '081-980-2416 หรือ 052-080-744', 'https://www.google.com/maps/dir//18.84068,99.024654/@18.84068,99.024654?', 4.4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(11, 'โอ้กะจู๋ นิมมาน', '250-500', 'ทุกวัน 9.00-21.30', '092-268-6639 หรือ 052-080-744', 'https://www.google.com/maps/dir//18.772440055438285,98.97818689814756/@18.772440055438285,98.97818689814756?', 4.4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(12, 'ริสเทรตโต้ นิมมาน ซอย3', 'ไม่ถึง 100', 'ทุกวัน 7.00-18.00', '062-692-4264 หรือ 053-215-278', 'https://www.google.com/maps/dir//18.799143795505003,98.967129072999/@18.799143795505003,98.967129072999?', 4.4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(15, 'ชุ่ม อาหารพื้นเมือง', '100-250', 'ทุกวัน 10.00-15.00 และ 17.00-22.00', '099-291-1911 หรือ 053-106-530', 'https://www.google.com/maps/dir//18.722825,99.008354/@18.722825,99.008354?', 4.7);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(16, 'ไอเบอร์รี่', '100-250', 'ทุกวัน 10.30-22.00', '053-895-171 หรือ 053-895-181', 'https://www.google.com/maps/dir//18.794245216047962,98.9693372380982/@18.794245216047962,98.9693372380982?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(17, 'ต๋อง เต็ม โต๊ะ', '100-250', 'ทุกวัน 7.00-21.00', '053-894-701', 'https://www.google.com/maps/dir//18.796569060100587,98.96775663558196/@18.796569060100587,98.96775663558196?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(18, 'ร๊อค มี', '100-250', 'ทุกวัน 11.30-23.59', '063-895-2456 หรือ 589-852-8801', 'https://www.google.com/maps/dir//18.784904112314294,98.99452311656762/@18.784904112314294,98.99452311656762?', 4.3);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(19, 'เดอะ โวคาโน่', '100-250', 'ทุกวัน 11.00-23.00', '062-172-2270 หรือ 062-172-2205', 'https://www.google.com/maps/dir//18.792177042175602,98.95607344907376/@18.792177042175602,98.95607344907376?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(20, 'คั่วไก่นิมมาน', 'ไม่ถึง 100', 'ทุกวัน 9.00-21.00', '082-180-1177 หรือ 053-218-278', 'https://www.google.com/maps/dir//18.794280764816005,98.96941586871719/@18.794280764816005,98.96941586871719?', 3.6);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(21, 'ฮ้านถึงเจียงใหม่', '100-250', 'ทุกวัน 9.00-20.30', '091-076-6100 หรือ 090-984-3033', 'https://www.google.com/maps/dir//18.789022014215234,98.95478446441803/@18.789022014215234,98.95478446441803?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(22, 'ก๋วยเตี๋ยวอัญชัน', 'ไม่ถึง 100', 'ทุกวัน 8.00-16.00', '084-949-2828', 'https://www.google.com/maps/dir//18.794292862630243,98.97256348282099/@18.794292862630243,98.97256348282099?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(23, 'เทนโกกุ', '500-1000', 'ทุกวัน 11.00-14.00 และ 17.30-22.00', '053-850-111', 'https://www.google.com/maps/dir//18.77851661441496,99.03951560061171/@18.77851661441496,99.03951560061171?', 4.3);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(24, 'ก๋วยเตี๋ยวหลุดโลก', '100-250', 'ทุกวัน 10.00-21.00', '088-978-7996 หรือ 086-541-6646', 'https://www.google.com/maps/dir//18.79341862737214,98.97135572883599/@18.79341862737214,98.97135572883599?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(25, 'แบร์ฮัก คาเฟ่', '100-250', 'จันทร์อังคาร 9.00-18.00 และ พฤาัสบดีถึงอาทิตย์ 9.00-18.00', '053-206-555', 'https://www.google.com/maps/dir//18.782918144318,98.9933643490076/@18.782918144318,98.9933643490076?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(26, 'ข้าวซอยลำดวน', 'ไม่ถึง 100', 'ทุกวัน 8.00-17.00', '053-243-519 หรือ 083-156-1916', 'https://www.google.com/maps/dir//18.801657,99.005531/@18.801657,99.005531?', 3.5);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(27, 'เฮือนเพ็ญ', '100-250', 'ทุกวัน 8.30-15.30', '053-277-103 หรือ 053-814-548', 'https://www.google.com/maps/dir//18.785871686492587,98.98515079999993/@18.785871686492587,98.98515079999993?', 3.6);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(28, 'ก๋วยจั๊บช้างม่อยตัดใหม่', 'ไม่ถึง 100', 'ทุกวัน 10.00-17.00', '053-251-451', 'https://www.google.com/maps/dir//18.78993,98.998797/@18.78993,98.998797?', 3.8);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(29, 'ช้างม่อยกาแฟ', 'ไม่ถึง 100', 'ทุกวัน 10.00-14.30', '053-211-343', 'https://www.google.com/maps/dir//18.790710969386105,98.98956533521412/@18.790710969386105,98.98956533521412?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(30, 'ข้าวซอยอิสลาม', 'ไม่ถึง 100', 'ทุกวัน 8.00-17.00', '053-271-484', 'https://www.google.com/maps/dir//18.786630977963934,99.00216098874807/@18.786630977963934,99.00216098874807?', 3.8);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(31, 'วิกุลพานิช', 'ไม่ถึง 100', 'ทุกวัน 8.00-17.00', '053-241-930', 'https://www.google.com/maps/dir//18.787081797118958,99.00795702943037/@18.787081797118958,99.00795702943037?', 4.1);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(32, 'เลิศรส', '250-500', 'ทุกวัน 11.00-14.00 และ 17.00-21.00', '053-872-092', 'https://www.google.com/maps/dir//18.80802236788428,99.00313089999997/@18.80802236788428,99.00313089999997?', 4.2);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(33, 'ข้าวซอยป้าไพ', 'ไม่ถึง 100', 'ทุกวัน 9.00-15.00', '053-260-929', 'https://www.google.com/maps/dir//18.790914,99.007169/@18.790914,99.007169?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(34, 'ก๋วยเตี๋ยวแดงโอชา', 'ไม่ถึง 100', 'ทุกวัน 7.00-16.00', '053-302-492', 'https://www.google.com/maps/dir//18.786277629094926,99.0087120294304/@18.786277629094926,99.0087120294304?', 3.7);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(35, 'มาม่าฟ้าธานี', 'ไม่ถึง 100', 'ทุกวัน 16.30-2.00', '081-111-5751', 'https://www.google.com/maps/dir//18.803392,98.976203/@18.803392,98.976203?', 3.8);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(36, 'หมูสะเต๊ะช้างม่อย', 'ไม่ถึง 100', 'จันทร์ถึงเสาร์ 9.00-17.00', '081-992-9301', 'https://www.google.com/maps/dir//18.789825,98.99878/@18.789825,98.99878?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(37, 'หยกฟ้าโภชนา', 'ไม่ถึง 100', 'ทุกวัน 10.00-21.30', '053-210-594', 'https://www.google.com/maps/dir//18.79172666683631,98.99003237485884/@18.79172666683631,98.99003237485884?', 3.6);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(38, 'ก๋วยเตี๋ยวเกษมเจ้าเก่า', 'ไม่ถึง 100', 'ทุกวัน 8.00-16.00', '053-252-394', 'https://www.google.com/maps/dir//18.79082,98.996624/@18.79082,98.996624?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(39, 'ข้าวซอยแม่มณี', 'ไม่ถึง 100', 'ทุกวัน 9.00-15.30', '053-218-519 หรือ 081-961-2235', 'https://www.google.com/maps/dir//18.836199949895843,98.97766873240471/@18.836199949895843,98.97766873240471?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(40, 'ช.โภชนา', 'ไม่ถึง 100', 'ทุกวัน 7.00-15.00', '053-213-076', 'https://www.google.com/maps/dir//18.79511175175721,98.99078104645015/@18.79511175175721,98.99078104645015?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(41, 'ถนอมโภชนา', '100-250', 'ทุกวัน 17.30-20.00', '-', 'https://www.google.com/maps/dir//18.788628,98.993672/@18.788628,98.993672?', 4.2);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(42, 'โบ๊ต เบเกอรี่', 'ไม่ถึง 100', 'ทุกวัน 7.00-20.00', '053-222-934', 'https://www.google.com/maps/dir//18.80701413828693,98.95698498251488/@18.80701413828693,98.95698498251488?', 3.6);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(43, 'จิวเยาวราช', '250-500', 'อังคารถึงอาทิตย์ 11.00-21.00', '062-235-9422', 'https://www.google.com/maps/dir//18.783025,99.028027/@18.783025,99.028027?', 3.8);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(44, 'เกียรติโอชา', 'ไม่ถึง 100', 'ทุกวัน 6.00-14.00', '053-213-959', 'https://www.google.com/maps/dir//18.7897091780089,98.98638334722136/@18.7897091780089,98.98638334722136?', 3.4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(45, 'ไก่ทอดเที่ยงคืน', '100-250', 'จันทร์ถึงเสาร์ 22.00-5.00', '089-433-0813', 'https://www.google.com/maps/dir//18.780055157647986,98.99812972883603/@18.780055157647986,98.99812972883603?', 3.7);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(46, 'ลูกชิ้นทอดลุงสวน', 'ไม่ถึง 100', 'จันทร์ถึงเสาร์ 9.00-18.00', '081-796-8412', 'https://www.google.com/maps/dir//18.797682,99.00496/@18.797682,99.00496?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(47, 'ช.สเต๊ก', '100-250', 'ทุกวัน 10.30-20.30', '053-894-381', 'https://www.google.com/maps/dir//18.796371078331923,98.97601826591256/@18.796371078331923,98.97601826591256?', 4.1);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(48, 'ธนาโอชา', 'ไม่ถึง 100', 'ทุกวัน 9.00-17.00', '086-917-6252 หรือ 053-232-423', 'https://www.google.com/maps/dir//18.791062,98.998238/@18.791062,98.998238?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(49, 'ไอศครีมมะพร้าวน้ำหอม สามกษัตริย์', 'ไม่ถึง 100', 'ทุกวัน 8.00-17.00', '089-434-9955', 'https://www.google.com/maps/dir//18.789754,98.986619/@18.789754,98.986619?', 4.1);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(50, 'โจ๊กสมเพชร', 'ไม่ถึง 100', 'ทุกวัน 0.00-23.59', '053-210-649', 'https://www.google.com/maps/dir//18.79513090284545,98.9897777460327/@18.79513090284545,98.9897777460327?', 3.3);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(51, 'ซัน โทริ', 'จันทร์ 11.00-14.00', 'ทุกวัน 11.00-14.00 และ 17.30-22.00 ยกเว้น อังคารที่ไม่เปิดตอนเย็น', '087-023-8898', 'https://www.google.com/maps/dir//18.796480049468197,98.98396119475365/@18.796480049468197,98.98396119475365?', 4.5);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(52, 'ลาบต้นข่อย', '100-250', 'ทุกวัน 11.00-14.00', '081-765-2424', 'https://www.google.com/maps/dir//18.832985158411276,99.05694138525007/@18.832985158411276,99.05694138525007?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(53, 'ขนมจีนสันป่าข่อย', 'ไม่ถึง 100', 'จันทร์ถึงเสาร์ 15.00-3.00', '089-192-3023', 'https://www.google.com/maps/dir//18.78579849439098,99.00856929695897/@18.78579849439098,99.00856929695897?', 3.9);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(54, 'ทับทิมกรอบเจ๊อ้วน', 'ไม่ถึง 100', 'ทุกวัน 10.00-22.30', '053-272-493 หรือ 053-821-094', 'https://www.google.com/maps/dir//18.781343848500597,99.00187253372951/@18.781343848500597,99.00187253372951?', 3.8);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(55, 'กาแล', '250-500', 'ทุกวัน 10.00-22.00', '083-328-455 หรือ 080-497-7979', 'https://www.google.com/maps/dir//18.793380058946244,98.94566211904908/@18.793380058946244,98.94566211904908?', 3.8);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(56, 'ฟิน ฟาร์ม', '100-250', 'ทุกวัน 11.00-22.00', '064-041-5642 หรือ 087-178-1444', 'https://www.google.com/maps/dir//18.88905,99.015404/@18.88905,99.015404?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(57, 'ลานดิน คาเฟ่', 'ไม่ถึง 100', 'ทุกวัน 8.00-20.00', '063-365-3946', 'https://www.google.com/maps/dir//18.774518972777372,98.94682299345732/@18.774518972777372,98.94682299345732?', 3.3);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(58, 'Khaofang Dessert Café', '100-250', 'ทุกวัน 10.00-21.00', '089-559-5831', 'https://www.google.com/maps/dir//18.805819471347526,98.99044878780843/@18.805819471347526,98.99044878780843?', 4);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(59, 'ฟอรเรสเบ้ก', '100-250', 'จันทร์อังคาร 10.30-17.00 และศุกร์อาทิตย์ 10.30-17.00', '091-928-8436 หรือ 053-242-621', 'https://www.google.com/maps/dir//18.792279,99.00492/@18.792279,99.00492?', 3.8);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(60, 'เฟิร์นฟอเรส คาเฟ่', '100-250', 'ทุกวัน 8.30-20.30', '084-616-1144', 'https://www.google.com/maps/dir//18.79337938393546,98.98202732205391/@18.79337938393546,98.98202732205391?', 4.1);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(61, 'เชฟพอล', '100-250', 'ทุกวัน 7.30-22.00', '080-392-9743', 'https://www.google.com/maps/dir//18.796921863472736,98.9678531885147/@18.796921863472736,98.9678531885147?', 3.1);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(62, 'Doai Ji Korean Restaurant', '100-250', 'ทุกวัน 11.00-23.59', '086-187-5463', 'https://www.google.com/maps/dir//13.738038,100.557953/@13.738038,100.557953?', 3.8);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(63, 'เท็นเท็น', '250-500', 'ทุกวัน 9.00-22.00', '088-869-0000', 'https://www.google.com/maps/dir//18.781716,98.982423/@18.781716,98.982423?', 4.5);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(64, 'ก๋วยเตี๋ยวเป็ดธงชัยโภชนา', 'ไม่ถึง 100', 'ทุกวัน 7.00-13.30', '053-282-065', 'https://www.google.com/maps/dir//18.7811675578777,98.99826407432556/@18.7811675578777,98.99826407432556?', 3.2);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(65, 'ดงมาดาม', '100-250', 'จันทร์ 13.00-16.00 และ 18.00-20.30 พุธอาทิตย์ 13.00-16.00 และ 18.00-20.30', '083-575-1373', 'https://www.google.com/maps/dir//18.789411727955535,98.95362291534423/@18.789411727955535,98.95362291534423?', 4.3);
INSERT INTO `restaurant_info` (`id`, `name`, `price`, `time`, `contact`, `address`, `score`) VALUES(66, 'อีท ออน เอิร์ท', '100-250', 'ทุกวัน 11.30-23.30', '093-132-7222', 'https://www.google.com/maps/dir//18.828853917099437,99.02005101719669/@18.828853917099437,99.02005101719669?', 4.1);

-- --------------------------------------------------------

--
-- Table structure for table `system_admin`
--

CREATE TABLE `system_admin` (
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_admin`
--

INSERT INTO `system_admin` (`username`, `password`) VALUES('admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `system_question`
--

CREATE TABLE `system_question` (
  `question_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ask_count` int(11) NOT NULL,
  `answer_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `template_sentence`
--

CREATE TABLE `template_sentence` (
  `sentence_id` int(10) UNSIGNED NOT NULL,
  `question_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sentence` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ag_milk` tinyint(1) NOT NULL DEFAULT '0',
  `ag_seafood` tinyint(1) NOT NULL DEFAULT '0',
  `ag_egg` tinyint(1) NOT NULL DEFAULT '0',
  `ag_nuts` tinyint(1) NOT NULL DEFAULT '0',
  `vegetarian` tinyint(1) NOT NULL DEFAULT '0',
  `islamic` tinyint(1) NOT NULL DEFAULT '0',
  `menu_history` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `review_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_log`
--
ALTER TABLE `chat_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `recommend_menu`
--
ALTER TABLE `recommend_menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `restaurant_info`
--
ALTER TABLE `restaurant_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_admin`
--
ALTER TABLE `system_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `system_question`
--
ALTER TABLE `system_question`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `template_sentence`
--
ALTER TABLE `template_sentence`
  ADD PRIMARY KEY (`sentence_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_log`
--
ALTER TABLE `chat_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recommend_menu`
--
ALTER TABLE `recommend_menu`
  MODIFY `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_info`
--
ALTER TABLE `restaurant_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `template_sentence`
--
ALTER TABLE `template_sentence`
  MODIFY `sentence_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recommend_menu`
--
ALTER TABLE `recommend_menu`
  ADD CONSTRAINT `recommend_menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
