-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2026 at 11:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `strapi_prod`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`action_parameters`)),
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `document_id`, `action`, `action_parameters`, `subject`, `properties`, `conditions`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'i7jp0xpp6y6vo8qfiqum6c77', 'plugin::content-manager.explorer.create', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[]', '2026-04-01 16:32:00.125000', '2026-04-01 16:32:00.125000', '2026-04-01 16:32:00.125000', NULL, NULL, NULL),
(2, 'xamd9c108vb3rnzibsnx1rlm', 'plugin::content-manager.explorer.create', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[]', '2026-04-01 16:32:00.135000', '2026-04-01 16:32:00.135000', '2026-04-01 16:32:00.135000', NULL, NULL, NULL),
(3, 'g2kud3vt3qj9en70hwzr96cp', 'plugin::content-manager.explorer.read', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[]', '2026-04-01 16:32:00.141000', '2026-04-01 16:32:00.141000', '2026-04-01 16:32:00.142000', NULL, NULL, NULL),
(4, 'hz7krjjh2dwo6lp1zbukjagl', 'plugin::content-manager.explorer.read', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[]', '2026-04-01 16:32:00.148000', '2026-04-01 16:32:00.148000', '2026-04-01 16:32:00.148000', NULL, NULL, NULL),
(5, 'aa2r0q0vd6i28lw61eoeth99', 'plugin::content-manager.explorer.update', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[]', '2026-04-01 16:32:00.155000', '2026-04-01 16:32:00.155000', '2026-04-01 16:32:00.155000', NULL, NULL, NULL),
(6, 'jfbmnl952pdtgd69hf4ornau', 'plugin::content-manager.explorer.update', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[]', '2026-04-01 16:32:00.159000', '2026-04-01 16:32:00.159000', '2026-04-01 16:32:00.159000', NULL, NULL, NULL),
(7, 'uwr6vko5phc03h9rdg6y7lw7', 'plugin::content-manager.explorer.delete', '{}', 'api::article.article', '{}', '[]', '2026-04-01 16:32:00.163000', '2026-04-01 16:32:00.163000', '2026-04-01 16:32:00.163000', NULL, NULL, NULL),
(8, 'fnozi92ichotm4dgx4y1f2ab', 'plugin::content-manager.explorer.delete', '{}', 'api::category.category', '{}', '[]', '2026-04-01 16:32:00.169000', '2026-04-01 16:32:00.169000', '2026-04-01 16:32:00.169000', NULL, NULL, NULL),
(9, 'dwjt6ei1m6u2r5jlfzqf3zb1', 'plugin::content-manager.explorer.publish', '{}', 'api::article.article', '{}', '[]', '2026-04-01 16:32:00.173000', '2026-04-01 16:32:00.173000', '2026-04-01 16:32:00.173000', NULL, NULL, NULL),
(10, 'qsd1g5ginat42yawn1acjmmr', 'plugin::content-manager.explorer.publish', '{}', 'api::category.category', '{}', '[]', '2026-04-01 16:32:00.177000', '2026-04-01 16:32:00.177000', '2026-04-01 16:32:00.177000', NULL, NULL, NULL),
(11, 'jw0lbc9776i2a4um1mtxp8vk', 'plugin::upload.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.182000', '2026-04-01 16:32:00.182000', '2026-04-01 16:32:00.183000', NULL, NULL, NULL),
(12, 'axky1g4d6epbf4y2v9o31i16', 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.188000', '2026-04-01 16:32:00.188000', '2026-04-01 16:32:00.188000', NULL, NULL, NULL),
(13, 'o3z3giumoyl0x1mu4b2y520s', 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.192000', '2026-04-01 16:32:00.192000', '2026-04-01 16:32:00.193000', NULL, NULL, NULL),
(14, 'o1dtobmhq1ttyw1v496c56vj', 'plugin::upload.assets.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.196000', '2026-04-01 16:32:00.196000', '2026-04-01 16:32:00.196000', NULL, NULL, NULL),
(15, 'iyqmab9ofdmlshp4vvyvta6g', 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.199000', '2026-04-01 16:32:00.199000', '2026-04-01 16:32:00.199000', NULL, NULL, NULL),
(16, 't8f9syf6sr3cup7k694r12tm', 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.203000', '2026-04-01 16:32:00.203000', '2026-04-01 16:32:00.203000', NULL, NULL, NULL),
(17, 'gpd8sxh4y4veg646xzbyzcp8', 'plugin::content-manager.explorer.create', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.214000', '2026-04-01 16:32:00.214000', '2026-04-01 16:32:00.214000', NULL, NULL, NULL),
(18, 'w2f0mwr8d7czl36o159bsmqp', 'plugin::content-manager.explorer.create', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.222000', '2026-04-01 16:32:00.222000', '2026-04-01 16:32:00.222000', NULL, NULL, NULL),
(19, 'mzkeq5j5hwcayio6e380tlan', 'plugin::content-manager.explorer.read', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.228000', '2026-04-01 16:32:00.228000', '2026-04-01 16:32:00.228000', NULL, NULL, NULL),
(20, 'p9gvimet9dvkjnq6dj2zfudf', 'plugin::content-manager.explorer.read', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.233000', '2026-04-01 16:32:00.233000', '2026-04-01 16:32:00.233000', NULL, NULL, NULL),
(21, 'v4cfsi3cxxsq2mgg8j08bopw', 'plugin::content-manager.explorer.update', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.238000', '2026-04-01 16:32:00.238000', '2026-04-01 16:32:00.238000', NULL, NULL, NULL),
(22, 'c500hsqzhmbp6xsqe9jyld9r', 'plugin::content-manager.explorer.update', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.243000', '2026-04-01 16:32:00.243000', '2026-04-01 16:32:00.243000', NULL, NULL, NULL),
(23, 'a1w9ibihnyzi1c2kge90zap3', 'plugin::content-manager.explorer.delete', '{}', 'api::article.article', '{}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.247000', '2026-04-01 16:32:00.247000', '2026-04-01 16:32:00.248000', NULL, NULL, NULL),
(24, 'a2h40icsjiiyaubtofwvo22i', 'plugin::content-manager.explorer.delete', '{}', 'api::category.category', '{}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.251000', '2026-04-01 16:32:00.251000', '2026-04-01 16:32:00.251000', NULL, NULL, NULL),
(25, 'papbk6lw74fit11hifgkjgqg', 'plugin::upload.read', '{}', NULL, '{}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.255000', '2026-04-01 16:32:00.255000', '2026-04-01 16:32:00.255000', NULL, NULL, NULL),
(26, 'zndzz4lssf4ji6tqywh4th4n', 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.259000', '2026-04-01 16:32:00.259000', '2026-04-01 16:32:00.259000', NULL, NULL, NULL),
(27, 'ltnd57e1gsvi7gyp9v28vdk8', 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.262000', '2026-04-01 16:32:00.262000', '2026-04-01 16:32:00.262000', NULL, NULL, NULL),
(28, 'z69vxdi66skkr2qsbl04li9m', 'plugin::upload.assets.update', '{}', NULL, '{}', '[\"admin::is-creator\"]', '2026-04-01 16:32:00.265000', '2026-04-01 16:32:00.265000', '2026-04-01 16:32:00.265000', NULL, NULL, NULL),
(29, 'p4rxsdrv0pcjylehoqn16oh9', 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.269000', '2026-04-01 16:32:00.269000', '2026-04-01 16:32:00.269000', NULL, NULL, NULL),
(30, 'r7pb39vnlt86sulzbcfznh2q', 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.276000', '2026-04-01 16:32:00.276000', '2026-04-01 16:32:00.276000', NULL, NULL, NULL),
(31, 'fhgk2o8rora15pn09p9kthx0', 'plugin::content-manager.explorer.create', '{}', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}', '[]', '2026-04-01 16:32:00.317000', '2026-04-01 16:32:00.317000', '2026-04-01 16:32:00.317000', NULL, NULL, NULL),
(32, 'b8592xp1jerj2irs8dg5h8v0', 'plugin::content-manager.explorer.create', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[]', '2026-04-01 16:32:00.324000', '2026-04-01 16:32:00.324000', '2026-04-01 16:32:00.324000', NULL, NULL, NULL),
(33, 'o24cxa70m3qjh1qw6rwkpo3a', 'plugin::content-manager.explorer.create', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[]', '2026-04-01 16:32:00.329000', '2026-04-01 16:32:00.329000', '2026-04-01 16:32:00.329000', NULL, NULL, NULL),
(34, 't2b97esmb0kzztlawsalsea5', 'plugin::content-manager.explorer.read', '{}', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}', '[]', '2026-04-01 16:32:00.333000', '2026-04-01 16:32:00.333000', '2026-04-01 16:32:00.333000', NULL, NULL, NULL),
(35, 'wnnavj570tauo78vbwmje0n1', 'plugin::content-manager.explorer.read', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[]', '2026-04-01 16:32:00.337000', '2026-04-01 16:32:00.337000', '2026-04-01 16:32:00.337000', NULL, NULL, NULL),
(36, 'o3xi1cfesximhp9ox2bp6r2x', 'plugin::content-manager.explorer.read', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[]', '2026-04-01 16:32:00.340000', '2026-04-01 16:32:00.340000', '2026-04-01 16:32:00.340000', NULL, NULL, NULL),
(37, 'e7oeg5sm117j5rx6cedc28l2', 'plugin::content-manager.explorer.update', '{}', 'plugin::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}', '[]', '2026-04-01 16:32:00.344000', '2026-04-01 16:32:00.344000', '2026-04-01 16:32:00.344000', NULL, NULL, NULL),
(38, 'cvhc2rsscdcsa9jl2gguf85h', 'plugin::content-manager.explorer.update', '{}', 'api::article.article', '{\"fields\":[\"title\",\"slug\",\"excerpt\",\"content\",\"featuredImage\",\"author\",\"published\",\"readTime\",\"categories\"]}', '[]', '2026-04-01 16:32:00.348000', '2026-04-01 16:32:00.348000', '2026-04-01 16:32:00.348000', NULL, NULL, NULL),
(39, 'c7r91qavnxqh42cm10uj1k9s', 'plugin::content-manager.explorer.update', '{}', 'api::category.category', '{\"fields\":[\"name\",\"slug\",\"description\",\"articles\"]}', '[]', '2026-04-01 16:32:00.358000', '2026-04-01 16:32:00.358000', '2026-04-01 16:32:00.358000', NULL, NULL, NULL),
(40, 'u5xpt9d8c6pgps5fft7ilamp', 'plugin::content-manager.explorer.delete', '{}', 'plugin::users-permissions.user', '{}', '[]', '2026-04-01 16:32:00.365000', '2026-04-01 16:32:00.365000', '2026-04-01 16:32:00.365000', NULL, NULL, NULL),
(41, 'arw05kr2k3nm7meds1v1sfwq', 'plugin::content-manager.explorer.delete', '{}', 'api::article.article', '{}', '[]', '2026-04-01 16:32:00.377000', '2026-04-01 16:32:00.377000', '2026-04-01 16:32:00.377000', NULL, NULL, NULL),
(42, 'tmrkywwvmmq6lt27r9u5uqn8', 'plugin::content-manager.explorer.delete', '{}', 'api::category.category', '{}', '[]', '2026-04-01 16:32:00.381000', '2026-04-01 16:32:00.381000', '2026-04-01 16:32:00.382000', NULL, NULL, NULL),
(43, 'cs2de52i29sgwn3kjlhy6x6u', 'plugin::content-manager.explorer.publish', '{}', 'plugin::users-permissions.user', '{}', '[]', '2026-04-01 16:32:00.386000', '2026-04-01 16:32:00.386000', '2026-04-01 16:32:00.387000', NULL, NULL, NULL),
(44, 'ks0ne78ujllappojjskk88ss', 'plugin::content-manager.explorer.publish', '{}', 'api::article.article', '{}', '[]', '2026-04-01 16:32:00.391000', '2026-04-01 16:32:00.391000', '2026-04-01 16:32:00.391000', NULL, NULL, NULL),
(45, 'bruxfbo417rbjok0ggsz6070', 'plugin::content-manager.explorer.publish', '{}', 'api::category.category', '{}', '[]', '2026-04-01 16:32:00.395000', '2026-04-01 16:32:00.395000', '2026-04-01 16:32:00.395000', NULL, NULL, NULL),
(46, 'wc6cytiwqkno67l9uu9vtdop', 'plugin::content-manager.single-types.configure-view', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.398000', '2026-04-01 16:32:00.398000', '2026-04-01 16:32:00.399000', NULL, NULL, NULL),
(47, 'm6ol1hbi7j38h7ey5gdssd5s', 'plugin::content-manager.collection-types.configure-view', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.404000', '2026-04-01 16:32:00.404000', '2026-04-01 16:32:00.404000', NULL, NULL, NULL),
(48, 'gcul5nb740caqoty35t85idp', 'plugin::content-manager.components.configure-layout', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.407000', '2026-04-01 16:32:00.407000', '2026-04-01 16:32:00.407000', NULL, NULL, NULL),
(49, 'dleldtqcbf62mk7i3agtod8q', 'plugin::content-type-builder.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.411000', '2026-04-01 16:32:00.411000', '2026-04-01 16:32:00.411000', NULL, NULL, NULL),
(50, 'lqyur8s6urxm85jgiz2b9ait', 'plugin::email.settings.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.414000', '2026-04-01 16:32:00.414000', '2026-04-01 16:32:00.414000', NULL, NULL, NULL),
(51, 'k7ihmbc8ourtj6w7q8sltv9c', 'plugin::upload.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.417000', '2026-04-01 16:32:00.417000', '2026-04-01 16:32:00.418000', NULL, NULL, NULL),
(52, 'xpkcu2j3yszacij06uydlv1r', 'plugin::upload.assets.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.421000', '2026-04-01 16:32:00.421000', '2026-04-01 16:32:00.421000', NULL, NULL, NULL),
(53, 'eganmrdb6wz0jcihy4t9321t', 'plugin::upload.assets.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.424000', '2026-04-01 16:32:00.424000', '2026-04-01 16:32:00.424000', NULL, NULL, NULL),
(54, 't08z6mgdjxesjer6y9bgxmtc', 'plugin::upload.assets.download', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.427000', '2026-04-01 16:32:00.427000', '2026-04-01 16:32:00.427000', NULL, NULL, NULL),
(55, 'anjiwvbyujsurr2l1edwk6h2', 'plugin::upload.assets.copy-link', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.431000', '2026-04-01 16:32:00.431000', '2026-04-01 16:32:00.431000', NULL, NULL, NULL),
(56, 'xm9i6km9p9hugll4473jiswl', 'plugin::upload.configure-view', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.434000', '2026-04-01 16:32:00.434000', '2026-04-01 16:32:00.434000', NULL, NULL, NULL),
(57, 'fmd2qduna5kt8vopvgz20ud0', 'plugin::upload.settings.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.438000', '2026-04-01 16:32:00.438000', '2026-04-01 16:32:00.438000', NULL, NULL, NULL),
(58, 'x091s09pmc75xnsjt7i0b3jo', 'plugin::i18n.locale.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.442000', '2026-04-01 16:32:00.442000', '2026-04-01 16:32:00.442000', NULL, NULL, NULL),
(59, 'j0snvzss0a88g2r1tsdumimj', 'plugin::i18n.locale.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.447000', '2026-04-01 16:32:00.447000', '2026-04-01 16:32:00.447000', NULL, NULL, NULL),
(60, 'r8u0ik0z65wlybdvltr3p2ts', 'plugin::i18n.locale.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.451000', '2026-04-01 16:32:00.451000', '2026-04-01 16:32:00.451000', NULL, NULL, NULL),
(61, 'wu8kucw2yho483ci556a6ls3', 'plugin::i18n.locale.delete', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.455000', '2026-04-01 16:32:00.455000', '2026-04-01 16:32:00.455000', NULL, NULL, NULL),
(62, 'gzsorh04rgi6mjtd6qjrxtdn', 'plugin::users-permissions.roles.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.459000', '2026-04-01 16:32:00.459000', '2026-04-01 16:32:00.459000', NULL, NULL, NULL),
(63, 'l07ge0nmccli8q7ww05fmvg8', 'plugin::users-permissions.roles.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.462000', '2026-04-01 16:32:00.462000', '2026-04-01 16:32:00.462000', NULL, NULL, NULL),
(64, 'ei28grwh0ljiukuij6z5i5mk', 'plugin::users-permissions.roles.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.465000', '2026-04-01 16:32:00.465000', '2026-04-01 16:32:00.465000', NULL, NULL, NULL),
(65, 'v2hi84v7oz62cgr1e091tkr0', 'plugin::users-permissions.roles.delete', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.471000', '2026-04-01 16:32:00.471000', '2026-04-01 16:32:00.471000', NULL, NULL, NULL),
(66, 's0ovqf8c3w58shmayi6mxtx0', 'plugin::users-permissions.providers.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.477000', '2026-04-01 16:32:00.477000', '2026-04-01 16:32:00.477000', NULL, NULL, NULL),
(67, 'muthvy9iao1afwcbo0fll176', 'plugin::users-permissions.providers.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.481000', '2026-04-01 16:32:00.481000', '2026-04-01 16:32:00.481000', NULL, NULL, NULL),
(68, 'jx6t0rfs9m190ehzzjnuyrk1', 'plugin::users-permissions.email-templates.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.484000', '2026-04-01 16:32:00.484000', '2026-04-01 16:32:00.484000', NULL, NULL, NULL),
(69, 'xm2kyx0ad3mdvfpaxpeg0dzg', 'plugin::users-permissions.email-templates.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.488000', '2026-04-01 16:32:00.488000', '2026-04-01 16:32:00.488000', NULL, NULL, NULL),
(70, 'hjpak48vxxttyq7tn08cs7wb', 'plugin::users-permissions.advanced-settings.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.493000', '2026-04-01 16:32:00.493000', '2026-04-01 16:32:00.493000', NULL, NULL, NULL),
(71, 'l8vkeh713p2fiobpjky3vg2s', 'plugin::users-permissions.advanced-settings.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.496000', '2026-04-01 16:32:00.496000', '2026-04-01 16:32:00.496000', NULL, NULL, NULL),
(72, 'cn7i8g88fkpl58k8xniw12y6', 'admin::marketplace.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.499000', '2026-04-01 16:32:00.499000', '2026-04-01 16:32:00.499000', NULL, NULL, NULL),
(73, 'qariwncoxjae1brbh7zchdxw', 'admin::webhooks.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.502000', '2026-04-01 16:32:00.502000', '2026-04-01 16:32:00.502000', NULL, NULL, NULL),
(74, 'sm933g7ep8fqubmyofupess4', 'admin::webhooks.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.506000', '2026-04-01 16:32:00.506000', '2026-04-01 16:32:00.506000', NULL, NULL, NULL),
(75, 'qzpipevvrdxe3dbeo53gso8z', 'admin::webhooks.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.510000', '2026-04-01 16:32:00.510000', '2026-04-01 16:32:00.510000', NULL, NULL, NULL),
(76, 'wrcrxtjq29swmx644qkvwv0f', 'admin::webhooks.delete', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.513000', '2026-04-01 16:32:00.513000', '2026-04-01 16:32:00.513000', NULL, NULL, NULL),
(77, 'pl360187gxm46wa2ndk73i61', 'admin::users.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.516000', '2026-04-01 16:32:00.516000', '2026-04-01 16:32:00.516000', NULL, NULL, NULL),
(78, 'mhr27ffd0c34v6p4la4vzcmy', 'admin::users.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.520000', '2026-04-01 16:32:00.520000', '2026-04-01 16:32:00.520000', NULL, NULL, NULL),
(79, 'l39oc7yi2ooe8yolfvggx75n', 'admin::users.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.528000', '2026-04-01 16:32:00.528000', '2026-04-01 16:32:00.528000', NULL, NULL, NULL),
(80, 'ycmivyckp503ib51948yxaon', 'admin::users.delete', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.531000', '2026-04-01 16:32:00.531000', '2026-04-01 16:32:00.531000', NULL, NULL, NULL),
(81, 'wc9pzbpohhl73b8rizvvtine', 'admin::roles.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.535000', '2026-04-01 16:32:00.535000', '2026-04-01 16:32:00.535000', NULL, NULL, NULL),
(82, 'tqffvb5zf4283jwvopg03822', 'admin::roles.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.542000', '2026-04-01 16:32:00.542000', '2026-04-01 16:32:00.542000', NULL, NULL, NULL),
(83, 'z7dzj3y89hopycov2q3orku5', 'admin::roles.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.548000', '2026-04-01 16:32:00.548000', '2026-04-01 16:32:00.548000', NULL, NULL, NULL),
(84, 'g2y5sjp4vqcd385qsmnjni57', 'admin::roles.delete', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.553000', '2026-04-01 16:32:00.553000', '2026-04-01 16:32:00.553000', NULL, NULL, NULL),
(85, 'ibcux3ws8za5yamtvmvh9bwz', 'admin::api-tokens.access', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.558000', '2026-04-01 16:32:00.558000', '2026-04-01 16:32:00.558000', NULL, NULL, NULL),
(86, 'enboimw78jp6t7z106xdigmy', 'admin::api-tokens.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.561000', '2026-04-01 16:32:00.561000', '2026-04-01 16:32:00.561000', NULL, NULL, NULL),
(87, 'er2xldmnorqfgv0ox3b1hn5f', 'admin::api-tokens.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.567000', '2026-04-01 16:32:00.567000', '2026-04-01 16:32:00.568000', NULL, NULL, NULL),
(88, 'peaaxlie2gurx282p1ygv573', 'admin::api-tokens.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.573000', '2026-04-01 16:32:00.573000', '2026-04-01 16:32:00.573000', NULL, NULL, NULL),
(89, 'zu6llxt9kk9s22ij71vzalmz', 'admin::api-tokens.regenerate', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.578000', '2026-04-01 16:32:00.578000', '2026-04-01 16:32:00.579000', NULL, NULL, NULL),
(90, 'r94p8vxd6yzy58lu3ua7m7og', 'admin::api-tokens.delete', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.583000', '2026-04-01 16:32:00.583000', '2026-04-01 16:32:00.583000', NULL, NULL, NULL),
(91, 'yjg1vpj9kws2418wwgeyz3km', 'admin::project-settings.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.590000', '2026-04-01 16:32:00.590000', '2026-04-01 16:32:00.590000', NULL, NULL, NULL),
(92, 'oyiuqdlingg2qfhxixollt0k', 'admin::project-settings.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.595000', '2026-04-01 16:32:00.595000', '2026-04-01 16:32:00.595000', NULL, NULL, NULL),
(93, 'z7fn0ihvc7wqil3u6dwmetil', 'admin::transfer.tokens.access', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.601000', '2026-04-01 16:32:00.601000', '2026-04-01 16:32:00.601000', NULL, NULL, NULL),
(94, 'fe3k1g94gpg4f776eredro4c', 'admin::transfer.tokens.create', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.607000', '2026-04-01 16:32:00.607000', '2026-04-01 16:32:00.608000', NULL, NULL, NULL),
(95, 'zlbqdxzy7huydtixz61op3ra', 'admin::transfer.tokens.read', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.611000', '2026-04-01 16:32:00.611000', '2026-04-01 16:32:00.611000', NULL, NULL, NULL),
(96, 'g0mchdq7gudy0qwx4yewx8wm', 'admin::transfer.tokens.update', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.614000', '2026-04-01 16:32:00.614000', '2026-04-01 16:32:00.614000', NULL, NULL, NULL),
(97, 'mb0la3i5ax3483cxo63dpuiu', 'admin::transfer.tokens.regenerate', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.617000', '2026-04-01 16:32:00.617000', '2026-04-01 16:32:00.617000', NULL, NULL, NULL),
(98, 'o12p9o97wi43na5qt5hrkchm', 'admin::transfer.tokens.delete', '{}', NULL, '{}', '[]', '2026-04-01 16:32:00.620000', '2026-04-01 16:32:00.620000', '2026-04-01 16:32:00.620000', NULL, NULL, NULL),
(99, 'vd2kxsftfwuu5nur66uulxy7', 'plugin::content-manager.explorer.create', '{}', 'api::menu-item.menu-item', '{\"fields\":[\"label\",\"path\",\"order\",\"isActive\",\"openInNewTab\",\"location\"]}', '[]', '2026-04-01 17:21:50.702000', '2026-04-01 17:21:50.702000', '2026-04-01 17:21:50.704000', NULL, NULL, NULL),
(100, 'pp016l3ojh00oyjquj9xogwz', 'plugin::content-manager.explorer.read', '{}', 'api::menu-item.menu-item', '{\"fields\":[\"label\",\"path\",\"order\",\"isActive\",\"openInNewTab\",\"location\"]}', '[]', '2026-04-01 17:21:50.721000', '2026-04-01 17:21:50.721000', '2026-04-01 17:21:50.721000', NULL, NULL, NULL),
(101, 'jkac1n7keecpmszd4d0xlelu', 'plugin::content-manager.explorer.update', '{}', 'api::menu-item.menu-item', '{\"fields\":[\"label\",\"path\",\"order\",\"isActive\",\"openInNewTab\",\"location\"]}', '[]', '2026-04-01 17:21:50.728000', '2026-04-01 17:21:50.728000', '2026-04-01 17:21:50.728000', NULL, NULL, NULL),
(102, 'iqdtrq2b9hium9xttjemx6o8', 'plugin::content-manager.explorer.delete', '{}', 'api::menu-item.menu-item', '{}', '[]', '2026-04-01 17:21:50.742000', '2026-04-01 17:21:50.742000', '2026-04-01 17:21:50.742000', NULL, NULL, NULL),
(103, 'xnfn0dg5nvrpwkh4ji70d0tt', 'plugin::content-manager.explorer.publish', '{}', 'api::menu-item.menu-item', '{}', '[]', '2026-04-01 17:21:50.750000', '2026-04-01 17:21:50.750000', '2026-04-01 17:21:50.750000', NULL, NULL, NULL),
(104, 'wah3367bi6ym2m9g6mpm7qds', 'plugin::content-manager.explorer.create', '{}', 'api::homepage.homepage', '{\"fields\":[\"heroArticles\",\"featured_articles\",\"weekly_top_articles\",\"weekly_top_titles\"]}', '[]', '2026-04-01 18:02:50.068000', '2026-04-01 18:02:50.068000', '2026-04-01 18:02:50.069000', NULL, NULL, NULL),
(105, 'ayl4rr2mtw7tk1t69j8un8fr', 'plugin::content-manager.explorer.read', '{}', 'api::homepage.homepage', '{\"fields\":[\"heroArticles\",\"featured_articles\",\"weekly_top_articles\",\"weekly_top_titles\"]}', '[]', '2026-04-01 18:02:50.120000', '2026-04-01 18:02:50.120000', '2026-04-01 18:02:50.121000', NULL, NULL, NULL),
(106, 'z35zt5sdgtpl7utarrpbtdkp', 'plugin::content-manager.explorer.update', '{}', 'api::homepage.homepage', '{\"fields\":[\"heroArticles\",\"featured_articles\",\"weekly_top_articles\",\"weekly_top_titles\"]}', '[]', '2026-04-01 18:02:50.131000', '2026-04-01 18:02:50.131000', '2026-04-01 18:02:50.131000', NULL, NULL, NULL),
(107, 'y4genaims0bu4ml61mk4ojrj', 'plugin::content-manager.explorer.delete', '{}', 'api::homepage.homepage', '{}', '[]', '2026-04-01 18:02:50.147000', '2026-04-01 18:02:50.147000', '2026-04-01 18:02:50.148000', NULL, NULL, NULL),
(108, 'lc4kuio1hakgu2d5p6x8y5fu', 'plugin::content-manager.explorer.publish', '{}', 'api::homepage.homepage', '{}', '[]', '2026-04-01 18:02:50.168000', '2026-04-01 18:02:50.168000', '2026-04-01 18:02:50.168000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions_role_lnk`
--

CREATE TABLE `admin_permissions_role_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_permissions_role_lnk`
--

INSERT INTO `admin_permissions_role_lnk` (`id`, `permission_id`, `role_id`, `permission_ord`) VALUES
(1, 1, 2, 1),
(2, 2, 2, 2),
(3, 3, 2, 3),
(4, 4, 2, 4),
(5, 5, 2, 5),
(6, 6, 2, 6),
(7, 7, 2, 7),
(8, 8, 2, 8),
(9, 9, 2, 9),
(10, 10, 2, 10),
(11, 11, 2, 11),
(12, 12, 2, 12),
(13, 13, 2, 13),
(14, 14, 2, 14),
(15, 15, 2, 15),
(16, 16, 2, 16),
(17, 17, 3, 1),
(18, 18, 3, 2),
(19, 19, 3, 3),
(20, 20, 3, 4),
(21, 21, 3, 5),
(22, 22, 3, 6),
(23, 23, 3, 7),
(24, 24, 3, 8),
(25, 25, 3, 9),
(26, 26, 3, 10),
(27, 27, 3, 11),
(28, 28, 3, 12),
(29, 29, 3, 13),
(30, 30, 3, 14),
(31, 31, 1, 1),
(32, 32, 1, 2),
(33, 33, 1, 3),
(34, 34, 1, 4),
(35, 35, 1, 5),
(36, 36, 1, 6),
(37, 37, 1, 7),
(38, 38, 1, 8),
(39, 39, 1, 9),
(40, 40, 1, 10),
(41, 41, 1, 11),
(42, 42, 1, 12),
(43, 43, 1, 13),
(44, 44, 1, 14),
(45, 45, 1, 15),
(46, 46, 1, 16),
(47, 47, 1, 17),
(48, 48, 1, 18),
(49, 49, 1, 19),
(50, 50, 1, 20),
(51, 51, 1, 21),
(52, 52, 1, 22),
(53, 53, 1, 23),
(54, 54, 1, 24),
(55, 55, 1, 25),
(56, 56, 1, 26),
(57, 57, 1, 27),
(58, 58, 1, 28),
(59, 59, 1, 29),
(60, 60, 1, 30),
(61, 61, 1, 31),
(62, 62, 1, 32),
(63, 63, 1, 33),
(64, 64, 1, 34),
(65, 65, 1, 35),
(66, 66, 1, 36),
(67, 67, 1, 37),
(68, 68, 1, 38),
(69, 69, 1, 39),
(70, 70, 1, 40),
(71, 71, 1, 41),
(72, 72, 1, 42),
(73, 73, 1, 43),
(74, 74, 1, 44),
(75, 75, 1, 45),
(76, 76, 1, 46),
(77, 77, 1, 47),
(78, 78, 1, 48),
(79, 79, 1, 49),
(80, 80, 1, 50),
(81, 81, 1, 51),
(82, 82, 1, 52),
(83, 83, 1, 53),
(84, 84, 1, 54),
(85, 85, 1, 55),
(86, 86, 1, 56),
(87, 87, 1, 57),
(88, 88, 1, 58),
(89, 89, 1, 59),
(90, 90, 1, 60),
(91, 91, 1, 61),
(92, 92, 1, 62),
(93, 93, 1, 63),
(94, 94, 1, 64),
(95, 95, 1, 65),
(96, 96, 1, 66),
(97, 97, 1, 67),
(98, 98, 1, 68),
(99, 99, 1, 69),
(100, 100, 1, 70),
(101, 101, 1, 71),
(102, 102, 1, 72),
(103, 103, 1, 73),
(104, 104, 1, 74),
(105, 105, 1, 75),
(106, 106, 1, 76),
(107, 107, 1, 77),
(108, 108, 1, 78);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `document_id`, `name`, `code`, `description`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'xgq7ec1u7qmrhxyg5shns9ht', 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2026-04-01 16:32:00.103000', '2026-04-01 16:32:00.103000', '2026-04-01 16:32:00.103000', NULL, NULL, NULL),
(2, 'fn5qetifgjzq2hegbnr1phjf', 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2026-04-01 16:32:00.111000', '2026-04-01 16:32:00.111000', '2026-04-01 16:32:00.111000', NULL, NULL, NULL),
(3, 'i7role2sr3i5h3yhlku6t6og', 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2026-04-01 16:32:00.116000', '2026-04-01 16:32:00.116000', '2026-04-01 16:32:00.116000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `document_id`, `firstname`, `lastname`, `username`, `email`, `password`, `reset_password_token`, `registration_token`, `is_active`, `blocked`, `prefered_language`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'it7xh8xief7unhn0r1aueg5k', 'Zain', 'Azeem', NULL, 'zainazeem2010@gmail.com', '$2a$10$BitoyMUTuu/7IJy.qoIh7.PswPppnNf85sz0ucNKdSyyt8VUvWcc6', NULL, NULL, 1, 0, NULL, '2026-04-01 16:36:21.446000', '2026-04-01 18:33:28.760000', '2026-04-01 16:36:21.447000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users_roles_lnk`
--

CREATE TABLE `admin_users_roles_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `role_ord` double UNSIGNED DEFAULT NULL,
  `user_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users_roles_lnk`
--

INSERT INTO `admin_users_roles_lnk` (`id`, `user_id`, `role_id`, `role_ord`, `user_ord`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `excerpt` longtext DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `author` varchar(255) DEFAULT NULL,
  `published` date DEFAULT NULL,
  `read_time` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `document_id`, `title`, `slug`, `excerpt`, `content`, `author`, `published`, `read_time`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'y8wwor2mmzod1ollb6zd4eif', 'Meta launches prescription-ready Ray-Ban smart glasses, expanding AI wearables strategy', 'meta-launches-prescription-ready-ray-ban-smart-glasses', 'Meta Platforms unveiled two new AI-powered Ray-Ban smart glasses designed specifically for prescription users', '[{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"Meta Platforms launches two new Ray-Ban smart glasses for prescription users\"}]}]},{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"Starting price set at $499, with availability from April 14 in select markets\"}]}]},{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"New designs focus on all-day comfort and personalized fit\"}]}]},{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"Added AI features include hands-free nutrition tracking and contextual assistance\"}]}]},{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"Move strengthens Meta’s lead in the fast-growing smart glasses market amid rising competition\"}]}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Meta Platforms unveiled two new AI-powered Ray-Ban smart glasses designed specifically for prescription users, marking a deeper push into one of the few consumer hardware categories where artificial intelligence is gaining real traction.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Developed in partnership with EssilorLuxottica, the new models, Ray-Ban Meta Blayzer Optics and Ray-Ban Meta Scriber Optics, will be available for pre-order in the U.S. starting at $499, with retail availability beginning April 14 across select international markets.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The launch targets a massive global audience. As CEO Mark Zuckerberg has emphasized, billions of people rely on corrective eyewear, making prescription-compatible smart glasses a key opportunity to bring AI into everyday life.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Designed for everyday use\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Unlike earlier versions that required add-on prescription lenses, the new glasses are built to support a wide range of prescriptions from the outset. Meta says the designs prioritize comfort and adaptability, featuring flexible overextension hinges, interchangeable nose pads, and optician-adjustable temple tips for a customized fit.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The Blayzer model offers a rectangular frame in standard and large sizes, while the Scriber features a more rounded style—both aimed at making smart glasses suitable for continuous, all-day wear.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"AI moves closer to daily routines\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Meta is also expanding AI functionality within its wearable ecosystem. A new feature enables hands-free nutrition tracking, allowing users to log meals via voice commands or quick photos. Meta AI then extracts key nutritional details and builds a personalized food log over time, offering insights to support healthier choices.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"These updates reflect Meta’s broader goal of embedding AI into routine activities, reducing reliance on smartphones and making interactions more seamless.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"A competitive and growing market\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Smart glasses are rapidly becoming a focal point in the race to commercialize AI hardware. Global shipments reached an estimated 9.6 million units last year, with Meta holding a dominant share of over 75%. That number is expected to grow significantly in the coming years.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"At the same time, competition is intensifying. Snap is preparing its own consumer-ready augmented reality glasses, while Google has partnered with Warby Parker to develop AI-powered eyewear solutions.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Betting big on personal AI\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The new release forms part of Meta’s long-term investment in what Zuckerberg has described as “personal superintelligence,” where AI-powered devices provide real-time, personalized assistance. The company is reportedly committing hundreds of billions of dollars toward this vision.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"By focusing on prescription-ready designs, Meta is aiming to turn smart glasses from a niche product into a mainstream necessity—potentially establishing them as one of the primary interfaces for interacting with AI in everyday life.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 16:56:50.493000', '2026-04-01 17:08:43.536000', NULL, 1, 1, NULL),
(4, 'y8wwor2mmzod1ollb6zd4eif', 'Meta launches prescription-ready Ray-Ban smart glasses, expanding AI wearables strategy', 'meta-launches-prescription-ready-ray-ban-smart-glasses', 'Meta Platforms unveiled two new AI-powered Ray-Ban smart glasses designed specifically for prescription users', '[{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"Meta Platforms launches two new Ray-Ban smart glasses for prescription users\"}]}]},{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"Starting price set at $499, with availability from April 14 in select markets\"}]}]},{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"New designs focus on all-day comfort and personalized fit\"}]}]},{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"Added AI features include hands-free nutrition tracking and contextual assistance\"}]}]},{\"type\":\"list\",\"format\":\"unordered\",\"children\":[{\"type\":\"list-item\",\"children\":[{\"type\":\"text\",\"text\":\"Move strengthens Meta’s lead in the fast-growing smart glasses market amid rising competition\"}]}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Meta Platforms unveiled two new AI-powered Ray-Ban smart glasses designed specifically for prescription users, marking a deeper push into one of the few consumer hardware categories where artificial intelligence is gaining real traction.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Developed in partnership with EssilorLuxottica, the new models, Ray-Ban Meta Blayzer Optics and Ray-Ban Meta Scriber Optics, will be available for pre-order in the U.S. starting at $499, with retail availability beginning April 14 across select international markets.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The launch targets a massive global audience. As CEO Mark Zuckerberg has emphasized, billions of people rely on corrective eyewear, making prescription-compatible smart glasses a key opportunity to bring AI into everyday life.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Designed for everyday use\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Unlike earlier versions that required add-on prescription lenses, the new glasses are built to support a wide range of prescriptions from the outset. Meta says the designs prioritize comfort and adaptability, featuring flexible overextension hinges, interchangeable nose pads, and optician-adjustable temple tips for a customized fit.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The Blayzer model offers a rectangular frame in standard and large sizes, while the Scriber features a more rounded style—both aimed at making smart glasses suitable for continuous, all-day wear.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"AI moves closer to daily routines\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Meta is also expanding AI functionality within its wearable ecosystem. A new feature enables hands-free nutrition tracking, allowing users to log meals via voice commands or quick photos. Meta AI then extracts key nutritional details and builds a personalized food log over time, offering insights to support healthier choices.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"These updates reflect Meta’s broader goal of embedding AI into routine activities, reducing reliance on smartphones and making interactions more seamless.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"A competitive and growing market\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Smart glasses are rapidly becoming a focal point in the race to commercialize AI hardware. Global shipments reached an estimated 9.6 million units last year, with Meta holding a dominant share of over 75%. That number is expected to grow significantly in the coming years.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"At the same time, competition is intensifying. Snap is preparing its own consumer-ready augmented reality glasses, while Google has partnered with Warby Parker to develop AI-powered eyewear solutions.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Betting big on personal AI\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The new release forms part of Meta’s long-term investment in what Zuckerberg has described as “personal superintelligence,” where AI-powered devices provide real-time, personalized assistance. The company is reportedly committing hundreds of billions of dollars toward this vision.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"By focusing on prescription-ready designs, Meta is aiming to turn smart glasses from a niche product into a mainstream necessity—potentially establishing them as one of the primary interfaces for interacting with AI in everyday life.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 16:56:50.493000', '2026-04-01 17:08:43.536000', '2026-04-01 17:08:43.575000', 1, 1, NULL),
(5, 'u4x4goi42rlgsadeas34s48m', 'Ethical AI in Daily Life: How Algorithms Influence Human Decisions and Judgment', 'how-algorithms-influence-human-decisions-and-judgment', 'AI is no longer a futuristic concept; it quietly shapes countless decisions in our daily lives. From the news ', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"AI is no longer a futuristic concept; it quietly shapes countless decisions in our daily lives. From the news we read and the products we buy to hiring decisions and medical recommendations, AI algorithms are influencing choices we once believed were entirely human. While these systems can enhance efficiency and personalization, their rise also raises critical questions: Are we outsourcing our judgment to machines, and what ethical risks does this pose?\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"The Invisible Hand of AI\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Most people interact with AI daily without realizing it. Social media feeds, video streaming recommendations, online shopping suggestions, and even navigation apps are powered by complex algorithms designed to predict our preferences. In healthcare, AI can suggest treatment plans or flag potential diagnoses; in finance, algorithms can influence investment decisions or credit scoring; in hiring, AI may shortlist candidates based on resumes.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"While these systems offer convenience, they also wield subtle influence. For example, an algorithmically curated news feed can reinforce biases by showing content that aligns with a user’s existing beliefs. Hiring AI tools may unintentionally favor candidates with specific educational or demographic profiles, reflecting biases in the training data. Even seemingly neutral recommendations can nudge human behavior in ways that go unnoticed.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Human Oversight and Responsibility\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The ethical challenge arises when humans begin to rely too heavily on AI outputs, assuming machine judgment is objective and flawless. This over-reliance can erode critical thinking and reduce accountability. Instances where AI decisions have caused harm are increasing—from healthcare misdiagnoses to unfair credit scoring and biased hiring practices—demonstrating that machines, no matter how sophisticated, cannot replace human discernment.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Maintaining human oversight is essential. Decision-makers must understand the limitations of AI, question its outputs, and remain accountable for final decisions. Ethical reasoning, empathy, and context-aware judgment are uniquely human qualities that algorithms cannot replicate. When AI is treated as a partner rather than an authority, it can augment rather than replace human decision-making.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Building Ethical AI for Everyday Life\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Developers and organizations play a central role in ensuring AI benefits society without compromising human agency. Transparent and explainable AI systems allow users to understand why specific recommendations are made. Regular audits for bias, fairness, and accuracy help prevent harmful outcomes. Moreover, designing AI to support human choice rather than dictate it can empower users while retaining accountability.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"For individuals, the key is awareness. Understanding that AI suggestions are tools, not instructions, enables people to critically evaluate outcomes and make informed choices. Combining human judgment with algorithmic insights can enhance both efficiency and ethical responsibility.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"The Human-AI Partnership\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"AI has immense potential to improve our daily lives, but it must remain a tool that complements, rather than replaces, human judgment. By consciously integrating human oversight, ethical safeguards, and transparency, we can harness AI to make better decisions while preserving our autonomy. In the end, the future of AI is not about machines making decisions for us—it’s about humans and machines collaborating thoughtfully to shape a fairer, more informed society.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 17:35:04.639000', '2026-04-01 17:35:04.639000', NULL, 1, 1, NULL),
(6, 'u4x4goi42rlgsadeas34s48m', 'Ethical AI in Daily Life: How Algorithms Influence Human Decisions and Judgment', 'how-algorithms-influence-human-decisions-and-judgment', 'AI is no longer a futuristic concept; it quietly shapes countless decisions in our daily lives. From the news ', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"AI is no longer a futuristic concept; it quietly shapes countless decisions in our daily lives. From the news we read and the products we buy to hiring decisions and medical recommendations, AI algorithms are influencing choices we once believed were entirely human. While these systems can enhance efficiency and personalization, their rise also raises critical questions: Are we outsourcing our judgment to machines, and what ethical risks does this pose?\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"The Invisible Hand of AI\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Most people interact with AI daily without realizing it. Social media feeds, video streaming recommendations, online shopping suggestions, and even navigation apps are powered by complex algorithms designed to predict our preferences. In healthcare, AI can suggest treatment plans or flag potential diagnoses; in finance, algorithms can influence investment decisions or credit scoring; in hiring, AI may shortlist candidates based on resumes.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"While these systems offer convenience, they also wield subtle influence. For example, an algorithmically curated news feed can reinforce biases by showing content that aligns with a user’s existing beliefs. Hiring AI tools may unintentionally favor candidates with specific educational or demographic profiles, reflecting biases in the training data. Even seemingly neutral recommendations can nudge human behavior in ways that go unnoticed.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Human Oversight and Responsibility\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The ethical challenge arises when humans begin to rely too heavily on AI outputs, assuming machine judgment is objective and flawless. This over-reliance can erode critical thinking and reduce accountability. Instances where AI decisions have caused harm are increasing—from healthcare misdiagnoses to unfair credit scoring and biased hiring practices—demonstrating that machines, no matter how sophisticated, cannot replace human discernment.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Maintaining human oversight is essential. Decision-makers must understand the limitations of AI, question its outputs, and remain accountable for final decisions. Ethical reasoning, empathy, and context-aware judgment are uniquely human qualities that algorithms cannot replicate. When AI is treated as a partner rather than an authority, it can augment rather than replace human decision-making.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Building Ethical AI for Everyday Life\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Developers and organizations play a central role in ensuring AI benefits society without compromising human agency. Transparent and explainable AI systems allow users to understand why specific recommendations are made. Regular audits for bias, fairness, and accuracy help prevent harmful outcomes. Moreover, designing AI to support human choice rather than dictate it can empower users while retaining accountability.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"For individuals, the key is awareness. Understanding that AI suggestions are tools, not instructions, enables people to critically evaluate outcomes and make informed choices. Combining human judgment with algorithmic insights can enhance both efficiency and ethical responsibility.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"The Human-AI Partnership\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"AI has immense potential to improve our daily lives, but it must remain a tool that complements, rather than replaces, human judgment. By consciously integrating human oversight, ethical safeguards, and transparency, we can harness AI to make better decisions while preserving our autonomy. In the end, the future of AI is not about machines making decisions for us—it’s about humans and machines collaborating thoughtfully to shape a fairer, more informed society.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 17:35:04.639000', '2026-04-01 17:35:04.639000', '2026-04-01 17:35:04.705000', 1, 1, NULL),
(7, 'nszeoje4upv5sq3ax7x8tyxm', 'YouTube tests AI summaries in place of video titles, raising concerns among creators', 'youtube-tests-ai-summaries-in-place-of-video-titles', 'YouTube is experimenting with a new AI-driven feature that replaces traditional video title', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"YouTube is experimenting with a new AI-driven feature that replaces traditional video titles with automatically generated summaries, a move that could significantly reshape how users discover content and how creators present it.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The test, currently limited to the Android app, shows video thumbnails without titles. Instead, users see expandable AI-written summaries beneath each video. To understand what a video is about, viewers must tap to reveal the description, adding an extra step to the browsing experience.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The feature reflects a broader push by parent company Google to integrate generative AI across its platforms. But it also introduces new tensions between automation and creator control.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"A shift away from creator-defined metadata\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Video titles have long been one of the most important elements on YouTube. They influence search rankings, drive click-through rates, and convey a creator’s tone, intent, and branding. Replacing them with AI-generated summaries effectively removes a layer of control from creators, handing interpretation of their content to an algorithm.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"For creators and marketers, this raises immediate concerns. AI summaries may not accurately reflect a video’s content, tone, or target keywords, potentially affecting discoverability and performance. Subtle shifts in wording could also alter meaning, especially in nuanced or specialized topics.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"A broader pattern across Google products\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The YouTube test aligns with similar experiments in Google Search, where the company has confirmed a “small” and “narrow” rollout of AI-generated headline rewrites. In those cases, original page titles are replaced or modified to better match user queries and improve engagement.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"However, early examples have shown that these rewrites can shorten or rephrase headlines in ways that change tone or intent. Extending this approach to YouTube suggests a wider strategy: using AI to reinterpret content presentation across platforms, rather than relying solely on creator-provided metadata.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"User experience trade-offs\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Initial feedback from users indicates that the change may introduce friction rather than reduce it. Requiring users to expand summaries slows down content discovery, particularly in a feed designed for quick browsing and engagement.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"This creates a paradox. While AI summaries aim to provide more context, they may make it harder for users to scan and decide what to watch—an outcome that runs counter to YouTube’s traditionally fast, scroll-based experience.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"What comes next\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"There is no official confirmation of a broader rollout, and it remains unclear whether the missing titles are part of a deliberate test or a temporary bug. Still, the feature fits squarely within Google’s ongoing investment in generative AI, suggesting that similar experiments are likely to continue.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"If expanded, the change could redefine how content is surfaced and evaluated on YouTube, shifting influence from creators toward AI systems that interpret and summarize their work. For now, the test offers an early glimpse into a future where algorithms not only rank content, but also decide how it is described to the world.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 18:37:31.611000', '2026-04-01 18:37:31.611000', NULL, 1, 1, NULL),
(8, 'nszeoje4upv5sq3ax7x8tyxm', 'YouTube tests AI summaries in place of video titles, raising concerns among creators', 'youtube-tests-ai-summaries-in-place-of-video-titles', 'YouTube is experimenting with a new AI-driven feature that replaces traditional video title', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"YouTube is experimenting with a new AI-driven feature that replaces traditional video titles with automatically generated summaries, a move that could significantly reshape how users discover content and how creators present it.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The test, currently limited to the Android app, shows video thumbnails without titles. Instead, users see expandable AI-written summaries beneath each video. To understand what a video is about, viewers must tap to reveal the description, adding an extra step to the browsing experience.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The feature reflects a broader push by parent company Google to integrate generative AI across its platforms. But it also introduces new tensions between automation and creator control.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"A shift away from creator-defined metadata\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Video titles have long been one of the most important elements on YouTube. They influence search rankings, drive click-through rates, and convey a creator’s tone, intent, and branding. Replacing them with AI-generated summaries effectively removes a layer of control from creators, handing interpretation of their content to an algorithm.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"For creators and marketers, this raises immediate concerns. AI summaries may not accurately reflect a video’s content, tone, or target keywords, potentially affecting discoverability and performance. Subtle shifts in wording could also alter meaning, especially in nuanced or specialized topics.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"A broader pattern across Google products\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The YouTube test aligns with similar experiments in Google Search, where the company has confirmed a “small” and “narrow” rollout of AI-generated headline rewrites. In those cases, original page titles are replaced or modified to better match user queries and improve engagement.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"However, early examples have shown that these rewrites can shorten or rephrase headlines in ways that change tone or intent. Extending this approach to YouTube suggests a wider strategy: using AI to reinterpret content presentation across platforms, rather than relying solely on creator-provided metadata.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"User experience trade-offs\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Initial feedback from users indicates that the change may introduce friction rather than reduce it. Requiring users to expand summaries slows down content discovery, particularly in a feed designed for quick browsing and engagement.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"This creates a paradox. While AI summaries aim to provide more context, they may make it harder for users to scan and decide what to watch—an outcome that runs counter to YouTube’s traditionally fast, scroll-based experience.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"What comes next\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"There is no official confirmation of a broader rollout, and it remains unclear whether the missing titles are part of a deliberate test or a temporary bug. Still, the feature fits squarely within Google’s ongoing investment in generative AI, suggesting that similar experiments are likely to continue.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"If expanded, the change could redefine how content is surfaced and evaluated on YouTube, shifting influence from creators toward AI systems that interpret and summarize their work. For now, the test offers an early glimpse into a future where algorithms not only rank content, but also decide how it is described to the world.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 18:37:31.611000', '2026-04-01 18:37:31.611000', '2026-04-01 18:37:31.652000', 1, 1, NULL),
(9, 'fc9gqgcuodqp1cke0n8s2isr', 'Microsoft expands Copilot with multi-model AI and Cowork agent to boost productivity', 'microsoft-expands-copilot-with-multi-model-ai', 'Microsoft on Monday unveiled significant upgrades to its Copilot research assistant', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Microsoft on Monday unveiled significant upgrades to its Copilot research assistant, introducing multi-model AI integration and expanded workflow automation capabilities. The new features aim to accelerate adoption, improve output reliability, and streamline enterprise productivity.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"A standout addition is a feature called “Critique,” which allows Copilot’s Researcher agent to pull outputs from both GPT and Claude simultaneously. In this setup, GPT generates initial responses while Claude reviews them for accuracy and quality before presenting the results to users. Microsoft said it plans to make this workflow bi-directional in the future, allowing GPT to evaluate Claude’s drafts as well.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The multi-model setup is designed to reduce AI hallucinations, where systems generate inaccurate information, while improving workflow speed and output quality, enhancing productivity for enterprise users. Microsoft is also launching “Model Council,” a feature that lets users compare outputs from multiple AI models side by side.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Alongside Critique, Microsoft is expanding access to Copilot Cowork, an agentic AI workflow tool based on Anthropic’s Claude Cowork. Initially launched in January, Cowork enables users to automate tasks and orchestrate workflows across business domains such as marketing, legal, and data analysis. Copilot Cowork now becomes available to a broader set of customers through Microsoft’s Frontier program, which provides early access to new AI features.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Jared Spataro, Microsoft’s chief marketing officer for AI at Work, explained that Copilot Cowork comes with built-in “skills”, essentially plugins for automating specific tasks.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Early testing indicates that Cowork integration improves internal adoption of Copilot and boosts productivity. Barton Warner, SVP of enterprise technology at Capital Group, confirmed that Claude Cowork has enabled the firm to automate a range of tasks, streamlining operations and supporting team efficiency.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Microsoft’s upgrades come amid intensifying competition in enterprise AI. Rivals such as Google with its Gemini AI and autonomous agents like Claude Cowork are vying for adoption in corporate workflows. By enabling multi-model collaboration and wider access to agentic AI, Microsoft positions Copilot as a more versatile and reliable assistant for enterprises seeking to scale productivity with AI.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The updates mark another step in Microsoft’s strategy to make AI tools central to workplace operations, combining multiple models, automation capabilities, and user-friendly workflows to transform how businesses leverage artificial intelligence.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 18:40:37.921000', '2026-04-01 18:40:37.921000', NULL, 1, 1, NULL),
(10, 'fc9gqgcuodqp1cke0n8s2isr', 'Microsoft expands Copilot with multi-model AI and Cowork agent to boost productivity', 'microsoft-expands-copilot-with-multi-model-ai', 'Microsoft on Monday unveiled significant upgrades to its Copilot research assistant', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Microsoft on Monday unveiled significant upgrades to its Copilot research assistant, introducing multi-model AI integration and expanded workflow automation capabilities. The new features aim to accelerate adoption, improve output reliability, and streamline enterprise productivity.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"A standout addition is a feature called “Critique,” which allows Copilot’s Researcher agent to pull outputs from both GPT and Claude simultaneously. In this setup, GPT generates initial responses while Claude reviews them for accuracy and quality before presenting the results to users. Microsoft said it plans to make this workflow bi-directional in the future, allowing GPT to evaluate Claude’s drafts as well.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The multi-model setup is designed to reduce AI hallucinations, where systems generate inaccurate information, while improving workflow speed and output quality, enhancing productivity for enterprise users. Microsoft is also launching “Model Council,” a feature that lets users compare outputs from multiple AI models side by side.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Alongside Critique, Microsoft is expanding access to Copilot Cowork, an agentic AI workflow tool based on Anthropic’s Claude Cowork. Initially launched in January, Cowork enables users to automate tasks and orchestrate workflows across business domains such as marketing, legal, and data analysis. Copilot Cowork now becomes available to a broader set of customers through Microsoft’s Frontier program, which provides early access to new AI features.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Jared Spataro, Microsoft’s chief marketing officer for AI at Work, explained that Copilot Cowork comes with built-in “skills”, essentially plugins for automating specific tasks.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Early testing indicates that Cowork integration improves internal adoption of Copilot and boosts productivity. Barton Warner, SVP of enterprise technology at Capital Group, confirmed that Claude Cowork has enabled the firm to automate a range of tasks, streamlining operations and supporting team efficiency.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Microsoft’s upgrades come amid intensifying competition in enterprise AI. Rivals such as Google with its Gemini AI and autonomous agents like Claude Cowork are vying for adoption in corporate workflows. By enabling multi-model collaboration and wider access to agentic AI, Microsoft positions Copilot as a more versatile and reliable assistant for enterprises seeking to scale productivity with AI.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The updates mark another step in Microsoft’s strategy to make AI tools central to workplace operations, combining multiple models, automation capabilities, and user-friendly workflows to transform how businesses leverage artificial intelligence.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 18:40:37.921000', '2026-04-01 18:40:37.921000', '2026-04-01 18:40:37.954000', 1, 1, NULL),
(11, 'lnmwkt73czkq8qg65cky6cr4', 'Mantis Biotech turns synthetic “digital twins” into the future of biomedical research', 'mantis-biotech-turns-synthetic', 'Large language models (LLMs) have shown enormous promise in healthcare', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Large language models (LLMs) have shown enormous promise in healthcare—accelerating genomics research, streamlining clinical documentation, supporting real-time diagnostics, and even aiding drug discovery. Yet despite their capabilities, these models often struggle in edge cases, such as rare diseases or unusual conditions, where structured, representative data is scarce.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Enter Mantis Biotech, a company developing synthetic datasets designed to fill these gaps. Its platform integrates disparate sources—textbooks, motion-capture cameras, biometric sensors, training logs, and medical imaging—to create high-fidelity “digital twins” of human anatomy, physiology, and behavior. These virtual humans can then be used for predictive modeling, simulations, and analysis, opening new possibilities in biomedical research.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Mantis CEO Georgia Witchel explained in a recent interview:\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"“We’re able to take all these disparate data sources and then turn them into predictive models for how people are going to perform. So anytime you want to predict how a human being is going to be performing, that is a really good use case for our technology.”\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The company’s platform uses an LLM-based system to validate and route incoming data, then runs it through a physics engine to generate realistic synthetic representations. This physics layer is crucial: it ensures that generated data is not just plausible, but grounded in the real-world mechanics of anatomy. As Witchel notes, this allows Mantis to model scenarios that would be difficult or impossible to capture with traditional datasets.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Currently, the platform has found traction in professional sports, helping teams monitor and predict athlete performance. One NBA team, for example, uses digital twins to track players’ jumps over time, correlating metrics with sleep, training, and arm movements to identify trends and prevent injury. Beyond sports, Mantis sees wide-ranging applications in biomedical research, particularly for rare diseases and edge cases where data is ethically or logistically difficult to obtain.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Witchel emphasizes the ethical advantage of digital twins: virtual humans allow experimentation without compromising patient privacy.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Mantis recently raised $7.4 million in seed funding led by Decibel VC, with support from Y Combinator, angel investors, and Liquid 2. The startup plans to expand its team, build out the platform, and target preventative healthcare, while also serving pharmaceutical labs and researchers running FDA trials.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"By turning fragmented, hard-to-access data into realistic synthetic models, Mantis Biotech is demonstrating how digital twins could transform biomedical research—making predictive modeling, experimentation, and insights possible even where real-world data is limited or unavailable.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 18:43:26.361000', '2026-04-01 18:43:26.361000', NULL, 1, 1, NULL),
(12, 'lnmwkt73czkq8qg65cky6cr4', 'Mantis Biotech turns synthetic “digital twins” into the future of biomedical research', 'mantis-biotech-turns-synthetic', 'Large language models (LLMs) have shown enormous promise in healthcare', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Large language models (LLMs) have shown enormous promise in healthcare—accelerating genomics research, streamlining clinical documentation, supporting real-time diagnostics, and even aiding drug discovery. Yet despite their capabilities, these models often struggle in edge cases, such as rare diseases or unusual conditions, where structured, representative data is scarce.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Enter Mantis Biotech, a company developing synthetic datasets designed to fill these gaps. Its platform integrates disparate sources—textbooks, motion-capture cameras, biometric sensors, training logs, and medical imaging—to create high-fidelity “digital twins” of human anatomy, physiology, and behavior. These virtual humans can then be used for predictive modeling, simulations, and analysis, opening new possibilities in biomedical research.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Mantis CEO Georgia Witchel explained in a recent interview:\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"“We’re able to take all these disparate data sources and then turn them into predictive models for how people are going to perform. So anytime you want to predict how a human being is going to be performing, that is a really good use case for our technology.”\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The company’s platform uses an LLM-based system to validate and route incoming data, then runs it through a physics engine to generate realistic synthetic representations. This physics layer is crucial: it ensures that generated data is not just plausible, but grounded in the real-world mechanics of anatomy. As Witchel notes, this allows Mantis to model scenarios that would be difficult or impossible to capture with traditional datasets.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Currently, the platform has found traction in professional sports, helping teams monitor and predict athlete performance. One NBA team, for example, uses digital twins to track players’ jumps over time, correlating metrics with sleep, training, and arm movements to identify trends and prevent injury. Beyond sports, Mantis sees wide-ranging applications in biomedical research, particularly for rare diseases and edge cases where data is ethically or logistically difficult to obtain.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Witchel emphasizes the ethical advantage of digital twins: virtual humans allow experimentation without compromising patient privacy.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Mantis recently raised $7.4 million in seed funding led by Decibel VC, with support from Y Combinator, angel investors, and Liquid 2. The startup plans to expand its team, build out the platform, and target preventative healthcare, while also serving pharmaceutical labs and researchers running FDA trials.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"By turning fragmented, hard-to-access data into realistic synthetic models, Mantis Biotech is demonstrating how digital twins could transform biomedical research—making predictive modeling, experimentation, and insights possible even where real-world data is limited or unavailable.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 18:43:26.361000', '2026-04-01 18:43:26.361000', '2026-04-01 18:43:26.391000', 1, 1, NULL);
INSERT INTO `articles` (`id`, `document_id`, `title`, `slug`, `excerpt`, `content`, `author`, `published`, `read_time`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(13, 'l2fqm4a6a5nz7dbzftwdp0sy', 'JPMorgan ties AI use to performance, signaling a shift in workplace expectations', 'jpmorgan-ties-ai-use-to-performance', 'Banking giant JPMorgan Chase is pushing artificial intelligence from optional tool ', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Banking giant JPMorgan Chase is pushing artificial intelligence from optional tool to core workplace requirement, asking its roughly 65,000 engineers and technologists to integrate AI into their daily workflows. The move reflects a broader shift across industries, where AI is no longer experimental but increasingly embedded in how work gets done—and evaluated.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"According to reporting, the bank is not only encouraging employees to use tools like ChatGPT and Claude Code, but also tracking how often they do so. Internal systems categorize workers based on usage, labeling them as “light,” “heavy,” or even “non” users metrics that may ultimately influence performance reviews.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Internal documents suggest this shift is being formalized at scale. Software and security engineers are now expected to “drive excellence” by adopting AI and “contributing to initiatives that improve productivity, speed, scalability, and impact.” In practical terms, this means demonstrating measurable gains in output through AI-assisted workflows.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"One goal outlined by HR reads:\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\" “Demonstrate measurable improvement in code quality, speed and productivity through regular use of approved AI coding assist tools, contributing to the team\'s overall efficiency targets.”\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"From optional tool to baseline skill\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"JPMorgan’s approach stands out not because it uses AI—many banks already deploy it in fraud detection and risk analysis—but because it is embedding AI usage into everyday expectations for employees.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Across corporate environments, AI adoption has often been uneven. Some teams experiment heavily, while others continue relying on traditional workflows. By tying AI use to performance metrics, JPMorgan is attempting to standardize adoption and avoid the common pitfall of underutilized enterprise tools.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"This also signals a deeper shift in how productivity is defined. Historically, performance reviews focused on outcomes—accuracy, speed, and output quality. Now, how those outcomes are achieved is becoming just as important. AI literacy is emerging as a baseline skill, much like spreadsheets or coding proficiency in earlier decades.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Efficiency gains and new pressures\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The bank’s strategy raises a fundamental question for the modern workplace: if AI reduces the time needed for routine tasks, should employees be expected to produce more within the same timeframe?\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Some employees are already feeling that pressure. One developer told Business Insider, “There\'s a lot of anxiety in the environment right now,” pointing to concerns that those who do not actively use AI tools may be perceived as underperforming.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Managers, according to employees, are increasingly emphasizing that access to AI tools should translate into visible productivity gains. In some cases, dashboards track tool usage at a granular level, reinforcing expectations around adoption.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"While several engineers acknowledged that AI tools are helpful, particularly for coding, documentation, and presentations, the added layer of monitoring introduces a new dynamic. The challenge is no longer just doing the work, but demonstrating that AI is part of how the work gets done.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Balancing innovation with oversight\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"For a highly regulated industry like banking, expanding AI use also introduces new risks. Tools such as ChatGPT and Claude can generate summaries or draft content quickly, but they are not infallible. Errors, omissions, or hallucinations can carry serious consequences in client-facing or decision-critical contexts.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"JPMorgan has already developed internal controls for AI in areas like trading and risk management. Extending AI use across a broader workforce will likely require similar safeguards, ensuring that efficiency gains do not come at the expense of accuracy or compliance.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"This creates a delicate balance: encouraging widespread AI adoption while maintaining rigorous oversight.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"A model for the future of work?\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"JPMorgan is one of the largest technology spenders on Wall Street, with projected investments nearing $20 billion by 2026. Its approach to AI adoption is likely to be closely watched by other financial institutions and large enterprises.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"If linking AI use to performance results in measurable productivity gains, similar frameworks could spread quickly. Beyond banking, companies like Meta and Google are already encouraging employees to integrate AI into their workflows, signaling a broader cultural shift.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"What emerges is a new model of work where AI is not just a tool, but an expectation. Skills such as prompt design, output verification, and AI-assisted problem-solving may soon become standard job requirements.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"JPMorgan’s strategy suggests that this transition is already underway and that the definition of a high-performing employee is being quietly rewritten in the age of AI.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 18:47:44.089000', '2026-04-01 18:47:44.089000', NULL, 1, 1, NULL),
(14, 'l2fqm4a6a5nz7dbzftwdp0sy', 'JPMorgan ties AI use to performance, signaling a shift in workplace expectations', 'jpmorgan-ties-ai-use-to-performance', 'Banking giant JPMorgan Chase is pushing artificial intelligence from optional tool ', '[{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Banking giant JPMorgan Chase is pushing artificial intelligence from optional tool to core workplace requirement, asking its roughly 65,000 engineers and technologists to integrate AI into their daily workflows. The move reflects a broader shift across industries, where AI is no longer experimental but increasingly embedded in how work gets done—and evaluated.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"According to reporting, the bank is not only encouraging employees to use tools like ChatGPT and Claude Code, but also tracking how often they do so. Internal systems categorize workers based on usage, labeling them as “light,” “heavy,” or even “non” users metrics that may ultimately influence performance reviews.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Internal documents suggest this shift is being formalized at scale. Software and security engineers are now expected to “drive excellence” by adopting AI and “contributing to initiatives that improve productivity, speed, scalability, and impact.” In practical terms, this means demonstrating measurable gains in output through AI-assisted workflows.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"One goal outlined by HR reads:\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\" “Demonstrate measurable improvement in code quality, speed and productivity through regular use of approved AI coding assist tools, contributing to the team\'s overall efficiency targets.”\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"From optional tool to baseline skill\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"JPMorgan’s approach stands out not because it uses AI—many banks already deploy it in fraud detection and risk analysis—but because it is embedding AI usage into everyday expectations for employees.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Across corporate environments, AI adoption has often been uneven. Some teams experiment heavily, while others continue relying on traditional workflows. By tying AI use to performance metrics, JPMorgan is attempting to standardize adoption and avoid the common pitfall of underutilized enterprise tools.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"This also signals a deeper shift in how productivity is defined. Historically, performance reviews focused on outcomes—accuracy, speed, and output quality. Now, how those outcomes are achieved is becoming just as important. AI literacy is emerging as a baseline skill, much like spreadsheets or coding proficiency in earlier decades.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Efficiency gains and new pressures\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"The bank’s strategy raises a fundamental question for the modern workplace: if AI reduces the time needed for routine tasks, should employees be expected to produce more within the same timeframe?\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Some employees are already feeling that pressure. One developer told Business Insider, “There\'s a lot of anxiety in the environment right now,” pointing to concerns that those who do not actively use AI tools may be perceived as underperforming.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"Managers, according to employees, are increasingly emphasizing that access to AI tools should translate into visible productivity gains. In some cases, dashboards track tool usage at a granular level, reinforcing expectations around adoption.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"While several engineers acknowledged that AI tools are helpful, particularly for coding, documentation, and presentations, the added layer of monitoring introduces a new dynamic. The challenge is no longer just doing the work, but demonstrating that AI is part of how the work gets done.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"Balancing innovation with oversight\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"For a highly regulated industry like banking, expanding AI use also introduces new risks. Tools such as ChatGPT and Claude can generate summaries or draft content quickly, but they are not infallible. Errors, omissions, or hallucinations can carry serious consequences in client-facing or decision-critical contexts.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"JPMorgan has already developed internal controls for AI in areas like trading and risk management. Extending AI use across a broader workforce will likely require similar safeguards, ensuring that efficiency gains do not come at the expense of accuracy or compliance.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"This creates a delicate balance: encouraging widespread AI adoption while maintaining rigorous oversight.\"}]},{\"type\":\"heading\",\"children\":[{\"type\":\"text\",\"text\":\"A model for the future of work?\"}],\"level\":3},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"JPMorgan is one of the largest technology spenders on Wall Street, with projected investments nearing $20 billion by 2026. Its approach to AI adoption is likely to be closely watched by other financial institutions and large enterprises.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"If linking AI use to performance results in measurable productivity gains, similar frameworks could spread quickly. Beyond banking, companies like Meta and Google are already encouraging employees to integrate AI into their workflows, signaling a broader cultural shift.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"What emerges is a new model of work where AI is not just a tool, but an expectation. Skills such as prompt design, output verification, and AI-assisted problem-solving may soon become standard job requirements.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"JPMorgan’s strategy suggests that this transition is already underway and that the definition of a high-performing employee is being quietly rewritten in the age of AI.\"}]},{\"type\":\"paragraph\",\"children\":[{\"type\":\"text\",\"text\":\"\"}]}]', 'Editorial Team', NULL, NULL, '2026-04-01 18:47:44.089000', '2026-04-01 18:47:44.089000', '2026-04-01 18:47:44.123000', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `articles_categories_lnk`
--

CREATE TABLE `articles_categories_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `category_ord` double UNSIGNED DEFAULT NULL,
  `article_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles_categories_lnk`
--

INSERT INTO `articles_categories_lnk` (`id`, `article_id`, `category_id`, `category_ord`, `article_ord`) VALUES
(1, 1, 1, 1, 1),
(3, 4, 2, 1, 1),
(4, 5, 3, 0, 1),
(5, 6, 4, 1, 1),
(6, 7, 1, 0, 2),
(7, 8, 2, 1, 2),
(8, 9, 1, 0, 3),
(9, 10, 2, 1, 3),
(10, 11, 1, 0, 4),
(11, 12, 2, 1, 4),
(12, 13, 1, 0, 5),
(13, 14, 2, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `document_id`, `name`, `slug`, `description`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'uzugwcrnzp0f2hngsgnayzdx', 'General News', 'general-news', NULL, '2026-04-01 16:58:38.324000', '2026-04-01 16:58:38.324000', NULL, 1, 1, NULL),
(2, 'uzugwcrnzp0f2hngsgnayzdx', 'General News', 'general-news', NULL, '2026-04-01 16:58:38.324000', '2026-04-01 16:58:38.324000', '2026-04-01 16:58:38.332000', 1, 1, NULL),
(3, 'mrxicdn4cqw9h5zkruxlg6qf', 'Insights', 'insights', NULL, '2026-04-01 17:00:42.639000', '2026-04-01 17:00:42.639000', NULL, 1, 1, NULL),
(4, 'mrxicdn4cqw9h5zkruxlg6qf', 'Insights', 'insights', NULL, '2026-04-01 17:00:42.639000', '2026-04-01 17:00:42.639000', '2026-04-01 17:00:42.645000', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` longtext DEFAULT NULL,
  `caption` longtext DEFAULT NULL,
  `focal_point` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`focal_point`)),
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formats`)),
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `preview_url` longtext DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_metadata`)),
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `document_id`, `name`, `alternative_text`, `caption`, `focal_point`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `preview_url`, `provider`, `provider_metadata`, `folder_path`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'fslb24toa7cjd391ttd4drqp', 'pexels-vika-glitter-392079-19997979.jpg', NULL, NULL, NULL, 3000, 1968, '{\"thumbnail\":{\"name\":\"thumbnail_pexels-vika-glitter-392079-19997979.jpg\",\"hash\":\"thumbnail_pexels_vika_glitter_392079_19997979_be5649410a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":238,\"height\":156,\"size\":10.96,\"sizeInBytes\":10961,\"url\":\"/uploads/thumbnail_pexels_vika_glitter_392079_19997979_be5649410a.jpg\"},\"medium\":{\"name\":\"medium_pexels-vika-glitter-392079-19997979.jpg\",\"hash\":\"medium_pexels_vika_glitter_392079_19997979_be5649410a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":492,\"size\":58.7,\"sizeInBytes\":58695,\"url\":\"/uploads/medium_pexels_vika_glitter_392079_19997979_be5649410a.jpg\"},\"small\":{\"name\":\"small_pexels-vika-glitter-392079-19997979.jpg\",\"hash\":\"small_pexels_vika_glitter_392079_19997979_be5649410a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":328,\"size\":32.19,\"sizeInBytes\":32185,\"url\":\"/uploads/small_pexels_vika_glitter_392079_19997979_be5649410a.jpg\"},\"large\":{\"name\":\"large_pexels-vika-glitter-392079-19997979.jpg\",\"hash\":\"large_pexels_vika_glitter_392079_19997979_be5649410a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":656,\"size\":90.68,\"sizeInBytes\":90684,\"url\":\"/uploads/large_pexels_vika_glitter_392079_19997979_be5649410a.jpg\"}}', 'pexels_vika_glitter_392079_19997979_be5649410a', '.jpg', 'image/jpeg', 687.36, '/uploads/pexels_vika_glitter_392079_19997979_be5649410a.jpg', NULL, 'local', NULL, '/', '2026-04-01 16:56:38.341000', '2026-04-01 16:56:38.341000', '2026-04-01 16:56:38.342000', 1, 1, NULL),
(2, 'ue0nfkrfxlos4nug7vxrzcvo', 'pexels-markus-winkler-1430818-18498317.jpg', NULL, NULL, NULL, 3999, 2667, '{\"thumbnail\":{\"name\":\"thumbnail_pexels-markus-winkler-1430818-18498317.jpg\",\"hash\":\"thumbnail_pexels_markus_winkler_1430818_18498317_2be3164081\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":10.18,\"sizeInBytes\":10184,\"url\":\"/uploads/thumbnail_pexels_markus_winkler_1430818_18498317_2be3164081.jpg\"},\"medium\":{\"name\":\"medium_pexels-markus-winkler-1430818-18498317.jpg\",\"hash\":\"medium_pexels_markus_winkler_1430818_18498317_2be3164081\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":60.61,\"sizeInBytes\":60611,\"url\":\"/uploads/medium_pexels_markus_winkler_1430818_18498317_2be3164081.jpg\"},\"small\":{\"name\":\"small_pexels-markus-winkler-1430818-18498317.jpg\",\"hash\":\"small_pexels_markus_winkler_1430818_18498317_2be3164081\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":32.82,\"sizeInBytes\":32819,\"url\":\"/uploads/small_pexels_markus_winkler_1430818_18498317_2be3164081.jpg\"},\"large\":{\"name\":\"large_pexels-markus-winkler-1430818-18498317.jpg\",\"hash\":\"large_pexels_markus_winkler_1430818_18498317_2be3164081\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":94.79,\"sizeInBytes\":94791,\"url\":\"/uploads/large_pexels_markus_winkler_1430818_18498317_2be3164081.jpg\"}}', 'pexels_markus_winkler_1430818_18498317_2be3164081', '.jpg', 'image/jpeg', 681.74, '/uploads/pexels_markus_winkler_1430818_18498317_2be3164081.jpg', NULL, 'local', NULL, '/', '2026-04-01 17:34:35.045000', '2026-04-01 17:34:35.045000', '2026-04-01 17:34:35.045000', 1, 1, NULL),
(3, 'olb2y17y8x45t2l0da84bftk', 'pexels-dkomov-34804018.jpg', NULL, NULL, NULL, 6048, 4032, '{\"thumbnail\":{\"name\":\"thumbnail_pexels-dkomov-34804018.jpg\",\"hash\":\"thumbnail_pexels_dkomov_34804018_408d2f669c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":8.08,\"sizeInBytes\":8077,\"url\":\"/uploads/thumbnail_pexels_dkomov_34804018_408d2f669c.jpg\"},\"medium\":{\"name\":\"medium_pexels-dkomov-34804018.jpg\",\"hash\":\"medium_pexels_dkomov_34804018_408d2f669c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":42.38,\"sizeInBytes\":42375,\"url\":\"/uploads/medium_pexels_dkomov_34804018_408d2f669c.jpg\"},\"small\":{\"name\":\"small_pexels-dkomov-34804018.jpg\",\"hash\":\"small_pexels_dkomov_34804018_408d2f669c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":23.94,\"sizeInBytes\":23941,\"url\":\"/uploads/small_pexels_dkomov_34804018_408d2f669c.jpg\"},\"large\":{\"name\":\"large_pexels-dkomov-34804018.jpg\",\"hash\":\"large_pexels_dkomov_34804018_408d2f669c\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":62.81,\"sizeInBytes\":62809,\"url\":\"/uploads/large_pexels_dkomov_34804018_408d2f669c.jpg\"}}', 'pexels_dkomov_34804018_408d2f669c', '.jpg', 'image/jpeg', 1481.98, '/uploads/pexels_dkomov_34804018_408d2f669c.jpg', NULL, 'local', NULL, '/', '2026-04-01 18:37:05.468000', '2026-04-01 18:37:05.468000', '2026-04-01 18:37:05.468000', 1, 1, NULL),
(4, 'rbw6h64cvcjdkiot820f9xs4', 'pexels-altabena-10142683.jpg', NULL, NULL, NULL, 6720, 4480, '{\"thumbnail\":{\"name\":\"thumbnail_pexels-altabena-10142683.jpg\",\"hash\":\"thumbnail_pexels_altabena_10142683_06176dbed7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":9.6,\"sizeInBytes\":9602,\"url\":\"/uploads/thumbnail_pexels_altabena_10142683_06176dbed7.jpg\"},\"small\":{\"name\":\"small_pexels-altabena-10142683.jpg\",\"hash\":\"small_pexels_altabena_10142683_06176dbed7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":32.06,\"sizeInBytes\":32055,\"url\":\"/uploads/small_pexels_altabena_10142683_06176dbed7.jpg\"},\"medium\":{\"name\":\"medium_pexels-altabena-10142683.jpg\",\"hash\":\"medium_pexels_altabena_10142683_06176dbed7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":61.58,\"sizeInBytes\":61580,\"url\":\"/uploads/medium_pexels_altabena_10142683_06176dbed7.jpg\"},\"large\":{\"name\":\"large_pexels-altabena-10142683.jpg\",\"hash\":\"large_pexels_altabena_10142683_06176dbed7\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":94.73,\"sizeInBytes\":94731,\"url\":\"/uploads/large_pexels_altabena_10142683_06176dbed7.jpg\"}}', 'pexels_altabena_10142683_06176dbed7', '.jpg', 'image/jpeg', 2181.51, '/uploads/pexels_altabena_10142683_06176dbed7.jpg', NULL, 'local', NULL, '/', '2026-04-01 18:40:00.866000', '2026-04-01 18:40:00.866000', '2026-04-01 18:40:00.866000', 1, 1, NULL),
(5, 'bnxzi2gvprttneymgigk719a', 'pexels-googledeepmind-17485705.jpg', NULL, NULL, NULL, 5000, 2812, '{\"thumbnail\":{\"name\":\"thumbnail_pexels-googledeepmind-17485705.jpg\",\"hash\":\"thumbnail_pexels_googledeepmind_17485705_080d497d14\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":9.44,\"sizeInBytes\":9439,\"url\":\"/uploads/thumbnail_pexels_googledeepmind_17485705_080d497d14.jpg\"},\"small\":{\"name\":\"small_pexels-googledeepmind-17485705.jpg\",\"hash\":\"small_pexels_googledeepmind_17485705_080d497d14\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":281,\"size\":26.74,\"sizeInBytes\":26742,\"url\":\"/uploads/small_pexels_googledeepmind_17485705_080d497d14.jpg\"},\"medium\":{\"name\":\"medium_pexels-googledeepmind-17485705.jpg\",\"hash\":\"medium_pexels_googledeepmind_17485705_080d497d14\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":422,\"size\":48.91,\"sizeInBytes\":48906,\"url\":\"/uploads/medium_pexels_googledeepmind_17485705_080d497d14.jpg\"},\"large\":{\"name\":\"large_pexels-googledeepmind-17485705.jpg\",\"hash\":\"large_pexels_googledeepmind_17485705_080d497d14\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":562,\"size\":73.46,\"sizeInBytes\":73462,\"url\":\"/uploads/large_pexels_googledeepmind_17485705_080d497d14.jpg\"}}', 'pexels_googledeepmind_17485705_080d497d14', '.jpg', 'image/jpeg', 648.19, '/uploads/pexels_googledeepmind_17485705_080d497d14.jpg', NULL, 'local', NULL, '/', '2026-04-01 18:43:13.645000', '2026-04-01 18:43:13.645000', '2026-04-01 18:43:13.646000', 1, 1, NULL),
(6, 'hnbtptkeonxyr3d9rt24xqat', 'pexels-bertellifotografia-16094046.jpg', NULL, NULL, NULL, 6720, 4480, '{\"thumbnail\":{\"name\":\"thumbnail_pexels-bertellifotografia-16094046.jpg\",\"hash\":\"thumbnail_pexels_bertellifotografia_16094046_60dc194836\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":234,\"height\":156,\"size\":8.56,\"sizeInBytes\":8561,\"url\":\"/uploads/thumbnail_pexels_bertellifotografia_16094046_60dc194836.jpg\"},\"small\":{\"name\":\"small_pexels-bertellifotografia-16094046.jpg\",\"hash\":\"small_pexels_bertellifotografia_16094046_60dc194836\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":333,\"size\":29.38,\"sizeInBytes\":29376,\"url\":\"/uploads/small_pexels_bertellifotografia_16094046_60dc194836.jpg\"},\"medium\":{\"name\":\"medium_pexels-bertellifotografia-16094046.jpg\",\"hash\":\"medium_pexels_bertellifotografia_16094046_60dc194836\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":500,\"size\":55.87,\"sizeInBytes\":55873,\"url\":\"/uploads/medium_pexels_bertellifotografia_16094046_60dc194836.jpg\"},\"large\":{\"name\":\"large_pexels-bertellifotografia-16094046.jpg\",\"hash\":\"large_pexels_bertellifotografia_16094046_60dc194836\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":667,\"size\":86.44,\"sizeInBytes\":86444,\"url\":\"/uploads/large_pexels_bertellifotografia_16094046_60dc194836.jpg\"}}', 'pexels_bertellifotografia_16094046_60dc194836', '.jpg', 'image/jpeg', 1680.12, '/uploads/pexels_bertellifotografia_16094046_60dc194836.jpg', NULL, 'local', NULL, '/', '2026-04-01 18:47:36.481000', '2026-04-01 18:47:36.481000', '2026-04-01 18:47:36.481000', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `files_folder_lnk`
--

CREATE TABLE `files_folder_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `folder_id` int(10) UNSIGNED DEFAULT NULL,
  `file_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files_related_mph`
--

CREATE TABLE `files_related_mph` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED DEFAULT NULL,
  `related_id` int(10) UNSIGNED DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files_related_mph`
--

INSERT INTO `files_related_mph` (`id`, `file_id`, `related_id`, `related_type`, `field`, `order`) VALUES
(5, 1, 1, 'api::article.article', 'featuredImage', 1),
(6, 1, 4, 'api::article.article', 'featuredImage', 1),
(7, 2, 5, 'api::article.article', 'featuredImage', 1),
(8, 2, 6, 'api::article.article', 'featuredImage', 1),
(9, 3, 7, 'api::article.article', 'featuredImage', 1),
(10, 3, 8, 'api::article.article', 'featuredImage', 1),
(11, 4, 9, 'api::article.article', 'featuredImage', 1),
(12, 4, 10, 'api::article.article', 'featuredImage', 1),
(13, 5, 11, 'api::article.article', 'featuredImage', 1),
(14, 5, 12, 'api::article.article', 'featuredImage', 1),
(15, 6, 13, 'api::article.article', 'featuredImage', 1),
(16, 6, 14, 'api::article.article', 'featuredImage', 1);

-- --------------------------------------------------------

--
-- Table structure for table `homepages`
--

CREATE TABLE `homepages` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homepages_featured_articles_lnk`
--

CREATE TABLE `homepages_featured_articles_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `homepage_id` int(10) UNSIGNED DEFAULT NULL,
  `article_id` int(10) UNSIGNED DEFAULT NULL,
  `article_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homepages_hero_articles_lnk`
--

CREATE TABLE `homepages_hero_articles_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `homepage_id` int(10) UNSIGNED DEFAULT NULL,
  `article_id` int(10) UNSIGNED DEFAULT NULL,
  `article_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homepages_weekly_top_articles_lnk`
--

CREATE TABLE `homepages_weekly_top_articles_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `homepage_id` int(10) UNSIGNED DEFAULT NULL,
  `article_id` int(10) UNSIGNED DEFAULT NULL,
  `article_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `homepages_weekly_top_titles_lnk`
--

CREATE TABLE `homepages_weekly_top_titles_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `homepage_id` int(10) UNSIGNED DEFAULT NULL,
  `article_id` int(10) UNSIGNED DEFAULT NULL,
  `article_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `i18n_locale`
--

CREATE TABLE `i18n_locale` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `i18n_locale`
--

INSERT INTO `i18n_locale` (`id`, `document_id`, `name`, `code`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'kvqgayfx2ae034h2s978ouob', 'English (en)', 'en', '2026-04-01 16:32:00.003000', '2026-04-01 16:32:00.003000', '2026-04-01 16:32:00.004000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `open_in_new_tab` tinyint(1) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `document_id`, `label`, `path`, `order`, `is_active`, `open_in_new_tab`, `location`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'bph1uq9ts1gstofw7rcyullb', 'News', '/categories/general-news', 1, 1, 1, 'both', '2026-04-01 17:22:38.612000', '2026-04-01 17:29:00.444000', NULL, 1, 1, NULL),
(3, 'u3xoe2eppbmkwgb4sumoimm7', 'Insights', '/categories/Insights', 2, 1, 1, 'both', '2026-04-01 17:23:02.258000', '2026-04-01 17:29:17.531000', NULL, 1, 1, NULL),
(5, 'eayuuh5oajpay9jc6u7ha8u4', 'Podcast', '#', 3, 1, 1, 'both', '2026-04-01 17:23:23.972000', '2026-04-01 17:23:23.972000', NULL, 1, 1, NULL),
(6, 'eayuuh5oajpay9jc6u7ha8u4', 'Podcast', '#', 3, 1, 1, 'both', '2026-04-01 17:23:23.972000', '2026-04-01 17:23:23.972000', '2026-04-01 17:23:23.992000', 1, 1, NULL),
(7, 'y8qn4jrlkpnnub2gl2vj5qg5', 'Events', '#', 4, 1, 1, 'both', '2026-04-01 17:23:46.009000', '2026-04-01 17:29:10.219000', NULL, 1, 1, NULL),
(9, 'vu9jxqufe1fecxv9at52woop', 'About', '/about', 5, 1, 1, 'both', '2026-04-01 17:24:33.817000', '2026-04-01 17:24:33.817000', NULL, 1, 1, NULL),
(10, 'vu9jxqufe1fecxv9at52woop', 'About', '/about', 5, 1, 1, 'both', '2026-04-01 17:24:33.817000', '2026-04-01 17:24:33.817000', '2026-04-01 17:24:33.844000', 1, 1, NULL),
(13, 'bph1uq9ts1gstofw7rcyullb', 'News', '/categories/general-news', 1, 1, 1, 'both', '2026-04-01 17:22:38.612000', '2026-04-01 17:29:00.444000', '2026-04-01 17:29:00.464000', 1, 1, NULL),
(14, 'y8qn4jrlkpnnub2gl2vj5qg5', 'Events', '#', 4, 1, 1, 'both', '2026-04-01 17:23:46.009000', '2026-04-01 17:29:10.219000', '2026-04-01 17:29:10.227000', 1, 1, NULL),
(15, 'u3xoe2eppbmkwgb4sumoimm7', 'Insights', '/categories/Insights', 2, 1, 1, 'both', '2026-04-01 17:23:02.258000', '2026-04-01 17:29:17.531000', '2026-04-01 17:29:17.541000', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_ai_localization_jobs`
--

CREATE TABLE `strapi_ai_localization_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `related_document_id` varchar(255) NOT NULL,
  `source_locale` varchar(255) NOT NULL,
  `target_locales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`target_locales`)),
  `status` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_ai_metadata_jobs`
--

CREATE TABLE `strapi_ai_metadata_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_tokens`
--

CREATE TABLE `strapi_api_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `encrypted_key` longtext DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_api_tokens`
--

INSERT INTO `strapi_api_tokens` (`id`, `document_id`, `name`, `description`, `type`, `access_key`, `encrypted_key`, `last_used_at`, `expires_at`, `lifespan`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'imbexsya2n5zbl7fk3s5yjxr', 'Read Only', 'A default API token with read-only permissions, only used for accessing resources', 'read-only', '8ccd68b15a3c9a01a896780e817e914a777f4cc772697e6db3563f9a76a4c25919779127a74c27f317ea49abb5f8d045398f6a9d508fa1c4de70306f19789e69', 'v1:66ad09a75010a8914fd0b9f11f3f9ade:205b7a5b02689ec753327efa6597a9f48ce64381df08eb48d4f2a5258f5d839b08ce1fe5389cc237fb7ede46ebca68a016e840881df818a2cbb31b780e886c355104d849c46ec5ce7b2c82931634b0c9bea09d517169f17749900292ea855ec9b2fc687f6ac0a034beba57ae41e4564c6686afd7f6bf7e2e5933ea7a028c47bee57a3af36ca9625552f5806106ddc56c140a2b03f177999089128af0ba54e5be66562212a74ea6ceb5f6b3472fcf80ea84955dd3fe5484e8ab758a5bb586c495758c0e778f3cf62b51f22ad979e4a939f4717967cba3521be2ce2dad94bf2898695aa2ae4d976e94be68f472a11e84e096225c7706a317b5d87e278bad575c40:20256e86d97e02264285176431cbed85', NULL, NULL, NULL, '2026-04-01 16:32:00.665000', '2026-04-01 16:32:00.665000', '2026-04-01 16:32:00.665000', NULL, NULL, NULL),
(2, 'mgug275hpgbsakcokic8zkxq', 'Full Access', 'A default API token with full access permissions, used for accessing or modifying resources', 'full-access', '3cf6ec21d8f07d09ffe993e6d86541433b0880bfd8a2bbb71ea1bee103a5f78290dc9ce5c6e732161e4b508b15a0f2f8e6d93c4ec067c619e925831823b8a9f6', 'v1:863ff19dcda30a95105c8c3bd8092086:512fcfd426021f964886afef5bcf3a3b1e07387571bb815408cb1b1315cbbd64e3efd2a3ddebe70d65b17434d01b6c46c43c884e5ecf8bb252e9a0f2fddf50e15992ea04dec652f12bd28a9af9d8d3d88fef52d4592370ce72f701107b61557bd68f0868afa29c9e83dc55d5942783c06644cc138688ffaa39b4df2215f8da4978c2ab523c314644597786c735732a3e98dba4ad7636cd6ad68d8a44b711d172b300b665c377a2319be04155b4ffa0be23175474054a5da96ee76bc1c56d4b9cf8686dac86ef92fbf75fac97bcc5ee8dc00099022694c47563734de050361e7fad48bd7ea4f2677b42e08748010ff26f8cf53ba981a9e52ae10c52abedb7e182:3b1aa4151a8b96d8a7add84937e836e9', NULL, NULL, NULL, '2026-04-01 16:32:00.673000', '2026-04-01 16:32:00.673000', '2026-04-01 16:32:00.673000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_token_permissions`
--

CREATE TABLE `strapi_api_token_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_api_token_permissions_token_lnk`
--

CREATE TABLE `strapi_api_token_permissions_token_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_token_permission_id` int(10) UNSIGNED DEFAULT NULL,
  `api_token_id` int(10) UNSIGNED DEFAULT NULL,
  `api_token_permission_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_core_store_settings`
--

CREATE TABLE `strapi_core_store_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_core_store_settings`
--

INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(1, 'strapi_unidirectional-join-table-repair-ran', 'true', 'boolean', NULL, NULL);
INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(2, 'strapi_content_types_schema', '{\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"text\",\"configurable\":false},\"caption\":{\"type\":\"text\",\"configurable\":false},\"focalPoint\":{\"type\":\"json\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"text\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"text\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"minLength\":1,\"required\":true,\"private\":true,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"files\"}}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"plugin\":\"upload\",\"globalId\":\"UploadFile\",\"uid\":\"plugin::upload.file\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"text\",\"configurable\":false},\"caption\":{\"type\":\"text\",\"configurable\":false},\"focalPoint\":{\"type\":\"json\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"text\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"text\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"minLength\":1,\"required\":true,\"private\":true,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"file\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"upload_folders\"}}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"plugin\":\"upload\",\"globalId\":\"UploadFolder\",\"uid\":\"plugin::upload.folder\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"minLength\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelName\":\"folder\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::i18n.locale\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"i18n_locale\"}}},\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\",\"uid\":\"plugin::i18n.locale\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"i18n_locale\",\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"locale\"},\"plugin::content-releases.release\":{\"collectionName\":\"strapi_releases\",\"info\":{\"singularName\":\"release\",\"pluralName\":\"releases\",\"displayName\":\"Release\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"releasedAt\":{\"type\":\"datetime\"},\"scheduledAt\":{\"type\":\"datetime\"},\"timezone\":{\"type\":\"string\"},\"status\":{\"type\":\"enumeration\",\"enum\":[\"ready\",\"blocked\",\"failed\",\"done\",\"empty\"],\"required\":true},\"actions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"mappedBy\":\"release\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_releases\"}}},\"plugin\":\"content-releases\",\"globalId\":\"ContentReleasesRelease\",\"uid\":\"plugin::content-releases.release\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_releases\",\"info\":{\"singularName\":\"release\",\"pluralName\":\"releases\",\"displayName\":\"Release\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"releasedAt\":{\"type\":\"datetime\"},\"scheduledAt\":{\"type\":\"datetime\"},\"timezone\":{\"type\":\"string\"},\"status\":{\"type\":\"enumeration\",\"enum\":[\"ready\",\"blocked\",\"failed\",\"done\",\"empty\"],\"required\":true},\"actions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"mappedBy\":\"release\"}},\"kind\":\"collectionType\"},\"modelName\":\"release\"},\"plugin::content-releases.release-action\":{\"collectionName\":\"strapi_release_actions\",\"info\":{\"singularName\":\"release-action\",\"pluralName\":\"release-actions\",\"displayName\":\"Release Action\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"enumeration\",\"enum\":[\"publish\",\"unpublish\"],\"required\":true},\"contentType\":{\"type\":\"string\",\"required\":true},\"entryDocumentId\":{\"type\":\"string\"},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"release\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::content-releases.release\",\"inversedBy\":\"actions\"},\"isEntryValid\":{\"type\":\"boolean\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_release_actions\"}}},\"plugin\":\"content-releases\",\"globalId\":\"ContentReleasesReleaseAction\",\"uid\":\"plugin::content-releases.release-action\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_release_actions\",\"info\":{\"singularName\":\"release-action\",\"pluralName\":\"release-actions\",\"displayName\":\"Release Action\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"enumeration\",\"enum\":[\"publish\",\"unpublish\"],\"required\":true},\"contentType\":{\"type\":\"string\",\"required\":true},\"entryDocumentId\":{\"type\":\"string\"},\"locale\":{\"type\":\"string\"},\"release\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::content-releases.release\",\"inversedBy\":\"actions\"},\"isEntryValid\":{\"type\":\"boolean\"}},\"kind\":\"collectionType\"},\"modelName\":\"release-action\"},\"plugin::review-workflows.workflow\":{\"collectionName\":\"strapi_workflows\",\"info\":{\"name\":\"Workflow\",\"description\":\"\",\"singularName\":\"workflow\",\"pluralName\":\"workflows\",\"displayName\":\"Workflow\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"stages\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToMany\",\"mappedBy\":\"workflow\"},\"stageRequiredToPublish\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToOne\",\"required\":false},\"contentTypes\":{\"type\":\"json\",\"required\":true,\"default\":\"[]\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::review-workflows.workflow\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_workflows\"}}},\"plugin\":\"review-workflows\",\"globalId\":\"ReviewWorkflowsWorkflow\",\"uid\":\"plugin::review-workflows.workflow\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_workflows\",\"info\":{\"name\":\"Workflow\",\"description\":\"\",\"singularName\":\"workflow\",\"pluralName\":\"workflows\",\"displayName\":\"Workflow\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"stages\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToMany\",\"mappedBy\":\"workflow\"},\"stageRequiredToPublish\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToOne\",\"required\":false},\"contentTypes\":{\"type\":\"json\",\"required\":true,\"default\":\"[]\"}},\"kind\":\"collectionType\"},\"modelName\":\"workflow\"},\"plugin::review-workflows.workflow-stage\":{\"collectionName\":\"strapi_workflows_stages\",\"info\":{\"name\":\"Workflow Stage\",\"description\":\"\",\"singularName\":\"workflow-stage\",\"pluralName\":\"workflow-stages\",\"displayName\":\"Stages\"},\"options\":{\"version\":\"1.1.0\",\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false},\"color\":{\"type\":\"string\",\"configurable\":false,\"default\":\"#4945FF\"},\"workflow\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow\",\"relation\":\"manyToOne\",\"inversedBy\":\"stages\",\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::permission\",\"relation\":\"manyToMany\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::review-workflows.workflow-stage\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_workflows_stages\"}}},\"plugin\":\"review-workflows\",\"globalId\":\"ReviewWorkflowsWorkflowStage\",\"uid\":\"plugin::review-workflows.workflow-stage\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_workflows_stages\",\"info\":{\"name\":\"Workflow Stage\",\"description\":\"\",\"singularName\":\"workflow-stage\",\"pluralName\":\"workflow-stages\",\"displayName\":\"Stages\"},\"options\":{\"version\":\"1.1.0\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false},\"color\":{\"type\":\"string\",\"configurable\":false,\"default\":\"#4945FF\"},\"workflow\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow\",\"relation\":\"manyToOne\",\"inversedBy\":\"stages\",\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::permission\",\"relation\":\"manyToMany\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"workflow-stage\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_permissions\"}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\",\"uid\":\"plugin::users-permissions.permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"permission\",\"options\":{\"draftAndPublish\":false}},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.role\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_roles\"}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\",\"uid\":\"plugin::users-permissions.role\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"role\",\"options\":{\"draftAndPublish\":false}},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"timestamps\":true,\"draftAndPublish\":false},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_users\"}}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\",\"uid\":\"plugin::users-permissions.user\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"user\"},\"api::article.article\":{\"kind\":\"collectionType\",\"collectionName\":\"articles\",\"info\":{\"singularName\":\"article\",\"pluralName\":\"articles\",\"displayName\":\"Article\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\",\"targetField\":\"title\",\"required\":true},\"excerpt\":{\"type\":\"text\"},\"content\":{\"type\":\"blocks\"},\"featuredImage\":{\"type\":\"media\",\"multiple\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"author\":{\"type\":\"string\"},\"published\":{\"type\":\"date\"},\"readTime\":{\"type\":\"integer\"},\"categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::category.category\",\"inversedBy\":\"articles\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"articles\"}}},\"apiName\":\"article\",\"globalId\":\"Article\",\"uid\":\"api::article.article\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"articles\",\"info\":{\"singularName\":\"article\",\"pluralName\":\"articles\",\"displayName\":\"Article\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\",\"targetField\":\"title\",\"required\":true},\"excerpt\":{\"type\":\"text\"},\"content\":{\"type\":\"blocks\"},\"featuredImage\":{\"type\":\"media\",\"multiple\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"author\":{\"type\":\"string\"},\"published\":{\"type\":\"date\"},\"readTime\":{\"type\":\"integer\"},\"categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::category.category\",\"inversedBy\":\"articles\"}},\"kind\":\"collectionType\"},\"modelName\":\"article\",\"actions\":{},\"lifecycles\":{}},\"api::category.category\":{\"kind\":\"collectionType\",\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"Category\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\",\"targetField\":\"name\"},\"description\":{\"type\":\"text\"},\"articles\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::article.article\",\"mappedBy\":\"categories\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::category.category\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"categories\"}}},\"apiName\":\"category\",\"globalId\":\"Category\",\"uid\":\"api::category.category\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"Category\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\",\"targetField\":\"name\"},\"description\":{\"type\":\"text\"},\"articles\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::article.article\",\"mappedBy\":\"categories\"}},\"kind\":\"collectionType\"},\"modelName\":\"category\",\"actions\":{},\"lifecycles\":{}},\"api::homepage.homepage\":{\"kind\":\"singleType\",\"collectionName\":\"homepages\",\"info\":{\"singularName\":\"homepage\",\"pluralName\":\"homepages\",\"displayName\":\"Homepage\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"heroArticles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"},\"featured_articles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"},\"weekly_top_articles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"},\"weekly_top_titles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::homepage.homepage\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"homepages\"}}},\"apiName\":\"homepage\",\"globalId\":\"Homepage\",\"uid\":\"api::homepage.homepage\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"homepages\",\"info\":{\"singularName\":\"homepage\",\"pluralName\":\"homepages\",\"displayName\":\"Homepage\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"heroArticles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"},\"featured_articles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"},\"weekly_top_articles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"},\"weekly_top_titles\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::article.article\"}},\"kind\":\"singleType\"},\"modelName\":\"homepage\",\"actions\":{},\"lifecycles\":{}},\"api::menu-item.menu-item\":{\"kind\":\"collectionType\",\"collectionName\":\"menu_items\",\"info\":{\"singularName\":\"menu-item\",\"pluralName\":\"menu-items\",\"displayName\":\"Menu Item\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"label\":{\"type\":\"string\"},\"path\":{\"type\":\"string\"},\"order\":{\"type\":\"integer\"},\"isActive\":{\"type\":\"boolean\"},\"openInNewTab\":{\"type\":\"boolean\"},\"location\":{\"type\":\"enumeration\",\"enum\":[\"header\",\"footer\",\"both\"]},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::menu-item.menu-item\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"menu_items\"}}},\"apiName\":\"menu-item\",\"globalId\":\"MenuItem\",\"uid\":\"api::menu-item.menu-item\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"menu_items\",\"info\":{\"singularName\":\"menu-item\",\"pluralName\":\"menu-items\",\"displayName\":\"Menu Item\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"label\":{\"type\":\"string\"},\"path\":{\"type\":\"string\"},\"order\":{\"type\":\"integer\"},\"isActive\":{\"type\":\"boolean\"},\"openInNewTab\":{\"type\":\"boolean\"},\"location\":{\"type\":\"enumeration\",\"enum\":[\"header\",\"footer\",\"both\"]}},\"kind\":\"collectionType\"},\"modelName\":\"menu-item\",\"actions\":{},\"lifecycles\":{}},\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminPermission\",\"uid\":\"admin::permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelName\":\"permission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::user\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_users\"}}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"registrationToken\":{\"hidden\":true}}},\"plugin\":\"admin\",\"globalId\":\"AdminUser\",\"uid\":\"admin::user\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"user\",\"options\":{\"draftAndPublish\":false}},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::role\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_roles\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminRole\",\"uid\":\"admin::role\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelName\":\"role\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"encryptedKey\":{\"type\":\"text\",\"minLength\":1,\"configurable\":false,\"required\":false,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::api-token\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_api_tokens\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\",\"uid\":\"admin::api-token\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"encryptedKey\":{\"type\":\"text\",\"minLength\":1,\"configurable\":false,\"required\":false,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelName\":\"api-token\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::api-token-permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_api_token_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\",\"uid\":\"admin::api-token-permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelName\":\"api-token-permission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::transfer-token\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_transfer_tokens\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\",\"uid\":\"admin::transfer-token\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelName\":\"transfer-token\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::transfer-token-permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_transfer_token_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\",\"uid\":\"admin::transfer-token-permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelName\":\"transfer-token-permission\"},\"admin::session\":{\"collectionName\":\"strapi_sessions\",\"info\":{\"name\":\"Session\",\"description\":\"Session Manager storage\",\"singularName\":\"session\",\"pluralName\":\"sessions\",\"displayName\":\"Session\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false},\"i18n\":{\"localized\":false}},\"attributes\":{\"userId\":{\"type\":\"string\",\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"sessionId\":{\"type\":\"string\",\"unique\":true,\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"childId\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"deviceId\":{\"type\":\"string\",\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"origin\":{\"type\":\"string\",\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"expiresAt\":{\"type\":\"datetime\",\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"absoluteExpiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"private\":true,\"searchable\":false},\"status\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"type\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":true},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::session\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_sessions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminSession\",\"uid\":\"admin::session\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_sessions\",\"info\":{\"name\":\"Session\",\"description\":\"Session Manager storage\",\"singularName\":\"session\",\"pluralName\":\"sessions\",\"displayName\":\"Session\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false},\"i18n\":{\"localized\":false}},\"attributes\":{\"userId\":{\"type\":\"string\",\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"sessionId\":{\"type\":\"string\",\"unique\":true,\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"childId\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"deviceId\":{\"type\":\"string\",\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"origin\":{\"type\":\"string\",\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"expiresAt\":{\"type\":\"datetime\",\"required\":true,\"configurable\":false,\"private\":true,\"searchable\":false},\"absoluteExpiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"private\":true,\"searchable\":false},\"status\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"type\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"session\"}}', 'object', NULL, NULL);
INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(3, 'plugin_content_manager_configuration_content_types::plugin::content-releases.release-action', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"contentType\",\"defaultSortBy\":\"contentType\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"contentType\":{\"edit\":{\"label\":\"contentType\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentType\",\"searchable\":true,\"sortable\":true}},\"entryDocumentId\":{\"edit\":{\"label\":\"entryDocumentId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"entryDocumentId\",\"searchable\":true,\"sortable\":true}},\"release\":{\"edit\":{\"label\":\"release\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"release\",\"searchable\":true,\"sortable\":true}},\"isEntryValid\":{\"edit\":{\"label\":\"isEntryValid\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isEntryValid\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"contentType\",\"entryDocumentId\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"contentType\",\"size\":6}],[{\"name\":\"entryDocumentId\",\"size\":6},{\"name\":\"release\",\"size\":6}],[{\"name\":\"isEntryValid\",\"size\":4}]]},\"uid\":\"plugin::content-releases.release-action\"}', 'object', NULL, NULL),
(4, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.permission\"}', 'object', NULL, NULL),
(5, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.role', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.role\"}', 'object', NULL, NULL),
(6, 'plugin_content_manager_configuration_content_types::api::article.article', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"excerpt\":{\"edit\":{\"label\":\"excerpt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"excerpt\",\"searchable\":true,\"sortable\":true}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":false,\"sortable\":false}},\"featuredImage\":{\"edit\":{\"label\":\"featuredImage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"featuredImage\",\"searchable\":false,\"sortable\":false}},\"author\":{\"edit\":{\"label\":\"author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"author\",\"searchable\":true,\"sortable\":true}},\"published\":{\"edit\":{\"label\":\"published\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"published\",\"searchable\":true,\"sortable\":true}},\"readTime\":{\"edit\":{\"label\":\"readTime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"readTime\",\"searchable\":true,\"sortable\":true}},\"categories\":{\"edit\":{\"label\":\"categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"categories\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"slug\",\"excerpt\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"excerpt\",\"size\":6}],[{\"name\":\"content\",\"size\":12}],[{\"name\":\"featuredImage\",\"size\":6},{\"name\":\"author\",\"size\":6}],[{\"name\":\"published\",\"size\":4},{\"name\":\"readTime\",\"size\":4}],[{\"name\":\"categories\",\"size\":6}]]},\"uid\":\"api::article.article\"}', 'object', NULL, NULL),
(7, 'plugin_content_manager_configuration_content_types::api::category.category', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"articles\":{\"edit\":{\"label\":\"articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"articles\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"articles\",\"size\":6}]]},\"uid\":\"api::category.category\"}', 'object', NULL, NULL),
(8, 'plugin_content_manager_configuration_content_types::admin::user', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]},\"uid\":\"admin::user\"}', 'object', NULL, NULL),
(9, 'plugin_content_manager_configuration_content_types::admin::api-token-permission', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]},\"uid\":\"admin::api-token-permission\"}', 'object', NULL, NULL),
(10, 'plugin_content_manager_configuration_content_types::plugin::users-permissions.user', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.user\"}', 'object', NULL, NULL),
(11, 'plugin_content_manager_configuration_content_types::admin::permission', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"actionParameters\":{\"edit\":{\"label\":\"actionParameters\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"actionParameters\",\"searchable\":false,\"sortable\":false}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6}],[{\"name\":\"actionParameters\",\"size\":12}],[{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]},\"uid\":\"admin::permission\"}', 'object', NULL, NULL),
(12, 'plugin_content_manager_configuration_content_types::admin::session', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"userId\",\"defaultSortBy\":\"userId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"userId\":{\"edit\":{\"label\":\"userId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"userId\",\"searchable\":true,\"sortable\":true}},\"sessionId\":{\"edit\":{\"label\":\"sessionId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"sessionId\",\"searchable\":true,\"sortable\":true}},\"childId\":{\"edit\":{\"label\":\"childId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"childId\",\"searchable\":true,\"sortable\":true}},\"deviceId\":{\"edit\":{\"label\":\"deviceId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"deviceId\",\"searchable\":true,\"sortable\":true}},\"origin\":{\"edit\":{\"label\":\"origin\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"origin\",\"searchable\":true,\"sortable\":true}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"absoluteExpiresAt\":{\"edit\":{\"label\":\"absoluteExpiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"absoluteExpiresAt\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"status\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"userId\",\"sessionId\",\"childId\"],\"edit\":[[{\"name\":\"userId\",\"size\":6},{\"name\":\"sessionId\",\"size\":6}],[{\"name\":\"childId\",\"size\":6},{\"name\":\"deviceId\",\"size\":6}],[{\"name\":\"origin\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"absoluteExpiresAt\",\"size\":6},{\"name\":\"status\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]},\"uid\":\"admin::session\"}', 'object', NULL, NULL),
(13, 'plugin_content_manager_configuration_content_types::admin::transfer-token', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]},\"uid\":\"admin::transfer-token\"}', 'object', NULL, NULL),
(14, 'plugin_content_manager_configuration_content_types::plugin::upload.file', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"focalPoint\":{\"edit\":{\"label\":\"focalPoint\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"focalPoint\",\"searchable\":false,\"sortable\":false}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6}],[{\"name\":\"focalPoint\",\"size\":12}],[{\"name\":\"width\",\"size\":4},{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]},\"uid\":\"plugin::upload.file\"}', 'object', NULL, NULL),
(15, 'plugin_content_manager_configuration_content_types::plugin::content-releases.release', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"releasedAt\":{\"edit\":{\"label\":\"releasedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"releasedAt\",\"searchable\":true,\"sortable\":true}},\"scheduledAt\":{\"edit\":{\"label\":\"scheduledAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"scheduledAt\",\"searchable\":true,\"sortable\":true}},\"timezone\":{\"edit\":{\"label\":\"timezone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"timezone\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"status\",\"searchable\":true,\"sortable\":true}},\"actions\":{\"edit\":{\"label\":\"actions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"contentType\"},\"list\":{\"label\":\"actions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"releasedAt\",\"scheduledAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"releasedAt\",\"size\":6}],[{\"name\":\"scheduledAt\",\"size\":6},{\"name\":\"timezone\",\"size\":6}],[{\"name\":\"status\",\"size\":6},{\"name\":\"actions\",\"size\":6}]]},\"uid\":\"plugin::content-releases.release\"}', 'object', NULL, NULL),
(16, 'plugin_content_manager_configuration_content_types::plugin::upload.folder', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]},\"uid\":\"plugin::upload.folder\"}', 'object', NULL, NULL),
(17, 'plugin_content_manager_configuration_content_types::plugin::i18n.locale', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]},\"uid\":\"plugin::i18n.locale\"}', 'object', NULL, NULL),
(18, 'plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"stages\":{\"edit\":{\"label\":\"stages\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"stages\",\"searchable\":false,\"sortable\":false}},\"stageRequiredToPublish\":{\"edit\":{\"label\":\"stageRequiredToPublish\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"stageRequiredToPublish\",\"searchable\":true,\"sortable\":true}},\"contentTypes\":{\"edit\":{\"label\":\"contentTypes\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentTypes\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"stages\",\"stageRequiredToPublish\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"stages\",\"size\":6}],[{\"name\":\"stageRequiredToPublish\",\"size\":6}],[{\"name\":\"contentTypes\",\"size\":12}]]},\"uid\":\"plugin::review-workflows.workflow\"}', 'object', NULL, NULL);
INSERT INTO `strapi_core_store_settings` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(19, 'plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"color\":{\"edit\":{\"label\":\"color\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"color\",\"searchable\":true,\"sortable\":true}},\"workflow\":{\"edit\":{\"label\":\"workflow\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"workflow\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"color\",\"workflow\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"color\",\"size\":6}],[{\"name\":\"workflow\",\"size\":6},{\"name\":\"permissions\",\"size\":6}]]},\"uid\":\"plugin::review-workflows.workflow-stage\"}', 'object', NULL, NULL),
(20, 'plugin_content_manager_configuration_content_types::admin::role', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]},\"uid\":\"admin::role\"}', 'object', NULL, NULL),
(21, 'plugin_content_manager_configuration_content_types::admin::api-token', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"encryptedKey\":{\"edit\":{\"label\":\"encryptedKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"encryptedKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"encryptedKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]},\"uid\":\"admin::api-token\"}', 'object', NULL, NULL),
(22, 'plugin_content_manager_configuration_content_types::admin::transfer-token-permission', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]},\"uid\":\"admin::transfer-token-permission\"}', 'object', NULL, NULL),
(23, 'plugin_upload_settings', '{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":false,\"aiMetadata\":true}', 'object', NULL, NULL),
(24, 'plugin_upload_view_configuration', '{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}', 'object', NULL, NULL),
(25, 'plugin_upload_metrics', '{\"weeklySchedule\":\"32 11 1 * * 4\",\"lastWeeklyUpdate\":1778703092620}', 'object', NULL, NULL),
(26, 'plugin_i18n_default_locale', '\"en\"', 'string', NULL, NULL),
(27, 'plugin_users-permissions_grant', '{\"email\":{\"icon\":\"envelope\",\"enabled\":true},\"discord\":{\"icon\":\"discord\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"icon\":\"facebook-square\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"icon\":\"google\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"icon\":\"github\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"icon\":\"windows\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"icon\":\"twitter\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/twitter/callback\"},\"instagram\":{\"icon\":\"instagram\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"icon\":\"vk\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"icon\":\"twitch\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"icon\":\"linkedin\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"icon\":\"aws\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"icon\":\"reddit\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"icon\":\"book\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]},\"keycloak\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"myKeycloakProvider.com/realms/myrealm\",\"callback\":\"api/auth/keycloak/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]}}', 'object', NULL, NULL),
(28, 'plugin_users-permissions_email', '{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}', 'object', NULL, NULL),
(29, 'plugin_users-permissions_advanced', '{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}', 'object', NULL, NULL),
(30, 'core_admin_auth', '{\"providers\":{\"autoRegister\":false,\"defaultRole\":null,\"ssoLockedRoles\":null}}', 'object', NULL, NULL),
(31, 'plugin_content_manager_configuration_content_types::api::menu-item.menu-item', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"label\",\"defaultSortBy\":\"label\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"order\":{\"edit\":{\"label\":\"order\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"order\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"openInNewTab\":{\"edit\":{\"label\":\"openInNewTab\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"openInNewTab\",\"searchable\":true,\"sortable\":true}},\"location\":{\"edit\":{\"label\":\"location\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"location\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"label\",\"path\",\"order\"],\"edit\":[[{\"name\":\"label\",\"size\":6},{\"name\":\"path\",\"size\":6}],[{\"name\":\"order\",\"size\":4},{\"name\":\"isActive\",\"size\":4},{\"name\":\"openInNewTab\",\"size\":4}],[{\"name\":\"location\",\"size\":6}]]},\"uid\":\"api::menu-item.menu-item\"}', 'object', NULL, NULL),
(32, 'core_admin_project-settings', '{\"menuLogo\":{\"name\":\"apple-touch-icon.png\",\"hash\":\"apple_touch_icon_a6af8e32c1\",\"url\":\"/uploads/apple_touch_icon_a6af8e32c1.png\",\"width\":180,\"height\":180,\"ext\":\".png\",\"size\":5.79,\"provider\":\"local\"},\"authLogo\":{\"name\":\"apple-touch-icon.png\",\"hash\":\"apple_touch_icon_7156dfa74c\",\"url\":\"/uploads/apple_touch_icon_7156dfa74c.png\",\"width\":180,\"height\":180,\"ext\":\".png\",\"size\":5.79,\"provider\":\"local\"}}', 'object', NULL, NULL),
(33, 'plugin_content_manager_configuration_content_types::api::homepage.homepage', '{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"relationOpenMode\":\"modal\",\"mainField\":\"documentId\",\"defaultSortBy\":\"documentId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"heroArticles\":{\"edit\":{\"label\":\"heroArticles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"heroArticles\",\"searchable\":false,\"sortable\":false}},\"featured_articles\":{\"edit\":{\"label\":\"featured_articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"featured_articles\",\"searchable\":false,\"sortable\":false}},\"weekly_top_articles\":{\"edit\":{\"label\":\"weekly_top_articles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"weekly_top_articles\",\"searchable\":false,\"sortable\":false}},\"weekly_top_titles\":{\"edit\":{\"label\":\"weekly_top_titles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"weekly_top_titles\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"heroArticles\",\"featured_articles\",\"weekly_top_articles\"],\"edit\":[[{\"name\":\"heroArticles\",\"size\":6},{\"name\":\"featured_articles\",\"size\":6}],[{\"name\":\"weekly_top_articles\",\"size\":6},{\"name\":\"weekly_top_titles\",\"size\":6}]]},\"uid\":\"api::homepage.homepage\"}', 'object', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_database_schema`
--

CREATE TABLE `strapi_database_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_database_schema`
--

INSERT INTO `strapi_database_schema` (`id`, `schema`, `time`, `hash`) VALUES
(5, '{\"tables\":[{\"name\":\"files\",\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null},{\"name\":\"files_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"alternative_text\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"caption\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"focal_point\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"width\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"height\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"formats\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"hash\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ext\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"mime\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"size\",\"type\":\"decimal\",\"args\":[10,2],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"preview_url\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider_metadata\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"folder_path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"upload_folders\",\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"},{\"name\":\"upload_folders_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"i18n_locale\",\"indexes\":[{\"name\":\"i18n_locale_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_releases\",\"indexes\":[{\"name\":\"strapi_releases_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_releases_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_releases_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_releases_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_releases_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"released_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"scheduled_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"timezone\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_release_actions\",\"indexes\":[{\"name\":\"strapi_release_actions_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_release_actions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_release_actions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_release_actions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_release_actions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"content_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"entry_document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_entry_valid\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_workflows\",\"indexes\":[{\"name\":\"strapi_workflows_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_workflows_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_workflows_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_workflows_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_workflows_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"content_types\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_workflows_stages\",\"indexes\":[{\"name\":\"strapi_workflows_stages_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_workflows_stages_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_workflows_stages_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_workflows_stages_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_workflows_stages_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"color\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"up_permissions\",\"indexes\":[{\"name\":\"up_permissions_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"up_roles\",\"indexes\":[{\"name\":\"up_roles_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"up_users\",\"indexes\":[{\"name\":\"up_users_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmation_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmed\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"articles\",\"indexes\":[{\"name\":\"articles_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"articles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"articles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"articles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"articles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"excerpt\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"content\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"author\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published\",\"type\":\"date\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"read_time\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"categories\",\"indexes\":[{\"name\":\"categories_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"slug\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"homepages\",\"indexes\":[{\"name\":\"homepages_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"homepages_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"homepages_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"homepages_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"homepages_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"menu_items\",\"indexes\":[{\"name\":\"menu_items_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"menu_items_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"menu_items_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"menu_items_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"menu_items_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"label\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_active\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"open_in_new_tab\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"location\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_permissions\",\"indexes\":[{\"name\":\"admin_permissions_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"action_parameters\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"subject\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"properties\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"conditions\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_users\",\"indexes\":[{\"name\":\"admin_users_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"firstname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lastname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"registration_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_active\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"prefered_language\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_roles\",\"indexes\":[{\"name\":\"admin_roles_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_api_tokens\",\"indexes\":[{\"name\":\"strapi_api_tokens_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"encrypted_key\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_api_token_permissions\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_transfer_tokens\",\"indexes\":[{\"name\":\"strapi_transfer_tokens_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_transfer_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_transfer_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_transfer_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_transfer_token_permissions\",\"indexes\":[{\"name\":\"strapi_transfer_token_permissions_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_transfer_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_transfer_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_transfer_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_sessions\",\"indexes\":[{\"name\":\"strapi_sessions_documents_idx\",\"columns\":[\"document_id\",\"locale\",\"published_at\"]},{\"name\":\"strapi_sessions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_sessions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_sessions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_sessions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"session_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"child_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"device_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"origin\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"absolute_expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_core_store_settings\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"value\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"environment\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"tag\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_webhooks\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"headers\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"events\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"enabled\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_history_versions\",\"indexes\":[{\"name\":\"strapi_history_versions_created_by_id_fk\",\"columns\":[\"created_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_history_versions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"content_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"related_document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"data\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"schema\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_ai_metadata_jobs\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"completed_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_ai_localization_jobs\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"content_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"related_document_id\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"source_locale\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"target_locales\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"files_related_mph\",\"indexes\":[{\"name\":\"files_related_mph_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_related_mph_oidx\",\"columns\":[\"order\"]},{\"name\":\"files_related_mph_idix\",\"columns\":[\"related_id\"]}],\"foreignKeys\":[{\"name\":\"files_related_mph_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_folder_lnk\",\"indexes\":[{\"name\":\"files_folder_lnk_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_folder_lnk_ifk\",\"columns\":[\"folder_id\"]},{\"name\":\"files_folder_lnk_uq\",\"columns\":[\"file_id\",\"folder_id\"],\"type\":\"unique\"},{\"name\":\"files_folder_lnk_oifk\",\"columns\":[\"file_ord\"]}],\"foreignKeys\":[{\"name\":\"files_folder_lnk_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"},{\"name\":\"files_folder_lnk_ifk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"file_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"upload_folders_parent_lnk\",\"indexes\":[{\"name\":\"upload_folders_parent_lnk_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"upload_folders_parent_lnk_ifk\",\"columns\":[\"inv_folder_id\"]},{\"name\":\"upload_folders_parent_lnk_uq\",\"columns\":[\"folder_id\",\"inv_folder_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_parent_lnk_oifk\",\"columns\":[\"folder_ord\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_parent_lnk_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"},{\"name\":\"upload_folders_parent_lnk_ifk\",\"columns\":[\"inv_folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_release_actions_release_lnk\",\"indexes\":[{\"name\":\"strapi_release_actions_release_lnk_fk\",\"columns\":[\"release_action_id\"]},{\"name\":\"strapi_release_actions_release_lnk_ifk\",\"columns\":[\"release_id\"]},{\"name\":\"strapi_release_actions_release_lnk_uq\",\"columns\":[\"release_action_id\",\"release_id\"],\"type\":\"unique\"},{\"name\":\"strapi_release_actions_release_lnk_oifk\",\"columns\":[\"release_action_ord\"]}],\"foreignKeys\":[{\"name\":\"strapi_release_actions_release_lnk_fk\",\"columns\":[\"release_action_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_release_actions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_release_actions_release_lnk_ifk\",\"columns\":[\"release_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_releases\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"release_action_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"release_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"release_action_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_workflows_stage_required_to_publish_lnk\",\"indexes\":[{\"name\":\"strapi_workflows_stage_required_to_publish_lnk_fk\",\"columns\":[\"workflow_id\"]},{\"name\":\"strapi_workflows_stage_required_to_publish_lnk_ifk\",\"columns\":[\"workflow_stage_id\"]},{\"name\":\"strapi_workflows_stage_required_to_publish_lnk_uq\",\"columns\":[\"workflow_id\",\"workflow_stage_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"strapi_workflows_stage_required_to_publish_lnk_fk\",\"columns\":[\"workflow_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_workflows\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_workflows_stage_required_to_publish_lnk_ifk\",\"columns\":[\"workflow_stage_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_workflows_stages\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"workflow_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"workflow_stage_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_workflows_stages_workflow_lnk\",\"indexes\":[{\"name\":\"strapi_workflows_stages_workflow_lnk_fk\",\"columns\":[\"workflow_stage_id\"]},{\"name\":\"strapi_workflows_stages_workflow_lnk_ifk\",\"columns\":[\"workflow_id\"]},{\"name\":\"strapi_workflows_stages_workflow_lnk_uq\",\"columns\":[\"workflow_stage_id\",\"workflow_id\"],\"type\":\"unique\"},{\"name\":\"strapi_workflows_stages_workflow_lnk_oifk\",\"columns\":[\"workflow_stage_ord\"]}],\"foreignKeys\":[{\"name\":\"strapi_workflows_stages_workflow_lnk_fk\",\"columns\":[\"workflow_stage_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_workflows_stages\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_workflows_stages_workflow_lnk_ifk\",\"columns\":[\"workflow_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_workflows\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"workflow_stage_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"workflow_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"workflow_stage_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_workflows_stages_permissions_lnk\",\"indexes\":[{\"name\":\"strapi_workflows_stages_permissions_lnk_fk\",\"columns\":[\"workflow_stage_id\"]},{\"name\":\"strapi_workflows_stages_permissions_lnk_ifk\",\"columns\":[\"permission_id\"]},{\"name\":\"strapi_workflows_stages_permissions_lnk_uq\",\"columns\":[\"workflow_stage_id\",\"permission_id\"],\"type\":\"unique\"},{\"name\":\"strapi_workflows_stages_permissions_lnk_ofk\",\"columns\":[\"permission_ord\"]}],\"foreignKeys\":[{\"name\":\"strapi_workflows_stages_permissions_lnk_fk\",\"columns\":[\"workflow_stage_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_workflows_stages\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_workflows_stages_permissions_lnk_ifk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_permissions\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"workflow_stage_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions_role_lnk\",\"indexes\":[{\"name\":\"up_permissions_role_lnk_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"up_permissions_role_lnk_ifk\",\"columns\":[\"role_id\"]},{\"name\":\"up_permissions_role_lnk_uq\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_permissions_role_lnk_oifk\",\"columns\":[\"permission_ord\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_role_lnk_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_permissions_role_lnk_ifk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users_role_lnk\",\"indexes\":[{\"name\":\"up_users_role_lnk_fk\",\"columns\":[\"user_id\"]},{\"name\":\"up_users_role_lnk_ifk\",\"columns\":[\"role_id\"]},{\"name\":\"up_users_role_lnk_uq\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_users_role_lnk_oifk\",\"columns\":[\"user_ord\"]}],\"foreignKeys\":[{\"name\":\"up_users_role_lnk_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_users_role_lnk_ifk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"articles_categories_lnk\",\"indexes\":[{\"name\":\"articles_categories_lnk_fk\",\"columns\":[\"article_id\"]},{\"name\":\"articles_categories_lnk_ifk\",\"columns\":[\"category_id\"]},{\"name\":\"articles_categories_lnk_uq\",\"columns\":[\"article_id\",\"category_id\"],\"type\":\"unique\"},{\"name\":\"articles_categories_lnk_ofk\",\"columns\":[\"category_ord\"]},{\"name\":\"articles_categories_lnk_oifk\",\"columns\":[\"article_ord\"]}],\"foreignKeys\":[{\"name\":\"articles_categories_lnk_fk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"articles\",\"onDelete\":\"CASCADE\"},{\"name\":\"articles_categories_lnk_ifk\",\"columns\":[\"category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"homepages_hero_articles_lnk\",\"indexes\":[{\"name\":\"homepages_hero_articles_lnk_fk\",\"columns\":[\"homepage_id\"]},{\"name\":\"homepages_hero_articles_lnk_ifk\",\"columns\":[\"article_id\"]},{\"name\":\"homepages_hero_articles_lnk_uq\",\"columns\":[\"homepage_id\",\"article_id\"],\"type\":\"unique\"},{\"name\":\"homepages_hero_articles_lnk_ofk\",\"columns\":[\"article_ord\"]}],\"foreignKeys\":[{\"name\":\"homepages_hero_articles_lnk_fk\",\"columns\":[\"homepage_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"homepages\",\"onDelete\":\"CASCADE\"},{\"name\":\"homepages_hero_articles_lnk_ifk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"articles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"homepage_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"homepages_featured_articles_lnk\",\"indexes\":[{\"name\":\"homepages_featured_articles_lnk_fk\",\"columns\":[\"homepage_id\"]},{\"name\":\"homepages_featured_articles_lnk_ifk\",\"columns\":[\"article_id\"]},{\"name\":\"homepages_featured_articles_lnk_uq\",\"columns\":[\"homepage_id\",\"article_id\"],\"type\":\"unique\"},{\"name\":\"homepages_featured_articles_lnk_ofk\",\"columns\":[\"article_ord\"]}],\"foreignKeys\":[{\"name\":\"homepages_featured_articles_lnk_fk\",\"columns\":[\"homepage_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"homepages\",\"onDelete\":\"CASCADE\"},{\"name\":\"homepages_featured_articles_lnk_ifk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"articles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"homepage_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"homepages_weekly_top_articles_lnk\",\"indexes\":[{\"name\":\"homepages_weekly_top_articles_lnk_fk\",\"columns\":[\"homepage_id\"]},{\"name\":\"homepages_weekly_top_articles_lnk_ifk\",\"columns\":[\"article_id\"]},{\"name\":\"homepages_weekly_top_articles_lnk_uq\",\"columns\":[\"homepage_id\",\"article_id\"],\"type\":\"unique\"},{\"name\":\"homepages_weekly_top_articles_lnk_ofk\",\"columns\":[\"article_ord\"]}],\"foreignKeys\":[{\"name\":\"homepages_weekly_top_articles_lnk_fk\",\"columns\":[\"homepage_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"homepages\",\"onDelete\":\"CASCADE\"},{\"name\":\"homepages_weekly_top_articles_lnk_ifk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"articles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"homepage_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"homepages_weekly_top_titles_lnk\",\"indexes\":[{\"name\":\"homepages_weekly_top_titles_lnk_fk\",\"columns\":[\"homepage_id\"]},{\"name\":\"homepages_weekly_top_titles_lnk_ifk\",\"columns\":[\"article_id\"]},{\"name\":\"homepages_weekly_top_titles_lnk_uq\",\"columns\":[\"homepage_id\",\"article_id\"],\"type\":\"unique\"},{\"name\":\"homepages_weekly_top_titles_lnk_ofk\",\"columns\":[\"article_ord\"]}],\"foreignKeys\":[{\"name\":\"homepages_weekly_top_titles_lnk_fk\",\"columns\":[\"homepage_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"homepages\",\"onDelete\":\"CASCADE\"},{\"name\":\"homepages_weekly_top_titles_lnk_ifk\",\"columns\":[\"article_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"articles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"homepage_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"article_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_permissions_role_lnk\",\"indexes\":[{\"name\":\"admin_permissions_role_lnk_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"admin_permissions_role_lnk_ifk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_permissions_role_lnk_uq\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_permissions_role_lnk_oifk\",\"columns\":[\"permission_ord\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_role_lnk_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_permissions_role_lnk_ifk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users_roles_lnk\",\"indexes\":[{\"name\":\"admin_users_roles_lnk_fk\",\"columns\":[\"user_id\"]},{\"name\":\"admin_users_roles_lnk_ifk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_users_roles_lnk_uq\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_users_roles_lnk_ofk\",\"columns\":[\"role_ord\"]},{\"name\":\"admin_users_roles_lnk_oifk\",\"columns\":[\"user_ord\"]}],\"foreignKeys\":[{\"name\":\"admin_users_roles_lnk_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_users_roles_lnk_ifk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions_token_lnk\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_token_lnk_fk\",\"columns\":[\"api_token_permission_id\"]},{\"name\":\"strapi_api_token_permissions_token_lnk_ifk\",\"columns\":[\"api_token_id\"]},{\"name\":\"strapi_api_token_permissions_token_lnk_uq\",\"columns\":[\"api_token_permission_id\",\"api_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_api_token_permissions_token_lnk_oifk\",\"columns\":[\"api_token_permission_ord\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_token_lnk_fk\",\"columns\":[\"api_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_api_token_permissions_token_lnk_ifk\",\"columns\":[\"api_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"api_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_permission_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_token_permissions_token_lnk\",\"indexes\":[{\"name\":\"strapi_transfer_token_permissions_token_lnk_fk\",\"columns\":[\"transfer_token_permission_id\"]},{\"name\":\"strapi_transfer_token_permissions_token_lnk_ifk\",\"columns\":[\"transfer_token_id\"]},{\"name\":\"strapi_transfer_token_permissions_token_lnk_uq\",\"columns\":[\"transfer_token_permission_id\",\"transfer_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_transfer_token_permissions_token_lnk_oifk\",\"columns\":[\"transfer_token_permission_ord\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_token_permissions_token_lnk_fk\",\"columns\":[\"transfer_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_transfer_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_transfer_token_permissions_token_lnk_ifk\",\"columns\":[\"transfer_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_transfer_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"transfer_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"transfer_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"transfer_token_permission_ord\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]}]}', '2026-05-14 01:23:48', '05362f32f01ff0fe90f1444a5931a610aabdb828157474d36f0612d6f8928e0b');

-- --------------------------------------------------------

--
-- Table structure for table `strapi_history_versions`
--

CREATE TABLE `strapi_history_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `related_document_id` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `created_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_migrations`
--

CREATE TABLE `strapi_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_migrations_internal`
--

CREATE TABLE `strapi_migrations_internal` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_migrations_internal`
--

INSERT INTO `strapi_migrations_internal` (`id`, `name`, `time`) VALUES
(1, '5.0.0-rename-identifiers-longer-than-max-length', '2026-04-01 16:31:57'),
(2, '5.0.0-02-created-document-id', '2026-04-01 16:31:57'),
(3, '5.0.0-03-created-locale', '2026-04-01 16:31:57'),
(4, '5.0.0-04-created-published-at', '2026-04-01 16:31:57'),
(5, '5.0.0-05-drop-slug-fields-index', '2026-04-01 16:31:57'),
(6, '5.0.0-06-add-document-id-indexes', '2026-04-01 16:31:57'),
(7, 'core::5.0.0-discard-drafts', '2026-04-01 16:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `strapi_releases`
--

CREATE TABLE `strapi_releases` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `released_at` datetime(6) DEFAULT NULL,
  `scheduled_at` datetime(6) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_release_actions`
--

CREATE TABLE `strapi_release_actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `entry_document_id` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `is_entry_valid` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_release_actions_release_lnk`
--

CREATE TABLE `strapi_release_actions_release_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `release_action_id` int(10) UNSIGNED DEFAULT NULL,
  `release_id` int(10) UNSIGNED DEFAULT NULL,
  `release_action_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_sessions`
--

CREATE TABLE `strapi_sessions` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `child_id` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `absolute_expires_at` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strapi_sessions`
--

INSERT INTO `strapi_sessions` (`id`, `document_id`, `user_id`, `session_id`, `child_id`, `device_id`, `origin`, `expires_at`, `absolute_expires_at`, `status`, `type`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(5, 'xjkj1o06nbp8pdp27k6bfd70', '1', 'febf5389140705586d474ec7fedd80ed', 'a39827c682e847f9de9b303c4a5f1bce', 'b54b53c1-566b-4f2f-a2d6-1edfbabd8c49', 'admin', '2026-04-15 18:33:37.716000', '2026-05-01 18:33:37.716000', 'rotated', 'refresh', '2026-04-01 18:33:37.716000', '2026-04-01 19:03:39.304000', '2026-04-01 18:33:37.716000', NULL, NULL, NULL),
(6, 'u9tnr9nt9mbzihck6a3m7i87', '1', 'a39827c682e847f9de9b303c4a5f1bce', '63a939659349cf6576e72571c911de85', 'b54b53c1-566b-4f2f-a2d6-1edfbabd8c49', 'admin', '2026-04-15 19:03:39.297000', '2026-05-01 18:33:37.716000', 'rotated', 'refresh', '2026-04-01 19:03:39.297000', '2026-04-01 19:03:39.371000', '2026-04-01 19:03:39.297000', NULL, NULL, NULL),
(7, 'jr4jbys01vwwhhu3lsj02qt1', '1', '63a939659349cf6576e72571c911de85', '406fcc3a8bbb3b3f3aa159d3a96698f8', 'b54b53c1-566b-4f2f-a2d6-1edfbabd8c49', 'admin', '2026-04-15 19:03:39.364000', '2026-05-01 18:33:37.716000', 'rotated', 'refresh', '2026-04-01 19:03:39.365000', '2026-04-01 21:58:59.799000', '2026-04-01 19:03:39.365000', NULL, NULL, NULL),
(8, 'q9va1odmbj3tv7c1wra20002', '1', '406fcc3a8bbb3b3f3aa159d3a96698f8', 'e0a9e76171ff389cdf3da31d196e5c14', 'b54b53c1-566b-4f2f-a2d6-1edfbabd8c49', 'admin', '2026-04-15 21:58:59.790000', '2026-05-01 18:33:37.716000', 'rotated', 'refresh', '2026-04-01 21:58:59.790000', '2026-04-03 01:35:03.791000', '2026-04-01 21:58:59.791000', NULL, NULL, NULL),
(9, 'x8dzqvags4o97sptu8pp3mvy', '1', 'e0a9e76171ff389cdf3da31d196e5c14', NULL, 'b54b53c1-566b-4f2f-a2d6-1edfbabd8c49', 'admin', '2026-04-17 01:35:03.775000', '2026-05-01 18:33:37.716000', 'active', 'refresh', '2026-04-03 01:35:03.776000', '2026-04-03 01:35:03.776000', '2026-04-03 01:35:03.776000', NULL, NULL, NULL),
(10, 'xj5ycau702n6s26mb86izsfq', '1', 'fce8a1abe3ae869a512661be221654d4', NULL, '7e092a64-3c37-4686-9096-168062ff4a0b', 'admin', '2026-05-28 01:15:30.041000', '2026-06-13 01:15:30.041000', 'active', 'refresh', '2026-05-14 01:15:30.042000', '2026-05-14 01:15:30.042000', '2026-05-14 01:15:30.043000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_tokens`
--

CREATE TABLE `strapi_transfer_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_token_permissions`
--

CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_transfer_token_permissions_token_lnk`
--

CREATE TABLE `strapi_transfer_token_permissions_token_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_token_permission_id` int(10) UNSIGNED DEFAULT NULL,
  `transfer_token_id` int(10) UNSIGNED DEFAULT NULL,
  `transfer_token_permission_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_webhooks`
--

CREATE TABLE `strapi_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`events`)),
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_workflows`
--

CREATE TABLE `strapi_workflows` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content_types` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content_types`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_workflows_stages`
--

CREATE TABLE `strapi_workflows_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_workflows_stages_permissions_lnk`
--

CREATE TABLE `strapi_workflows_stages_permissions_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `workflow_stage_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_workflows_stages_workflow_lnk`
--

CREATE TABLE `strapi_workflows_stages_workflow_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `workflow_stage_id` int(10) UNSIGNED DEFAULT NULL,
  `workflow_id` int(10) UNSIGNED DEFAULT NULL,
  `workflow_stage_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strapi_workflows_stage_required_to_publish_lnk`
--

CREATE TABLE `strapi_workflows_stage_required_to_publish_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `workflow_id` int(10) UNSIGNED DEFAULT NULL,
  `workflow_stage_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upload_folders`
--

CREATE TABLE `upload_folders` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upload_folders_parent_lnk`
--

CREATE TABLE `upload_folders_parent_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `folder_id` int(10) UNSIGNED DEFAULT NULL,
  `inv_folder_id` int(10) UNSIGNED DEFAULT NULL,
  `folder_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `up_permissions`
--

CREATE TABLE `up_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_permissions`
--

INSERT INTO `up_permissions` (`id`, `document_id`, `action`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'ro2dxjrtb9lu9rqt9ywg4cym', 'plugin::users-permissions.auth.logout', '2026-04-01 16:32:00.054000', '2026-04-01 16:32:00.054000', '2026-04-01 16:32:00.054000', NULL, NULL, NULL),
(2, 'b16ivf69a6g6hzyy4a183ok3', 'plugin::users-permissions.user.me', '2026-04-01 16:32:00.054000', '2026-04-01 16:32:00.054000', '2026-04-01 16:32:00.055000', NULL, NULL, NULL),
(3, 'ha91koqobtd1d1yfjs6dbvcu', 'plugin::users-permissions.auth.changePassword', '2026-04-01 16:32:00.054000', '2026-04-01 16:32:00.054000', '2026-04-01 16:32:00.055000', NULL, NULL, NULL),
(4, 'dcha7nctxxxzudgzq7s7dxqn', 'plugin::users-permissions.auth.callback', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', NULL, NULL, NULL),
(5, 'wmmfubsve3p1pw11cqfzvm9k', 'plugin::users-permissions.auth.connect', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', NULL, NULL, NULL),
(6, 'al3enw1dlrl357qtrktxtjfw', 'plugin::users-permissions.auth.forgotPassword', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', NULL, NULL, NULL),
(7, 'aiubyf8y979p0c5xorlo8198', 'plugin::users-permissions.auth.resetPassword', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', NULL, NULL, NULL),
(8, 'p408j3ajtrgepkds3qtgpn61', 'plugin::users-permissions.auth.register', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.074000', NULL, NULL, NULL),
(9, 'oenh02gr71wow7unukx7t64g', 'plugin::users-permissions.auth.emailConfirmation', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.074000', NULL, NULL, NULL),
(10, 'fv56u5utgd7tgmes0fmjdnfh', 'plugin::users-permissions.auth.sendEmailConfirmation', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.074000', NULL, NULL, NULL),
(11, 'dhc61yk501j0g4ambiu86vd2', 'plugin::users-permissions.auth.refresh', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.073000', '2026-04-01 16:32:00.074000', NULL, NULL, NULL),
(12, 'ld5dl3yh95kk8lmy0xklqrol', 'api::article.article.find', '2026-04-01 16:57:24.802000', '2026-04-01 16:57:24.802000', '2026-04-01 16:57:24.802000', NULL, NULL, NULL),
(13, 'arca2wsozf39mvzdpo8pwnyy', 'api::article.article.findOne', '2026-04-01 16:57:24.802000', '2026-04-01 16:57:24.802000', '2026-04-01 16:57:24.802000', NULL, NULL, NULL),
(14, 'y700b7dt4zgwftuzbbid2e6j', 'api::category.category.find', '2026-04-01 16:57:29.907000', '2026-04-01 16:57:29.907000', '2026-04-01 16:57:29.907000', NULL, NULL, NULL),
(15, 'zjlju57mbg7nwy2l4h8j7pw8', 'api::category.category.findOne', '2026-04-01 16:57:29.907000', '2026-04-01 16:57:29.907000', '2026-04-01 16:57:29.907000', NULL, NULL, NULL),
(16, 'mp2wz2cncsqjooe2b895tqqj', 'api::article.article.find', '2026-04-01 16:57:41.253000', '2026-04-01 16:57:41.253000', '2026-04-01 16:57:41.254000', NULL, NULL, NULL),
(17, 'a2salg9ygkqnwwpte53k1j3s', 'api::article.article.findOne', '2026-04-01 16:57:41.253000', '2026-04-01 16:57:41.253000', '2026-04-01 16:57:41.254000', NULL, NULL, NULL),
(18, 'qy9reaf1thvgvaagr78c9wij', 'api::category.category.find', '2026-04-01 16:57:41.253000', '2026-04-01 16:57:41.253000', '2026-04-01 16:57:41.254000', NULL, NULL, NULL),
(19, 'vs5g55sru3lhx79yvs890dlr', 'api::category.category.findOne', '2026-04-01 16:57:41.253000', '2026-04-01 16:57:41.253000', '2026-04-01 16:57:41.254000', NULL, NULL, NULL),
(20, 'wabwlo8v5kkj0e11ya9ulept', 'api::menu-item.menu-item.find', '2026-04-01 17:25:39.728000', '2026-04-01 17:25:39.728000', '2026-04-01 17:25:39.728000', NULL, NULL, NULL),
(21, 'ofuuhfnlde3l0srzeidgsiln', 'api::menu-item.menu-item.findOne', '2026-04-01 17:25:39.728000', '2026-04-01 17:25:39.728000', '2026-04-01 17:25:39.728000', NULL, NULL, NULL),
(22, 'd1rufsjyyui6hppgqdyymv0h', 'api::homepage.homepage.find', '2026-04-01 18:03:49.626000', '2026-04-01 18:03:49.626000', '2026-04-01 18:03:49.626000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_permissions_role_lnk`
--

CREATE TABLE `up_permissions_role_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `permission_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_permissions_role_lnk`
--

INSERT INTO `up_permissions_role_lnk` (`id`, `permission_id`, `role_id`, `permission_ord`) VALUES
(1, 1, 1, 1),
(2, 3, 1, 1),
(3, 2, 1, 1),
(4, 4, 2, 1),
(5, 5, 2, 1),
(6, 11, 2, 1),
(7, 6, 2, 1),
(8, 8, 2, 2),
(9, 10, 2, 2),
(10, 9, 2, 2),
(11, 7, 2, 2),
(12, 12, 2, 3),
(13, 13, 2, 3),
(14, 15, 2, 4),
(15, 14, 2, 4),
(16, 17, 1, 2),
(17, 16, 1, 2),
(18, 18, 1, 2),
(19, 19, 1, 3),
(20, 20, 2, 5),
(21, 21, 2, 5),
(22, 22, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `up_roles`
--

CREATE TABLE `up_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up_roles`
--

INSERT INTO `up_roles` (`id`, `document_id`, `name`, `description`, `type`, `created_at`, `updated_at`, `published_at`, `created_by_id`, `updated_by_id`, `locale`) VALUES
(1, 'xcccndpfso0aoc7uuzs0ul5u', 'Authenticated', 'Default role given to authenticated user.', 'authenticated', '2026-04-01 16:32:00.043000', '2026-04-01 16:57:41.250000', '2026-04-01 16:32:00.043000', NULL, NULL, NULL),
(2, 'n51k7agi1sgx2c9b9ovw4z7h', 'Public', 'Default role given to unauthenticated user.', 'public', '2026-04-01 16:32:00.047000', '2026-04-01 18:03:49.618000', '2026-04-01 16:32:00.047000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_users`
--

CREATE TABLE `up_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) UNSIGNED DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `up_users_role_lnk`
--

CREATE TABLE `up_users_role_lnk` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `user_ord` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_permissions_role_lnk`
--
ALTER TABLE `admin_permissions_role_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_role_lnk_uq` (`permission_id`,`role_id`),
  ADD KEY `admin_permissions_role_lnk_fk` (`permission_id`),
  ADD KEY `admin_permissions_role_lnk_ifk` (`role_id`),
  ADD KEY `admin_permissions_role_lnk_oifk` (`permission_ord`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_roles_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_roles_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_users_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `admin_users_created_by_id_fk` (`created_by_id`),
  ADD KEY `admin_users_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `admin_users_roles_lnk`
--
ALTER TABLE `admin_users_roles_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_roles_lnk_uq` (`user_id`,`role_id`),
  ADD KEY `admin_users_roles_lnk_fk` (`user_id`),
  ADD KEY `admin_users_roles_lnk_ifk` (`role_id`),
  ADD KEY `admin_users_roles_lnk_ofk` (`role_ord`),
  ADD KEY `admin_users_roles_lnk_oifk` (`user_ord`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `articles_created_by_id_fk` (`created_by_id`),
  ADD KEY `articles_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `articles_categories_lnk`
--
ALTER TABLE `articles_categories_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_categories_lnk_uq` (`article_id`,`category_id`),
  ADD KEY `articles_categories_lnk_fk` (`article_id`),
  ADD KEY `articles_categories_lnk_ifk` (`category_id`),
  ADD KEY `articles_categories_lnk_ofk` (`category_ord`),
  ADD KEY `articles_categories_lnk_oifk` (`article_ord`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `categories_created_by_id_fk` (`created_by_id`),
  ADD KEY `categories_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_files_folder_path_index` (`folder_path`),
  ADD KEY `upload_files_created_at_index` (`created_at`),
  ADD KEY `upload_files_updated_at_index` (`updated_at`),
  ADD KEY `upload_files_name_index` (`name`),
  ADD KEY `upload_files_size_index` (`size`),
  ADD KEY `upload_files_ext_index` (`ext`),
  ADD KEY `files_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `files_created_by_id_fk` (`created_by_id`),
  ADD KEY `files_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `files_folder_lnk`
--
ALTER TABLE `files_folder_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `files_folder_lnk_uq` (`file_id`,`folder_id`),
  ADD KEY `files_folder_lnk_fk` (`file_id`),
  ADD KEY `files_folder_lnk_ifk` (`folder_id`),
  ADD KEY `files_folder_lnk_oifk` (`file_ord`);

--
-- Indexes for table `files_related_mph`
--
ALTER TABLE `files_related_mph`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_related_mph_fk` (`file_id`),
  ADD KEY `files_related_mph_oidx` (`order`),
  ADD KEY `files_related_mph_idix` (`related_id`);

--
-- Indexes for table `homepages`
--
ALTER TABLE `homepages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homepages_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `homepages_created_by_id_fk` (`created_by_id`),
  ADD KEY `homepages_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `homepages_featured_articles_lnk`
--
ALTER TABLE `homepages_featured_articles_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `homepages_featured_articles_lnk_uq` (`homepage_id`,`article_id`),
  ADD KEY `homepages_featured_articles_lnk_fk` (`homepage_id`),
  ADD KEY `homepages_featured_articles_lnk_ifk` (`article_id`),
  ADD KEY `homepages_featured_articles_lnk_ofk` (`article_ord`);

--
-- Indexes for table `homepages_hero_articles_lnk`
--
ALTER TABLE `homepages_hero_articles_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `homepages_hero_articles_lnk_uq` (`homepage_id`,`article_id`),
  ADD KEY `homepages_hero_articles_lnk_fk` (`homepage_id`),
  ADD KEY `homepages_hero_articles_lnk_ifk` (`article_id`),
  ADD KEY `homepages_hero_articles_lnk_ofk` (`article_ord`);

--
-- Indexes for table `homepages_weekly_top_articles_lnk`
--
ALTER TABLE `homepages_weekly_top_articles_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `homepages_weekly_top_articles_lnk_uq` (`homepage_id`,`article_id`),
  ADD KEY `homepages_weekly_top_articles_lnk_fk` (`homepage_id`),
  ADD KEY `homepages_weekly_top_articles_lnk_ifk` (`article_id`),
  ADD KEY `homepages_weekly_top_articles_lnk_ofk` (`article_ord`);

--
-- Indexes for table `homepages_weekly_top_titles_lnk`
--
ALTER TABLE `homepages_weekly_top_titles_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `homepages_weekly_top_titles_lnk_uq` (`homepage_id`,`article_id`),
  ADD KEY `homepages_weekly_top_titles_lnk_fk` (`homepage_id`),
  ADD KEY `homepages_weekly_top_titles_lnk_ifk` (`article_id`),
  ADD KEY `homepages_weekly_top_titles_lnk_ofk` (`article_ord`);

--
-- Indexes for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i18n_locale_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  ADD KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `menu_items_created_by_id_fk` (`created_by_id`),
  ADD KEY `menu_items_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_ai_localization_jobs`
--
ALTER TABLE `strapi_ai_localization_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_ai_metadata_jobs`
--
ALTER TABLE `strapi_ai_metadata_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_api_tokens_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_api_token_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_api_token_permissions_token_lnk`
--
ALTER TABLE `strapi_api_token_permissions_token_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_api_token_permissions_token_lnk_uq` (`api_token_permission_id`,`api_token_id`),
  ADD KEY `strapi_api_token_permissions_token_lnk_fk` (`api_token_permission_id`),
  ADD KEY `strapi_api_token_permissions_token_lnk_ifk` (`api_token_id`),
  ADD KEY `strapi_api_token_permissions_token_lnk_oifk` (`api_token_permission_ord`);

--
-- Indexes for table `strapi_core_store_settings`
--
ALTER TABLE `strapi_core_store_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_database_schema`
--
ALTER TABLE `strapi_database_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_history_versions`
--
ALTER TABLE `strapi_history_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_history_versions_created_by_id_fk` (`created_by_id`);

--
-- Indexes for table `strapi_migrations`
--
ALTER TABLE `strapi_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_migrations_internal`
--
ALTER TABLE `strapi_migrations_internal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_releases`
--
ALTER TABLE `strapi_releases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_releases_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_releases_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_releases_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_release_actions`
--
ALTER TABLE `strapi_release_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_release_actions_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_release_actions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_release_actions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_release_actions_release_lnk`
--
ALTER TABLE `strapi_release_actions_release_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_release_actions_release_lnk_uq` (`release_action_id`,`release_id`),
  ADD KEY `strapi_release_actions_release_lnk_fk` (`release_action_id`),
  ADD KEY `strapi_release_actions_release_lnk_ifk` (`release_id`),
  ADD KEY `strapi_release_actions_release_lnk_oifk` (`release_action_ord`);

--
-- Indexes for table `strapi_sessions`
--
ALTER TABLE `strapi_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_sessions_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_sessions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_sessions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_transfer_tokens_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_transfer_token_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_transfer_token_permissions_token_lnk`
--
ALTER TABLE `strapi_transfer_token_permissions_token_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_transfer_token_permissions_token_lnk_uq` (`transfer_token_permission_id`,`transfer_token_id`),
  ADD KEY `strapi_transfer_token_permissions_token_lnk_fk` (`transfer_token_permission_id`),
  ADD KEY `strapi_transfer_token_permissions_token_lnk_ifk` (`transfer_token_id`),
  ADD KEY `strapi_transfer_token_permissions_token_lnk_oifk` (`transfer_token_permission_ord`);

--
-- Indexes for table `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strapi_workflows`
--
ALTER TABLE `strapi_workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_workflows_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_workflows_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_workflows_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_workflows_stages`
--
ALTER TABLE `strapi_workflows_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strapi_workflows_stages_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `strapi_workflows_stages_created_by_id_fk` (`created_by_id`),
  ADD KEY `strapi_workflows_stages_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `strapi_workflows_stages_permissions_lnk`
--
ALTER TABLE `strapi_workflows_stages_permissions_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_workflows_stages_permissions_lnk_uq` (`workflow_stage_id`,`permission_id`),
  ADD KEY `strapi_workflows_stages_permissions_lnk_fk` (`workflow_stage_id`),
  ADD KEY `strapi_workflows_stages_permissions_lnk_ifk` (`permission_id`),
  ADD KEY `strapi_workflows_stages_permissions_lnk_ofk` (`permission_ord`);

--
-- Indexes for table `strapi_workflows_stages_workflow_lnk`
--
ALTER TABLE `strapi_workflows_stages_workflow_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_workflows_stages_workflow_lnk_uq` (`workflow_stage_id`,`workflow_id`),
  ADD KEY `strapi_workflows_stages_workflow_lnk_fk` (`workflow_stage_id`),
  ADD KEY `strapi_workflows_stages_workflow_lnk_ifk` (`workflow_id`),
  ADD KEY `strapi_workflows_stages_workflow_lnk_oifk` (`workflow_stage_ord`);

--
-- Indexes for table `strapi_workflows_stage_required_to_publish_lnk`
--
ALTER TABLE `strapi_workflows_stage_required_to_publish_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `strapi_workflows_stage_required_to_publish_lnk_uq` (`workflow_id`,`workflow_stage_id`),
  ADD KEY `strapi_workflows_stage_required_to_publish_lnk_fk` (`workflow_id`),
  ADD KEY `strapi_workflows_stage_required_to_publish_lnk_ifk` (`workflow_stage_id`);

--
-- Indexes for table `upload_folders`
--
ALTER TABLE `upload_folders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  ADD UNIQUE KEY `upload_folders_path_index` (`path`),
  ADD KEY `upload_folders_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  ADD KEY `upload_folders_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `upload_folders_parent_lnk`
--
ALTER TABLE `upload_folders_parent_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upload_folders_parent_lnk_uq` (`folder_id`,`inv_folder_id`),
  ADD KEY `upload_folders_parent_lnk_fk` (`folder_id`),
  ADD KEY `upload_folders_parent_lnk_ifk` (`inv_folder_id`),
  ADD KEY `upload_folders_parent_lnk_oifk` (`folder_ord`);

--
-- Indexes for table `up_permissions`
--
ALTER TABLE `up_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_permissions_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_permissions_role_lnk`
--
ALTER TABLE `up_permissions_role_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `up_permissions_role_lnk_uq` (`permission_id`,`role_id`),
  ADD KEY `up_permissions_role_lnk_fk` (`permission_id`),
  ADD KEY `up_permissions_role_lnk_ifk` (`role_id`),
  ADD KEY `up_permissions_role_lnk_oifk` (`permission_ord`);

--
-- Indexes for table `up_roles`
--
ALTER TABLE `up_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_roles_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `up_roles_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_roles_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_users`
--
ALTER TABLE `up_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `up_users_documents_idx` (`document_id`,`locale`,`published_at`),
  ADD KEY `up_users_created_by_id_fk` (`created_by_id`),
  ADD KEY `up_users_updated_by_id_fk` (`updated_by_id`);

--
-- Indexes for table `up_users_role_lnk`
--
ALTER TABLE `up_users_role_lnk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `up_users_role_lnk_uq` (`user_id`,`role_id`),
  ADD KEY `up_users_role_lnk_fk` (`user_id`),
  ADD KEY `up_users_role_lnk_ifk` (`role_id`),
  ADD KEY `up_users_role_lnk_oifk` (`user_ord`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `admin_permissions_role_lnk`
--
ALTER TABLE `admin_permissions_role_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users_roles_lnk`
--
ALTER TABLE `admin_users_roles_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `articles_categories_lnk`
--
ALTER TABLE `articles_categories_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `files_folder_lnk`
--
ALTER TABLE `files_folder_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files_related_mph`
--
ALTER TABLE `files_related_mph`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `homepages`
--
ALTER TABLE `homepages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homepages_featured_articles_lnk`
--
ALTER TABLE `homepages_featured_articles_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homepages_hero_articles_lnk`
--
ALTER TABLE `homepages_hero_articles_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homepages_weekly_top_articles_lnk`
--
ALTER TABLE `homepages_weekly_top_articles_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homepages_weekly_top_titles_lnk`
--
ALTER TABLE `homepages_weekly_top_titles_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `strapi_ai_localization_jobs`
--
ALTER TABLE `strapi_ai_localization_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_ai_metadata_jobs`
--
ALTER TABLE `strapi_ai_metadata_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_api_token_permissions_token_lnk`
--
ALTER TABLE `strapi_api_token_permissions_token_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_core_store_settings`
--
ALTER TABLE `strapi_core_store_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `strapi_database_schema`
--
ALTER TABLE `strapi_database_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `strapi_history_versions`
--
ALTER TABLE `strapi_history_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_migrations`
--
ALTER TABLE `strapi_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_migrations_internal`
--
ALTER TABLE `strapi_migrations_internal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `strapi_releases`
--
ALTER TABLE `strapi_releases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_release_actions`
--
ALTER TABLE `strapi_release_actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_release_actions_release_lnk`
--
ALTER TABLE `strapi_release_actions_release_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_sessions`
--
ALTER TABLE `strapi_sessions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_transfer_token_permissions_token_lnk`
--
ALTER TABLE `strapi_transfer_token_permissions_token_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_webhooks`
--
ALTER TABLE `strapi_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_workflows`
--
ALTER TABLE `strapi_workflows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_workflows_stages`
--
ALTER TABLE `strapi_workflows_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_workflows_stages_permissions_lnk`
--
ALTER TABLE `strapi_workflows_stages_permissions_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_workflows_stages_workflow_lnk`
--
ALTER TABLE `strapi_workflows_stages_workflow_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strapi_workflows_stage_required_to_publish_lnk`
--
ALTER TABLE `strapi_workflows_stage_required_to_publish_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upload_folders`
--
ALTER TABLE `upload_folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upload_folders_parent_lnk`
--
ALTER TABLE `upload_folders_parent_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `up_permissions`
--
ALTER TABLE `up_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `up_permissions_role_lnk`
--
ALTER TABLE `up_permissions_role_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `up_roles`
--
ALTER TABLE `up_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `up_users`
--
ALTER TABLE `up_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `up_users_role_lnk`
--
ALTER TABLE `up_users_role_lnk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_permissions_role_lnk`
--
ALTER TABLE `admin_permissions_role_lnk`
  ADD CONSTRAINT `admin_permissions_role_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_permissions_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_users_roles_lnk`
--
ALTER TABLE `admin_users_roles_lnk`
  ADD CONSTRAINT `admin_users_roles_lnk_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_users_roles_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `articles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `articles_categories_lnk`
--
ALTER TABLE `articles_categories_lnk`
  ADD CONSTRAINT `articles_categories_lnk_fk` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `articles_categories_lnk_ifk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `files_folder_lnk`
--
ALTER TABLE `files_folder_lnk`
  ADD CONSTRAINT `files_folder_lnk_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `files_folder_lnk_ifk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files_related_mph`
--
ALTER TABLE `files_related_mph`
  ADD CONSTRAINT `files_related_mph_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homepages`
--
ALTER TABLE `homepages`
  ADD CONSTRAINT `homepages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `homepages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `homepages_featured_articles_lnk`
--
ALTER TABLE `homepages_featured_articles_lnk`
  ADD CONSTRAINT `homepages_featured_articles_lnk_fk` FOREIGN KEY (`homepage_id`) REFERENCES `homepages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homepages_featured_articles_lnk_ifk` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homepages_hero_articles_lnk`
--
ALTER TABLE `homepages_hero_articles_lnk`
  ADD CONSTRAINT `homepages_hero_articles_lnk_fk` FOREIGN KEY (`homepage_id`) REFERENCES `homepages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homepages_hero_articles_lnk_ifk` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homepages_weekly_top_articles_lnk`
--
ALTER TABLE `homepages_weekly_top_articles_lnk`
  ADD CONSTRAINT `homepages_weekly_top_articles_lnk_fk` FOREIGN KEY (`homepage_id`) REFERENCES `homepages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homepages_weekly_top_articles_lnk_ifk` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homepages_weekly_top_titles_lnk`
--
ALTER TABLE `homepages_weekly_top_titles_lnk`
  ADD CONSTRAINT `homepages_weekly_top_titles_lnk_fk` FOREIGN KEY (`homepage_id`) REFERENCES `homepages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homepages_weekly_top_titles_lnk_ifk` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `i18n_locale`
--
ALTER TABLE `i18n_locale`
  ADD CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `menu_items_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_api_tokens`
--
ALTER TABLE `strapi_api_tokens`
  ADD CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_api_token_permissions`
--
ALTER TABLE `strapi_api_token_permissions`
  ADD CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_api_token_permissions_token_lnk`
--
ALTER TABLE `strapi_api_token_permissions_token_lnk`
  ADD CONSTRAINT `strapi_api_token_permissions_token_lnk_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_api_token_permissions_token_lnk_ifk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_history_versions`
--
ALTER TABLE `strapi_history_versions`
  ADD CONSTRAINT `strapi_history_versions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_releases`
--
ALTER TABLE `strapi_releases`
  ADD CONSTRAINT `strapi_releases_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_releases_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_release_actions`
--
ALTER TABLE `strapi_release_actions`
  ADD CONSTRAINT `strapi_release_actions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_release_actions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_release_actions_release_lnk`
--
ALTER TABLE `strapi_release_actions_release_lnk`
  ADD CONSTRAINT `strapi_release_actions_release_lnk_fk` FOREIGN KEY (`release_action_id`) REFERENCES `strapi_release_actions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_release_actions_release_lnk_ifk` FOREIGN KEY (`release_id`) REFERENCES `strapi_releases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_sessions`
--
ALTER TABLE `strapi_sessions`
  ADD CONSTRAINT `strapi_sessions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_sessions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_transfer_tokens`
--
ALTER TABLE `strapi_transfer_tokens`
  ADD CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_transfer_token_permissions`
--
ALTER TABLE `strapi_transfer_token_permissions`
  ADD CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_transfer_token_permissions_token_lnk`
--
ALTER TABLE `strapi_transfer_token_permissions_token_lnk`
  ADD CONSTRAINT `strapi_transfer_token_permissions_token_lnk_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_transfer_token_permissions_token_lnk_ifk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_workflows`
--
ALTER TABLE `strapi_workflows`
  ADD CONSTRAINT `strapi_workflows_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_workflows_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_workflows_stages`
--
ALTER TABLE `strapi_workflows_stages`
  ADD CONSTRAINT `strapi_workflows_stages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `strapi_workflows_stages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `strapi_workflows_stages_permissions_lnk`
--
ALTER TABLE `strapi_workflows_stages_permissions_lnk`
  ADD CONSTRAINT `strapi_workflows_stages_permissions_lnk_fk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_workflows_stages_permissions_lnk_ifk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_workflows_stages_workflow_lnk`
--
ALTER TABLE `strapi_workflows_stages_workflow_lnk`
  ADD CONSTRAINT `strapi_workflows_stages_workflow_lnk_fk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_workflows_stages_workflow_lnk_ifk` FOREIGN KEY (`workflow_id`) REFERENCES `strapi_workflows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `strapi_workflows_stage_required_to_publish_lnk`
--
ALTER TABLE `strapi_workflows_stage_required_to_publish_lnk`
  ADD CONSTRAINT `strapi_workflows_stage_required_to_publish_lnk_fk` FOREIGN KEY (`workflow_id`) REFERENCES `strapi_workflows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `strapi_workflows_stage_required_to_publish_lnk_ifk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `upload_folders`
--
ALTER TABLE `upload_folders`
  ADD CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `upload_folders_parent_lnk`
--
ALTER TABLE `upload_folders_parent_lnk`
  ADD CONSTRAINT `upload_folders_parent_lnk_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `upload_folders_parent_lnk_ifk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `up_permissions`
--
ALTER TABLE `up_permissions`
  ADD CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_permissions_role_lnk`
--
ALTER TABLE `up_permissions_role_lnk`
  ADD CONSTRAINT `up_permissions_role_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `up_permissions_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `up_roles`
--
ALTER TABLE `up_roles`
  ADD CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_users`
--
ALTER TABLE `up_users`
  ADD CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `up_users_role_lnk`
--
ALTER TABLE `up_users_role_lnk`
  ADD CONSTRAINT `up_users_role_lnk_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `up_users_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
