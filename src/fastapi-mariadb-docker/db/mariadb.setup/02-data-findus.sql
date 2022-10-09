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

INSERT INTO `animal` (`animal_id`, `name`, `race`, `owner`, `image`) VALUES(1, 'Hasso', 'Dackel', 'Frau Maier', 'https://upload.wikimedia.org/wikipedia/commons/9/93/%27LUCKY%27_Mumbai%27s_infamous_prize_winning_Dachshund_of_the_1980%27S_and_90%27S.jpg');
INSERT INTO `animal` (`animal_id`, `name`, `race`, `owner`, `image`) VALUES(2, 'Bello', 'Golden Retriever', 'Herr Müller', 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Golden_Retriever_Dukedestiny01_drvd.jpg');
INSERT INTO `animal` (`animal_id`, `name`, `race`, `owner`, `image`) VALUES(3, 'Ella', 'Bernhardiner', 'Anton', 'https://upload.wikimedia.org/wikipedia/commons/3/3a/St_Bernard_Dog.jpg');

COMMIT;
