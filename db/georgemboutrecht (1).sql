-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 07 dec 2021 om 13:42
-- Serverversie: 5.7.31
-- PHP-versie: 7.3.21

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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `begeleidersrooster`
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
-- Tabelstructuur voor tabel `beoordeling`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `beoordeling`
--

INSERT INTO `beoordeling` (`id`, `inschrijving`, `oordeel`, `voldoende`, `begeleider`, `createdAt`, `updatedAt`) VALUES
(1, 5, 'f', 3, 'Y', '2021-12-07 13:00:53', '2021-12-07 13:00:53');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `beroep`
--

DROP TABLE IF EXISTS `beroep`;
CREATE TABLE IF NOT EXISTS `beroep` (
  `beroep` varchar(10) NOT NULL,
  PRIMARY KEY (`beroep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `beroep`
--

INSERT INTO `beroep` (`beroep`) VALUES
('kok');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
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
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`id`, `voornaam`, `tussenvoegsel`, `achternaam`, `email`, `mobiel`, `rol`, `createdAt`, `updatedAt`, `emailVerified`) VALUES
(26, 'Arjan', 'de', 'Ruijter', 'arjanderuijter@gmail.com', '0612345678', 'klant', '2021-10-14 04:53:37', '2021-10-14 04:53:37', 1),
(27, 'Aron', 'van de', 'ridder', 'a@a', '0648377848', 'klant', '2021-10-14 11:26:02', '2021-10-14 11:26:02', 1),
(28, 'l', 'l', 'l', 'l@l.nl', '0612345678', 'klant', '2021-10-26 11:51:21', '2021-10-26 11:51:21', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lespakket`
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
-- Gegevens worden geëxporteerd voor tabel `lespakket`
--

INSERT INTO `lespakket` (`lespakket`, `omschrijving`, `aantalLessenKok`, `aantalLessenBarman`, `aantalLessenOber`, `createdAt`, `updatedAt`) VALUES
('Algemeen', 'Het lespakket met gelijke verdeling over de verschillende discipline', 5, 5, 5, '2021-10-12 11:10:22', '2021-10-12 11:10:22'),
('Barman', 'Dit is het lespakket waarbij je veel uren draait als barman', 3, 9, 3, '2021-10-12 11:07:32', '2021-10-12 11:07:32'),
('kok', 'Dit is de cursus waarbij je veel uren draait als kok', 10, 2, 3, '2021-10-07 10:37:58', '2021-10-12 11:06:46'),
('Ober', 'Dit is het lespakket waarbij je veel uren draait als ober.', 3, 2, 10, '2021-10-12 11:08:13', '2021-10-12 11:08:13');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `mededeling`
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
-- Tabelstructuur voor tabel `medewerker`
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
-- Gegevens worden geëxporteerd voor tabel `medewerker`
--

INSERT INTO `medewerker` (`email`, `voornaam`, `tussenvoegsel`, `achternaam`, `mobiel`, `afkorting`) VALUES
('georgemarina@georgemarina.nl', 'George', '', 'Marina', '0612345678', 'GEMA'),
('hsok@mboutrecht.nl', 'Hans', '', 'Odijk', '0612345678', 'HSOK'),
('rra@mboutrecht.nl', 'Arjan', 'de', 'Ruijter', '0612345678', 'RRA'),
('s@georgemarina.nl', 's', 'd', 'v', '0612345678', 'SSVV'),
('stevendejong@georgemarina.nl', 'Steven', 'de', 'Jong', '06123456', 'SNJG'),
('y@mboutrecht.nl', 's', 'v', 'd', '0612345678', 'Y');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerkerrol`
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
-- Tabelstructuur voor tabel `password`
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
-- Gegevens worden geëxporteerd voor tabel `password`
--

INSERT INTO `password` (`email`, `passwd`, `createdAt`, `updatedAt`, `activated`, `rol`) VALUES
('123321@student.mboutrecht.nl', '$2y$10$.M2.U9uo1sgf80qhlD11qe8xXTB6ocfjcDIsLCeRilULVUHyy.toS', '2021-10-14 10:07:42', '2021-10-14 10:08:30', 1, 'student'),
('123456@student.mboutrecht.nl', '$2y$10$lbpCXD36JmglDMImVmtFo.7gIZPKNO60LeS2DFzlbb4cp9dvW/hpi', '2021-10-14 04:41:34', '2021-10-14 04:42:41', 1, 'student'),
('326356@student.mboutrecht.nl', '$2y$10$HA6lLAUIxQX2vdkZV7EFTegD6wxdQ1GEALnid3JOnv/aDX6Hv8lYS', '2021-10-26 12:48:22', '2021-10-26 12:48:22', 0, 'student'),
('327155@student.mboutrecht.nl', '$2y$10$H06O1padn6n1P4MYhEVVxukGArxAOLy2kBTC9UKoGhOw5LDb5hzLK', '2021-10-14 12:00:22', '2021-10-14 12:10:14', 1, 'student'),
('327156@student.mboutrecht.nl', '$2y$10$PoTOlTElEwDKWGQb8TPSHOseHCJytJIexFuM6/YJBgGTRFktiaEky', '2021-10-14 11:28:08', '2021-10-14 11:28:08', 0, 'student'),
('332275@student.mboutrecht.nl', '$2y$10$yxOKVnc6ePVVkHON9SCBC.Y.6zNwjfNU5RGGvHQYSl.zEot8Larpq', '2021-11-22 14:01:17', '2021-11-22 14:01:17', 0, 'student'),
('456654@student.mboutrecht.nl', '$2y$10$wjFyxRcvuS0fUFsxuIU9gOAbOciO8IcX040i.IiCRskrlJjsm2EAK', '2021-10-14 10:11:32', '2021-10-14 10:29:43', 1, 'student'),
('654321@student.mboutrecht.nl', '$2y$10$saR.TVF3YlsWU8dNwDcIRO5P2/lzQlSnxeMyF6enXlTq6/5812j26', '2021-10-14 10:00:41', '2021-10-14 10:01:50', 1, 'student'),
('a@a', '$2y$10$lUjZamrDqHeUMMU/ZWY5BOeXMJE7hA0Hk27YcqPU0lKBREhExr/Wi', '2021-10-14 11:25:25', '2021-10-14 11:26:02', 1, 'klant'),
('arjanderuijter@gmail.com', '$2y$10$K7XA94EV2TNK.3WwQHWg0OxU48b2ZkPlRItujk.Rh1xC1gXPn77pq', '2021-10-14 04:53:03', '2021-10-14 04:53:37', 1, 'klant'),
('c@c.nl', '$2y$10$RGdL1mEe0aXfDYJ8LO8NK.w5A290TavzmCXDorVRxMB0xlPFGQGEW', '2021-10-14 11:30:25', '2021-10-14 11:30:25', 0, 'klant'),
('f@f.nl', '$2y$10$/9nd3wi2o/zGDGK28qHDe.WEsOtHPotMxq1VHXXMx8Wr/PF9tsc3K', '2021-11-16 14:32:17', '2021-11-16 14:32:17', 0, 'klant'),
('georgemarina@georgemarina.nl', '$2y$10$DzNTIHOvKNy/gQImQHtxZuXK5tZk/u5GmkIxSkLi20wNt86fN.G2.', '2021-10-14 04:39:59', '2021-10-14 04:40:30', 1, 'eigenaar'),
('h@h.nl', '$2y$10$wxMrkmZEguP4uJURJ4/dmuEdk3xlNsUwJ/U1PR8ZqK5Rc/8e2ckxK', '2021-10-25 14:26:13', '2021-10-25 14:26:13', 0, 'klant'),
('hsok@mboutrecht.nl', '$2y$10$XVWZbBQvCnmrkGmLYcyn1uEcqyjI2mcOkuSO5vwDjioTpbHQCeCA6', '2021-10-14 10:10:03', '2021-10-14 10:10:37', 1, 'docent'),
('j@j.nl', '$2y$10$QmwDbct1FgdWGHHbKyJyauPB.NYeHlsim9RA4lyOxUwyARRtOyIBm', '2021-10-26 11:50:27', '2021-10-26 11:50:27', 0, 'klant'),
('l@l.nl', '$2y$10$lB/.ZJMUuRKlQ9htdmXqVe8rx4wN/3Q5fqH2SAMWimKdnUXYHbz4y', '2021-10-26 11:50:58', '2021-10-26 11:51:21', 1, 'klant'),
('o@o.nl', '$2y$10$hOudzizUB3T6ecFX94QTcOjb/WCuHjQVvNmCx6UiXl5KJhueoBOAC', '2021-11-16 13:04:52', '2021-11-16 13:04:52', 0, 'klant'),
('q@q.nl', '$2y$10$oiO2l57PF8OH8RoQUMwhseNsOdICGqZJZXwO.2o.59YaxqxsPG2hq', '2021-10-14 11:20:30', '2021-10-14 11:20:30', 0, 'klant'),
('qwe@qwe.nl', '$2y$10$QfmMVKMEjW3rOJt.DrOjz.eF4xBCo0K6HasNUP00EdfQxad46kgea', '2021-10-26 12:09:29', '2021-10-26 12:09:29', 0, 'klant'),
('rra@mboutrecht.nl', '$2y$10$uGAkAWlFLPW4Fe8cd6jQaegq8l/Ci/w4EqSd0q4khRkilhyJ46hiS', '2021-10-14 04:33:24', '2021-10-14 04:33:53', 1, 'docent'),
('s@georgemarina.nl', '$2y$10$Gn2/ZIbgXZ18iULd16C2W.43Wd1SXnK4XTbBIOmjBvWxmaVbleNGK', '2021-12-07 13:41:10', '2021-12-07 13:41:25', 1, 'begeleider'),
('stevendejong@georgemarina.nl', '$2y$10$6eW0zGDXgKKgKWuLxlU7veS2aS1207eGr.QKXiQkAtKpDUR/IWGvy', '2021-10-14 04:48:32', '2021-10-14 04:49:01', 1, 'begeleider'),
('y@mboutrecht.nl', '$2y$10$lH5HxvsQ0KNH6CHNLMBiUOLTqv/YCIaGC1pTZ9Sgj5JRcl3MAmohK', '2021-11-22 14:05:29', '2021-11-22 14:06:12', 1, 'docent'),
('y@student.mboutrecht.nl', '$2y$10$LihE5MboaXofTqdiuTy2wOUCW74Bx4mBGKAny2/JM65VDSWIRT/we', '2021-11-22 14:02:02', '2021-11-22 14:02:54', 1, 'student');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `reactie`
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
-- Tabelstructuur voor tabel `reserveringen`
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `reserveringen`
--

INSERT INTO `reserveringen` (`id`, `TafelNr`, `Pers`, `Achternaam`, `Tijd`, `Day`) VALUES
(1, '1', 2, 's', '18:00:00.000000', '2020-08-06');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `restaurantinschrijving`
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `restaurantinschrijving`
--

INSERT INTO `restaurantinschrijving` (`id`, `werkDatum`, `student`, `beroep`, `createdAt`, `updatedAt`) VALUES
(5, '2021-11-29', 123321, 'kok', '2021-12-07 13:00:38', '2021-12-07 13:00:38');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `review`
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
-- Tabelstructuur voor tabel `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `rol` varchar(25) NOT NULL,
  `omschrijving` varchar(225) NOT NULL,
  PRIMARY KEY (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `rol`
--

INSERT INTO `rol` (`rol`, `omschrijving`) VALUES
('begeleider', 'begeleider van de studenten in dienst bij George'),
('docent', 'schoolbegeleider'),
('eigenaar', 'eigenaar van George'),
('klant', 'bezoekers van het restaurant'),
('student', 'studenten van MBO Utrecht');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time(4) NOT NULL,
  `end_time` time(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `schedule`
--

INSERT INTO `schedule` (`id`, `title`, `start_date`, `end_date`, `start_time`, `end_time`) VALUES
(1, '12', '0012-12-12', '0012-12-12', '00:12:00.0000', '00:12:00.0000'),
(2, '12', '0012-12-12', '0012-12-12', '00:12:00.0000', '00:12:00.0000'),
(3, '12', '0012-12-12', '0012-12-12', '00:12:00.0000', '00:12:00.0000'),
(4, '12', '0012-12-12', '0012-12-12', '00:12:00.0000', '00:12:00.0000'),
(5, '12', '0012-12-12', '0012-12-12', '00:12:00.0000', '00:12:00.0000'),
(6, '11', '0011-11-11', '0011-11-11', '11:11:00.0000', '11:11:00.0000'),
(7, '11', '0011-11-11', '0011-11-11', '11:11:00.0000', '11:11:00.0000'),
(8, '11', '0011-11-11', '0011-11-11', '11:11:00.0000', '11:11:00.0000');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `student`
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
-- Gegevens worden geëxporteerd voor tabel `student`
--

INSERT INTO `student` (`studentnr`, `voornaam`, `tussenvoegsel`, `achternaam`, `mobiel`, `email`, `woonplaats`, `straat`, `postcode`, `rol`, `docent`, `lespakket`) VALUES
(123321, 'Dennis', 'den', 'Dolder', '0612345678', '123321@student.mboutrecht.nl', 'Blaricum', 'Huistraat 12', '1901CB', 'student', 'RRA', 'Algemeen'),
(123456, 'Harry', 'de', 'Boer', '0612345678', '123456@student.mboutrecht.nl', 'Utrecht', 'Prins Hendrikstraat 17', '1901CB', 'student', 'RRA', 'Barman'),
(327155, 'Aron', 'van de', 'ridder', '0612345678', '327155@student.mboutrecht.nl', 'utrecht', 'jaapdisselstraat', '5325LL', 'student', 'HSOK', 'Algemeen'),
(456654, 'Bert', 'de', 'Bakker', '0612345678', '456654@student.mboutrecht.nl', 'Den Helder', 'Heldersekade', '1901CB', 'student', 'HSOK', 'Barman'),
(654321, 'Harry', 'van den', 'Dolder', '0612345667', '654321@student.mboutrecht.nl', 'Utrecht', 'P van Eikstraat 6', '1901CB', 'student', 'SNJG', 'kok');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `werkdag`
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
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `begeleidersrooster`
--
ALTER TABLE `begeleidersrooster`
  ADD CONSTRAINT `fk_BR_Begeleider` FOREIGN KEY (`begeleider`) REFERENCES `medewerker` (`afkorting`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_BR_Werkdag` FOREIGN KEY (`werkDatum`) REFERENCES `werkdag` (`datum`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `beoordeling`
--
ALTER TABLE `beoordeling`
  ADD CONSTRAINT `fk_Beoordeling_Medewerker` FOREIGN KEY (`begeleider`) REFERENCES `medewerker` (`afkorting`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Beoordeling_RI` FOREIGN KEY (`inschrijving`) REFERENCES `restaurantinschrijving` (`id`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD CONSTRAINT `fk_Klant_Password` FOREIGN KEY (`email`) REFERENCES `password` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Klant_Rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `medewerker`
--
ALTER TABLE `medewerker`
  ADD CONSTRAINT `fk_Medeqwerker_Password` FOREIGN KEY (`email`) REFERENCES `password` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `password`
--
ALTER TABLE `password`
  ADD CONSTRAINT `FK_rol_password` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
