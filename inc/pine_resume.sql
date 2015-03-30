-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 30, 2015 at 01:46 PM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pine_resume`
--

-- --------------------------------------------------------

--
-- Table structure for table `rms_cities`
--

CREATE TABLE IF NOT EXISTS `rms_cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=201 ;

--
-- Dumping data for table `rms_cities`
--

INSERT INTO `rms_cities` (`id`, `city`) VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Bangalore'),
(4, 'Hyderabad'),
(5, 'Ahmedabad'),
(6, 'Chennai'),
(7, 'Kolkata'),
(8, 'Surat'),
(9, 'Pune'),
(10, 'Jaipur'),
(11, 'Lucknow'),
(12, 'Kanpur'),
(13, 'Nagpur'),
(14, 'Indore'),
(15, 'Thane'),
(16, 'Bhopal'),
(17, 'Visakhapatnam'),
(18, 'Pimpri-Chinchwad'),
(19, 'Patna'),
(20, 'Vadodara'),
(21, 'Ghaziabad'),
(22, 'Ludhiana'),
(23, 'Agra'),
(24, 'Nashik'),
(25, 'Faridabad'),
(26, 'Meerut'),
(27, 'Rajkot'),
(28, 'Kalyan-Dombivali'),
(29, 'Vasai-Virar'),
(30, 'Varanasi'),
(31, 'Srinagar'),
(32, 'Aurangabad'),
(33, 'Dhanbad'),
(34, 'Amritsar'),
(35, 'Navi Mumbai'),
(36, 'Allahabad'),
(37, 'Ranchi'),
(38, 'Howrah'),
(39, 'Coimbatore'),
(40, 'Jabalpur'),
(41, 'Gwalior'),
(42, 'Vijayawada'),
(43, 'Jodhpur'),
(44, 'Madurai'),
(45, 'Raipur'),
(46, 'Kota'),
(47, 'Guwahati'),
(48, 'Chandigarh'),
(49, 'Solapur'),
(50, 'Hubballi-Dharwad'),
(51, 'Bareilly'),
(52, 'Moradabad'),
(53, 'Mysore'),
(54, 'Gurgaon'),
(55, 'Aligarh'),
(56, 'Jalandhar'),
(57, 'Tiruchirappalli'),
(58, 'Bhubaneswar'),
(59, 'Salem'),
(60, 'Mira-Bhayandar'),
(61, 'Thiruvananthapuram'),
(62, 'Bhiwandi'),
(63, 'Saharanpur'),
(64, 'Gorakhpur'),
(65, 'Guntur'),
(66, 'Bikaner'),
(67, 'Amravati'),
(68, 'Noida'),
(69, 'Jamshedpur'),
(70, 'Bhilai'),
(71, 'Warangal'),
(72, 'Cuttack'),
(73, 'Firozabad'),
(74, 'Kochi'),
(75, 'Bhavnagar'),
(76, 'Dehradun'),
(77, 'Durgapur'),
(78, 'Asansol'),
(79, 'Nanded'),
(80, 'Kolhapur'),
(81, 'Ajmer'),
(82, 'Gulbarga'),
(83, 'Jamnagar'),
(84, 'Ujjain'),
(85, 'Loni'),
(86, 'Siliguri'),
(87, 'Jhansi'),
(88, 'Ulhasnagar'),
(89, 'Nellore'),
(90, 'Jammu'),
(91, 'Sangli-Miraj & Kupwad'),
(92, 'Belgaum'),
(93, 'Mangalore'),
(94, 'Ambattur'),
(95, 'Tirunelveli'),
(96, 'Malegaon'),
(97, 'Gaya'),
(98, 'Jalgaon'),
(99, 'Udaipur'),
(100, 'Maheshtala'),
(101, 'Tirupur'),
(102, 'Davanagere'),
(103, 'Kozhikode'),
(104, 'Akola'),
(105, 'Kurnool'),
(106, 'Rajpur Sonarpur'),
(107, 'Bokaro'),
(108, 'South Dumdum'),
(109, 'Bellary'),
(110, 'Patiala'),
(111, 'Gopalpur'),
(112, 'Agartala'),
(113, 'Bhagalpur'),
(114, 'Muzaffarnagar'),
(115, 'Bhatpara'),
(116, 'Panihati'),
(117, 'Latur'),
(118, 'Dhule'),
(119, 'Rohtak'),
(120, 'Korba'),
(121, 'Bhilwara'),
(122, 'Brahmapur'),
(123, 'Muzaffarpur'),
(124, 'Ahmednagar'),
(125, 'Mathura'),
(126, 'Kollam'),
(127, 'Avadi'),
(128, 'Rajahmundry'),
(129, 'Kadapa'),
(130, 'Kamarhati'),
(131, 'Bilaspur'),
(132, 'Shahjahanpur'),
(133, 'Bijapur'),
(134, 'Rampur'),
(135, 'Shivamogga?(Shimoga)'),
(136, 'Chandrapur'),
(137, 'Junagadh'),
(138, 'Thrissur'),
(139, 'Alwar'),
(140, 'Bardhaman'),
(141, 'Kulti'),
(142, 'Kakinada'),
(143, 'Nizamabad'),
(144, 'Parbhani'),
(145, 'Tumkur'),
(146, 'Hisar'),
(147, 'Ozhukarai'),
(148, 'Bihar Sharif'),
(149, 'Panipat'),
(150, 'Darbhanga'),
(151, 'Bally'),
(152, 'Aizawl'),
(153, 'Dewas'),
(154, 'Ichalkaranji'),
(155, 'Tirupati'),
(156, 'Karnal'),
(157, 'Bathinda'),
(158, 'Jalna'),
(159, 'Barasat'),
(160, 'Kirari Suleman Nagar'),
(161, 'Purnia'),
(162, 'Satna'),
(163, 'Mau'),
(164, 'Sonipat'),
(165, 'Farrukhabad'),
(166, 'Sagar'),
(167, 'Rourkela'),
(168, 'Durg'),
(169, 'Imphal'),
(170, 'Ratlam'),
(171, 'Hapur'),
(172, 'Anantapur'),
(173, 'Arrah'),
(174, 'Karimnagar'),
(175, 'Etawah'),
(176, 'Ambernath'),
(177, 'North Dumdum'),
(178, 'Bharatpur'),
(179, 'Begusarai'),
(180, 'New Delhi'),
(181, 'Gandhidham'),
(182, 'Baranagar'),
(183, 'Tiruvottiyur'),
(184, 'Puducherry'),
(185, 'Sikar'),
(186, 'Thoothukudi'),
(187, 'Rewa'),
(188, 'Mirzapur'),
(189, 'Raichur'),
(190, 'Pali'),
(191, 'Ramagundam'),
(192, 'Vizianagaram'),
(193, 'Katihar'),
(194, 'Haridwar'),
(195, 'Sri Ganganagar'),
(196, 'Karawal Nagar'),
(197, 'Nagercoil'),
(198, 'Mango'),
(199, 'Bulandshahr'),
(200, 'Thanjavur');

