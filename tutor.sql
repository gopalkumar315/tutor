-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2015 at 07:35 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tutor`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent`) VALUES
(1, 'English', 0),
(6, 'Math', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE IF NOT EXISTS `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`id`, `title`, `description`, `file`, `created_at`, `updated_at`) VALUES
(4, '24/7 Access', '<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies  magna et. Quisque euismod orci ut et lobortis aliquam. Aliquam in tortor  enim.</p>', '6wFKJLwatch.png', '2015-02-14 09:15:42', '2015-02-14 09:15:42'),
(5, 'The Best Tutors', '<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies  magna et. Quisque euismod orci ut et lobortis aliquam. Aliquam in tortor  enim.</p>', 'HwwQ1vblub.png', '2015-02-14 09:16:20', '2015-02-14 09:16:20'),
(6, 'Personalized', '<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies  magna et. Quisque euismod orci ut et lobortis aliquam. Aliquam in tortor  enim.</p>', 'cI2Ntptarget.png', '2015-02-14 09:16:50', '2015-02-14 09:16:50'),
(7, 'Variety of Subjects', '<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies  magna et. Quisque euismod orci ut et lobortis aliquam. Aliquam in tortor  enim.</p>', '8Blx4Yshare.png', '2015-02-14 09:17:16', '2015-02-14 09:17:16'),
(8, 'Variety of Subjects', '<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies  magna et. Quisque euismod orci ut et lobortis aliquam. Aliquam in tortor  enim.</p>', '8Blx4Yshare.png', '2015-02-14 09:17:16', '2015-02-14 09:17:16'),
(9, 'Variety of Subjects', '<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies  magna et. Quisque euismod orci ut et lobortis aliquam. Aliquam in tortor  enim.</p>', '8Blx4Yshare.png', '2015-02-14 09:17:16', '2015-02-14 09:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `description`, `user_id`) VALUES
(1, 'dfd', 'gopalkumar315@gmail.com', 'fgfg', 2),
(2, 'fgfd', 'gfgfd@gmail.com', 'fdgdfg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `longitude`, `latitude`, `address`, `postal_code`, `user_id`) VALUES
(1, 'fg', 'fgfg', 'dfgf', '1111', 2);

-- --------------------------------------------------------

--
-- Table structure for table `privacy`
--

CREATE TABLE IF NOT EXISTS `privacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE IF NOT EXISTS `social_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linked_in` varchar(255) NOT NULL,
  `google_plus` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `facebook`, `twitter`, `linked_in`, `google_plus`, `user_id`) VALUES
