-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 16 nov 2021 om 14:08
-- Serverversie: 5.7.31
-- PHP-versie: 7.4.9

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
  `id` int(11) NOT NULL,
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
-- Tabelstructuur voor tabel `beroep`
--

DROP TABLE IF EXISTS `beroep`;
CREATE TABLE IF NOT EXISTS `beroep` (
  `beroep` varchar(10) NOT NULL,
  PRIMARY KEY (`beroep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Tabelstructuur voor tabel `reserveren`
--

DROP TABLE IF EXISTS `reserveren`;
CREATE TABLE IF NOT EXISTS `reserveren` (
  `tafel` tinyint(3) UNSIGNED NOT NULL,
  `datum` date NOT NULL,
  `tijd` time NOT NULL,
  `personen` tinyint(3) UNSIGNED NOT NULL,
  `klantemail` varchar(255) NOT NULL,
  PRIMARY KEY (`tafel`,`datum`,`tijd`),
  KEY `FK_reservering_PK_tafel` (`tafel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `reserveren`
--

INSERT INTO `reserveren` (`tafel`, `datum`, `tijd`, `personen`, `klantemail`) VALUES
(1, '2021-10-28', '14:30:00', 6, 'arjanderuijter@mboutrecht.nl'),
(2, '2021-10-28', '13:00:00', 6, 'arjanderuijter@mboutrecht.nl');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tafel`
--

DROP TABLE IF EXISTS `tafel`;
CREATE TABLE IF NOT EXISTS `tafel` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `maxpersonen` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `tafel`
--

INSERT INTO `tafel` (`id`, `maxpersonen`) VALUES
(1, 6),
(2, 6),
(4, 4),
(5, 4),
(6, 4),
(7, 2),
(8, 2),
(9, 2);

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
-- Beperkingen voor tabel `medewerkerrol`
--
ALTER TABLE `medewerkerrol`
  ADD CONSTRAINT `fk_MedewerkerRol_Med` FOREIGN KEY (`medewerker`) REFERENCES `medewerker` (`email`),
  ADD CONSTRAINT `fk_MedewerkerRol_Rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `password`
--
ALTER TABLE `password`
  ADD CONSTRAINT `FK_rol_password` FOREIGN KEY (`rol`) REFERENCES `rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `reactie`
--
ALTER TABLE `reactie`
  ADD CONSTRAINT `fk_Reactie_Review` FOREIGN KEY (`review`) REFERENCES `review` (`id`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `restaurantinschrijving`
--
ALTER TABLE `restaurantinschrijving`
  ADD CONSTRAINT `fk_RI_Beroep` FOREIGN KEY (`beroep`) REFERENCES `beroep` (`beroep`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_RI_Student` FOREIGN KEY (`student`) REFERENCES `student` (`studentnr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RI_Werdag` FOREIGN KEY (`werkDatum`) REFERENCES `werkdag` (`datum`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_Review_Klant` FOREIGN KEY (`klant`) REFERENCES `klant` (`email`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Review_Werkdag` FOREIGN KEY (`werkdag`) REFERENCES `werkdag` (`datum`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `student`
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
