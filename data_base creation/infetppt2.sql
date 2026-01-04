-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 04 jan. 2026 à 21:32
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `infetppt2`
--

-- --------------------------------------------------------

--
-- Structure de la table `age_moyen_de_depart_en_retraite`
--

CREATE TABLE `age_moyen_de_depart_en_retraite` (
  `annee` int(11) NOT NULL,
  `age_moyen_ensemble` float NOT NULL,
  `age_moyen_femme` float NOT NULL,
  `age_moyen_homme` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `declaration_prealable_a_l_emboche`
--

CREATE TABLE `declaration_prealable_a_l_emboche` (
  `annee` int(11) NOT NULL,
  `trimestre` int(11) NOT NULL,
  `dernier_jour_du_mois` date NOT NULL,
  `duree_du_contrat` varchar(255) NOT NULL,
  `nature_du_contract` varchar(255) NOT NULL,
  `dpae_brut` int(11) NOT NULL,
  `dpae_csv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `nombre_de_retraite_hf_de_2002_a_2022_en_milliers`
--

CREATE TABLE `nombre_de_retraite_hf_de_2002_a_2022_en_milliers` (
  `annee` int(11) NOT NULL,
  `nombre_total` int(11) NOT NULL,
  `nombre_femme` int(11) NOT NULL,
  `nombre_homme` int(11) NOT NULL,
  `age_moyen_de_la_retraite_annee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `offre_d_emploi_diffuse`
--

CREATE TABLE `offre_d_emploi_diffuse` (
  `annee` int(11) NOT NULL,
  `trimestre` varchar(255) NOT NULL,
  `mois` int(11) NOT NULL,
  `cdi` int(11) NOT NULL,
  `cdd_de_plus_de_six_mois` int(11) NOT NULL,
  `cdd_de_un_a_six_mois` int(11) NOT NULL,
  `cdd_de_moins_d_un_mois` int(11) NOT NULL,
  `autre_contrat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tension_dans_le_secteur_de_l_it`
--

CREATE TABLE `tension_dans_le_secteur_de_l_it` (
  `annee` int(11) NOT NULL,
  `tension_ingenieurs_de_l_informatique` float NOT NULL,
  `tension_technicien_informatique` float NOT NULL,
  `tension_ensemble_des_métiers` float NOT NULL,
  `projet_de_recrutement_ingenieur` int(11) NOT NULL,
  `projet_de_recrutement_technicien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `age_moyen_de_depart_en_retraite`
--
ALTER TABLE `age_moyen_de_depart_en_retraite`
  ADD PRIMARY KEY (`annee`);

--
-- Index pour la table `nombre_de_retraite_hf_de_2002_a_2022_en_milliers`
--
ALTER TABLE `nombre_de_retraite_hf_de_2002_a_2022_en_milliers`
  ADD PRIMARY KEY (`annee`),
  ADD KEY `age_moyen_de_la_retraite_annee` (`age_moyen_de_la_retraite_annee`);

--
-- Index pour la table `tension_dans_le_secteur_de_l_it`
--
ALTER TABLE `tension_dans_le_secteur_de_l_it`
  ADD PRIMARY KEY (`annee`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `age_moyen_de_depart_en_retraite`
--
ALTER TABLE `age_moyen_de_depart_en_retraite`
  MODIFY `annee` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nombre_de_retraite_hf_de_2002_a_2022_en_milliers`
--
ALTER TABLE `nombre_de_retraite_hf_de_2002_a_2022_en_milliers`
  MODIFY `annee` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `nombre_de_retraite_hf_de_2002_a_2022_en_milliers`
--
ALTER TABLE `nombre_de_retraite_hf_de_2002_a_2022_en_milliers`
  ADD CONSTRAINT `nombre_de_retraite_hf_de_2002_a_2022_en_milliers_ibfk_1` FOREIGN KEY (`age_moyen_de_la_retraite_annee`) REFERENCES `age_moyen_de_depart_en_retraite` (`annee`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
