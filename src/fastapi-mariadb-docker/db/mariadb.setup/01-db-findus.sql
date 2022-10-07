--
-- Datenbank: `findus`
--
CREATE DATABASE IF NOT EXISTS `findus`
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

USE findus;


SET NAMES utf8mb4;

-- ----------------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `animal`
--

CREATE TABLE IF NOT EXISTS `animal` (
  `animal_id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50)  COLLATE utf8_unicode_ci  NOT NULL,
  `race` varchar(50)  COLLATE utf8_unicode_ci  NOT NULL,
  `owner` varchar(50) COLLATE utf8_unicode_ci  NOT NULL,
  `image` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

GRANT SELECT, INSERT, UPDATE, DELETE ON `findus`.* TO 'public'@'%'; 