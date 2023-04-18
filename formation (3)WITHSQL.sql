-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2023 at 03:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `formation`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email_admin` varchar(50) DEFAULT NULL,
  `mot_de_pass_admin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email_admin`, `mot_de_pass_admin`) VALUES
('haitamsouiri3@gmail.com', 'Haitam');

-- --------------------------------------------------------

--
-- Table structure for table `apprenants`
--

CREATE TABLE `apprenants` (
  `id_apprenant` int(11) NOT NULL,
  `nom_apprenant` varchar(50) DEFAULT NULL,
  `prenom_apprenant` varchar(50) DEFAULT NULL,
  `email_apprenant` varchar(50) DEFAULT NULL,
  `mot_de_pass` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apprenants`
--

INSERT INTO `apprenants` (`id_apprenant`, `nom_apprenant`, `prenom_apprenant`, `email_apprenant`, `mot_de_pass`) VALUES
(1, 'Doe', 'John', 'john.doe@example.com', 'password123'),
(2, 'Smith', 'Jane', 'jane.smith@example.com', 'secret123'),
(3, 'Garcia', 'Maria', 'maria.garcia@example.com', 'mypassword');

-- --------------------------------------------------------

--
-- Table structure for table `formateurs`
--

CREATE TABLE `formateurs` (
  `id_formateur` int(11) NOT NULL,
  `nom_formateur` varchar(50) DEFAULT NULL,
  `prenom_formateur` varchar(50) DEFAULT NULL,
  `email_formateur` varchar(50) DEFAULT NULL,
  `mot_de_passe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formateurs`
--

INSERT INTO `formateurs` (`id_formateur`, `nom_formateur`, `prenom_formateur`, `email_formateur`, `mot_de_passe`) VALUES
(1, 'Dupont', 'Pierre', 'pierre.dupont@example.com', 'pass123'),
(2, 'Martin', 'Sophie', 'sophie.martin@example.com', 'password'),
(3, 'Leblanc', 'Jean', 'jean.leblanc@example.com', 'secret123');

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

CREATE TABLE `formation` (
  `id_formation` int(11) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_formateur` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `masse_horaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formation`
--

INSERT INTO `formation` (`id_formation`, `titre`, `description`, `id_formateur`, `image`, `categorie`, `masse_horaire`) VALUES
(1, 'Formation de Développement Web', 'Formation pour apprendre à développer des sites web', 1, '', 'Informatique', 40),
(2, 'Formation de Marketing Digital', 'Formation pour apprendre à gérer une stratégie de marketing digital', 2, '', 'Marketing', 30),
(3, 'Formation de Gestion de Projet', 'Formation pour apprendre à gérer un projet de A à Z', 3, '', 'Gestion de projet', 50);

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `id_apprenant` int(11) NOT NULL,
  `id_session` int(11) NOT NULL,
  `resultat` varchar(50) DEFAULT NULL,
  `date_valu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id_session` int(11) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `etat` varchar(50) DEFAULT NULL,
  `nombre_de_place` int(11) DEFAULT NULL,
  `id_formateur` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id_session`, `date_debut`, `date_fin`, `etat`, `nombre_de_place`, `id_formateur`, `id_formation`) VALUES
(1, '2023-05-01', '2023-05-15', 'En cours', 20, 1, 1),
(2, '2023-06-01', '2023-06-30', 'en cours d\'inscription ', 10, 2, 2),
(3, '2023-07-01', '2023-07-31', 'en cours', 30, 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apprenants`
--
ALTER TABLE `apprenants`
  ADD PRIMARY KEY (`id_apprenant`),
  ADD UNIQUE KEY `email_unique` (`email_apprenant`);

--
-- Indexes for table `formateurs`
--
ALTER TABLE `formateurs`
  ADD PRIMARY KEY (`id_formateur`);

--
-- Indexes for table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id_formation`),
  ADD UNIQUE KEY `titre_unique` (`titre`),
  ADD KEY `id_formateur` (`id_formateur`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id_apprenant`,`id_session`),
  ADD KEY `id_session` (`id_session`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id_session`),
  ADD KEY `id_formateur` (`id_formateur`),
  ADD KEY `id_formation` (`id_formation`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `formation_ibfk_1` FOREIGN KEY (`id_formateur`) REFERENCES `formateurs` (`id_formateur`);

--
-- Constraints for table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`id_apprenant`) REFERENCES `apprenants` (`id_apprenant`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`id_session`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`id_formateur`) REFERENCES `formateurs` (`id_formateur`),
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id_formation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
