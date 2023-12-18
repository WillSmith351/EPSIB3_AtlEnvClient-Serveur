-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 18 déc. 2023 à 09:41
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `epsib3_exercices_atlenvclientserveur`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `RefArt` varchar(10) NOT NULL,
  `Designation` varchar(100) DEFAULT NULL,
  `CodeGam` varchar(10) DEFAULT NULL,
  `CodeCate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RefArt`),
  KEY `CodeCate` (`CodeCate`),
  KEY `CodeGam` (`CodeGam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`RefArt`, `Designation`, `CodeGam`, `CodeCate`) VALUES
('A01', 'Salomon 24X+Z12', 'EG', 'SA'),
('A02', 'Salomon 24X+Z12', 'EG', 'SA'),
('A03', 'Salomon 24X+Z12', 'EG', 'SA'),
('A04', 'Salomon 24X+Z12', 'EG', 'SA'),
('A05', 'Salomon 24X+Z12', 'EG', 'SA'),
('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA'),
('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA'),
('F01', 'Fischer Cruiser', 'EG', 'FOA'),
('F02', 'Fischer Cruiser', 'EG', 'FOA'),
('F03', 'Fischer Cruiser', 'EG', 'FOA'),
('F04', 'Fischer Cruiser', 'EG', 'FOA'),
('F05', 'Fischer Cruiser', 'EG', 'FOA'),
('F10', 'Fischer Sporty Crown', 'MG', 'FOA'),
('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA'),
('F50', 'Fischer SOSSkating VASA', 'PR', 'FOA'),
('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOA'),
('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP'),
('P01', 'Décathlon Allegre junior 150', 'EG', 'PA'),
('P10', 'Fischer mini ski patinette', 'MG', 'PA'),
('P11', 'Fischer mini ski patinette', 'MG', 'PA'),
('S01', 'Décathlon Apparition', 'EG', 'SURF'),
('S02', 'Décathlon Apparition', 'EG', 'SURF'),
('S03', 'Décathlon Apparition', 'EG', 'SURF');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `CodeCate` varchar(10) NOT NULL,
  `Libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CodeCate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`CodeCate`, `Libelle`) VALUES
('FOA', 'Ski de fond alternatif'),
('FOP', 'Ski de fond patineur'),
('Mono', 'Monoski'),
('PA', 'Patinette'),
('SA', 'Ski alpin'),
('SURF', 'Surf');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `NoCli` int NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Adresse` varchar(300) DEFAULT NULL,
  `Cpo` int DEFAULT NULL,
  `Ville` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NoCli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`NoCli`, `Nom`, `Prenom`, `Adresse`, `Cpo`, `Ville`) VALUES
(1, 'Albert', 'Anatole', 'Rue des acacias', 61000, 'Amiens'),
(2, 'Bernard', 'Barnabé', 'Rue du bar', 1000, 'Bourg en Bresse'),
(3, 'Dupond', 'Camille', 'Rue Crébillon', 44000, 'Nantes'),
(4, 'Desmoulins', 'Daniel', 'Rue descendante', 21000, 'Dijon'),
(5, 'Ernest', 'Etienne', 'Rue de l\'échafaud', 42000, 'Saint Étienne'),
(6, 'Ferdinand', 'François', 'Rue de la convention', 44100, 'Nantes'),
(9, 'Dupond', 'Jean', 'Rue des mimosas', 75018, 'Paris'),
(14, 'Boutaud', 'Sabine', 'Rue des platanes', 75002, 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `fiches`
--

DROP TABLE IF EXISTS `fiches`;
CREATE TABLE IF NOT EXISTS `fiches` (
  `NoFic` int DEFAULT NULL,
  `NoCli` int DEFAULT NULL,
  `DateCrea` varchar(100) DEFAULT NULL,
  `DatePaye` varchar(100) DEFAULT NULL,
  `Etat` varchar(100) DEFAULT NULL,
  `NoLig` int DEFAULT NULL,
  `RefArt` varchar(100) DEFAULT NULL,
  `Depart` varchar(100) DEFAULT NULL,
  `Retour` varchar(100) DEFAULT NULL,
  KEY `NoCli` (`NoCli`),
  KEY `RefArt` (`RefArt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fiches`
--

INSERT INTO `fiches` (`NoFic`, `NoCli`, `DateCrea`, `DatePaye`, `Etat`, `NoLig`, `RefArt`, `Depart`, `Retour`) VALUES
(1001, 14, 'DDJ-15', 'DDJ-13', 'SO', 1, 'F05', 'DDJ-15', 'DDJ-13'),
(1001, 14, 'DDJ-15', 'DDJ-13', 'SO', 2, 'F50', 'DDJ-15', 'DDJ-14'),
(1001, 14, 'DDJ-15', 'DDJ-13', 'SO', 3, 'F60', 'DDJ-13', 'DDJ-13'),
(1002, 4, 'DDJ-13', NULL, 'EC', 1, 'A03', 'DDJ-13', 'DDJ-9'),
(1002, 4, 'DDJ-13', NULL, 'EC', 2, 'A04', 'DDJ-12', 'DDJ-7'),
(1002, 4, 'DDJ-13', NULL, 'EC', 3, 'S03', 'DDJ-8', NULL),
(1003, 1, 'DDJ-12', 'DDJ-10', 'SO', 1, 'F50', 'DDJ-12', 'DDJ-10'),
(1003, 1, 'DDJ-12', 'DDJ-10', 'SO', 2, 'F05', 'DDJ-12', 'DDJ-10'),
(1004, 6, 'DDJ-11', NULL, 'EC', 1, 'P01', 'DDJ-6', NULL),
(1005, 3, 'DDJ-10', NULL, 'EC', 1, 'F05', 'DDJ-9', 'DDJ-5'),
(1005, 3, 'DDJ-10', NULL, 'EC', 2, 'F10', 'DDJ-4', NULL),
(1006, 9, 'DDJ-10', NULL, 'RE', 1, 'S01', 'DDJ-10', 'DDJ-9'),
(1006, 9, 'DDJ-10', NULL, 'RE', 2, 'S02', 'DDJ-10', 'DDJ-9'),
(1006, 9, 'DDJ-10', NULL, 'RE', 3, '$03', 'DDJ-10', 'DDJ-9'),
(1007, 1, 'DDJ-3', NULL, 'EC', 1, 'F50', 'DDJ-3', 'DDJ-2'),
(1007, 1, 'DDJ-3', NULL, 'EC', 2, 'F60', 'DDJ-1', NULL),
(1007, 1, 'DDJ-3', NULL, 'EC', 3, 'F05', 'DDJ-3', NULL),
(1007, 1, 'DDJ-3', NULL, 'EC', 4, 'S02', 'DDJ', NULL),
(1008, 2, 'DDJ', NULL, 'EC', 1, 'S01', 'DDJ', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `gammes`
--

DROP TABLE IF EXISTS `gammes`;
CREATE TABLE IF NOT EXISTS `gammes` (
  `CodeGam` varchar(10) NOT NULL,
  `Libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CodeGam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `gammes`
