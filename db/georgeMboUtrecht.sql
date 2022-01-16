-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 29, 2021 at 01:31 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `georgemboutrecht`
--
CREATE DATABASE IF NOT EXISTS `georgemboutrecht` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `georgemboutrecht`;

-- --------------------------------------------------------

--
-- Table structure for table `begeleidersrooster`
--

DROP TABLE IF EXISTS `begeleidersrooster`;
CREATE TABLE IF NOT EXISTS `begeleidersrooster` (
  `id` int(11) NOT NULL,
  `begeleider` varchar(5) NOT NULL,
  `werkDatum` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BR_Werkdag_idx` (`werkDatum`),
  KEY `fk_BR_Begeleider_idx` (`begeleider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `beoordeling`
--

DROP TABLE IF EXISTS `beoordeling`;
CREATE TABLE IF NOT EXISTS `beoordeling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inschrijving` int(11) NOT NULL,
  `oordeel` varchar(500) NOT NULL,
  `voldoende` tinyint(4) NOT NULL DEFAULT '0',
  `begeleider` varchar(5) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Beorrdeling_RI_idx` (`inschrijving`),
  KEY `fk_Beoordeling_Medewerker_idx` (`begeleider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `beroep`
--

DROP TABLE IF EXISTS `beroep`;
CREATE TABLE IF NOT EXISTS `beroep` (
  `beroep` varchar(10) NOT NULL,
  PRIMARY KEY (`beroep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `klant`
--

DROP TABLE IF EXISTS `klant`;
CREATE TABLE IF NOT EXISTS `klant` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(45) NOT NULL,
  `tussenvoegsel` varchar(10) DEFAULT NULL,
  `achternaam` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobiel` varchar(10) NOT NULL,
  `rol` varchar(25) NOT NULL DEFAULT 'klant',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emailVerified` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Klant_Rol_idx` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `klant`
--

INSERT INTO `klant` (`id`, `voornaam`, `tussenvoegsel`, `achternaam`, `email`, `mobiel`, `rol`, `createdAt`, `updatedAt`, `emailVerified`) VALUES
(26, 'Arjan', 'de', 'Ruijter', 'arjanderuijter@gmail.com', '0612345678', 'klant', '2021-10-14 04:53:37', '2021-10-14 04:53:37', 1),
(27, 'Aron', 'van de', 'ridder', 'a@a', '0648377848', 'klant', '2021-10-14 11:26:02', '2021-10-14 11:26:02', 1),
(28, 'l', 'l', 'l', 'l@l.nl', '0612345678', 'klant', '2021-10-26 11:51:21', '2021-10-26 11:51:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lespakket`
--

DROP TABLE IF EXISTS `lespakket`;
CREATE TABLE IF NOT EXISTS `lespakket` (
  `lespakket` varchar(10) NOT NULL,
  `omschrijving` varchar(100) NOT NULL,
  `aantalLessenKok` int(11) NOT NULL,
  `aantalLessenBarman` int(11) NOT NULL,
  `aantalLessenOber` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lespakket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lespakket`
--

INSERT INTO `lespakket` (`lespakket`, `omschrijving`, `aantalLessenKok`, `aantalLessenBarman`, `aantalLessenOber`, `createdAt`, `updatedAt`) VALUES
('Algemeen', 'Het lespakket met gelijke verdeling over de verschillende discipline', 5, 5, 5, '2021-10-12 11:10:22', '2021-10-12 11:10:22'),
('Barman', 'Dit is het lespakket waarbij je veel uren draait als barman', 3, 9, 3, '2021-10-12 11:07:32', '2021-10-12 11:07:32'),
('kok', 'Dit is de cursus waarbij je veel uren draait als kok', 10, 2, 3, '2021-10-07 10:37:58', '2021-10-12 11:06:46'),
('Ober', 'Dit is het lespakket waarbij je veel uren draait als ober.', 3, 2, 10, '2021-10-12 11:08:13', '2021-10-12 11:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `mededeling`
--

DROP TABLE IF EXISTS `mededeling`;
CREATE TABLE IF NOT EXISTS `mededeling` (
  `id` int(11) NOT NULL,
  `mededeling` varchar(500) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medewerker`
--

DROP TABLE IF EXISTS `medewerker`;
CREATE TABLE IF NOT EXISTS `medewerker` (
  `email` varchar(100) NOT NULL,
  `voornaam` varchar(45) NOT NULL,
  `tussenvoegsel` varchar(10) DEFAULT NULL,
  `achternaam` varchar(45) NOT NULL,
  `mobiel` varchar(10) NOT NULL,
  `afkorting` varchar(5) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `afkorting_UNIQUE` (`afkorting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medewerker`
--

INSERT INTO `medewerker` (`email`, `voornaam`, `tussenvoegsel`, `achternaam`, `mobiel`, `afkorting`) VALUES
('georgemarina@georgemarina.nl', 'George', '', 'Marina', '0612345678', 'GEMA'),
('hsok@mboutrecht.nl', 'Hans', '', 'Odijk', '0612345678', 'HSOK'),
('rra@mboutrecht.nl', 'Arjan', 'de', 'Ruijter', '0612345678', 'RRA'),
('stevendejong@georgemarina.nl', 'Steven', 'de', 'Jong', '06123456', 'SNJG');

-- --------------------------------------------------------

--
-- Table structure for table `medewerkerrol`
--

DROP TABLE IF EXISTS `medewerkerrol`;
CREATE TABLE IF NOT EXISTS `medewerkerrol` (
  `rol` varchar(25) NOT NULL,
  `medewerker` varchar(100) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rol`,`medewerker`),
  KEY `fk_MedewerkerRol_Med_idx` (`medewerker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
CREATE TABLE IF NOT EXISTS `password` (
  `email` varchar(100) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activated` int(1) NOT NULL DEFAULT '0',
  `rol` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `FK_rol_password` (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `password`
--

INSERT INTO `password` (`email`, `passwd`, `createdAt`, `updatedAt`, `activated`, `rol`) VALUES
('123321@student.mboutrecht.nl', '$2y$10$.M2.U9uo1sgf80qhlD11qe8xXTB6ocfjcDIsLCeRilULVUHyy.toS', '2021-10-14 10:07:42', '2021-10-14 10:08:30', 1, 'student'),
('123456@student.mboutrecht.nl', '$2y$10$lbpCXD36JmglDMImVmtFo.7gIZPKNO60LeS2DFzlbb4cp9dvW/hpi', '2021-10-14 04:41:34', '2021-10-14 04:42:41', 1, 'student'),
('326356@student.mboutrecht.nl', '$2y$10$HA6lLAUIxQX2vdkZV7EFTegD6wxdQ1GEALnid3JOnv/aDX6Hv8lYS', '2021-10-26 12:48:22', '2021-10-26 12:48:22', 0, 'student'),
('327155@student.mboutrecht.nl', '$2y$10$H06O1padn6n1P4MYhEVVxukGArxAOLy2kBTC9UKoGhOw5LDb5hzLK', '2021-10-14 12:00:22', '2021-10-14 12:10:14', 1, 'student'),
('327156@student.mboutrecht.nl', '$2y$10$PoTOlTElEwDKWGQb8TPSHOseHCJytJIexFuM6/YJBgGTRFktiaEky', '2021-10-14 11:28:08', '2021-10-14 11:28:08', 0, 'student'),
('341246@student.mboutrecht.nl', '$2y$10$Tpaw9LdM5IBz42RZmikWHOdbuaaUedOdT89Tv5LZAR2ecBLY.Gq1u', '2021-11-19 18:21:12', '2021-11-19 18:21:12', 0, 'student'),
('35235216@student.mboutrecht.nl', '$2y$10$CkeVTF9R1hC7pAeEJVuSUecgtyGGAksXs0tKbpvOWcSPN2QXRGNNy', '2021-11-19 18:21:36', '2021-11-19 18:21:36', 0, 'student'),
('456654@student.mboutrecht.nl', '$2y$10$wjFyxRcvuS0fUFsxuIU9gOAbOciO8IcX040i.IiCRskrlJjsm2EAK', '2021-10-14 10:11:32', '2021-10-14 10:29:43', 1, 'student'),
('654321@student.mboutrecht.nl', '$2y$10$saR.TVF3YlsWU8dNwDcIRO5P2/lzQlSnxeMyF6enXlTq6/5812j26', '2021-10-14 10:00:41', '2021-10-14 10:01:50', 1, 'student'),
('a@a', '$2y$10$lUjZamrDqHeUMMU/ZWY5BOeXMJE7hA0Hk27YcqPU0lKBREhExr/Wi', '2021-10-14 11:25:25', '2021-10-14 11:26:02', 1, 'klant'),
('arjanderuijter@gmail.com', '$2y$10$K7XA94EV2TNK.3WwQHWg0OxU48b2ZkPlRItujk.Rh1xC1gXPn77pq', '2021-10-14 04:53:03', '2021-10-14 04:53:37', 1, 'klant'),
('c@c.nl', '$2y$10$RGdL1mEe0aXfDYJ8LO8NK.w5A290TavzmCXDorVRxMB0xlPFGQGEW', '2021-10-14 11:30:25', '2021-10-14 11:30:25', 0, 'klant'),
('georgemarina@georgemarina.nl', '$2y$10$DzNTIHOvKNy/gQImQHtxZuXK5tZk/u5GmkIxSkLi20wNt86fN.G2.', '2021-10-14 04:39:59', '2021-10-14 04:40:30', 1, 'eigenaar'),
('h@h.nl', '$2y$10$wxMrkmZEguP4uJURJ4/dmuEdk3xlNsUwJ/U1PR8ZqK5Rc/8e2ckxK', '2021-10-25 14:26:13', '2021-10-25 14:26:13', 0, 'klant'),
('hsok@mboutrecht.nl', '$2y$10$XVWZbBQvCnmrkGmLYcyn1uEcqyjI2mcOkuSO5vwDjioTpbHQCeCA6', '2021-10-14 10:10:03', '2021-10-14 10:10:37', 1, 'docent'),
('j@j.nl', '$2y$10$QmwDbct1FgdWGHHbKyJyauPB.NYeHlsim9RA4lyOxUwyARRtOyIBm', '2021-10-26 11:50:27', '2021-10-26 11:50:27', 0, 'klant'),
('l@l.nl', '$2y$10$lB/.ZJMUuRKlQ9htdmXqVe8rx4wN/3Q5fqH2SAMWimKdnUXYHbz4y', '2021-10-26 11:50:58', '2021-10-26 11:51:21', 1, 'klant'),
('o@o.nl', '$2y$10$hOudzizUB3T6ecFX94QTcOjb/WCuHjQVvNmCx6UiXl5KJhueoBOAC', '2021-11-16 13:04:52', '2021-11-16 13:04:52', 0, 'klant'),
('q@q.nl', '$2y$10$oiO2l57PF8OH8RoQUMwhseNsOdICGqZJZXwO.2o.59YaxqxsPG2hq', '2021-10-14 11:20:30', '2021-10-14 11:20:30', 0, 'klant'),
('qwe@qwe.nl', '$2y$10$QfmMVKMEjW3rOJt.DrOjz.eF4xBCo0K6HasNUP00EdfQxad46kgea', '2021-10-26 12:09:29', '2021-10-26 12:09:29', 0, 'klant'),
('rra@mboutrecht.nl', '$2y$10$uGAkAWlFLPW4Fe8cd6jQaegq8l/Ci/w4EqSd0q4khRkilhyJ46hiS', '2021-10-14 04:33:24', '2021-10-14 04:33:53', 1, 'docent'),
('stevendejong@georgemarina.nl', '$2y$10$6eW0zGDXgKKgKWuLxlU7veS2aS1207eGr.QKXiQkAtKpDUR/IWGvy', '2021-10-14 04:48:32', '2021-10-14 04:49:01', 1, 'begeleider');

-- --------------------------------------------------------

--
-- Table structure for table `reactie`
--

DROP TABLE IF EXISTS `reactie`;
CREATE TABLE IF NOT EXISTS `reactie` (
  `id` int(11) NOT NULL,
  `review` int(11) NOT NULL,
  `reactie` varchar(500) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_Reactie_Review_idx` (`review`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reserveringen`
--

DROP TABLE IF EXISTS `reserveringen`;
CREATE TABLE IF NOT EXISTS `reserveringen` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `TafelNr` varchar(100) NOT NULL,
  `Pers` int(100) NOT NULL,
  `Achternaam` varchar(100) NOT NULL,
  `Tijd` time(6) NOT NULL,
  `Day` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `restaurantinschrijving`
--

DROP TABLE IF EXISTS `restaurantinschrijving`;
CREATE TABLE IF NOT EXISTS `restaurantinschrijving` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `werkDatum` date NOT NULL,
  `student` int(11) NOT NULL,
  `beroep` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_RI_Student_idx` (`student`),
  KEY `fk_RI_Beroep_idx` (`beroep`),
  KEY `fk_RI_Werdag_idx` (`werkDatum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL DEFAULT '1000',
  `klant` varchar(100) NOT NULL,
  `werkdag` date NOT NULL,
  `beoordeling` varchar(255) NOT NULL,
  `sterren` int(11) NOT NULL DEFAULT '3',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reactie` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_Review_Klant_idx` (`klant`),
  KEY `fk_Review_Werkdag_idx` (`werkdag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `rol` varchar(25) NOT NULL,
  `omschrijving` varchar(225) NOT NULL,
  PRIMARY KEY (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`rol`, `omschrijving`) VALUES
('begeleider', 'begeleider van de studenten in dienst bij George'),
('docent', 'schoolbegeleider'),
('eigenaar', 'eigenaar van George'),
('klant', 'bezoekers van het restaurant'),
('student', 'studenten van MBO Utrecht');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentnr` int(11) NOT NULL,
  `voornaam` varchar(45) NOT NULL,
  `tussenvoegsel` varchar(25) DEFAULT NULL,
  `achternaam` varchar(45) NOT NULL,
  `mobiel` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `woonplaats` varchar(45) NOT NULL,
  `straat` varchar(60) NOT NULL,
  `postcode` varchar(7) NOT NULL,
  `rol` varchar(25) NOT NULL DEFAULT 'student',
  `docent` varchar(5) NOT NULL,
  `lespakket` varchar(10) NOT NULL,
  PRIMARY KEY (`studentnr`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Student_Rol_idx` (`rol`),
  KEY `fk_Student_Docent_idx` (`docent`),
  KEY `fk_Student_LesPakket_idx` (`lespakket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentnr`, `voornaam`, `tussenvoegsel`, `achternaam`, `mobiel`, `email`, `woonplaats`, `straat`, `postcode`, `rol`, `docent`, `lespakket`) VALUES
(123321, 'Dennis', 'den', 'Dolder', '0612345678', '123321@student.mboutrecht.nl', 'Blaricum', 'Huistraat 12', '1901CB', 'student', 'RRA', 'Algemeen'),
(123456, 'Harry', 'de', 'Boer', '0612345678', '123456@student.mboutrecht.nl', 'Utrecht', 'Prins Hendrikstraat 17', '1901CB', 'student', 'RRA', 'Barman'),
(327155, 'Aron', 'van de', 'ridder', '0612345678', '327155@student.mboutrecht.nl', 'utrecht', 'jaapdisselstraat', '5325LL', 'student', 'HSOK', 'Algemeen'),
(456654, 'Bert', 'de', 'Bakker', '0612345678', '456654@student.mboutrecht.nl', 'Den Helder', 'Heldersekade', '1901CB', 'student', 'HSOK', 'Barman'),
(654321, 'Harry', 'van den', 'Dolder', '0612345667', '654321@student.mboutrecht.nl', 'Utrecht', 'P van Eikstraat 6', '1901CB', 'student', 'SNJG', 'kok');

-- --------------------------------------------------------

--
-- Table structure for table `werkdag`
--

DROP TABLE IF EXISTS `werkdag`;
CREATE TABLE IF NOT EXISTS `werkdag` (
  `datum` date NOT NULL,
  `weeknummer` int(11) NOT NULL,
  `jaar` int(11) NOT NULL,
  `dag` varchar(2) NOT NULL,
  PRIMARY KEY (`datum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `begeleidersrooster`
--
ALTER TABLE `begeleidersrooster`
  ADD CONSTRAINT `fk_BR_Begeleider` FOREIGN KEY (`begeleider`) REFERENCES `medewerker` (`afkorting`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_BR_Werkdag` FOREIGN KEY (`werkDatum`) REFERENCES `werkdag` (`datum`) ON UPDATE CASCADE;

--
-- Constraints for table `beoordeling`
--
ALTER TABLE `beoordeling`
  ADD CONSTRAINT `fk_Beoordeling_Medewerker` FOREIGN KEY (`begeleider`) REFERENCES `medewerker` (`afkorting`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Beoordeling_RI` FOREIGN KEY (`inschrijving`) REFERENCES `restaurantinschrijving` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `klant`
--
ALTER TABLE `klant`
  ADD CONSTRAINT `fk_Klant_Password` FOREIGN KEY (`email`) REFERENCES `password` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Klant_Rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON UPDATE CASCADE;

--
-- Constraints for table `medewerker`
--
ALTER TABLE `medewerker`
  ADD CONSTRAINT `fk_Medeqwerker_Password` FOREIGN KEY (`email`) REFERENCES `password` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medewerkerrol`
--
ALTER TABLE `medewerkerrol`
  ADD CONSTRAINT `fk_MedewerkerRol_Med` FOREIGN KEY (`medewerker`) REFERENCES `medewerker` (`email`),
  ADD CONSTRAINT `fk_MedewerkerRol_Rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON UPDATE CASCADE;

--
-- Constraints for table `password`
--
ALTER TABLE `password`
  ADD CONSTRAINT `FK_rol_password` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reactie`
--
ALTER TABLE `reactie`
  ADD CONSTRAINT `fk_Reactie_Review` FOREIGN KEY (`review`) REFERENCES `review` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `restaurantinschrijving`
--
ALTER TABLE `restaurantinschrijving`
  ADD CONSTRAINT `fk_RI_Beroep` FOREIGN KEY (`beroep`) REFERENCES `beroep` (`beroep`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_RI_Student` FOREIGN KEY (`student`) REFERENCES `student` (`studentnr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RI_Werdag` FOREIGN KEY (`werkDatum`) REFERENCES `werkdag` (`datum`) ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_Review_Klant` FOREIGN KEY (`klant`) REFERENCES `klant` (`email`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Review_Werkdag` FOREIGN KEY (`werkdag`) REFERENCES `werkdag` (`datum`) ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_Student_Docent` FOREIGN KEY (`docent`) REFERENCES `medewerker` (`afkorting`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Student_LesPakket` FOREIGN KEY (`lespakket`) REFERENCES `lespakket` (`lespakket`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Student_Password` FOREIGN KEY (`email`) REFERENCES `password` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Student_Rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