-- --------------------------------------------------------

--
-- Table structure for table `rms_client`
--

CREATE TABLE IF NOT EXISTS `rms_client` (
  `clientID` int(10) NOT NULL AUTO_INCREMENT,
  `clientName` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `branch` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone1` varchar(50) NOT NULL,
  `phone2` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `pincode` int(10) NOT NULL,
  `note` text NOT NULL,
  `createdOn` date NOT NULL,
  PRIMARY KEY (`clientID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rms_client`
--
-- --------------------------------------------------------

--
-- Table structure for table `rms_country`
--

CREATE TABLE IF NOT EXISTS `rms_country` (
  `countryID` int(10) NOT NULL,
  `country` varchar(200) NOT NULL,
  `currency` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_country`
--

INSERT INTO `rms_country` (`countryID`, `country`, `currency`) VALUES
(1, 'Afghanistan', 'AFN'),
(2, 'Albania', 'ALL'),
(3, 'Algeria', 'DZD'),
(4, 'American Samoa', 'USD'),
(5, 'Andorra', 'EUR'),
(6, 'Angola', 'AOA'),
(7, 'Anguilla', 'XCD'),
(8, 'Antarctica', 'NA'),
(9, 'Antigua and Barbuda', 'XCD'),
(10, 'Argentina', 'ARS'),
(11, 'Armenia', 'AMD'),
(12, 'Aruba', 'AWG'),
(13, 'Australia', 'AUD'),
(14, 'Austria', 'EUR'),
(15, 'Azerbaijan', 'AZN'),
(16, 'Bahamas', 'BSD'),
(17, 'Bahrain', 'BHD'),
(18, 'Bangladesh', 'BDT'),
(19, 'Barbados', 'BBD'),
(20, 'Belarus', 'BYR'),
(21, 'Belgium', 'EUR'),
(22, 'Belize', 'BZD'),
(23, 'Benin', 'XOF'),
(24, 'Bermuda', 'BMD'),
(25, 'Bhutan', 'BTN'),
(26, 'Bolivia', 'BOB'),
(27, 'Bosnia and Herzegowina', 'BAM'),
(28, 'Botswana', 'BWP'),
(29, 'Bouvet Island', 'BVT'),
(30, 'Brazil', 'BRL'),
(31, 'British Indian Ocean Territory', 'USD'),
(32, 'Brunei Darussalam', 'USD'),
(33, 'Bulgaria', 'BGN'),
(34, 'Burkina Faso', 'XOF'),
(35, 'Burundi', 'BIF'),
(36, 'Cambodia', 'KHR'),
(37, 'Cameroon', 'XAF'),
(38, 'Canada', 'CAD'),
(39, 'Cape Verde', 'CVE'),
(40, 'Cayman Islands', 'KYD'),
(41, 'Central African Republic', 'XAF'),
(42, 'Chad', 'XAF'),
(43, 'Chile', 'CLP'),
(44, 'China', 'CNY'),
(45, 'Christmas Island', 'AUD'),
(46, 'Cocos (Keeling) Islands', 'AUD'),
(47, 'Colombia', 'COP'),
(48, 'Comoros', 'KMF'),
(49, 'Congo', 'USD'),
(50, 'Cook Islands', 'NZD'),
(51, 'Costa Rica', 'CRC'),
(52, 'Cote D''Ivoire', 'XOF'),
(53, 'Croatia', 'HRK'),
(54, 'Cuba', 'CUP'),
(55, 'Cyprus', 'CYP'),
(56, 'Czech Republic', 'CZK'),
(57, 'Denmark', 'DKK'),
(58, 'Djibouti', 'DJF'),
(59, 'Dominica', 'XCD'),
(60, 'Dominican Republic', 'DOP'),
(61, 'East Timor', 'USD'),
(62, 'Ecuador', 'USD'),
(63, 'Egypt', 'EGP'),
(64, 'El Salvador', 'USD'),
(65, 'Equatorial Guinea', 'XAF'),
(66, 'Eritrea', 'ERN'),
(67, 'Estonia', 'EEK'),
(68, 'Ethiopia', 'ETB'),
(69, 'Falkland Islands (Malvinas', 'USD'),
(70, 'Faroe Islands', 'DKK'),
(71, 'Fiji', 'FJD'),
(72, 'Finland', 'EUR'),
(73, 'France', 'EUR'),
(74, 'France, Metropolitan', 'EUR'),
(75, 'French Guiana', 'EUR'),
(76, 'French Polynesia', 'EUR'),
(77, 'French Southern Territories', 'EUR'),
(78, 'Gabon', 'XAF'),
(79, 'Gambia', 'GMD'),
(80, 'Georgia', 'GEL'),
(81, 'Germany', 'EUR'),
(82, 'Ghana', 'GHS'),
(83, 'Gibraltar', 'GIP'),
(84, 'Greece', 'EUR'),
(85, 'Greenland', 'DKK'),
(86, 'Grenada', 'XCD'),
(87, 'Guadeloupe', 'EUR'),
(88, 'Guam', 'USD'),
(89, 'Guatemala', 'GTQ'),
(90, 'Guinea', 'GNF'),
(91, 'Guinea-bissau', 'XOF'),
(92, 'Guyana', 'GYD'),
(93, 'Haiti', 'HTG'),
(94, 'Heard and Mc Donald Islands', 'AUD'),
(95, 'Honduras', 'HNL'),
(96, 'Hong Kong', 'HKD'),
(97, 'Hungary', 'HUF'),
(98, 'Iceland', 'ISK'),
(99, 'India', 'INR'),
(100, 'Indonesia', 'IDR'),
(101, 'Iran', 'IRR'),
(102, 'Iraq', 'IQD'),
(103, 'Ireland', 'EUR'),
(104, 'Israel', 'ILS'),
(105, 'Italy', 'EUR'),
(106, 'Jamaica', 'JMD'),
(107, 'Japan', 'JPY'),
(108, 'Jordan', 'JOD'),
(109, 'Kazakhstan', 'KZT'),
(110, 'Kenya', 'KES'),
(111, 'Kiribati', 'AUD'),
(112, 'Korea', 'KPW'),
(113, 'Korea, Republic of', 'KPW'),
(114, 'Kuwait', 'KWD'),
(115, 'Kyrgyzstan', 'KGS'),
(116, 'Lao ', 'LAK'),
(117, 'Latvia', 'LVL'),
(118, 'Lebanon', 'LBP'),
(119, 'Lesotho', 'LSL'),
(120, 'Liberia', 'LRD'),
(121, 'Libyan Arab Jamahiriya', 'LYD'),
(122, 'Liechtenstein', 'CHF'),
(123, 'Lithuania', 'LTL'),
(124, 'Luxembourg', 'EUR'),
(125, 'Macau', 'MOP'),
(126, 'Macedonia', 'MKD'),
(127, 'Madagascar', 'MGA'),
(128, 'Malawi', 'MWK'),
(129, 'Malaysia', 'MYR'),
(130, 'Maldives', 'MVR'),
(131, 'Mali', 'XOF'),
(132, 'Malta', 'MTL'),
(133, 'Marshall Islands', 'USD'),
(134, 'Martinique', 'EUR'),
(135, 'Mauritania', 'MRO'),
(136, 'Mauritius', 'MUR'),
(137, 'Mayotte', 'EUR'),
(138, 'Mexico', 'MXN'),
(139, 'Micronesia', 'USD'),
(140, 'Moldova, Republic of', 'MDL'),
(141, 'Monaco', 'EUR'),
(142, 'Mongolia', 'MNT'),
(143, 'Montserrat', 'XCD'),
(144, 'Morocco', 'MAD'),
(145, 'Mozambique', 'MZN'),
(146, 'Myanmar', 'MMK'),
(147, 'Namibia', 'NAD'),
(148, 'Nauru', 'AUD'),
(149, 'Nepal', 'NPR'),
(150, 'Netherlands', 'EUR'),
(151, 'Netherlands Antilles', 'ANG'),
(152, 'New Caledonia', 'XPF'),
(153, 'New Zealand', 'NZD'),
(154, 'Nicaragua', 'NIO'),
(155, 'Niger', 'XOF'),
(156, 'Nigeria', 'NGN'),
(157, 'Niue', 'NZD'),
(158, 'Norfolk Island', 'AUD'),
(159, 'Northern Mariana Islands', 'USD'),
(160, 'Norway', 'NOK'),
(161, 'Oman', 'OMR'),
(162, 'Pakistan', 'PKR'),
(163, 'Palau', 'USD'),
(164, 'Panama', 'USD'),
(165, 'Papua New Guinea', 'PGK'),
(166, 'Paraguay', 'PYG'),
(167, 'Peru', 'PEN'),
(168, 'Philippines', 'PHP'),
(169, 'Pitcairn', 'NZD'),
(170, 'Poland', 'PLN'),
(171, 'Portugal', 'EUR'),
(172, 'Puerto Rico', 'USD'),
(173, 'Qatar', 'QAR'),
(175, 'Romania', 'RON'),
(176, 'Russian Federation', 'RUR'),
(177, 'Rwanda', 'RWF'),
(178, 'Saint Kitts and Nevis', 'XCD'),
(179, 'Saint Lucia', 'XCD'),
(180, 'Saint Vincent and the Grenadines', 'XCD'),
(181, 'Samoa', 'WST'),
(182, 'San Marino', 'EUR'),
(183, 'Sao Tome and Principe', 'STD'),
(184, 'Saudi Arabia', 'SAR'),
(185, 'Senegal', 'XOF'),
(186, 'Seychelles', 'SCR'),
(187, 'Sierra Leone', 'SLL'),
(188, 'Singapore', 'SGD'),
(189, 'Slovakia (Slovak Republic', 'SKK'),
(190, 'Slovenia', 'EUR'),
(191, 'Solomon Islands', 'SBD'),
(192, 'Somalia', 'SOS'),
(193, 'South Africa', 'ZAR'),
(194, 'South Georgia', 'GBP'),
(195, 'Spain', 'EUR'),
(196, 'Sri Lanka', 'LKR'),
(197, 'St. Helena', 'SHP'),
(198, 'St. Pierre and Miquelon', ' '),
(199, 'Sudan', 'SDG'),
(200, 'Suriname', 'SRD'),
(201, 'Svalbard and Jan Mayen Islands', 'NOK'),
(202, 'Swaziland', 'ZAR'),
(203, 'Sweden', 'SEK'),
(204, 'Switzerland', 'CHF'),
(205, 'Syrian Arab Republic', 'SYP'),
(206, 'Taiwan', 'TWD'),
(207, 'Tajikistan', 'RUB'),
(208, 'Tanzania, United Republic of', 'TZS'),
(209, 'Thailand', 'THB'),
(210, 'Togo', 'XOF'),
(211, 'Tokelau', 'NZD'),
(212, 'Tonga', 'TOP'),
(213, 'Trinidad and Tobago', 'TTD'),
(214, 'Tunisia', 'TND'),
(215, 'Turkey', 'TRY'),
(216, 'Turkmenistan', 'TMM'),
(217, 'Turks and Caicos Islands', 'USD'),
(218, 'Tuvalu', 'TVD'),
(219, 'Uganda', 'UGX'),
(220, 'Ukraine', 'UAH'),
(221, 'United Arab Emirates', 'AED'),
(222, 'United Kingdom', 'GBP'),
(223, 'United States', 'USD'),
(224, 'United States Minor Outlying Islands', 'USD'),
(225, 'Uruguay', 'UYU'),
(226, 'Uzbekistan', 'UZS'),
(227, 'Vanuatu', 'VUV'),
(228, 'Vatican City State (Holy See', 'USD'),
(229, 'Venezuela', 'VEB'),
(230, 'Viet Nam', 'USD'),
(231, 'Virgin Islands (British', 'VND'),
(232, 'Virgin Islands (U.S.', 'VND'),
(233, 'Wallis and Futuna Islands', 'XPF'),
(234, 'Western Sahara', 'MAD'),
(235, 'Yemen', 'YER'),
(236, 'Yugoslavia', 'YUN'),
(237, 'Zaire', ''),
(238, 'Zambia', 'ZMK'),
(239, 'Zimbabwe', 'ZWD');

-- --------------------------------------------------------

--
-- Table structure for table `rms_etemplates`
--

CREATE TABLE IF NOT EXISTS `rms_etemplates` (
  `temID` int(11) NOT NULL AUTO_INCREMENT,
  `temTitle` varchar(100) NOT NULL,
  `temContent` text NOT NULL,
  `temStatus` char(1) NOT NULL,
  PRIMARY KEY (`temID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rms_experience`
--

CREATE TABLE IF NOT EXISTS `rms_experience` (
  `experienceID` int(10) NOT NULL AUTO_INCREMENT,
  `employee` varchar(200) DEFAULT NULL,
  `experience` int(3) DEFAULT NULL,
  `profileID` int(10) DEFAULT NULL,
  PRIMARY KEY (`experienceID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `rms_industry`
--

CREATE TABLE IF NOT EXISTS `rms_industry` (
  `industryID` int(10) NOT NULL,
  `industry` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_industry`
--

INSERT INTO `rms_industry` (`industryID`, `industry`) VALUES
(1, 'Software, Hardware, EDP'),
(2, 'Sales'),
(3, 'Marketing &amp; Communications'),
(4, 'Advertising, DM, PR, MR and Event Management'),
(5, 'Entertainment / Media / Journalism'),
(6, 'Human Resource, Admin &amp; Recruitment'),
(7, 'Purchase/ Supply Chain'),
(8, 'Finance &amp; Accounts'),
(9, 'Banking'),
(10, 'Insurance'),
(11, 'Financial Services'),
(12, 'Legal/ Law'),
(13, 'Production/ Engg/ R&amp;D'),
(14, 'Pharmaceutical/ Biotechnology'),
(15, 'Retail Chains'),
(16, 'Travel/ Airlines'),
(17, 'Hotels/ restaurants'),
(18, 'Health Care'),
(19, 'Telecom/ ISP'),
(20, 'Call Centre, BPO, Customer Service'),
(21, 'Construction'),
(22, 'Oil &amp; Gas'),
(23, 'Senior Management'),
(24, 'Export/ Import'),
(25, 'Distribution &amp; Delivery/ Courier'),
(26, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `rms_jobs`
--

CREATE TABLE IF NOT EXISTS `rms_jobs` (
  `jobID` int(10) NOT NULL AUTO_INCREMENT,
  `jobUniqueID` varchar(200) DEFAULT NULL,
  `projectName` varchar(200) DEFAULT NULL,
  `jobTitle` varchar(200) NOT NULL,
  `totalPositions` int(10) DEFAULT NULL,
  `minExp` int(2) DEFAULT NULL,
  `maxExp` int(2) DEFAULT NULL,
  `jobType` varchar(200) DEFAULT NULL,
  `jobCity` varchar(200) NOT NULL,
  `jobCountry` varchar(200) NOT NULL,
  `priority` varchar(200) DEFAULT NULL,
  `duration` varchar(200) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `primSkills` text,
  `secSkills` text,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `jobDesc` text,
  `clientID` int(10) DEFAULT NULL,
  `visaID` varchar(200) DEFAULT NULL,
  `createdOn` date NOT NULL,
  `modifiedOn` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `showEmail` varchar(10) NOT NULL,
  `hotJob` varchar(10) DEFAULT NULL,
  `userID` int(10) DEFAULT NULL,
  `showJob` varchar(10) DEFAULT NULL,
  `showClient` varchar(10) NOT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


-- --------------------------------------------------------

--
-- Table structure for table `rms_mail_setting`
--

CREATE TABLE IF NOT EXISTS `rms_mail_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rms_pipeline`
--

CREATE TABLE IF NOT EXISTS `rms_pipeline` (
  `pipelineID` int(10) NOT NULL AUTO_INCREMENT,
  `profileID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `clientID` int(10) NOT NULL,
  `jobID` int(10) NOT NULL,
  `status` varchar(200) NOT NULL,
  `entryDate` date NOT NULL,
  `lastUpdatedOn` date NOT NULL,
  PRIMARY KEY (`pipelineID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rms_profile_details`
--

CREATE TABLE IF NOT EXISTS `rms_profile_details` (
  `profileID` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `exp` int(10) NOT NULL,
  `primSkill` text NOT NULL,
  `secSkill` text NOT NULL,
  `industry` varchar(200) NOT NULL,
  `salaryCurrency` int(1) NOT NULL,
  `currSalary` varchar(50) NOT NULL,
  `exptSalary` varchar(50) NOT NULL,
  `currLocation` varchar(200) NOT NULL,
  `prefLocation` varchar(200) NOT NULL,
  `relocate` char(1) NOT NULL,
  `acceptedVisa` text NOT NULL,
  `eduQualification` text NOT NULL,
  `expDetails` text NOT NULL,
  `resumeFileName` varchar(200) NOT NULL,
  `resumeText` longtext CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `resumeSecond` longtext CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `updatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` int(10) NOT NULL,
  PRIMARY KEY (`profileID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;



-- --------------------------------------------------------

--
-- Table structure for table `rms_qualifications`
--

CREATE TABLE IF NOT EXISTS `rms_qualifications` (
  `qualificationID` int(11) NOT NULL AUTO_INCREMENT,
  `qualification` varchar(200) DEFAULT NULL,
  `specialization` varchar(200) DEFAULT NULL,
  `percentage` int(3) DEFAULT NULL,
  `profileID` int(10) DEFAULT NULL,
  PRIMARY KEY (`qualificationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rms_qualifications`
--

INSERT INTO `rms_qualifications` (`qualificationID`, `qualification`, `specialization`, `percentage`, `profileID`) VALUES
(1, 'MBBS', 'Microbiology', 0, 1),
(2, 'B.Arch', 'Chemistry', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rms_resume`
--

CREATE TABLE IF NOT EXISTS `rms_resume` (
  `resumeID` int(10) NOT NULL AUTO_INCREMENT,
  `userID` int(10) NOT NULL,
  `isPrimary` char(1) NOT NULL,
  `title` varchar(200) NOT NULL,
  `experienceMonths` varchar(10) NOT NULL,
  `primarySkills` text NOT NULL,
  `secondySkills` text NOT NULL,
  `industryID` int(10) NOT NULL,
  `currentSalary` double(10,2) NOT NULL,
  `currentSalaryType` char(1) NOT NULL,
  `expectedSalary` double(10,2) NOT NULL,
  `expectedSalaryType` char(1) NOT NULL,
  `currencyID` int(10) NOT NULL,
  `currentLocation` varchar(200) NOT NULL,
  `preferredLocation` varchar(200) NOT NULL,
  `relocate` char(1) NOT NULL,
  `availableFrom` date NOT NULL,
  `visaID` int(10) NOT NULL,
  `qualificationDetails` longtext NOT NULL,
  `experienceDetails` longtext NOT NULL,
  `resumeLocation` varchar(200) NOT NULL,
  `resumeText` longtext NOT NULL,
  PRIMARY KEY (`resumeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rms_resume_details`
--

CREATE TABLE IF NOT EXISTS `rms_resume_details` (
  `resumeID` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `fileName` varchar(200) NOT NULL,
  `resumeText` text NOT NULL,
  `userID` int(10) NOT NULL,
  `profileID` int(10) NOT NULL,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`resumeID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `rms_role`
--

CREATE TABLE IF NOT EXISTS `rms_role` (
  `roleID` int(10) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(200) NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rms_role`
--

INSERT INTO `rms_role` (`roleID`, `roleName`, `status`) VALUES
(1, 'Admin', 'Y'),
(2, 'Staff', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `rms_settings`
--

CREATE TABLE IF NOT EXISTS `rms_settings` (
  `name` varchar(200) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rms_user`
--

CREATE TABLE IF NOT EXISTS `rms_user` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `lastName` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `age` int(3) NOT NULL,
  `gender` char(1) NOT NULL,
  `phone1` varchar(50) NOT NULL,
  `phone2` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `pincode` int(10) NOT NULL,
  `roleID` int(10) NOT NULL,
  `profileID` int(10) NOT NULL,
  `lastLoginDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdOn` date NOT NULL,
  `confirmationCode` varchar(200) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Table structure for table `rms_visa`
--

CREATE TABLE IF NOT EXISTS `rms_visa` (
  `visaID` int(10) NOT NULL,
  `visa` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_visa`
--

INSERT INTO `rms_visa` (`visaID`, `visa`) VALUES
(1, 'H-1B - USA'),
(2, 'US-Citizen'),
(3, 'Green Card - USA'),
(4, 'US - Green Card'),
(5, 'Indian-Citizen');

-- --------------------------------------------------------

--
-- Table structure for table `rms_workflow`
--

CREATE TABLE IF NOT EXISTS `rms_workflow` (
  `workflowID` int(10) NOT NULL AUTO_INCREMENT,
  `profileID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `clientID` int(10) NOT NULL,
  `jobID` int(10) NOT NULL,
  `status` varchar(200) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `schdule` date NOT NULL,
  `entryDate` date NOT NULL,
  `lastUpdatedOn` datetime NOT NULL,
  PRIMARY KEY (`workflowID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
