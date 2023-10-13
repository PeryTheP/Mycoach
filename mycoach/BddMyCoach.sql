-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 06 oct. 2023 à 12:25
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
-- Base de données : `mycoach`
--
CREATE DATABASE IF NOT EXISTS `mycoach` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `mycoach`;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id_niveau` int NOT NULL,
  `libNIV` varchar(30) NOT NULL,
  PRIMARY KEY (`id_niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `libNIV`) VALUES
(1, 'Debutant'),
(2, 'Intermediaire'),
(3, 'Avancé'),
(4, 'Professionel');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int NOT NULL,
  `cp` varchar(5) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `nomSA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `cp`, `ville`, `adresse`, `nomSA`) VALUES
(301, '31000', 'Toulouse', '8 Voie de la Chaussée-d\'Antin', 'Jupiter'),
(302, '31000', 'Toulouse', '99 Quai du Faubourg Saint-Honoré ', 'Pluton'),
(303, '31000', 'Toulouse', '8 Voie de la Chaussée-d\'Antin', 'Mercure'),
(304, '31000', 'Toulouse', '99 Quai du Faubourg Saint-Honoré', 'Mars');

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id_seance` int NOT NULL,
  `DateS` date NOT NULL,
  `HeureDebut` time NOT NULL,
  `HeureFIN` time NOT NULL,
  `Sport` int NOT NULL,
  `Salle` int NOT NULL,
  `id_Niv` int NOT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `Salle` (`Salle`),
  KEY `Sport_2` (`Sport`),
  KEY `fk_niveau_seance` (`id_Niv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id_seance`, `DateS`, `HeureDebut`, `HeureFIN`, `Sport`, `Salle`, `id_Niv`) VALUES
(101, '2023-12-04', '14:00:00', '15:30:00', 201, 301, 1),
(102, '2023-12-05', '14:00:00', '15:30:00', 202, 302, 2),
(103, '2023-12-06', '14:00:00', '15:30:00', 203, 303, 3),
(104, '2023-12-07', '14:00:00', '15:30:00', 204, 304, 4),
(105, '2023-12-18', '14:00:00', '15:30:00', 204, 304, 2);

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `nomSP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_sport` int NOT NULL,
  PRIMARY KEY (`id_sport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`nomSP`, `id_sport`) VALUES
('Cardio-training', 201),
('Yoga et Pilates', 202),
('CrossFit', 203),
('Musculation', 204);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `fk_salle_seance` FOREIGN KEY (`id_salle`) REFERENCES `seance` (`Salle`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `fk_niveau_seance` FOREIGN KEY (`id_Niv`) REFERENCES `niveau` (`id_niveau`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sport`
--
ALTER TABLE `sport`
  ADD CONSTRAINT `fk_sport_seance` FOREIGN KEY (`id_sport`) REFERENCES `seance` (`Sport`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données : `tp1_classe`
--
CREATE DATABASE IF NOT EXISTS `tp1_classe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `tp1_classe`;

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

DROP TABLE IF EXISTS `epreuve`;
CREATE TABLE IF NOT EXISTS `epreuve` (
  `numEpreuve` char(3) NOT NULL,
  `dateEpreuve` date NOT NULL,
  `lieu` varchar(20) NOT NULL,
  `codeMat` char(6) NOT NULL,
  PRIMARY KEY (`numEpreuve`),
  KEY `codeMat` (`codeMat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `epreuve`
--

INSERT INTO `epreuve` (`numEpreuve`, `dateEpreuve`, `lieu`, `codeMat`) VALUES
('11', '2023-05-23', 'Toulouse', '5100'),
('12', '2022-05-24', 'Toulouse', '5200'),
('13', '2023-11-22', 'Toulouse', '5300'),
('14', '2025-04-06', 'Toulouse', '5400'),
('15', '2023-05-23', 'Toulouse', '5500');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `numEtudiant` int NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `DateNaiss` year NOT NULL,
  `rue` varchar(50) NOT NULL,
  `cp` char(5) NOT NULL,
  `ville` varchar(30) NOT NULL,
  PRIMARY KEY (`numEtudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`numEtudiant`, `nom`, `prenom`, `DateNaiss`, `rue`, `cp`, `ville`) VALUES
(1, 'Bourseiller', 'Dimitri ', 2004, '1 Voie du Faubourg-Saint-Denis', '31000', 'Toulouse'),
(2, 'Dupont', 'Vivien', 2004, '266 Allée de Vaugirard', '13000', 'Marseille'),
(3, 'Malpart', 'Georges', 2004, '9 Voie de la Chaussée-d\'Antin', '31000', 'Toulouse'),
(4, 'Merx', 'Noël', 2002, '64 Avenue Joubert', '81000', 'Albi'),
(6, 'JAVEL', 'AUDE', 2004, '19 Boulevard Bonaparte', '31000', 'Toulouse');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `codeMatiere` char(6) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `coef` tinyint DEFAULT NULL,
  PRIMARY KEY (`codeMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`codeMatiere`, `libelle`, `coef`) VALUES
('5100', 'Histoire', 1),
('5200', 'Anglais', 4),
('5300', 'INFO', 2),
('5400', 'Sport', 10),
('5500', 'Math', 5),
('5600', 'GEO', 5),
('5700', 'petanque', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `notation`
--

DROP TABLE IF EXISTS `notation`;
CREATE TABLE IF NOT EXISTS `notation` (
  `numEtu` int NOT NULL,
  `NumEp` char(3) NOT NULL,
  `note` int NOT NULL,
  PRIMARY KEY (`numEtu`,`NumEp`),
  KEY `NumEp` (`NumEp`),
  KEY `numEtu` (`numEtu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notation`
--

INSERT INTO `notation` (`numEtu`, `NumEp`, `note`) VALUES
(1, '11', 5),
(2, '12', 13),
(2, '14', 15),
(3, '13', 20),
(4, '12', 2),
(4, '13', 11);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `epreuve_ibfk_1` FOREIGN KEY (`codeMat`) REFERENCES `matiere` (`codeMatiere`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notation`
--
ALTER TABLE `notation`
  ADD CONSTRAINT `notation_ibfk_1` FOREIGN KEY (`numEtu`) REFERENCES `etudiant` (`numEtudiant`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notation_ibfk_2` FOREIGN KEY (`NumEp`) REFERENCES `epreuve` (`numEpreuve`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
