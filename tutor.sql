-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 25, 2015 at 09:33 PM
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
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `parent_id`) VALUES
(1, 'dfdsfggg', 0),
(2, 'abc', 0),
(3, 'fgfgf', 0),
(5, 'English', 0),
(8, 'abcd', 1),
(9, 'Grammer', 5);

-- --------------------------------------------------------

--
-- Table structure for table `subject_detail`
--

CREATE TABLE IF NOT EXISTS `subject_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) NOT NULL,
  `tag_line` text NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `subject_detail`
--

INSERT INTO `subject_detail` (`id`, `subject_id`, `tag_line`, `description`, `created_at`, `updated_at`) VALUES
(2, 8, 'Nothing', '<h1>Get Better Grades in Chemistry</h1><p>Don’t stress about chemistry homework. Get a tutor. Our expert  chemistry tutors are ready to help you 24/7 with everything from  balancing chemical equations to finding the oxidation number to  understanding acids and bases.</p><h3>Finding Chemistry Help Is Easy</h3><p>All you have to do it tell us a little about your chemistry problem.  Then, we’ll connect you to the best chemistry tutor available to help.  Every session is personalized and will address your specific questions.  You’ll work one-to-one with a chemistry tutor in our online classroom  and can cover whatever topic you’re working on, including:</p><ul><li>Atomic theory</li><li>Polymerization</li><li>Molecular structure</li><li>Chemical equilibrium</li><li>Oxidation reduction</li><li>Chemical Reactions</li></ul>', '2015-01-25 20:26:40', '2015-01-25 14:56:40'),
(3, 9, 'nthing now', '<p>dsfhjdshfddjhfjdshfjkshdfdfd</p>', '2015-01-25 12:51:42', '2015-01-25 12:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset` varchar(255) NOT NULL,
  `confirm_code` varchar(255) NOT NULL,
  `confirm_status` varchar(255) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `reset`, `confirm_code`, `confirm_status`, `remember_token`, `created_at`, `updated_at`, `type`) VALUES
(1, 'abc@gmail.com', '$2y$10$QsPTHMoV1Bcd75UlmbL3fOlG9JdBOFcXbN.cLQliom.L68xvfFHbC', 'tj1aeZmQ6ZjOL76dwXV3Zx1LgtpoXlcc2DQLTIyxgsYTC2FMaGMOFToC4jvR', '', '1', 'kHcpeOTXhBraI673pxk5IAmjOpUI8l7KiQ9uXgg2mmqD0d1mYVaJ8OrU1gca', '2015-01-25 06:40:28', '2015-01-25 01:10:28', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