--

INSERT INTO `gammes` (`CodeGam`, `Libelle`) VALUES
('EG', 'Entrée de gamme'),
('HG', 'Haut de gamme'),
('MG', 'Moyenne gamme'),
('PR', 'Matériel Professionnel');

-- --------------------------------------------------------

--
-- Structure de la table `grilletarifs`
--

DROP TABLE IF EXISTS `grilletarifs`;
CREATE TABLE IF NOT EXISTS `grilletarifs` (
  `CodeGam` varchar(10) DEFAULT NULL,
  `CodeCate` varchar(10) DEFAULT NULL,
  `CodeTarif` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `grilletarifs`
--

INSERT INTO `grilletarifs` (`CodeGam`, `CodeCate`, `CodeTarif`) VALUES
('EG', 'MONO', 'T1'),
('MG', 'MONO', 'T2'),
('EG', 'SURF', 'T1'),
('MG', 'SURF', 'T2'),
('HG', 'SURF', 'T3'),
('PR', 'SURF', 'T5'),
('EG', 'PA', 'T1'),
('MG', 'PA', 'T2'),
('EG', 'FOA', 'T1'),
('MG', 'FOA', 'T2'),
('HG', 'FOA', 'T4'),
('PR', 'FOA', 'T6'),
('EG', 'FOP', 'T2'),
('MG', 'FOP', 'T3'),
('HG', 'FOP', 'T4'),
('PR', 'FOP', 'T6'),
('EG', 'SA', 'T1'),
('MG', 'SA', 'T2'),
('HG', 'SA', 'T4'),
('PR', 'SA', 'T6');

-- --------------------------------------------------------

--
-- Structure de la table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
CREATE TABLE IF NOT EXISTS `tarifs` (
  `CodeTarif` varchar(10) NOT NULL,
  `Libelle` varchar(100) DEFAULT NULL,
  `PrixJour` int DEFAULT NULL,
  PRIMARY KEY (`CodeTarif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tarifs`
--

INSERT INTO `tarifs` (`CodeTarif`, `Libelle`, `PrixJour`) VALUES
('T1', 'Base', 10),
('T2', 'Chocolat', 15),
('T3', 'Bronze', 20),
('T4', 'Argent', 30),
('T5', 'Or', 50),
('T6', 'Platine', 90);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`CodeGam`) REFERENCES `gammes` (`CodeGam`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
