-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 06, 2010 at 03:30 PM
-- Server version: 5.1.37
-- PHP Version: 5.2.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bushfireconnect_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) DEFAULT NULL,
  `alert_code` varchar(30) DEFAULT NULL,
  `alert_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `alert_lat` varchar(150) DEFAULT NULL,
  `alert_lon` varchar(150) DEFAULT NULL,
  `alert_radius` tinyint(4) NOT NULL DEFAULT '20',
  `alert_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_alert_code` (`alert_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` VALUES(1, 1, '61415675807', '9ZWXEXY3', 0, '-36.74328605438', '144.28894042969', 20, NULL);
INSERT INTO `alert` VALUES(2, 1, '61431860751', '6FWJMKUF', 0, '-36.879620605027', '144.140625', 20, NULL);
INSERT INTO `alert` VALUES(3, 2, 'daniela.fernandez@gmail.com', '56wm71RU1lV5O8NPAOKf', 0, '-36.879620605027', '144.140625', 20, NULL);
INSERT INTO `alert` VALUES(4, 1, '61449559441', 'KTAASRX3', 0, '-36.710265426478', '144.27520751953', 20, NULL);
INSERT INTO `alert` VALUES(5, 2, 'daniela.fernandez@gmail.com', 'DlVpGDJds12ZEHeR563P', 0, '-36.710265426478', '144.27520751953', 20, NULL);
INSERT INTO `alert` VALUES(6, 1, '61400188267', 'EMWWH2SP', 0, '-36.771892444961', '144.404296875', 20, NULL);
INSERT INTO `alert` VALUES(7, 2, 'anthonyjoeyjo@gmail.com', 'Zg5p7PiSfaOrdL2nNrw6', 0, '-36.771892444961', '144.404296875', 20, NULL);
INSERT INTO `alert` VALUES(8, 1, '61415675807', 'KDURZMJE', 0, '-36.708063546476', '144.39605712891', 20, NULL);
INSERT INTO `alert` VALUES(9, 1, '61415675807', 'KZCS5Z92', 0, '-36.600094165941', '143.85772705079', 20, NULL);
INSERT INTO `alert` VALUES(10, 2, 'anthonyjoeyjo@gmail.com', '39YaGiTfB7Qx3lTXY108', 0, '-36.831271621407', '144.54711914062', 20, NULL);
INSERT INTO `alert` VALUES(11, 1, '61415675807', 'FCUUACX9', 0, '-36.769692332146', '144.41802978516', 20, NULL);
INSERT INTO `alert` VALUES(12, 1, '0415675807', 'N6XZVDYR', 0, '-36.879620605027', '144.140625', 20, NULL);
INSERT INTO `alert` VALUES(13, 1, '0415675807', '2LXU7MWR', 1, '-36.765291917117', '144.29992675781', 20, NULL);
INSERT INTO `alert` VALUES(14, 1, '0415675807', 'E5ZES55C', 0, '-36.710265426478', '144.11865234375', 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `alert_sent`
--

CREATE TABLE `alert_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `alert_sent`
--


