-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 23 sep. 2024 à 14:18
-- Version du serveur : 11.5.2-MariaDB-log
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `creation_date` date NOT NULL,
  `modification_date` date DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_subject` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `creation_date`, `modification_date`, `id_user`, `id_subject`) VALUES
(14, 'Savant', 'Un génie de la musique éléctronique !!', '2024-09-23', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `creation_date` date NOT NULL,
  `modification_date` date DEFAULT NULL,
  `id_article` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creation_date` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `subject`
--

INSERT INTO `subject` (`id`, `title`, `description`, `creation_date`, `id_user`) VALUES
(1, 'Mon sujet !', 'blabla bla', '2024-09-20', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `mail` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` date NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `mail`, `password`, `register_date`, `id_role`) VALUES
(1, 'zertghyj', 'allaan.salim@gmail.com', '$2y$10$tKLI1TCDeX06FgCkm2sYduzi.4w9OsLVC5dCj0tBiI2U9k0UPOI0.', '2024-09-19', 2),
(2, 'rash7d', 'rashad7@gmail.com', '$2y$10$tKLI1TCDeX06FgCkm2sYduzi.4w9OsLVC5dCj0tBiI2U9k0UPOI0.', '2024-09-19', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_user_FK` (`id_user`),
  ADD KEY `article_subject0_FK` (`id_subject`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_article_FK` (`id_article`),
  ADD KEY `comment_user0_FK` (`id_user`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `note_article_FK` (`id_article`),
  ADD KEY `note_user0_FK` (`id_user`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_user_FK` (`id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_FK` (`id_role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_subject0_FK` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `article_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_article_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `comment_user0_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_article_FK` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `note_user0_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_role_FK` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
