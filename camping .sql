-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 17 juil. 2020 à 10:09
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `camping`
--

-- --------------------------------------------------------

--
-- Structure de la table `accompagnant`
--

CREATE TABLE `accompagnant` (
  `Id_client` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Date_naissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Id_client` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Date_naissance` date NOT NULL,
  `Adresse` varchar(100) NOT NULL,
  `Code_postal` int(11) NOT NULL,
  `Ville` varchar(20) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Pays` varchar(20) NOT NULL,
  `Immatriculation` varchar(20) NOT NULL,
  `Id_accompagnant` int(11) DEFAULT NULL,
  `Animaux` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Id_client`, `Nom`, `Prenom`, `Date_naissance`, `Adresse`, `Code_postal`, `Ville`, `Telephone`, `Email`, `Pays`, `Immatriculation`, `Id_accompagnant`, `Animaux`) VALUES
(1, 'BAUDINO', 'Nicolas', '1990-12-24', '498 chemin de lieutaud', 13420, 'GEMENOS', 635492779, '', 'FRANCE', '5563wn13', NULL, NULL),
(2, 'chuck', 'norris', '2020-02-25', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(3, 'chuck', 'norris', '2020-02-25', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(4, 'baudino', 'nicolas', '1990-12-24', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(5, 'baudino', 'nicolas', '1990-12-24', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(6, 'baud', 'nicolas', '1990-12-24', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(7, 'baud', 'nicolas', '1990-12-24', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(8, 'baudino', 'nicolas', '1990-12-24', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(9, 'baudino', 'nicolas', '1990-12-24', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(10, 'baudino', 'nicolas', '2020-01-01', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(11, 'Castle', 'franck', '1990-02-28', '2 rue trivett', 13015, 'marseille', 653265487, 'nico@nico.mail.fr', 'france', '5563wn13', NULL, NULL),
(12, 'Castle', 'franck', '1990-12-24', '2 rue trivett', 13015, 'marseille', 653265487, 'nico@nico.mail.fr', 'france', '2252ds45', NULL, NULL),
(13, 'tchao', 'manu', '1954-02-12', '45 rue om', 13420, 'gemenos', 645652326, 'jkj@ggf.fr', 'france', '6532cv23', NULL, NULL),
(14, 'tchaopp', 'manuk', '1954-02-12', '45 rue om', 13420, 'gemenos', 645652326, 'jkj@ggf.fr', 'france', '6532cv23', NULL, NULL),
(15, 'kiooo', 'manuk', '1954-02-12', '45 rue om', 13420, 'gemenos', 645652326, 'jkj@ggf.fr', 'france', '6532cv23', NULL, NULL),
(16, 'kiolo', 'manuk', '1954-02-12', '45 rue om', 13420, 'gemenos', 645652326, 'jkj@ggf.fr', 'france', '6532cv23', NULL, NULL),
(17, 'kiololll', 'manuk', '1954-02-12', '45 rue om', 13420, 'gemenos', 645652326, 'jkj@ggf.fr', 'france', '6532cv23', NULL, NULL),
(18, 'Castle', 'franck', '1987-03-02', '2 rue trivett', 13015, 'marseille', 653265487, 'nico@nico.mail.fr', 'france', '55555555', NULL, NULL),
(19, 'Castle', 'franck', '1953-06-05', '2 rue trivett', 13015, 'marseille', 653265487, 'nico@nico.mail.fr', 'france', '2252ds45', NULL, NULL),
(20, 'Castle', 'franck', '1545-02-02', '2 rue trivett', 13015, 'marseille', 653265487, 'nico@nico.mail.fr', 'france', '2252ds45', NULL, NULL),
(21, 'Castle', 'franck', '1985-05-02', '2 rue trivett', 13015, 'marseille', 653265487, 'nico@nico.mail.fr', 'france', '5563wn13', NULL, NULL),
(22, 'chuck', 'norris', '2020-02-05', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(23, 'chucko', 'norris', '2020-02-05', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL),
(24, 'chuckop', 'norris', '2020-02-05', '84 rue trivette', 13011, 'marseille', 654523654, 'chuck@hotmail.fr', 'france', '2252ds45', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `emplacement`
--

CREATE TABLE `emplacement` (
  `Id_emplacement` int(11) NOT NULL,
  `Id_location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `emplacement`
--

INSERT INTO `emplacement` (`Id_emplacement`, `Id_location`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `Id_location` int(11) NOT NULL,
  `type_location` varchar(20) NOT NULL,
  `Tarif_jour` float NOT NULL,
  `Nombre_emplacement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`Id_location`, `type_location`, `Tarif_jour`, `Nombre_emplacement`) VALUES
(1, 'Emplacement Tente', 10, 4),
(2, 'Emplacement Camping ', 20.5, 3),
(3, 'Caravane', 30.22, 3),
(4, 'Mobil home', 40, 2);

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

CREATE TABLE `maintenance` (
  `Id_ticket` int(11) NOT NULL,
  `Id_emplacement` int(11) NOT NULL,
  `Commentaire` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `En_service` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `options`
--

CREATE TABLE `options` (
  `Id_client` int(11) NOT NULL,
  `Internet/pc` float NOT NULL,
  `Laverie` float NOT NULL,
  `Location_velo` float NOT NULL,
  `Barbecue` float NOT NULL,
  `Kit_bebe` float NOT NULL,
  `Draps_simple` float NOT NULL,
  `Draps_doucle` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `options`
--

INSERT INTO `options` (`Id_client`, `Internet/pc`, `Laverie`, `Location_velo`, `Barbecue`, `Kit_bebe`, `Draps_simple`, `Draps_doucle`) VALUES
(1, 1, 2, 3, 4, 5, 6, 7);

-- --------------------------------------------------------

--
-- Structure de la table `sejour`
--

CREATE TABLE `sejour` (
  `Id_sejour` int(11) NOT NULL,
  `Id_client` int(11) NOT NULL,
  `Id_location` int(11) NOT NULL,
  `Arrivee` date NOT NULL,
  `Depart` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `sejour`
--

INSERT INTO `sejour` (`Id_sejour`, `Id_client`, `Id_location`, `Arrivee`, `Depart`) VALUES
(1, 1, 4, '2020-07-20', '2020-07-26'),
(2, 12, 1, '2020-08-18', '2020-08-20'),
(3, 1, 1, '2020-08-05', '2020-08-11'),
(4, 13, 2, '2020-08-08', '2020-08-12'),
(5, 16, 1, '2020-07-27', '2020-07-30'),
(6, 16, 1, '2020-07-27', '2020-07-30'),
(7, 16, 1, '2020-07-27', '2020-07-30'),
(8, 16, 1, '2020-09-27', '2020-09-30'),
(9, 16, 1, '2020-09-27', '2020-09-30'),
(10, 16, 1, '2020-09-27', '2020-09-30'),
(11, 16, 1, '2020-09-27', '2020-09-30'),
(12, 17, 1, '2020-10-02', '2020-10-05'),
(13, 17, 1, '2020-10-06', '2020-10-10'),
(14, 17, 1, '2020-10-06', '2020-10-10'),
(15, 17, 1, '2020-10-06', '2020-10-10'),
(16, 17, 1, '2020-10-06', '2020-10-10'),
(17, 19, 1, '2020-11-03', '2020-11-28'),
(18, 19, 1, '2020-11-03', '2020-11-28'),
(19, 19, 1, '2020-11-03', '2020-11-28'),
(20, 19, 1, '2020-11-03', '2020-11-28'),
(21, 19, 1, '2020-11-29', '2020-12-10'),
(22, 19, 1, '2020-11-29', '2020-12-10'),
(23, 19, 1, '2020-11-29', '2020-12-10'),
(24, 19, 1, '2020-11-29', '2020-12-10'),
(25, 19, 3, '2020-11-29', '2020-12-10'),
(26, 19, 2, '2020-11-29', '2020-12-10'),
(27, 19, 1, '2020-12-20', '2020-12-25'),
(28, 19, 1, '2020-12-20', '2020-12-25'),
(29, 19, 3, '2020-12-20', '2020-12-28'),
(30, 19, 1, '2020-12-20', '2020-12-28'),
(31, 19, 3, '2020-12-20', '2020-12-28'),
(32, 19, 3, '2020-12-20', '2020-12-28'),
(33, 20, 3, '2021-05-02', '2022-05-03'),
(34, 21, 1, '2021-01-01', '2021-01-05'),
(35, 22, 1, '2021-05-02', '2021-05-15'),
(36, 22, 1, '2021-05-02', '2021-05-15'),
(37, 22, 2, '2021-05-02', '2021-05-15'),
(38, 23, 3, '2021-05-02', '2021-05-17'),
(39, 23, 4, '2021-05-02', '2021-05-17'),
(40, 23, 3, '2021-05-02', '2021-05-17'),
(41, 23, 4, '2021-05-02', '2021-05-17'),
(42, 24, 4, '2021-05-20', '2021-05-30'),
(43, 24, 4, '2021-05-20', '2021-05-30'),
(44, 24, 3, '2021-05-20', '2021-05-30');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `Id_client` int(11) NOT NULL,
  `Pain` float NOT NULL,
  `Boulangerie` float NOT NULL,
  `Bar` float NOT NULL,
  `Snack` int(11) NOT NULL,
  `Restaurant` int(11) NOT NULL,
  `Plats_emporte` float NOT NULL,
  `Pizzeria` float NOT NULL,
  `Glacier` float NOT NULL,
  `Epicerie` float NOT NULL,
  `Souvenir` float NOT NULL,
  `Presse` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accompagnant`
--
ALTER TABLE `accompagnant`
  ADD KEY `IND_ID_CLIENT` (`Id_client`) USING BTREE;

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id_client`),
  ADD KEY `INX_ACCOMPAGNANT` (`Id_accompagnant`);

--
-- Index pour la table `emplacement`
--
ALTER TABLE `emplacement`
  ADD PRIMARY KEY (`Id_emplacement`) USING BTREE,
  ADD KEY `Id_location` (`Id_location`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Id_location`);

--
-- Index pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`Id_ticket`),
  ADD KEY `INX_ID_EMPLACEMENT` (`Id_emplacement`);

--
-- Index pour la table `options`
--
ALTER TABLE `options`
  ADD KEY `INX_ID_CLIENT` (`Id_client`);

--
-- Index pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD PRIMARY KEY (`Id_sejour`) USING BTREE,
  ADD KEY `Id_client` (`Id_client`),
  ADD KEY `Id_emplacement` (`Id_location`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD KEY `IDX_ID_CLIENT` (`Id_client`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `Id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `emplacement`
--
ALTER TABLE `emplacement`
  MODIFY `Id_emplacement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `Id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `Id_ticket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sejour`
--
ALTER TABLE `sejour`
  MODIFY `Id_sejour` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accompagnant`
--
ALTER TABLE `accompagnant`
  ADD CONSTRAINT `accompagnant_ibfk_1` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`);

--
-- Contraintes pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`Id_emplacement`) REFERENCES `emplacement` (`Id_emplacement`);

--
-- Contraintes pour la table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_1` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`);

--
-- Contraintes pour la table `sejour`
--
ALTER TABLE `sejour`
  ADD CONSTRAINT `sejour_ibfk_2` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`),
  ADD CONSTRAINT `sejour_ibfk_3` FOREIGN KEY (`Id_location`) REFERENCES `location` (`Id_location`);

--
-- Contraintes pour la table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
