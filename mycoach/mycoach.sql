-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 19 oct. 2023 à 16:13
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

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `identifiant` varchar(50) NOT NULL,
  `mdp` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `identifiant`, `mdp`) VALUES
(1, 'Charbon', 'Fred', 'FredC', 'azerty');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
