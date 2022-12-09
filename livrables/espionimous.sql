-- SQL
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `espionimous`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `code_country` char(2) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contact_mission`
--

CREATE TABLE `contact_mission` (
  `id_mission` int(11) NOT NULL,
  `id_contact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `hideout`
--

CREATE TABLE `hideout` (
  `id` int(11) NOT NULL,
  `code_name` int(50) NOT NULL,
  `adress` varchar(250) NOT NULL,
  `code_country` char(2) NOT NULL,
  `country` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `hideout_mission`
--

CREATE TABLE `hideout_mission` (
  `id_mission` int(11) NOT NULL,
  `id_hideout` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

CREATE TABLE `mission` (
  `id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `code_country` char(2) NOT NULL,
  `country` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `mission_speciality`
--

CREATE TABLE `mission_speciality` (
  `id_mission` int(11) NOT NULL,
  `id_speciality` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `mission_type_of_mission`
--

CREATE TABLE `mission_type_of_mission` (
  `id_mission` int(11) NOT NULL,
  `id_type_of_mission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `speciality`
--

CREATE TABLE `speciality` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `spy`
--

CREATE TABLE `spy` (
  `id` int(11) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `code_country` char(2) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `spy_mission`
--

CREATE TABLE `spy_mission` (
  `id_mission` int(11) NOT NULL,
  `id_spy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `spy_speciality`
--

CREATE TABLE `spy_speciality` (
  `id_speciality` int(11) NOT NULL,
  `id_spy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `target`
--

CREATE TABLE `target` (
  `id` int(11) NOT NULL,
  `code_name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `code_country` char(2) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `target_mission`
--

CREATE TABLE `target_mission` (
  `id_mission` int(11) NOT NULL,
  `id_target` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `type_of_mission`
--

CREATE TABLE `type_of_mission` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact_mission`
--
ALTER TABLE `contact_mission`
  ADD PRIMARY KEY (`id_mission`,`id_contact`),
  ADD KEY `id_contact` (`id_contact`);

--
-- Index pour la table `hideout`
--
ALTER TABLE `hideout`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hideout_mission`
--
ALTER TABLE `hideout_mission`
  ADD PRIMARY KEY (`id_mission`,`id_hideout`),
  ADD KEY `id_hideout` (`id_hideout`);

--
-- Index pour la table `mission`
--
ALTER TABLE `mission`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mission_speciality`
--
ALTER TABLE `mission_speciality`
  ADD PRIMARY KEY (`id_mission`,`id_speciality`),
  ADD KEY `id_speciality` (`id_speciality`);

--
-- Index pour la table `mission_type_of_mission`
--
ALTER TABLE `mission_type_of_mission`
  ADD PRIMARY KEY (`id_mission`,`id_type_of_mission`),
  ADD KEY `id_type_of_mission` (`id_type_of_mission`);

--
-- Index pour la table `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `spy`
--
ALTER TABLE `spy`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `spy_mission`
--
ALTER TABLE `spy_mission`
  ADD PRIMARY KEY (`id_mission`,`id_spy`),
  ADD KEY `id_spy` (`id_spy`);

--
-- Index pour la table `spy_speciality`
--
ALTER TABLE `spy_speciality`
  ADD PRIMARY KEY (`id_speciality`,`id_spy`),
  ADD KEY `id_spy` (`id_spy`);

--
-- Index pour la table `target`
--
ALTER TABLE `target`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `target_mission`
--
ALTER TABLE `target_mission`
  ADD PRIMARY KEY (`id_mission`,`id_target`),
  ADD KEY `id_target` (`id_target`);

--
-- Index pour la table `type_of_mission`
--
ALTER TABLE `type_of_mission`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `hideout`
--
ALTER TABLE `hideout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mission`
--
ALTER TABLE `mission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `speciality`
--
ALTER TABLE `speciality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `spy`
--
ALTER TABLE `spy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `target`
--
ALTER TABLE `target`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_of_mission`
--
ALTER TABLE `type_of_mission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contact_mission`
--
ALTER TABLE `contact_mission`
  ADD CONSTRAINT `contact_mission_ibfk_1` FOREIGN KEY (`id_mission`) REFERENCES `mission` (`id`),
  ADD CONSTRAINT `contact_mission_ibfk_2` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`);

--
-- Contraintes pour la table `hideout_mission`
--
ALTER TABLE `hideout_mission`
  ADD CONSTRAINT `hideout_mission_ibfk_1` FOREIGN KEY (`id_mission`) REFERENCES `mission` (`id`),
  ADD CONSTRAINT `hideout_mission_ibfk_2` FOREIGN KEY (`id_hideout`) REFERENCES `hideout` (`id`);

--
-- Contraintes pour la table `mission_speciality`
--
ALTER TABLE `mission_speciality`
  ADD CONSTRAINT `mission_speciality_ibfk_1` FOREIGN KEY (`id_mission`) REFERENCES `mission` (`id`),
  ADD CONSTRAINT `mission_speciality_ibfk_2` FOREIGN KEY (`id_speciality`) REFERENCES `speciality` (`id`);

--
-- Contraintes pour la table `mission_type_of_mission`
--
ALTER TABLE `mission_type_of_mission`
  ADD CONSTRAINT `mission_type_of_mission_ibfk_1` FOREIGN KEY (`id_mission`) REFERENCES `mission` (`id`),
  ADD CONSTRAINT `mission_type_of_mission_ibfk_2` FOREIGN KEY (`id_type_of_mission`) REFERENCES `type_of_mission` (`id`);

--
-- Contraintes pour la table `spy_mission`
--
ALTER TABLE `spy_mission`
  ADD CONSTRAINT `spy_mission_ibfk_1` FOREIGN KEY (`id_mission`) REFERENCES `mission` (`id`),
  ADD CONSTRAINT `spy_mission_ibfk_2` FOREIGN KEY (`id_spy`) REFERENCES `spy` (`id`);

--
-- Contraintes pour la table `spy_speciality`
--
ALTER TABLE `spy_speciality`
  ADD CONSTRAINT `spy_speciality_ibfk_1` FOREIGN KEY (`id_speciality`) REFERENCES `speciality` (`id`),
  ADD CONSTRAINT `spy_speciality_ibfk_2` FOREIGN KEY (`id_spy`) REFERENCES `spy` (`id`);

--
-- Contraintes pour la table `target_mission`
--
ALTER TABLE `target_mission`
  ADD CONSTRAINT `target_mission_ibfk_1` FOREIGN KEY (`id_mission`) REFERENCES `mission` (`id`),
  ADD CONSTRAINT `target_mission_ibfk_2` FOREIGN KEY (`id_target`) REFERENCES `target` (`id`);
COMMIT;