(1, 'https://www.facebook.com/gopalkumar315', 'https://www.facebook.com/gopalkumar315', 'https://www.facebook.com/gopalkumar315', 'https://www.facebook.com/gopalkumar315', 2);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `tag_line` text NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subject_id`, `tag_line`, `description`, `created_at`, `updated_at`, `name`) VALUES
(7, 1, 'Get help learning english from basic Grammer to geometric formulas to derivatives.', '<h3>One-to-One Discrete Math Sessions</h3><p>\r\n	Large class lectures can be long and distracting, having a  personalized tutor makes a big difference. With topics like Euler trails  and circuits, permutations and combinations, it is easy to get confused  in class. Find your tutor now and master the rules of sum and product  today!</p><h3>24/7 Expert Tutoring</h3><p>\r\n	Whether you’re trying to finish homework before soccer practice or  studying at 11 pm the night before a big test, we’ve got you covered.  Our tutors are available 24/7 to help with everything from o-notation to  logical equivalence. Stop going to class confused. Finish your homework  on time and be confident in class by finding a personal discrete math  tutor online!</p><h3>Learning in the Online Classroom</h3><p>\r\n	Learning discrete math in our online classroom is simple and  efficient. You can easily work through proofs with your tutor on the  interactive whiteboard. Being able to work in real time on the  whiteboard allows your tutor to see each step you make and help you  along the way. Are you unsure of the difference between induction and  recursion that came up on last week’s test? No problem. Utilize the  file-sharing tool to go over old tests and homework directly in the  classroom. You and your tutor will be able to chat back and forth to  master concepts together.</p><h3>Improve Your Grades Today</h3><p>\r\n	Solving a problem in class with the teacher in front of you is  different than trying to do your homework alone after school. Get the  extra help you need outside of the classroom to get on your way to  better grades. Our tutors are available whenever you need them to give  you 24/7 expert help online. From high school to college level courses,  our tutors can help you with the topics your stuck on.</p>', '2015-02-15 17:14:25', '2015-02-15 11:44:25', 'English Grammer'),
(8, 6, 'Algebra Tutors', '<h3>One-to-One Discrete Math Sessions</h3><p>\r\n	Large class lectures can be long and distracting, having a  personalized tutor makes a big difference. With topics like Euler trails  and circuits, permutations and combinations, it is easy to get confused  in class. Find your tutor now and master the rules of sum and product  today!</p><h3>24/7 Expert Tutoring</h3><p>\r\n	Whether you’re trying to finish homework before soccer practice or  studying at 11 pm the night before a big test, we’ve got you covered.  Our tutors are available 24/7 to help with everything from o-notation to  logical equivalence. Stop going to class confused. Finish your homework  on time and be confident in class by finding a personal discrete math  tutor online!</p><h3>Learning in the Online Classroom</h3><p>\r\n	Learning discrete math in our online classroom is simple and  efficient. You can easily work through proofs with your tutor on the  interactive whiteboard. Being able to work in real time on the  whiteboard allows your tutor to see each step you make and help you  along the way. Are you unsure of the difference between induction and  recursion that came up on last week’s test? No problem. Utilize the  file-sharing tool to go over old tests and homework directly in the  classroom. You and your tutor will be able to chat back and forth to  master concepts together.</p><h3>Improve Your Grades Today</h3><p>\r\n	Solving a problem in class with the teacher in front of you is  different than trying to do your homework alone after school. Get the  extra help you need outside of the classroom to get on your way to  better grades. Our tutors are available whenever you need them to give  you 24/7 expert help online. From high school to college level courses,  our tutors can help you with the topics your stuck on.</p>', '2015-02-15 12:49:02', '2015-02-15 12:49:02', 'Algebra Tutors'),
(9, 6, 'Calculus Tutors', '<h3>One-to-One Discrete Math Sessions</h3>\r\n<p>\r\n	Large class lectures can be long and distracting, having a  personalized tutor makes a big difference. With topics like Euler trails  and circuits, permutations and combinations, it is easy to get confused  in class. Find your tutor now and master the rules of sum and product  today!\r\n</p>\r\n<h3>24/7 Expert Tutoring</h3>\r\n<p>\r\n	Whether you’re trying to finish homework before soccer practice or  studying at 11 pm the night before a big test, we’ve got you covered.  Our tutors are available 24/7 to help with everything from o-notation to  logical equivalence. Stop going to class confused. Finish your homework  on time and be confident in class by finding a personal discrete math  tutor online!\r\n</p>\r\n<h3>Learning in the Online Classroom</h3>\r\n<p>\r\n	Learning discrete math in our online classroom is simple and  efficient. You can easily work through proofs with your tutor on the  interactive whiteboard. Being able to work in real time on the  whiteboard allows your tutor to see each step you make and help you  along the way. Are you unsure of the difference between induction and  recursion that came up on last week’s test? No problem. Utilize the  file-sharing tool to go over old tests and homework directly in the  classroom. You and your tutor will be able to chat back and forth to  master concepts together.\r\n</p>\r\n<h3>Improve Your Grades Today</h3>\r\n<p>\r\n	Solving a problem in class with the teacher in front of you is  different than trying to do your homework alone after school. Get the  extra help you need outside of the classroom to get on your way to  better grades. Our tutors are available whenever you need them to give  you 24/7 expert help online. From high school to college level courses,  our tutors can help you with the topics your stuck on.\r\n</p>', '2015-02-15 12:49:41', '2015-02-15 12:49:41', 'Calculus Tutors'),
(10, 6, 'Trigonometry Tutors', '<h3>\r\n	One-to-One Discrete Math Sessions\r\n</h3>\r\n<p>\r\n	Large class lectures can be long and distracting, having a  personalized tutor makes a big difference. With topics like Euler trails  and circuits, permutations and combinations, it is easy to get confused  in class. Find your tutor now and master the rules of sum and product  today!\r\n</p>\r\n<h3>24/7 Expert Tutoring</h3>\r\n<p>\r\n	Whether you’re trying to finish homework before soccer practice or  studying at 11 pm the night before a big test, we’ve got you covered.  Our tutors are available 24/7 to help with everything from o-notation to  logical equivalence. Stop going to class confused. Finish your homework  on time and be confident in class by finding a personal discrete math  tutor online!\r\n</p>\r\n<h3>Learning in the Online Classroom</h3>\r\n<p>\r\n	Learning discrete math in our online classroom is simple and  efficient. You can easily work through proofs with your tutor on the  interactive whiteboard. Being able to work in real time on the  whiteboard allows your tutor to see each step you make and help you  along the way. Are you unsure of the difference between induction and  recursion that came up on last week’s test? No problem. Utilize the  file-sharing tool to go over old tests and homework directly in the  classroom. You and your tutor will be able to chat back and forth to  master concepts together.\r\n</p>\r\n<h3>Improve Your Grades Today</h3>\r\n<p>\r\n	Solving a problem in class with the teacher in front of you is  different than trying to do your homework alone after school. Get the  extra help you need outside of the classroom to get on your way to  better grades. Our tutors are available whenever you need them to give  you 24/7 expert help online. From high school to college level courses,  our tutors can help you with the topics your stuck on.\r\n</p>', '2015-02-15 12:51:19', '2015-02-15 12:51:19', 'Trigonometry Tutors');

-- --------------------------------------------------------

--
-- Table structure for table `t_profile`
--

CREATE TABLE IF NOT EXISTS `t_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `file` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `availability` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `qualification` text NOT NULL,
  `experience` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `t_profile`