-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `category_type` tinyint(4) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_color` varchar(20) DEFAULT NULL,
  `category_image` varchar(100) DEFAULT NULL,
  `category_image_shadow` varchar(100) DEFAULT NULL,
  `category_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `category_visible` (`category_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` VALUES(1, 7, 'en_US', 5, 'Fire Break Areas', 'Fire Break Areas', 'c9770c', 'category_1_1275795854.png', NULL, 1);
INSERT INTO `category` VALUES(2, 7, 'en_US', 5, 'Prescribed Burn Activity', 'Prescribed Burn Activity', 'f2c01b', 'category_2_1275788144.png', NULL, 1);
INSERT INTO `category` VALUES(3, 7, 'en_US', 5, 'High Risk Areas', 'High Risk Areas', 'ed8f2b', 'category_3_1275786069.png', NULL, 1);
INSERT INTO `category` VALUES(4, 0, 'en_US', 5, 'AUTHORITIES', 'AUTHORITIES', '0015ff', NULL, NULL, 1);
INSERT INTO `category` VALUES(5, 0, 'en_US', 5, 'EMERGENCY', 'EMERGENCY', 'ff0505', 'category_5_1275785812.png', NULL, 1);
INSERT INTO `category` VALUES(6, 7, 'en_US', 5, 'Places of Last Resort', 'Places of Last Resort', 'f5b767', 'category_6_1275788180.png', NULL, 1);
INSERT INTO `category` VALUES(7, 0, 'en_US', 5, 'PREPARATION', 'PREPARATION', 'fac644', NULL, NULL, 1);
INSERT INTO `category` VALUES(8, 5, 'en_US', 5, 'Fire Sightings', 'Fire Sightings', 'e03620', 'category_8_1275785900.png', NULL, 1);
INSERT INTO `category` VALUES(9, 4, 'en_US', 5, 'DSE', 'Department of Sustainability and Environment', '0de0e0', 'category_9_1275746204.png', NULL, 1);
INSERT INTO `category` VALUES(10, 5, 'en_US', NULL, 'Evacuation Alerts', 'Evacuation Alerts', 'e04a4a', 'category_10_1275785966.png', NULL, 1);
INSERT INTO `category` VALUES(11, 5, 'en_US', NULL, 'Road Closures', 'Road Closures', 'a13a9c', 'category_11_1275785985.png', NULL, 1);
INSERT INTO `category` VALUES(12, 4, 'en_US', NULL, 'BoM', 'Bureau of Meterology', '2151b8', 'category_12_1275784916.png', NULL, 1);
INSERT INTO `category` VALUES(13, 4, 'en_US', NULL, 'SES', 'State Emergency Services Victoria', '44a5f5', 'category_13_1275784943.png', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_lang`
--

CREATE TABLE `category_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `category_lang`
--


-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `city_lat` varchar(150) DEFAULT NULL,
  `city_lon` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=201 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` VALUES(101, 14, 'Canberra', '-35.2834624726481', '149.128074645996');
INSERT INTO `city` VALUES(102, 14, 'Perth', '-31.9333333', '115.8333333');
INSERT INTO `city` VALUES(103, 14, 'Adelaide', '-34.9333333', '138.6');
INSERT INTO `city` VALUES(104, 14, 'Sydney', '-33.8678499639382', '151.207323074341');
INSERT INTO `city` VALUES(105, 14, 'Melbourne', '-37.8139965641595', '144.963322877884');
INSERT INTO `city` VALUES(106, 14, 'Brisbane', '-27.4679357321901', '153.028092384338');
INSERT INTO `city` VALUES(107, 14, 'Darwin', '-12.4611336615902', '130.841846466064');
INSERT INTO `city` VALUES(108, 14, 'Canberra Capital Hill', '-35.3081212316951', '149.12446975708');
INSERT INTO `city` VALUES(109, 14, 'Newcastle', '-32.9271483615446', '151.776466369629');
INSERT INTO `city` VALUES(110, 14, 'Gold Coast', '-28.0', '153.4333333');
INSERT INTO `city` VALUES(111, 14, 'Wollongong', '-34.4333333', '150.8833333');
INSERT INTO `city` VALUES(112, 14, 'Cairns', '-16.9166667', '145.7666667');
INSERT INTO `city` VALUES(113, 14, 'Townsville', '-19.25', '146.8');
INSERT INTO `city` VALUES(114, 14, 'Geelong', '-38.1471125837516', '144.360694885254');
INSERT INTO `city` VALUES(115, 14, 'Hobart', '-42.9166667', '147.3333333');
INSERT INTO `city` VALUES(116, 14, 'Alice Springs', '-23.7', '133.8833333');
INSERT INTO `city` VALUES(117, 14, 'Albury', '-36.0833333', '146.9166667');
INSERT INTO `city` VALUES(118, 14, 'Mount Isa', '-20.7333333', '139.5');
INSERT INTO `city` VALUES(119, 14, 'Mandurah', '-32.55', '115.7');
INSERT INTO `city` VALUES(120, 14, 'Katherine', '-14.4666667', '132.2666667');
INSERT INTO `city` VALUES(121, 14, 'Fremantle', '-32.05', '115.7666667');
INSERT INTO `city` VALUES(122, 14, 'Toowoomba', '-27.55', '151.9666667');
INSERT INTO `city` VALUES(123, 14, 'Rockhampton', '-23.3833333', '150.5');
INSERT INTO `city` VALUES(124, 14, 'Mount Gambier', '-37.8333333', '140.7666667');
INSERT INTO `city` VALUES(125, 14, 'Mackay', '-21.15', '149.2');
INSERT INTO `city` VALUES(126, 14, 'Hamilton', '-37.75', '142.0333333');
INSERT INTO `city` VALUES(127, 14, 'Geelong West', '-38.1333333', '144.35');
INSERT INTO `city` VALUES(128, 14, 'Coffs Harbour', '-30.3', '153.1333333');
INSERT INTO `city` VALUES(129, 14, 'Broken Hill', '-31.95', '141.4333333');
INSERT INTO `city` VALUES(130, 14, 'Bendigo', '-36.7666667', '144.2833333');
INSERT INTO `city` VALUES(131, 14, 'Ballarat', '-37.5666667', '143.85');
INSERT INTO `city` VALUES(132, 14, 'North Shore', '-31.402369', '152.901853');
INSERT INTO `city` VALUES(133, 14, 'Logan City', '-27.639167', '153.109444');
INSERT INTO `city` VALUES(134, 14, 'Murray Bridge', '-35.1166667', '139.2666667');
INSERT INTO `city` VALUES(135, 14, 'Wagga', '-35.1166667', '147.3666667');
INSERT INTO `city` VALUES(136, 14, 'Taree', '-31.9', '152.4666667');
INSERT INTO `city` VALUES(137, 14, 'Surfers Paradise', '-28.0027377616665', '153.42999458313');
INSERT INTO `city` VALUES(138, 14, 'Nowra', '-34.8833333', '150.6');
INSERT INTO `city` VALUES(139, 14, 'Mount Druitt', '-33.7666667', '150.8166667');
INSERT INTO `city` VALUES(140, 14, 'Mooloolaba', '-26.6833333', '153.1166667');
INSERT INTO `city` VALUES(141, 14, 'Launceston', '-41.45', '147.1666667');
INSERT INTO `city` VALUES(142, 14, 'Jervis Bay Territory', '-35.1333333', '150.7');
INSERT INTO `city` VALUES(143, 14, 'Devonport', '-41.1666667', '146.35');
INSERT INTO `city` VALUES(144, 14, 'Batemans Bay', '-35.7166667', '150.1833333');
INSERT INTO `city` VALUES(145, 14, 'Armidale', '-30.5166667', '151.65');
INSERT INTO `city` VALUES(146, 14, 'Karratha', '-20.737652', '116.846294');
INSERT INTO `city` VALUES(147, 14, 'Wayville', '-34.95', '138.5833333');
INSERT INTO `city` VALUES(148, 14, 'Victor Harbour', '-35.5666667', '138.6166667');
INSERT INTO `city` VALUES(149, 14, 'Unley', '-34.95', '138.6');
INSERT INTO `city` VALUES(150, 14, 'Thebarton', '-34.9166667', '138.5666667');
INSERT INTO `city` VALUES(151, 14, 'South Perth', '-31.9833333', '115.8666667');
INSERT INTO `city` VALUES(152, 14, 'Port Lincoln', '-34.7333333', '135.8666667');
INSERT INTO `city` VALUES(153, 14, 'Plympton', '-34.95', '138.55');
INSERT INTO `city` VALUES(154, 14, 'Nhulunbuy', '-12.2333333', '136.7666667');
INSERT INTO `city` VALUES(155, 14, 'Kingscote', '-35.6666667', '137.6333333');
INSERT INTO `city` VALUES(156, 14, 'Kalgoorlie', '-30.75', '121.4666667');
INSERT INTO `city` VALUES(157, 14, 'Geraldton', '-28.7666667', '114.6');
INSERT INTO `city` VALUES(158, 14, 'Bunbury', '-33.3333333', '115.6333333');
INSERT INTO `city` VALUES(159, 14, 'Broome', '-17.9666667', '122.2333333');
INSERT INTO `city` VALUES(160, 14, 'Beaumont', '-34.9333333', '138.65');
INSERT INTO `city` VALUES(161, 14, 'Albany', '-35.0169444', '117.8916667');
INSERT INTO `city` VALUES(162, 14, 'Yeppoon', '-23.1333333', '150.7333333');
INSERT INTO `city` VALUES(163, 14, 'Tamworth', '-31.1', '150.9333333');
INSERT INTO `city` VALUES(164, 14, 'Singleton', '-32.5666667', '151.1833333');
INSERT INTO `city` VALUES(165, 14, 'Shepparton', '-36.3833333', '145.4');
INSERT INTO `city` VALUES(166, 14, 'Shellharbour', '-34.5833333', '150.8666667');
INSERT INTO `city` VALUES(167, 14, 'Sheffield', '-41.3833333', '146.3333333');
INSERT INTO `city` VALUES(168, 14, 'Sale', '-38.1', '147.0666667');
INSERT INTO `city` VALUES(169, 14, 'Queenstown', '-42.0833333', '145.55');
INSERT INTO `city` VALUES(170, 14, 'Queenscliff', '-38.2666667', '144.65');
INSERT INTO `city` VALUES(171, 14, 'Queanbeyan', '-35.35', '149.2333333');
INSERT INTO `city` VALUES(172, 14, 'Port Macquarie', '-31.4333333', '152.9166667');
INSERT INTO `city` VALUES(173, 14, 'Port Douglas', '-16.4833333', '145.4666667');
INSERT INTO `city` VALUES(174, 14, 'Orange', '-33.2833333', '149.1');
INSERT INTO `city` VALUES(175, 14, 'Nelson Bay', '-32.7166667', '152.15');
INSERT INTO `city` VALUES(176, 14, 'Naracoorte', '-36.9578481109552', '140.738296508789');
INSERT INTO `city` VALUES(177, 14, 'Nambour', '-26.6333333', '152.95');
INSERT INTO `city` VALUES(178, 14, 'Muswellbrook', '-32.2666667', '150.9');
INSERT INTO `city` VALUES(179, 14, 'Mornington', '-38.2166667', '145.0333333');
INSERT INTO `city` VALUES(180, 14, 'Mildura', '-34.2', '142.15');
INSERT INTO `city` VALUES(181, 14, 'Melton', '-37.6833333', '144.5833333');
INSERT INTO `city` VALUES(182, 14, 'Mansfield', '-37.05', '146.0833333');
INSERT INTO `city` VALUES(183, 14, 'Lithgow', '-33.4833333', '150.15');
INSERT INTO `city` VALUES(184, 14, 'Lismore', '-28.8135437840429', '153.27730178833');
INSERT INTO `city` VALUES(185, 14, 'Kuranda', '-16.8166667', '145.65');
INSERT INTO `city` VALUES(186, 14, 'Katoomba', '-33.7', '150.3');
INSERT INTO `city` VALUES(187, 14, 'Innisfail', '-17.5333333', '146.0333333');
INSERT INTO `city` VALUES(188, 14, 'Huonville', '-43.0333333', '147.0333333');
INSERT INTO `city` VALUES(189, 14, 'Goulburn', '-34.75', '149.7166667');
INSERT INTO `city` VALUES(190, 14, 'Gladstone', '-23.85', '151.25');
INSERT INTO `city` VALUES(191, 14, 'Dubbo', '-32.25', '148.6166667');
INSERT INTO `city` VALUES(192, 14, 'Deloraine', '-41.5333333', '146.6666667');
INSERT INTO `city` VALUES(193, 14, 'Cowes', '-38.45', '145.2333333');
INSERT INTO `city` VALUES(194, 14, 'Cootamundra', '-34.65', '148.0333333');
INSERT INTO `city` VALUES(195, 14, 'Cooma', '-36.2333333', '149.1333333');
INSERT INTO `city` VALUES(196, 14, 'Cleveland', '-27.5333333', '153.2666667');
INSERT INTO `city` VALUES(197, 14, 'Cessnock', '-32.8333333', '151.35');
INSERT INTO `city` VALUES(198, 14, 'Caloundra', '-26.8', '153.1333333');
INSERT INTO `city` VALUES(199, 14, 'Bundaberg', '-24.85', '152.35');
INSERT INTO `city` VALUES(200, 14, 'Bridgewater', '-42.7333333', '147.2333333');

-- --------------------------------------------------------

--
-- Table structure for table `cluster`
--

CREATE TABLE `cluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) NOT NULL DEFAULT '0',
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_date` int(10) NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_color` varchar(20) NOT NULL DEFAULT '990000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cluster`
--


-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `comment_author` varchar(100) DEFAULT NULL,
  `comment_email` varchar(120) DEFAULT NULL,
  `comment_description` text,
  `comment_ip` varchar(100) DEFAULT NULL,
  `comment_rating` varchar(15) NOT NULL DEFAULT '0',
  `comment_spam` tinyint(4) NOT NULL DEFAULT '0',
  `comment_active` tinyint(4) NOT NULL DEFAULT '0',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `cities` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` VALUES(1, 'AD', 'Andorra', 'Andorra la Vella', 0);
INSERT INTO `country` VALUES(2, 'AE', 'United Arab Emirates', 'Abu Dhabi', 0);
INSERT INTO `country` VALUES(3, 'AF', 'Afghanistan', 'Kabul', 0);
INSERT INTO `country` VALUES(4, 'AG', 'Antigua and Barbuda', 'St. John''s', 0);
INSERT INTO `country` VALUES(5, 'AI', 'Anguilla', 'The Valley', 0);
INSERT INTO `country` VALUES(6, 'AL', 'Albania', 'Tirana', 0);
INSERT INTO `country` VALUES(7, 'AM', 'Armenia', 'Yerevan', 0);
INSERT INTO `country` VALUES(8, 'AN', 'Netherlands Antilles', 'Willemstad', 0);
INSERT INTO `country` VALUES(9, 'AO', 'Angola', 'Luanda', 0);
INSERT INTO `country` VALUES(10, 'AQ', 'Antarctica', '', 0);
INSERT INTO `country` VALUES(11, 'AR', 'Argentina', 'Buenos Aires', 0);
INSERT INTO `country` VALUES(12, 'AS', 'American Samoa', 'Pago Pago', 0);
INSERT INTO `country` VALUES(13, 'AT', 'Austria', 'Vienna', 0);
INSERT INTO `country` VALUES(14, 'AU', 'Australia', 'Canberra', 100);
INSERT INTO `country` VALUES(15, 'AW', 'Aruba', 'Oranjestad', 0);
INSERT INTO `country` VALUES(16, 'AX', 'Aland Islands', 'Mariehamn', 0);
INSERT INTO `country` VALUES(17, 'AZ', 'Azerbaijan', 'Baku', 0);
INSERT INTO `country` VALUES(18, 'BA', 'Bosnia and Herzegovina', 'Sarajevo', 0);
INSERT INTO `country` VALUES(19, 'BB', 'Barbados', 'Bridgetown', 0);
INSERT INTO `country` VALUES(20, 'BD', 'Bangladesh', 'Dhaka', 0);
INSERT INTO `country` VALUES(21, 'BE', 'Belgium', 'Brussels', 0);
INSERT INTO `country` VALUES(22, 'BF', 'Burkina Faso', 'Ouagadougou', 0);
INSERT INTO `country` VALUES(23, 'BG', 'Bulgaria', 'Sofia', 0);
INSERT INTO `country` VALUES(24, 'BH', 'Bahrain', 'Manama', 0);
INSERT INTO `country` VALUES(25, 'BI', 'Burundi', 'Bujumbura', 0);
INSERT INTO `country` VALUES(26, 'BJ', 'Benin', 'Porto-Novo', 0);
INSERT INTO `country` VALUES(27, 'BL', 'Saint BarthÃ©lemy', 'Gustavia', 0);
INSERT INTO `country` VALUES(28, 'BM', 'Bermuda', 'Hamilton', 0);
INSERT INTO `country` VALUES(29, 'BN', 'Brunei', 'Bandar Seri Begawan', 0);
INSERT INTO `country` VALUES(30, 'BO', 'Bolivia', 'La Paz', 0);
INSERT INTO `country` VALUES(31, 'BR', 'Brazil', 'BrasÃ­lia', 0);
INSERT INTO `country` VALUES(32, 'BS', 'Bahamas', 'Nassau', 0);
INSERT INTO `country` VALUES(33, 'BT', 'Bhutan', 'Thimphu', 0);
INSERT INTO `country` VALUES(34, 'BV', 'Bouvet Island', '', 0);
INSERT INTO `country` VALUES(35, 'BW', 'Botswana', 'Gaborone', 0);
INSERT INTO `country` VALUES(36, 'BY', 'Belarus', 'Minsk', 0);
INSERT INTO `country` VALUES(37, 'BZ', 'Belize', 'Belmopan', 0);
INSERT INTO `country` VALUES(38, 'CA', 'Canada', 'Ottawa', 0);
INSERT INTO `country` VALUES(39, 'CC', 'Cocos Islands', 'West Island', 0);
INSERT INTO `country` VALUES(40, 'CD', 'Democratic Republic of the Congo', 'Kinshasa', 0);
INSERT INTO `country` VALUES(41, 'CF', 'Central African Republic', 'Bangui', 0);
INSERT INTO `country` VALUES(42, 'CG', 'Congo Brazzavile', 'Brazzaville', 0);
INSERT INTO `country` VALUES(43, 'CH', 'Switzerland', 'Berne', 0);
INSERT INTO `country` VALUES(44, 'CI', 'Ivory Coast', 'Yamoussoukro', 0);
INSERT INTO `country` VALUES(45, 'CK', 'Cook Islands', 'Avarua', 0);
INSERT INTO `country` VALUES(46, 'CL', 'Chile', 'Santiago', 0);
INSERT INTO `country` VALUES(47, 'CM', 'Cameroon', 'YaoundÃ©', 0);
INSERT INTO `country` VALUES(48, 'CN', 'China', 'Beijing', 0);
INSERT INTO `country` VALUES(49, 'CO', 'Colombia', 'BogotÃ¡', 0);
INSERT INTO `country` VALUES(50, 'CR', 'Costa Rica', 'San JosÃ©', 0);
INSERT INTO `country` VALUES(51, 'CS', 'Serbia and Montenegro', 'Belgrade', 0);
INSERT INTO `country` VALUES(52, 'CU', 'Cuba', 'Havana', 0);
INSERT INTO `country` VALUES(53, 'CV', 'Cape Verde', 'Praia', 0);
INSERT INTO `country` VALUES(54, 'CX', 'Christmas Island', 'Flying Fish Cove', 0);
INSERT INTO `country` VALUES(55, 'CY', 'Cyprus', 'Nicosia', 0);
INSERT INTO `country` VALUES(56, 'CZ', 'Czech Republic', 'Prague', 0);
INSERT INTO `country` VALUES(57, 'DE', 'Germany', 'Berlin', 0);
INSERT INTO `country` VALUES(58, 'DJ', 'Djibouti', 'Djibouti', 0);
INSERT INTO `country` VALUES(59, 'DK', 'Denmark', 'Copenhagen', 0);
INSERT INTO `country` VALUES(60, 'DM', 'Dominica', 'Roseau', 0);
INSERT INTO `country` VALUES(61, 'DO', 'Dominican Republic', 'Santo Domingo', 0);
INSERT INTO `country` VALUES(62, 'DZ', 'Algeria', 'Algiers', 0);
INSERT INTO `country` VALUES(63, 'EC', 'Ecuador', 'Quito', 0);
INSERT INTO `country` VALUES(64, 'EE', 'Estonia', 'Tallinn', 0);
INSERT INTO `country` VALUES(65, 'EG', 'Egypt', 'Cairo', 0);
INSERT INTO `country` VALUES(66, 'EH', 'Western Sahara', 'El-Aaiun', 0);
INSERT INTO `country` VALUES(67, 'ER', 'Eritrea', 'Asmara', 0);
INSERT INTO `country` VALUES(68, 'ES', 'Spain', 'Madrid', 0);
INSERT INTO `country` VALUES(69, 'ET', 'Ethiopia', 'Addis Ababa', 0);
INSERT INTO `country` VALUES(70, 'FI', 'Finland', 'Helsinki', 0);
INSERT INTO `country` VALUES(71, 'FJ', 'Fiji', 'Suva', 0);
INSERT INTO `country` VALUES(72, 'FK', 'Falkland Islands', 'Stanley', 0);
INSERT INTO `country` VALUES(73, 'FM', 'Micronesia', 'Palikir', 0);
INSERT INTO `country` VALUES(74, 'FO', 'Faroe Islands', 'TÃ³rshavn', 0);
INSERT INTO `country` VALUES(75, 'FR', 'France', 'Paris', 0);
INSERT INTO `country` VALUES(76, 'GA', 'Gabon', 'Libreville', 0);
INSERT INTO `country` VALUES(77, 'GB', 'United Kingdom', 'London', 0);
INSERT INTO `country` VALUES(78, 'GD', 'Grenada', 'St. George''s', 0);
INSERT INTO `country` VALUES(79, 'GE', 'Georgia', 'Tbilisi', 0);
INSERT INTO `country` VALUES(80, 'GF', 'French Guiana', 'Cayenne', 0);
INSERT INTO `country` VALUES(81, 'GG', 'Guernsey', 'St Peter Port', 0);
INSERT INTO `country` VALUES(82, 'GH', 'Ghana', 'Accra', 0);
INSERT INTO `country` VALUES(83, 'GI', 'Gibraltar', 'Gibraltar', 0);
INSERT INTO `country` VALUES(84, 'GL', 'Greenland', 'Nuuk', 0);
INSERT INTO `country` VALUES(85, 'GM', 'Gambia', 'Banjul', 0);
INSERT INTO `country` VALUES(86, 'GN', 'Guinea', 'Conakry', 0);
INSERT INTO `country` VALUES(87, 'GP', 'Guadeloupe', 'Basse-Terre', 0);
INSERT INTO `country` VALUES(88, 'GQ', 'Equatorial Guinea', 'Malabo', 0);
INSERT INTO `country` VALUES(89, 'GR', 'Greece', 'Athens', 0);
INSERT INTO `country` VALUES(90, 'GS', 'South Georgia and the South Sandwich Islands', 'Grytviken', 0);
INSERT INTO `country` VALUES(91, 'GT', 'Guatemala', 'Guatemala City', 0);
INSERT INTO `country` VALUES(92, 'GU', 'Guam', 'HagÃ¥tÃ±a', 0);
INSERT INTO `country` VALUES(93, 'GW', 'Guinea-Bissau', 'Bissau', 0);
INSERT INTO `country` VALUES(94, 'GY', 'Guyana', 'Georgetown', 0);
INSERT INTO `country` VALUES(95, 'HK', 'Hong Kong', 'Hong Kong', 0);
INSERT INTO `country` VALUES(96, 'HM', 'Heard Island and McDonald Islands', '', 0);
INSERT INTO `country` VALUES(97, 'HN', 'Honduras', 'Tegucigalpa', 0);
INSERT INTO `country` VALUES(98, 'HR', 'Croatia', 'Zagreb', 0);
INSERT INTO `country` VALUES(99, 'HT', 'Haiti', 'Port-au-Prince', 0);
INSERT INTO `country` VALUES(100, 'HU', 'Hungary', 'Budapest', 0);
INSERT INTO `country` VALUES(101, 'ID', 'Indonesia', 'Jakarta', 0);
INSERT INTO `country` VALUES(102, 'IE', 'Ireland', 'Dublin', 0);
INSERT INTO `country` VALUES(103, 'IL', 'Israel', 'Jerusalem', 0);
INSERT INTO `country` VALUES(104, 'IM', 'Isle of Man', 'Douglas, Isle of Man', 0);
INSERT INTO `country` VALUES(105, 'IN', 'India', 'New Delhi', 0);
INSERT INTO `country` VALUES(106, 'IO', 'British Indian Ocean Territory', 'Diego Garcia', 0);
INSERT INTO `country` VALUES(107, 'IQ', 'Iraq', 'Baghdad', 0);
INSERT INTO `country` VALUES(108, 'IR', 'Iran', 'Tehran', 0);
INSERT INTO `country` VALUES(109, 'IS', 'Iceland', 'ReykjavÃ­k', 0);
INSERT INTO `country` VALUES(110, 'IT', 'Italy', 'Rome', 0);
INSERT INTO `country` VALUES(111, 'JE', 'Jersey', 'Saint Helier', 0);
INSERT INTO `country` VALUES(112, 'JM', 'Jamaica', 'Kingston', 0);
INSERT INTO `country` VALUES(113, 'JO', 'Jordan', 'Amman', 0);
INSERT INTO `country` VALUES(114, 'JP', 'Japan', 'Tokyo', 0);
INSERT INTO `country` VALUES(115, 'KE', 'Kenya', 'Nairobi', 0);
INSERT INTO `country` VALUES(116, 'KG', 'Kyrgyzstan', 'Bishkek', 0);
INSERT INTO `country` VALUES(117, 'KH', 'Cambodia', 'Phnom Penh', 0);
INSERT INTO `country` VALUES(118, 'KI', 'Kiribati', 'South Tarawa', 0);
INSERT INTO `country` VALUES(119, 'KM', 'Comoros', 'Moroni', 0);
INSERT INTO `country` VALUES(120, 'KN', 'Saint Kitts and Nevis', 'Basseterre', 0);
INSERT INTO `country` VALUES(121, 'KP', 'North Korea', 'Pyongyang', 0);
INSERT INTO `country` VALUES(122, 'KR', 'South Korea', 'Seoul', 0);
INSERT INTO `country` VALUES(123, 'KW', 'Kuwait', 'Kuwait City', 0);
INSERT INTO `country` VALUES(124, 'KY', 'Cayman Islands', 'George Town', 0);
INSERT INTO `country` VALUES(125, 'KZ', 'Kazakhstan', 'Astana', 0);
INSERT INTO `country` VALUES(126, 'LA', 'Laos', 'Vientiane', 0);
INSERT INTO `country` VALUES(127, 'LB', 'Lebanon', 'Beirut', 0);
INSERT INTO `country` VALUES(128, 'LC', 'Saint Lucia', 'Castries', 0);
INSERT INTO `country` VALUES(129, 'LI', 'Liechtenstein', 'Vaduz', 0);
INSERT INTO `country` VALUES(130, 'LK', 'Sri Lanka', 'Colombo', 0);
INSERT INTO `country` VALUES(131, 'LR', 'Liberia', 'Monrovia', 0);
INSERT INTO `country` VALUES(132, 'LS', 'Lesotho', 'Maseru', 0);
INSERT INTO `country` VALUES(133, 'LT', 'Lithuania', 'Vilnius', 0);
INSERT INTO `country` VALUES(134, 'LU', 'Luxembourg', 'Luxembourg', 0);
INSERT INTO `country` VALUES(135, 'LV', 'Latvia', 'Riga', 0);
INSERT INTO `country` VALUES(136, 'LY', 'Libya', 'Tripolis', 0);
INSERT INTO `country` VALUES(137, 'MA', 'Morocco', 'Rabat', 0);
INSERT INTO `country` VALUES(138, 'MC', 'Monaco', 'Monaco', 0);
INSERT INTO `country` VALUES(139, 'MD', 'Moldova', 'Chi_in_u', 0);
INSERT INTO `country` VALUES(140, 'ME', 'Montenegro', 'Podgorica', 0);
INSERT INTO `country` VALUES(141, 'MF', 'Saint Martin', 'Marigot', 0);
INSERT INTO `country` VALUES(142, 'MG', 'Madagascar', 'Antananarivo', 0);
INSERT INTO `country` VALUES(143, 'MH', 'Marshall Islands', 'Uliga', 0);
INSERT INTO `country` VALUES(144, 'MK', 'Macedonia', 'Skopje', 0);
INSERT INTO `country` VALUES(145, 'ML', 'Mali', 'Bamako', 0);
INSERT INTO `country` VALUES(146, 'MM', 'Myanmar', 'Yangon', 0);
INSERT INTO `country` VALUES(147, 'MN', 'Mongolia', 'Ulan Bator', 0);
INSERT INTO `country` VALUES(148, 'MO', 'Macao', 'Macao', 0);
INSERT INTO `country` VALUES(149, 'MP', 'Northern Mariana Islands', 'Saipan', 0);
INSERT INTO `country` VALUES(150, 'MQ', 'Martinique', 'Fort-de-France', 0);
INSERT INTO `country` VALUES(151, 'MR', 'Mauritania', 'Nouakchott', 0);
INSERT INTO `country` VALUES(152, 'MS', 'Montserrat', 'Plymouth', 0);
INSERT INTO `country` VALUES(153, 'MT', 'Malta', 'Valletta', 0);
INSERT INTO `country` VALUES(154, 'MU', 'Mauritius', 'Port Louis', 0);
INSERT INTO `country` VALUES(155, 'MV', 'Maldives', 'MalÃ©', 0);
INSERT INTO `country` VALUES(156, 'MW', 'Malawi', 'Lilongwe', 0);
INSERT INTO `country` VALUES(157, 'MX', 'Mexico', 'Mexico City', 0);
INSERT INTO `country` VALUES(158, 'MY', 'Malaysia', 'Kuala Lumpur', 0);
INSERT INTO `country` VALUES(159, 'MZ', 'Mozambique', 'Maputo', 0);
INSERT INTO `country` VALUES(160, 'NA', 'Namibia', 'Windhoek', 0);
INSERT INTO `country` VALUES(161, 'NC', 'New Caledonia', 'NoumÃ©a', 0);
INSERT INTO `country` VALUES(162, 'NE', 'Niger', 'Niamey', 0);
INSERT INTO `country` VALUES(163, 'NF', 'Norfolk Island', 'Kingston', 0);
INSERT INTO `country` VALUES(164, 'NG', 'Nigeria', 'Abuja', 0);
INSERT INTO `country` VALUES(165, 'NI', 'Nicaragua', 'Managua', 0);
INSERT INTO `country` VALUES(166, 'NL', 'Netherlands', 'Amsterdam', 0);
INSERT INTO `country` VALUES(167, 'NO', 'Norway', 'Oslo', 0);
INSERT INTO `country` VALUES(168, 'NP', 'Nepal', 'Kathmandu', 0);
INSERT INTO `country` VALUES(169, 'NR', 'Nauru', 'Yaren', 0);
INSERT INTO `country` VALUES(170, 'NU', 'Niue', 'Alofi', 0);
INSERT INTO `country` VALUES(171, 'NZ', 'New Zealand', 'Wellington', 0);
INSERT INTO `country` VALUES(172, 'OM', 'Oman', 'Muscat', 0);
INSERT INTO `country` VALUES(173, 'PA', 'Panama', 'Panama City', 0);
INSERT INTO `country` VALUES(174, 'PE', 'Peru', 'Lima', 0);
INSERT INTO `country` VALUES(175, 'PF', 'French Polynesia', 'Papeete', 0);
INSERT INTO `country` VALUES(176, 'PG', 'Papua New Guinea', 'Port Moresby', 0);
INSERT INTO `country` VALUES(177, 'PH', 'Philippines', 'Manila', 0);
INSERT INTO `country` VALUES(178, 'PK', 'Pakistan', 'Islamabad', 0);
INSERT INTO `country` VALUES(179, 'PL', 'Poland', 'Warsaw', 0);
INSERT INTO `country` VALUES(180, 'PM', 'Saint Pierre and Miquelon', 'Saint-Pierre', 0);
INSERT INTO `country` VALUES(181, 'PN', 'Pitcairn', 'Adamstown', 0);
INSERT INTO `country` VALUES(182, 'PR', 'Puerto Rico', 'San Juan', 0);
INSERT INTO `country` VALUES(183, 'PS', 'Palestinian Territory', 'East Jerusalem', 0);
INSERT INTO `country` VALUES(184, 'PT', 'Portugal', 'Lisbon', 0);
INSERT INTO `country` VALUES(185, 'PW', 'Palau', 'Koror', 0);
INSERT INTO `country` VALUES(186, 'PY', 'Paraguay', 'AsunciÃ³n', 0);
INSERT INTO `country` VALUES(187, 'QA', 'Qatar', 'Doha', 0);
INSERT INTO `country` VALUES(188, 'RE', 'Reunion', 'Saint-Denis', 0);
INSERT INTO `country` VALUES(189, 'RO', 'Romania', 'Bucharest', 0);
INSERT INTO `country` VALUES(190, 'RS', 'Serbia', 'Belgrade', 0);
INSERT INTO `country` VALUES(191, 'RU', 'Russia', 'Moscow', 0);
INSERT INTO `country` VALUES(192, 'RW', 'Rwanda', 'Kigali', 0);
INSERT INTO `country` VALUES(193, 'SA', 'Saudi Arabia', 'Riyadh', 0);
INSERT INTO `country` VALUES(194, 'SB', 'Solomon Islands', 'Honiara', 0);
INSERT INTO `country` VALUES(195, 'SC', 'Seychelles', 'Victoria', 0);
INSERT INTO `country` VALUES(196, 'SD', 'Sudan', 'Khartoum', 0);
INSERT INTO `country` VALUES(197, 'SE', 'Sweden', 'Stockholm', 0);
INSERT INTO `country` VALUES(198, 'SG', 'Singapore', 'Singapur', 0);
INSERT INTO `country` VALUES(199, 'SH', 'Saint Helena', 'Jamestown', 0);
INSERT INTO `country` VALUES(200, 'SI', 'Slovenia', 'Ljubljana', 0);
INSERT INTO `country` VALUES(201, 'SJ', 'Svalbard and Jan Mayen', 'Longyearbyen', 0);
INSERT INTO `country` VALUES(202, 'SK', 'Slovakia', 'Bratislava', 0);
INSERT INTO `country` VALUES(203, 'SL', 'Sierra Leone', 'Freetown', 0);
INSERT INTO `country` VALUES(204, 'SM', 'San Marino', 'San Marino', 0);
INSERT INTO `country` VALUES(205, 'SN', 'Senegal', 'Dakar', 0);
INSERT INTO `country` VALUES(206, 'SO', 'Somalia', 'Mogadishu', 0);
INSERT INTO `country` VALUES(207, 'SR', 'Suriname', 'Paramaribo', 0);
INSERT INTO `country` VALUES(208, 'ST', 'Sao Tome and Principe', 'SÃ£o TomÃ©', 0);
INSERT INTO `country` VALUES(209, 'SV', 'El Salvador', 'San Salvador', 0);
INSERT INTO `country` VALUES(210, 'SY', 'Syria', 'Damascus', 0);
INSERT INTO `country` VALUES(211, 'SZ', 'Swaziland', 'Mbabane', 0);
INSERT INTO `country` VALUES(212, 'TC', 'Turks and Caicos Islands', 'Cockburn Town', 0);
INSERT INTO `country` VALUES(213, 'TD', 'Chad', 'N''Djamena', 0);
INSERT INTO `country` VALUES(214, 'TF', 'French Southern Territories', 'Martin-de-ViviÃ¨s', 0);
INSERT INTO `country` VALUES(215, 'TG', 'Togo', 'LomÃ©', 0);
INSERT INTO `country` VALUES(216, 'TH', 'Thailand', 'Bangkok', 0);
INSERT INTO `country` VALUES(217, 'TJ', 'Tajikistan', 'Dushanbe', 0);
INSERT INTO `country` VALUES(218, 'TK', 'Tokelau', '', 0);
INSERT INTO `country` VALUES(219, 'TL', 'East Timor', 'Dili', 0);
INSERT INTO `country` VALUES(220, 'TM', 'Turkmenistan', 'Ashgabat', 0);
INSERT INTO `country` VALUES(221, 'TN', 'Tunisia', 'Tunis', 0);
INSERT INTO `country` VALUES(222, 'TO', 'Tonga', 'Nuku''alofa', 0);
INSERT INTO `country` VALUES(223, 'TR', 'Turkey', 'Ankara', 0);
INSERT INTO `country` VALUES(224, 'TT', 'Trinidad and Tobago', 'Port of Spain', 0);
INSERT INTO `country` VALUES(225, 'TV', 'Tuvalu', 'Vaiaku', 0);
INSERT INTO `country` VALUES(226, 'TW', 'Taiwan', 'Taipei', 0);
INSERT INTO `country` VALUES(227, 'TZ', 'Tanzania', 'Dar es Salaam', 0);
INSERT INTO `country` VALUES(228, 'UA', 'Ukraine', 'Kiev', 0);
INSERT INTO `country` VALUES(229, 'UG', 'Uganda', 'Kampala', 0);
INSERT INTO `country` VALUES(230, 'UM', 'United States Minor Outlying Islands', '', 0);
INSERT INTO `country` VALUES(231, 'US', 'United States', 'Washington', 0);
INSERT INTO `country` VALUES(232, 'UY', 'Uruguay', 'Montevideo', 0);
INSERT INTO `country` VALUES(233, 'UZ', 'Uzbekistan', 'Tashkent', 0);
INSERT INTO `country` VALUES(234, 'VA', 'Vatican', 'Vatican City', 0);
INSERT INTO `country` VALUES(235, 'VC', 'Saint Vincent and the Grenadines', 'Kingstown', 0);
INSERT INTO `country` VALUES(236, 'VE', 'Venezuela', 'Caracas', 0);
INSERT INTO `country` VALUES(237, 'VG', 'British Virgin Islands', 'Road Town', 0);
INSERT INTO `country` VALUES(238, 'VI', 'U.S. Virgin Islands', 'Charlotte Amalie', 0);
INSERT INTO `country` VALUES(239, 'VN', 'Vietnam', 'Hanoi', 0);
INSERT INTO `country` VALUES(240, 'VU', 'Vanuatu', 'Port Vila', 0);
INSERT INTO `country` VALUES(241, 'WF', 'Wallis and Futuna', 'MatÃ¢''Utu', 0);
INSERT INTO `country` VALUES(242, 'WS', 'Samoa', 'Apia', 0);
INSERT INTO `country` VALUES(243, 'YE', 'Yemen', 'Sanâ€˜aâ€™', 0);
INSERT INTO `country` VALUES(244, 'YT', 'Mayotte', 'Mamoudzou', 0);
INSERT INTO `country` VALUES(245, 'ZA', 'South Africa', 'Pretoria', 0);
INSERT INTO `country` VALUES(246, 'ZM', 'Zambia', 'Lusaka', 0);
INSERT INTO `country` VALUES(247, 'ZW', 'Zimbabwe', 'Harare', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE `feed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feed_name` varchar(255) DEFAULT NULL,
  `feed_url` varchar(255) DEFAULT NULL,
  `feed_cache` text,
  `feed_active` tinyint(4) DEFAULT '1',
  `feed_update` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `feed`
--

INSERT INTO `feed` VALUES(2, 'The Age Newspaper', 'http://feeds.theage.com.au/rssheadlines/top.xml', NULL, 1, 0);
INSERT INTO `feed` VALUES(4, 'Bushfire', 'http://www.csiro.au/science/Bushfires/whats-new.xml', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `feedback_mesg` text NOT NULL,
  `feedback_status` tinyint(3) NOT NULL,
  `feedback_dateadd` datetime DEFAULT NULL,
  `feedback_datemodify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `feedback`
--


-- --------------------------------------------------------

--
-- Table structure for table `feedback_person`
--

CREATE TABLE `feedback_person` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `feedback_id` tinyint(11) NOT NULL,
  `person_email` varchar(30) NOT NULL,
  `person_date` datetime DEFAULT NULL,
  `person_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `feedback_person`
--


-- --------------------------------------------------------

--
-- Table structure for table `feed_item`
--

CREATE TABLE `feed_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feed_id` int(11) NOT NULL,
  `location_id` bigint(20) DEFAULT '0',
  `incident_id` int(11) NOT NULL DEFAULT '0',
  `item_title` varchar(255) DEFAULT NULL,
  `item_description` text,
  `item_link` varchar(255) DEFAULT NULL,
  `item_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `feed_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_title` varchar(200) NOT NULL,
  `form_description` text,
  `form_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `form`
--

INSERT INTO `form` VALUES(1, 'Default Form', 'Default form, for report entry', 1);

-- --------------------------------------------------------

--
-- Table structure for table `form_field`
--

CREATE TABLE `form_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `field_name` varchar(200) DEFAULT NULL,
  `field_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - TEXTFIELD, 2 - TEXTAREA (FREETEXT), 3 - DATE, 4 - PASSWORD, 5 - RADIO, 6 - CHECKBOX',
  `field_required` tinyint(4) DEFAULT '0',
  `field_options` text,
  `field_position` tinyint(4) NOT NULL DEFAULT '0',
  `field_default` varchar(200) DEFAULT NULL,
  `field_maxlength` int(11) NOT NULL DEFAULT '0',
  `field_width` smallint(6) NOT NULL DEFAULT '0',
  `field_height` tinyint(4) DEFAULT '5',
  `field_isdate` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `form_field`
--


-- --------------------------------------------------------

--
-- Table structure for table `form_response`
--

CREATE TABLE `form_response` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `form_field_id` int(11) NOT NULL,
  `incident_id` bigint(20) NOT NULL,
  `form_response` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_form_field_id` (`form_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `form_response`
--


-- --------------------------------------------------------

--
-- Table structure for table `idp`
--

CREATE TABLE `idp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) NOT NULL,
  `verified_id` bigint(20) DEFAULT NULL,
  `idp_idnumber` varchar(100) DEFAULT NULL,
  `idp_orig_idnumber` varchar(100) DEFAULT NULL,
  `idp_fname` varchar(50) DEFAULT NULL,
  `idp_lname` varchar(50) DEFAULT NULL,
  `idp_email` varchar(100) DEFAULT NULL,
  `idp_phone` varchar(50) DEFAULT NULL,
  `current_location_id` bigint(20) DEFAULT NULL,
  `displacedfrom_location_id` bigint(20) DEFAULT NULL,
  `movedto_location_id` bigint(20) DEFAULT NULL,
  `idp_move_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `idp`
--


-- --------------------------------------------------------

--
-- Table structure for table `incident`
--

CREATE TABLE `incident` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) NOT NULL,
  `form_id` int(11) NOT NULL DEFAULT '1',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `user_id` bigint(20) DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  `incident_date` datetime DEFAULT NULL,
  `incident_mode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - WEB, 2 - SMS, 3 - EMAIL, 4 - TWITTER',
  `incident_active` tinyint(4) NOT NULL DEFAULT '0',
  `incident_verified` tinyint(4) NOT NULL DEFAULT '0',
  `incident_source` varchar(5) DEFAULT NULL,
  `incident_information` varchar(5) DEFAULT NULL,
  `incident_rating` varchar(15) NOT NULL DEFAULT '0',
  `incident_dateadd` datetime DEFAULT NULL,
  `incident_dateadd_gmt` datetime DEFAULT NULL,
  `incident_datemodify` datetime DEFAULT NULL,
  `incident_alert_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - Not Tagged for Sending, 1 - Tagged for Sending, 2 - Alerts Have Been Sent',
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_id` (`location_id`),
  KEY `incident_active` (`incident_active`),
  KEY `incident_date` (`incident_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `incident`
--

INSERT INTO `incident` VALUES(13, 13, 1, 'en_US', 1, 'Bushfire starting', 'test please delete', '2010-06-06 02:56:00', 1, 1, 1, 'C', '3', '0', '2010-06-06 14:57:30', NULL, '2010-06-06 14:58:31', 0);
INSERT INTO `incident` VALUES(12, 12, 1, 'en_US', 1, 'Fire Brigade at Scene', '1 Fire truck', '2010-06-06 01:44:00', 1, 1, 0, 'C', '3', '1', '2010-06-06 13:46:03', NULL, '2010-06-06 13:47:40', 0);
INSERT INTO `incident` VALUES(11, 11, 1, 'en_US', 0, 'A building left standing', 'Possible last place of refuge', '2010-06-06 01:39:00', 1, 1, 0, NULL, NULL, '0', '2010-06-06 13:41:54', NULL, NULL, 1);
INSERT INTO `incident` VALUES(9, 9, 1, 'en_US', 1, 'Backburning Operation', 'Fire prevention task', '2010-06-06 01:34:00', 1, 1, 1, '', '', '-1', '2010-06-06 13:35:15', NULL, '2010-06-06 13:43:26', 1);
INSERT INTO `incident` VALUES(10, 10, 1, 'en_US', 1, 'Very large fire front', 'Warning: avoid this area!', '2010-06-06 01:35:00', 1, 0, 0, '', '', '0', '2010-06-06 13:39:11', NULL, '2010-06-06 13:48:26', 1);
INSERT INTO `incident` VALUES(8, 8, 1, 'en_US', 1, 'Injured Animal', 'An injured animal was found at this location', '2010-06-06 01:17:00', 1, 1, 1, 'A', '1', '0', '2010-06-06 13:26:08', NULL, '2010-06-06 13:29:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `incident_category`
--

CREATE TABLE `incident_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `incident_category_ids` (`incident_id`,`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `incident_category`
--

INSERT INTO `incident_category` VALUES(22, 11, 6);
INSERT INTO `incident_category` VALUES(34, 10, 3);
INSERT INTO `incident_category` VALUES(21, 11, 3);
INSERT INTO `incident_category` VALUES(35, 10, 10);
INSERT INTO `incident_category` VALUES(24, 9, 1);
INSERT INTO `incident_category` VALUES(25, 9, 9);
INSERT INTO `incident_category` VALUES(16, 8, 13);
INSERT INTO `incident_category` VALUES(23, 11, 10);
INSERT INTO `incident_category` VALUES(33, 12, 13);
INSERT INTO `incident_category` VALUES(32, 12, 12);
INSERT INTO `incident_category` VALUES(31, 12, 3);
INSERT INTO `incident_category` VALUES(30, 12, 1);
INSERT INTO `incident_category` VALUES(39, 13, 8);
INSERT INTO `incident_category` VALUES(38, 13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `incident_lang`
--

CREATE TABLE `incident_lang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `incident_lang`
--


-- --------------------------------------------------------

--
-- Table structure for table `incident_person`
--

CREATE TABLE `incident_person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `person_first` varchar(200) DEFAULT NULL,
  `person_last` varchar(200) DEFAULT NULL,
  `person_email` varchar(120) DEFAULT NULL,
  `person_phone` varchar(60) DEFAULT NULL,
  `person_ip` varchar(50) DEFAULT NULL,
  `person_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `incident_person`
--

INSERT INTO `incident_person` VALUES(20, 12, 12, '', '', '', NULL, NULL, '2010-06-06 13:47:40');
INSERT INTO `incident_person` VALUES(17, 11, 11, '', '', '', NULL, NULL, '2010-06-06 13:41:55');
INSERT INTO `incident_person` VALUES(21, 10, 10, '', '', '', NULL, NULL, '2010-06-06 13:48:26');
INSERT INTO `incident_person` VALUES(18, 9, 9, 'Anthony', 'J .', 'bushfireconnect@gmail.com', NULL, NULL, '2010-06-06 13:43:26');
INSERT INTO `incident_person` VALUES(14, 8, 8, '', '', '', NULL, NULL, '2010-06-06 13:29:55');
INSERT INTO `incident_person` VALUES(23, 13, 13, 'Daniela', 'Fernandez', 'daniela.fernandez@gmail.com', NULL, NULL, '2010-06-06 14:58:31');

-- --------------------------------------------------------

--
-- Table structure for table `laconica`
--

CREATE TABLE `laconica` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` int(11) DEFAULT '0',
  `laconica_mesg_from` varchar(100) DEFAULT NULL,
  `laconica_mesg_to` varchar(100) DEFAULT NULL,
  `laconica_mesg_link` varchar(100) DEFAULT NULL,
  `laconica_mesg` varchar(255) DEFAULT NULL,
  `laconica_mesg_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin)',
  `laconica_mesg_date` datetime DEFAULT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `laconica`
--


-- --------------------------------------------------------

--
-- Table structure for table `layer`
--

CREATE TABLE `layer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layer_name` varchar(255) DEFAULT NULL,
  `layer_url` varchar(255) DEFAULT NULL,
  `layer_file` varchar(100) DEFAULT NULL,
  `layer_color` varchar(20) DEFAULT NULL,
  `layer_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `layer`
--

INSERT INTO `layer` VALUES(1, 'Victorian Hospitals', '', '1275722323vic_hospitals.kml', 'd62727', 1);
INSERT INTO `layer` VALUES(6, 'Victorian Police Stations', '', '12757970601275797018-22680-129.94.108.34.kml', '0084ff', 1);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_title` varchar(200) DEFAULT NULL,
  `level_description` varchar(200) DEFAULT NULL,
  `level_weight` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `level`
--

INSERT INTO `level` VALUES(1, 'SPAM + Delete', 'SPAM + Delete', -2);
INSERT INTO `level` VALUES(2, 'SPAM', 'SPAM', -1);
INSERT INTO `level` VALUES(3, 'Untrusted', 'Untrusted', 0);
INSERT INTO `level` VALUES(4, 'Trusted', 'Trusted', 1);
INSERT INTO `level` VALUES(5, 'Trusted + Verifiy', 'Trusted + Verify', 2);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `location_visible` tinyint(4) NOT NULL DEFAULT '1',
  `location_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` VALUES(12, 'Strathewen', NULL, -37.599272, 145.340195, 1, '2010-06-06 13:47:40');
INSERT INTO `location` VALUES(11, 'Strathewen', NULL, -37.529332, 145.206299, 1, '2010-06-06 13:41:54');
INSERT INTO `location` VALUES(10, 'Strathewen', NULL, -37.530693, 145.314789, 1, '2010-06-06 13:48:26');
INSERT INTO `location` VALUES(9, 'Bendigo', NULL, -37.507819, 145.250244, 1, '2010-06-06 13:43:26');
INSERT INTO `location` VALUES(8, 'National Park', NULL, -37.508364, 145.238571, 1, '2010-06-06 13:29:55');
INSERT INTO `location` VALUES(13, 'Melbourne', NULL, -37.814251, 144.963169, 1, '2010-06-06 14:58:31');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) DEFAULT NULL,
  `incident_id` bigint(20) DEFAULT NULL,
  `media_type` tinyint(4) DEFAULT NULL COMMENT '1 - IMAGES, 2 - VIDEO, 3 - AUDIO, 4 - NEWS, 5 - PODCAST',
  `media_title` varchar(255) DEFAULT NULL,
  `media_description` longtext,
  `media_link` varchar(255) DEFAULT NULL,
  `media_thumb` varchar(255) DEFAULT NULL,
  `media_date` datetime DEFAULT NULL,
  `media_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` VALUES(4, 8, 8, 1, NULL, NULL, '8_1_1275794768.jpg', '8_1_1275794768_t.jpg', '2010-06-06 13:26:08', 1);
INSERT INTO `media` VALUES(5, 10, 10, 1, NULL, NULL, '10_1_1275795551.jpg', '10_1_1275795551_t.jpg', '2010-06-06 13:39:11', 1);
INSERT INTO `media` VALUES(6, 11, 11, 1, NULL, NULL, '11_1_1275795715.jpg', '11_1_1275795715_t.jpg', '2010-06-06 13:41:55', 1);
INSERT INTO `media` VALUES(7, 9, 9, 1, NULL, NULL, '9_1_1275795806.jpg', '9_1_1275795806_t.jpg', '2010-06-06 13:43:26', 1);
INSERT INTO `media` VALUES(8, 12, 12, 1, NULL, NULL, '12_1_1275796060.jpg', '12_1_1275796060_t.jpg', '2010-06-06 13:47:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT '0',
  `incident_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `reporter_id` bigint(20) DEFAULT NULL,
  `service_messageid` varchar(100) DEFAULT NULL,
  `message_from` varchar(100) DEFAULT NULL,
  `message_to` varchar(100) DEFAULT NULL,
  `message` text,
  `message_detail` text,
  `message_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin)',
  `message_date` datetime DEFAULT NULL,
  `message_level` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `message`
--


-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(255) DEFAULT NULL,
  `organization_description` longtext,
  `organization_website` varchar(255) DEFAULT NULL,
  `organization_email` varchar(120) DEFAULT NULL,
  `organization_phone1` varchar(50) DEFAULT NULL,
  `organization_phone2` varchar(50) DEFAULT NULL,
  `organization_address` varchar(255) DEFAULT NULL,
  `organization_country` varchar(100) DEFAULT NULL,
  `organization_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `organization`
--


-- --------------------------------------------------------

--
-- Table structure for table `organization_incident`
--

CREATE TABLE `organization_incident` (
  `organization_id` bigint(20) DEFAULT NULL,
  `incident_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organization_incident`
--


-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `page_description` longtext,
  `page_tab` varchar(100) NOT NULL,
  `page_active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` VALUES(1, 'About Us', '<p>Bushfire Connect is an online bushfire crisis service presenting real  time information submitted by local community members and emergency  agencies.</p>\n<p>Our goal is to establish a reliable, dynamic and timely resource  for people in fire threatened or damaged areas to enhance and extend the  utility of official data sources.</p>\n<p>The Bushfire Connect website maps fire related incidents added by  people via SMS, smart phone applications or through the website. People  in remote areas needing information quickly can receive customized,  automatic SMS alerts direct to their phones.</p>\n<p>Bushfire Connect overcomes the limitations with the current,  official fire alert services by improving timeliness and relevance of  data by empowering tens of thousands of people to contribute a human  intelligence stream of content including text, images and video.</p>\n<p>The system is a central repository collecting crowd-sourced  incident data and layering it with information from official sources.</p>\n<p>Bushfire Connect will be developed using <a href="http://www.ushahidi.com"><strong>Ushahidi</strong></a> an open-source  platform developed in Kenya and most recently used in Haiti and for the  Gulf of Mexico oil spill.</p>\n<p>This is a <strong>real</strong> project, that will be rolled out in the  state of Victoria (Australia) by December 2010.  We have created a first, non-prescriptive ''Mockup'' as a thought starter.</p>\n<p>Possible features: - Ability to submit using these categories via twitter/email/webform - Ability to create RSS feed - Ability to display reports - Ability to feed in any official content streams</p>\n<p>More information: see <a href="mailto:Maurits.vandervlugt@ngis.com.au">Maurits van der Vlugt</a> or <a href="mailto:keren.flavell@gmail.com">Keren Flavell</a>.</p>', 'About Us', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pending_users`
--

CREATE TABLE `pending_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(31) NOT NULL DEFAULT '',
  `password` char(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pending_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT '0',
  `rating_ip` varchar(100) DEFAULT NULL,
  `rating_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` VALUES(1, 2, NULL, 1, '129.94.108.34', '2010-06-05 14:09:06');
INSERT INTO `rating` VALUES(2, 2, NULL, 1, '::1', '2010-06-06 12:36:53');
INSERT INTO `rating` VALUES(3, 12, NULL, 1, '129.94.108.34', '2010-06-06 14:10:22');
INSERT INTO `rating` VALUES(4, 9, NULL, -1, '129.94.108.34', '2010-06-06 14:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `reporter`
--

CREATE TABLE `reporter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `service_userid` varchar(255) DEFAULT NULL,
  `service_account` varchar(255) DEFAULT NULL,
  `reporter_first` varchar(200) DEFAULT NULL,
  `reporter_last` varchar(200) DEFAULT NULL,
  `reporter_email` varchar(120) DEFAULT NULL,
  `reporter_phone` varchar(60) DEFAULT NULL,
  `reporter_ip` varchar(50) DEFAULT NULL,
  `reporter_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `reporter`
--

INSERT INTO `reporter` VALUES(1, NULL, NULL, NULL, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `reporter` VALUES(2, NULL, NULL, NULL, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` VALUES(1, 'login', 'Login privileges, granted after account confirmation');
INSERT INTO `roles` VALUES(2, 'admin', 'Administrative user, has access to almost everything.');
INSERT INTO `roles` VALUES(3, 'superadmin', 'Super administrative user, has access to everything.');

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE `roles_users` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` VALUES(1, 1);
INSERT INTO `roles_users` VALUES(2, 1);
INSERT INTO `roles_users` VALUES(3, 1);
INSERT INTO `roles_users` VALUES(1, 2);
INSERT INTO `roles_users` VALUES(2, 2);
INSERT INTO `roles_users` VALUES(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `scheduler`
--

CREATE TABLE `scheduler` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_last` int(10) unsigned NOT NULL DEFAULT '0',
  `scheduler_weekday` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_day` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_hour` smallint(6) NOT NULL DEFAULT '-1',
  `scheduler_minute` smallint(6) NOT NULL,
  `scheduler_controller` varchar(100) NOT NULL,
  `scheduler_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `scheduler`
--

INSERT INTO `scheduler` VALUES(1, 'Feeds', 0, -1, -1, -1, 0, 'feeds', 1);
INSERT INTO `scheduler` VALUES(2, 'Alerts', 0, -1, -1, -1, -1, 'alerts', 1);
INSERT INTO `scheduler` VALUES(3, 'Email', 0, -1, -1, -1, 0, 'email', 1);
INSERT INTO `scheduler` VALUES(4, 'Twitter', 0, -1, -1, -1, 0, 'twitter', 1);
INSERT INTO `scheduler` VALUES(5, 'Sharing', 0, -1, -1, -1, 0, 'sharing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `scheduler_log`
--

CREATE TABLE `scheduler_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(11) NOT NULL,
  `scheduler_name` varchar(100) NOT NULL,
  `scheduler_status` varchar(20) DEFAULT NULL,
  `scheduler_date` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `scheduler_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `service_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` VALUES(1, 'SMS', 'Text messages from phones', NULL, NULL);
INSERT INTO `service` VALUES(2, 'Email', 'Text messages from phones', NULL, NULL);
INSERT INTO `service` VALUES(3, 'Twitter', 'Tweets tweets tweets', 'http://twitter.com', NULL);
INSERT INTO `service` VALUES(4, 'Laconica', 'Tweets tweets tweets', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(40) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) DEFAULT NULL,
  `site_tagline` varchar(255) DEFAULT NULL,
  `site_email` varchar(120) DEFAULT NULL,
  `site_key` varchar(100) DEFAULT NULL,
  `site_language` varchar(10) NOT NULL DEFAULT 'en_US',
  `site_style` varchar(50) NOT NULL DEFAULT 'default',
  `site_timezone` varchar(80) DEFAULT NULL,
  `site_contact_page` tinyint(4) NOT NULL DEFAULT '1',
  `site_help_page` tinyint(4) NOT NULL DEFAULT '1',
  `allow_reports` tinyint(4) NOT NULL DEFAULT '1',
  `allow_comments` tinyint(4) NOT NULL DEFAULT '1',
  `allow_feed` tinyint(4) NOT NULL DEFAULT '1',
  `allow_stat_sharing` tinyint(4) NOT NULL DEFAULT '1',
  `allow_clustering` tinyint(4) NOT NULL DEFAULT '1',
  `default_map` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - GOOGLE MAPS, 2 - LIVE MAPS, 3 - YAHOO MAPS, 4 - OPEN STREET MAPS',
  `default_map_all` varchar(20) NOT NULL DEFAULT 'CC0000',
  `api_google` varchar(200) DEFAULT NULL,
  `api_yahoo` varchar(200) DEFAULT NULL,
  `api_live` varchar(200) DEFAULT NULL,
  `api_akismet` varchar(200) DEFAULT NULL,
  `default_country` int(11) DEFAULT NULL,
  `multi_country` tinyint(4) NOT NULL DEFAULT '0',
  `default_city` varchar(150) DEFAULT NULL,
  `default_lat` varchar(100) DEFAULT NULL,
  `default_lon` varchar(100) DEFAULT NULL,
  `default_zoom` tinyint(4) NOT NULL DEFAULT '10',
  `items_per_page` smallint(6) NOT NULL DEFAULT '20',
  `items_per_page_admin` smallint(6) NOT NULL DEFAULT '20',
  `sms_no1` varchar(100) DEFAULT NULL,
  `sms_no2` varchar(100) DEFAULT NULL,
  `sms_no3` varchar(100) DEFAULT NULL,
  `frontlinesms_key` varchar(30) DEFAULT NULL,
  `clickatell_api` varchar(30) DEFAULT NULL,
  `clickatell_username` varchar(100) DEFAULT NULL,
  `clickatell_password` varchar(100) DEFAULT NULL,
  `google_analytics` text,
  `twitter_hashtags` text,
  `twitter_username` varchar(50) DEFAULT NULL,
  `twitter_password` varchar(50) DEFAULT NULL,
  `laconica_username` varchar(50) DEFAULT NULL,
  `laconica_password` varchar(50) DEFAULT NULL,
  `laconica_site` varchar(30) DEFAULT NULL COMMENT 'a laconica site',
  `date_modify` datetime DEFAULT NULL,
  `stat_id` bigint(20) DEFAULT NULL COMMENT 'comes from centralized stats',
  `stat_key` varchar(30) NOT NULL,
  `email_username` varchar(100) NOT NULL,
  `email_password` varchar(100) NOT NULL,
  `email_port` int(11) NOT NULL,
  `email_host` varchar(100) NOT NULL,
  `email_servertype` varchar(100) NOT NULL,
  `email_ssl` int(5) NOT NULL,
  `alerts_email` varchar(120) NOT NULL,
  `db_version` varchar(20) DEFAULT NULL,
  `ushahidi_version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` VALUES(1, 'bushfireconnect.org', 'Trust, transparency and timeliness', 'bushfireconnect@gmail.com', NULL, 'en_US', '', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 'CC0000', 'ABQIAAAAjsEM5UsvCPCIHp80spK1kBQKW7L4j6gYznY0oMkScAbKwifzxxRhJ3SP_ijydkmJpN3jX8kn5r5fEQ', '5CYeWbfV34E21JOW1a4.54Mf6e9jLNkD0HVzaKoQmJZi2qzmSZd5mD8X49x7', NULL, '', 14, 0, 'nairobi', '-36.879620605027', '144.140625', 13, 20, 20, NULL, NULL, NULL, 'JUBP6H6O', '3241462', 'anthonyj', 'anthonyrhok', '', '#bushfireconnect', 'admin', 'peter123nicola', '', '', '', '2010-06-05 16:46:36', 2194, 'b34dfd52b5255a69ccfba36202ef75', 'bushfireconnect@gmail.com', 'bfcrhok2010', 993, 'imap.gmail.com', 'imap', 1, 'bushfireconnect@gmail.com', '21', '1.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `sharing`
--

CREATE TABLE `sharing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sharing_type` tinyint(4) DEFAULT '1' COMMENT '1 - PULLing Data, 2 - PUSHing Data, 3 - TWO way',
  `sharing_limits` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - Once Per Hour, 2 - Once Every 6 Hours, 3 - Once Every 12 Hours, 4 - Once Daily',
  `sharing_color` varchar(20) DEFAULT NULL,
  `sharing_site_name` varchar(255) DEFAULT NULL,
  `sharing_email` varchar(255) DEFAULT NULL,
  `sharing_url` varchar(255) DEFAULT NULL,
  `sharing_key` varchar(50) DEFAULT NULL,
  `sharing_ushahidi` tinyint(4) NOT NULL DEFAULT '1',
  `sharing_report` tinyint(4) NOT NULL DEFAULT '1',
  `sharing_media` tinyint(4) NOT NULL DEFAULT '1',
  `sharing_category` tinyint(4) NOT NULL DEFAULT '1',
  `sharing_personaldata` tinyint(4) NOT NULL DEFAULT '0',
  `sharing_active` tinyint(4) NOT NULL DEFAULT '0',
  `sharing_date` datetime NOT NULL,
  `sharing_dateaccess` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sharing_key` (`sharing_key`),
  KEY `sharing_url` (`sharing_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sharing`
--


-- --------------------------------------------------------

--
-- Table structure for table `sharing_log`
--

CREATE TABLE `sharing_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sharing_id` int(11) NOT NULL,
  `sharing_log_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sharing_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `twitter`
--

CREATE TABLE `twitter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` int(11) DEFAULT '0',
  `tweet_from` varchar(100) DEFAULT NULL,
  `tweet_to` varchar(100) DEFAULT NULL,
  `tweet_hashtag` varchar(50) DEFAULT NULL,
  `tweet_link` varchar(100) DEFAULT NULL,
  `tweet` varchar(255) DEFAULT NULL,
  `tweet_type` tinyint(4) DEFAULT '1' COMMENT '1 - INBOX, 2 - OUTBOX (From Admin)',
  `tweet_date` datetime DEFAULT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `twitter`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(31) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag incase admin opts in for email notifications',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(1, 'Administrator', 'daniela@mangoldsengers.com', 'admin', 'c33f625fe281f30582d1dd80b66b8801e1e1e7dd8db2847c82', 665, 1275800311, 0, '2010-06-06 14:58:31');
INSERT INTO `users` VALUES(2, 'Administrator', 'daniela.fernandez@gmail.com', 'daniela', '00bf3db7d13ae71ac0ea7afa566b09c88d6dd3f8483bb84810', 0, NULL, 0, '2010-06-05 13:35:55');
INSERT INTO `users` VALUES(3, 'Moderator', 'danira_98@hotmail.com', 'moderator', '85d074f81292c0eef3a885bb36a753e34bd63eb4d1a15a6977', 0, NULL, 0, '2010-06-05 13:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user_tokens`
--

INSERT INTO `user_tokens` VALUES(1, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'M5yCmY6TJwE3q4jGPVkGrICpgnHSDVlR', 1275700544, 1276910144);
INSERT INTO `user_tokens` VALUES(2, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'jsjYzIVoNRInAHDKiJijD4j7lgWgBHF9', 1275707034, 1276916634);
INSERT INTO `user_tokens` VALUES(3, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'cl5Oyp1KQdiReew1QUAAo8P0VMTgZOE5', 1275718989, 1276928589);
INSERT INTO `user_tokens` VALUES(4, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'wrk6eIIHRcmdzHvgG19QlRVeMQp2J6mY', 1275720733, 1276930333);
INSERT INTO `user_tokens` VALUES(5, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'jWtNwjdcTEI02sqAUvFbsCAvyQry0JX8', 1275746501, 1276956101);
INSERT INTO `user_tokens` VALUES(6, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'olc6u4dq1Hh3qsD8hWzFle61E0poCbNu', 1275782116, 1276991716);
INSERT INTO `user_tokens` VALUES(7, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'jvQJqoazCx66yQ4mFmar7ACcu8cLMGW5', 1275782307, 1276991907);
INSERT INTO `user_tokens` VALUES(8, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'ojjud2U5GyybCHqFrcAxCaOXdONMlvtj', 1275789668, 1276999268);
INSERT INTO `user_tokens` VALUES(9, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'hotprhei445p1GQ32IkbVn256BwCWVBk', 1275791906, 1277001506);
INSERT INTO `user_tokens` VALUES(10, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'wN1msFzfBlbkGujlvZw5kz8zn111nazk', 1275793192, 1277002792);
INSERT INTO `user_tokens` VALUES(11, 1, 'e0cce1abc47b3a21b5e59705b19c32b8fbd7324a', 'b6jmhU1cQF8FaYoN2K8NdtRJ5JCjKE6k', 1275794953, 1277004553);

-- --------------------------------------------------------

--
-- Table structure for table `verified`
--

CREATE TABLE `verified` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) DEFAULT NULL,
  `idp_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verified_comment` longtext,
  `verified_date` datetime DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `verified`
--

INSERT INTO `verified` VALUES(1, 2, NULL, 1, NULL, '2010-06-05 14:08:14', 1);
INSERT INTO `verified` VALUES(2, 3, NULL, 1, NULL, '2010-06-05 14:22:17', 1);
INSERT INTO `verified` VALUES(3, 4, NULL, 1, NULL, '2010-06-06 00:02:14', 1);
INSERT INTO `verified` VALUES(4, 2, NULL, 1, NULL, '2010-06-06 12:38:27', 1);
INSERT INTO `verified` VALUES(5, 5, NULL, 1, NULL, '2010-06-06 12:50:12', 1);
INSERT INTO `verified` VALUES(6, 6, NULL, 1, NULL, '2010-06-06 12:54:05', 1);
INSERT INTO `verified` VALUES(7, 7, NULL, 1, NULL, '2010-06-06 13:00:01', 1);
INSERT INTO `verified` VALUES(8, 7, NULL, 1, NULL, '2010-06-06 13:00:09', 2);
INSERT INTO `verified` VALUES(9, 8, NULL, 1, NULL, '2010-06-06 13:29:55', 1);
INSERT INTO `verified` VALUES(10, 9, NULL, 1, NULL, '2010-06-06 13:35:58', 1);
INSERT INTO `verified` VALUES(11, 8, NULL, 1, NULL, '2010-06-06 13:36:03', 2);
INSERT INTO `verified` VALUES(12, 9, NULL, 1, NULL, '2010-06-06 13:36:06', 2);
INSERT INTO `verified` VALUES(13, 10, NULL, 1, NULL, '2010-06-06 13:42:25', 1);
INSERT INTO `verified` VALUES(14, 11, NULL, 1, NULL, '2010-06-06 13:42:29', 1);
INSERT INTO `verified` VALUES(15, 9, NULL, 1, NULL, '2010-06-06 13:43:26', 2);
INSERT INTO `verified` VALUES(16, 12, NULL, 1, NULL, '2010-06-06 13:46:03', 1);
INSERT INTO `verified` VALUES(17, 9, NULL, 1, NULL, '2010-06-06 13:47:28', 1);
INSERT INTO `verified` VALUES(18, 12, NULL, 1, NULL, '2010-06-06 13:47:40', 1);
INSERT INTO `verified` VALUES(19, 10, NULL, 1, NULL, '2010-06-06 13:48:26', 0);
INSERT INTO `verified` VALUES(20, 13, NULL, 1, NULL, '2010-06-06 14:58:31', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
