SET NAMES utf8mb4;

USE findus;

-- ----------------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
-- --------------------------------------------------------


--
-- Daten für Tabelle `animal`
--


-- ----------------------------------------------------------------

INSERT INTO `animal` (`animal_id`, `name`, `race`, `owner`, `image`) VALUES(1, 'Hasso', 'Dackel', 'Frau Maier', 'https://commons.wikimedia.org/wiki/Category:Smooth_Standard_Dachshund#/media/File:Dackel_Stanard_Rot.jpg');
INSERT INTO `animal` (`animal_id`, `name`, `race`, `owner`, `image`) VALUES(2, 'Bello', 'Golden Retriever', 'Herr Müller', 'https://commons.wikimedia.org/wiki/Golden_Retriever#/media/File:Golden_Retriever_10weeks.jpg');
INSERT INTO `animal` (`animal_id`, `name`, `race`, `owner`, `image`) VALUES(3, 'Ella', 'Bernhardiner', 'Anton', 'https://commons.wikimedia.org/wiki/File:St_Bernard_Dog.jpg');

COMMIT;