--

INSERT INTO `t_profile` (`id`, `title`, `first_name`, `last_name`, `email`, `address1`, `address2`, `country`, `city`, `postcode`, `phone`, `mobile`, `dob`, `file`, `description`, `availability`, `user_id`, `created_at`, `updated_at`, `qualification`, `experience`) VALUES
(1, 'Prof', 'fgf', 'Kumar', 'gopalkumar315@gmail.com', 'h.no 256,Islam gunj,prem nagar,Ludhiana', 'h.no 256,Islam gunj,prem nagar,Ludhiana', 'India', 'Ludhiana', '141001', '+918591819500', '+918591819500', '1993-11-25', '20150226064559.png', 'dsfdsfdsfds', 'sdfsdfsdfsdfsdf', 2, '2015-02-27 18:10:34', '2015-02-27 12:40:34', 'fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff ', 'fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff fdgdff ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset` varchar(255) NOT NULL,
  `confirm_code` varchar(255) NOT NULL,
  `confirm_status` int(11) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `last_logout` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `last_login`, `email`, `password`, `reset`, `confirm_code`, `confirm_status`, `remember_token`, `created_at`, `updated_at`, `type`, `username`, `last_logout`) VALUES
(1, '2015-02-24 19:24:06', 'abc@gmail.com', '$2y$10$QsPTHMoV1Bcd75UlmbL3fOlG9JdBOFcXbN.cLQliom.L68xvfFHbC', 'tj1aeZmQ6ZjOL76dwXV3Zx1LgtpoXlcc2DQLTIyxgsYTC2FMaGMOFToC4jvR', '', 1, 'xfi42mSuZb2US3yUTKYxmENSWejXYmWDgz07vJCJgwKthGPbeEwzJD9CPDAI', '2015-02-24 19:24:06', '2015-02-24 13:54:06', 'admin', 'abc@gmail.com', '2015-02-24 13:54:06'),
(2, '2015-02-27 18:25:09', 'gopalkumar315@gmail.com', '$2y$10$F/QILt7kFhglvV1hdwLYFuDlCmBWC7GVxcJZafs145V2MYTGkEgoy', '', 'tj1aeZmQ6ZjOL76dwXV3Zx1LgtpoXlcc2DQLTIyxgsYTC2FMaGMOFToC4jvR', 0, 'CNo2ve2eqqo9eJXievh9aTb0jHJU4dzbXL0lXe8V6sgnwl9uSgJWnr8DaZxC', '2015-02-27 18:25:09', '2015-02-27 12:55:09', 'tutor', 'gopalkumar315', '2015-02-27 12:55:09');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
