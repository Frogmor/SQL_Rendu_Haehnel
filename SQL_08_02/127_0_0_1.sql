-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Lun 06 Mars 2017 à 22:01
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `clicom`
--
CREATE DATABASE IF NOT EXISTS `clicom` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `clicom`;

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Creat_cli` (IN `NNCLI` VARCHAR(50), IN `NNOM` VARCHAR(50), IN `NADR` VARCHAR(50), IN `NLOC` VARCHAR(50), IN `NCAT` VARCHAR(50), IN `NCOMPTE` INT(50))  INSERT INTO `client`(`NCLI`, `NOM`, `ADRESSE`, `LOCALITE`, `(CAT)`, `COMPTE`) VALUES (NNCLI,NNOM,NADR,NLOC,NCAT,NCOMPTE)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `NCLI` varchar(4) NOT NULL,
  `NOM` varchar(25) NOT NULL,
  `ADRESSE` varchar(25) NOT NULL,
  `LOCALITE` varchar(25) NOT NULL,
  `(CAT)` varchar(2) NOT NULL,
  `COMPTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`NCLI`, `NOM`, `ADRESSE`, `LOCALITE`, `(CAT)`, `COMPTE`) VALUES
('B062', 'GOFFIN', '72, r. de la Gare', 'Namur', 'B2', -3200),
('B112', 'HANSENNE', '23, r. Dumont', 'Poitiers', 'C1', 1250),
('B332', 'MONTI', '112, r. Neuve', 'Genève', 'B2', 0),
('B512', 'GILLET', '14, r. de l\'Eté', 'Toulouse', 'B1', -8700),
('C003', 'AVRON', '8, r. de la Cure', 'Toulouse', 'B1', -1700),
('C123', 'MERCIER', '25, r. Lemaître', 'Namur', 'C1', -2300),
('C400', 'FERARD', '65, r. du Tertre', 'Poitiers', 'B2', 350),
('D063', 'MERCIER', '201, bvd du Nord', 'Toulouse', '', -2250),
('F010', 'TOUSSAINT', '5, r. Godefroid', 'Poitiers', 'C1', 0),
('F011', 'PONCELET', '17, Clos des Erables', 'Toulouse', 'B2', 0),
('F400', 'JACOB', '78, ch. du Moulin', 'Bruxelles', 'C2', 0),
('f456', 'Charle', '15 rue du t', 'strasbourg', 'b1', 2000),
('G854', 'Charle', '15 rue du schluck', 'Brest', 'F7', 5000),
('K111', 'VANBIST', '180, r. Florimont', 'Lille', 'B1', 720),
('K729', 'NEUMAN', '40, r. Bransart', 'Toulouse', '', 0),
('L422', 'FRANCK', '60, r. de Wépion', 'Namur', 'C1', 0),
('S127', 'VANDERKA', '3, av. des Roses', 'Namur', 'C1', -4580),
('S712', 'GUILLAUME', '14a, ch. des Roses', 'Paris', 'B1', 0),
('V525', 'Haehnel', '15 rue d\'Obernai', 'ghetto', '', 1000000);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `NCOM` int(11) NOT NULL,
  `NCLI` varchar(4) NOT NULL,
  `DATECOM` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`NCOM`, `NCLI`, `DATECOM`) VALUES
(30179, 'C400', '2008-12-22'),
(30182, 'S127', '2008-12-23'),
(30184, 'C400', '2008-12-23'),
(30185, 'F011', '2009-01-02'),
(30186, 'C400', '2009-01-02'),
(30188, 'B512', '2009-01-02');

-- --------------------------------------------------------

--
-- Structure de la table `detail`
--

CREATE TABLE `detail` (
  `NCOM` int(11) NOT NULL,
  `NPRO` varchar(5) NOT NULL,
  `QCOM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `detail`
--

INSERT INTO `detail` (`NCOM`, `NPRO`, `QCOM`) VALUES
(30178, 'CS464', 25),
(30179, 'CS262', 60),
(30179, 'PA60', 20),
(30182, 'PA60', 30),
(30184, 'CS464', 120),
(30184, 'PA45', 20),
(30185, 'CS464', 260),
(30185, 'PA45', 12),
(30185, 'PA60', 15),
(30185, 'PS222', 600),
(30186, 'PA45', 3),
(30188, 'CS464', 180),
(30188, 'PA45', 22),
(30188, 'PA60', 70),
(30188, 'PH222', 92);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `NPRO` varchar(5) NOT NULL,
  `LIBELLE` varchar(25) NOT NULL,
  `PRIX` int(11) NOT NULL,
  `QSTOCK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`NPRO`, `LIBELLE`, `PRIX`, `QSTOCK`) VALUES
('CS262', 'CHEV. SAPIN 200x6x2', 75, 45),
('CS264', 'CHEV. SAPIN 200x6x4', 120, 2690),
('CS464', 'CHEV. SAPIN 400x6x4', 220, 450),
('PA45', 'POINTE ACIER 45 (20K)', 105, 580),
('PA60', 'POINTE ACIER 60 (10K)', 95, 134),
('PH222', 'PL. HETRE 200x20x2', 230, 782),
('PS222', 'PL. SAPIN 200x20x2', 185, 1220);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`NCLI`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`NCOM`),
  ADD KEY `NCLI` (`NCLI`);

--
-- Index pour la table `detail`
--
ALTER TABLE `detail`
  ADD PRIMARY KEY (`NCOM`,`NPRO`),
  ADD KEY `NPRO` (`NPRO`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`NPRO`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`NCOM`) REFERENCES `detail` (`NCOM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`NCLI`) REFERENCES `client` (`NCLI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`NPRO`) REFERENCES `produit` (`NPRO`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
