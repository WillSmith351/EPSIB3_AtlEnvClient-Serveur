-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 18 déc. 2023 à 12:50
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
-- Structure de la table `acteur`
--

DROP TABLE IF EXISTS `acteur`;
CREATE TABLE IF NOT EXISTS `acteur` (
  `Ident_Acteur` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Date_Naissance` date NOT NULL,
  `Nb_Film` int NOT NULL,
  `Nationalite` int NOT NULL,
  PRIMARY KEY (`Ident_Acteur`),
  KEY `Nationalite` (`Nationalite`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `acteur`
--

INSERT INTO `acteur` (`Ident_Acteur`, `Nom`, `Prenom`, `Date_Naissance`, `Nb_Film`, `Nationalite`) VALUES
(1, 'ADJANI', 'ISABELLE', '1955-06-27', 42, 1),
(2, 'LAMBERT', 'CHRISTOPHE', '1957-03-29', 64, 1),
(3, 'BOHRINGER', 'RICHARD', '1942-06-16', 132, 1),
(4, 'GALABRU', 'MICHEL', '1922-10-27', 277, 1),
(5, 'PARILLAUD', 'ANNE', '1960-05-06', 35, 1),
(6, 'FORD', 'HARRISON', '1942-06-13', 64, 2),
(7, 'FISHER', 'CARRIE', '1956-10-21', 74, 2),
(8, 'SALDANA', 'ZOE', '1978-06-19', 31, 2),
(9, 'WEAVER', 'SIGOURNEY', '1949-10-08', 66, 2),
(10, 'RENO', 'JEAN', '1948-06-30', 75, 1),
(11, 'BOON', 'DANY', '1966-06-26', 23, 1),
(12, 'MERAD', 'KAD', '1964-03-27', 55, 3);

-- --------------------------------------------------------

--
-- Structure de la table `casting`
--

DROP TABLE IF EXISTS `casting`;
CREATE TABLE IF NOT EXISTS `casting` (
  `Ident_Film` int NOT NULL,
  `Ident_Acteur` int NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Nb_Jour_Tournage` int DEFAULT NULL,
  KEY `Ident_Film` (`Ident_Film`),
  KEY `Ident_Acteur` (`Ident_Acteur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `casting`
--

INSERT INTO `casting` (`Ident_Film`, `Ident_Acteur`, `Role`, `Nb_Jour_Tournage`) VALUES
(1, 1, 'HELENA', 100),
(1, 2, 'FRED', 100),
(1, 3, 'INSPECTEUR GESBERG', NULL),
(1, 4, 'LE FLEURISTE', 35),
(1, 10, 'LE BATTEUR', 20),
(2, 5, 'NIKITA', 68),
(2, 10, 'VICTOR LE NETTOYEUR', 9),
(3, 6, 'HAN SOLO', 201),
(3, 7, 'PRINCESSE LEIA', 203),
(4, 8, 'NEYTIRI', 50),
(4, 9, 'Dr. Grace Augustine', 45),
(5, 11, 'ANTOINE BAILLEUL', 125),
(5, 12, 'PHILIPPE ABRAMS', 126);

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `Ident_Film` int NOT NULL AUTO_INCREMENT,
  `Titre` varchar(100) NOT NULL,
  `Genre1` varchar(50) NOT NULL,
  `Genre2` varchar(50) DEFAULT NULL,
  `Date_Sortie` date NOT NULL,
  `Pays` int NOT NULL,
  `Ident_Realisateur` int NOT NULL,
  `Distributeur` varchar(50) NOT NULL,
  `Resume` text NOT NULL,
  PRIMARY KEY (`Ident_Film`),
  KEY `Pays` (`Pays`),
  KEY `Ident_Realisateur` (`Ident_Realisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`Ident_Film`, `Titre`, `Genre1`, `Genre2`, `Date_Sortie`, `Pays`, `Ident_Realisateur`, `Distributeur`, `Resume`) VALUES
(1, 'SUBWAY', 'POLICIER', 'DRAME', '1985-04-10', 1, 1, 'GAUMONT', 'Conte les aventures de la population souterraine dans les couloirs du métro parisien'),
(2, 'NIKITA', 'DRAME', 'ROMANTIQUE', '1990-02-21', 1, 1, 'GAUMONT', 'Nikita condamnée à la prison à perpétuité est contrainte de travailler secrètement pour le gouvernement en tant que agent hautement qualifié des services secrets.'),
(3, 'STAR WARS 6- LE RETOUR DU JEDI', 'ACTION', 'SF', '1983-10-19', 2, 2, '20th Century Fox', 'L\'Empire galactique est plus puissant que jamais: la construction de la nouvelle arme, l\'Etoile de la Mort, menace l\'univers tout entier.'),
(4, 'AVATAR', 'ACTION', 'SF', '2009-10-16', 2, 3, '20th Century Fox', 'Malgré sa paralysie, Jake Sully, un ancien marine immobilisé dans un fauteuil roulant, est resté un combattant au plus profond'),
(5, 'BIENVENUE CHEZ LES CH\'TIS', 'COMEDIE', NULL, '2008-02-27', 1, 4, 'PATHE', 'Philippe Abrams est directeur de la poste de Salon-de-Provence est muté dans le Nord.');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `Ident_Pays` int NOT NULL,
  `Libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Ident_Pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`Ident_Pays`, `Libelle`) VALUES
(1, 'FRANCE'),
(2, 'USA'),
(3, 'ALGERIE');

-- --------------------------------------------------------

--
-- Structure de la table `realisateur`
--

DROP TABLE IF EXISTS `realisateur`;
CREATE TABLE IF NOT EXISTS `realisateur` (
  `Ident_Realisateur` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Date_Naissance` date NOT NULL,
  `Nb_Film_Ecrit` int DEFAULT NULL,
  `Nb_Film_Produit` int DEFAULT NULL,
  `Nationalite` int NOT NULL,
  PRIMARY KEY (`Ident_Realisateur`),
  KEY `Nationalite` (`Nationalite`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `realisateur`
--

INSERT INTO `realisateur` (`Ident_Realisateur`, `Nom`, `Prenom`, `Date_Naissance`, `Nb_Film_Ecrit`, `Nb_Film_Produit`, `Nationalite`) VALUES
(1, 'BESSON', 'LUC', '1959-03-18', 40, 99, 1),
(2, 'LUCAS', 'GEORGES', '1944-05-14', 79, 64, 2),
(3, 'CAMERON', 'JAMES', '1954-08-16', 22, 23, 2),
(4, 'BOON', 'DANY', '1966-06-26', 5, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `statistique`
--

DROP TABLE IF EXISTS `statistique`;
CREATE TABLE IF NOT EXISTS `statistique` (
  `Ident_Film` int NOT NULL,
  `Duree` int NOT NULL,
  `Nb_Entree_France` int NOT NULL,
  `Recette_USA` int NOT NULL,
  `Recette_Monde` int NOT NULL,
  `Budget` decimal(6,2) NOT NULL,
  PRIMARY KEY (`Ident_Film`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `statistique`
--

INSERT INTO `statistique` (`Ident_Film`, `Duree`, `Nb_Entree_France`, `Recette_USA`, `Recette_Monde`, `Budget`) VALUES
(1, 104, 2917562, 390659, 1272637, '2.60'),
(2, 118, 3787845, 5017971, 0, '7.60'),
(3, 133, 4263000, 191648000, 472000000, '32.00'),
(4, 170, 12018251, 760505847, 2147483647, '237.00'),
(5, 100, 21000000, 0, 245000000, '11.00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
