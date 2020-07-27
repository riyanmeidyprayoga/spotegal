-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2020 at 11:44 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spotegal`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed`
--

CREATE TABLE `feed` (
  `id` int(11) NOT NULL,
  `idMember` int(11) DEFAULT NULL,
  `idSpot` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `caption` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feed`
--

INSERT INTO `feed` (`id`, `idMember`, `idSpot`, `createdDate`, `photo`, `caption`) VALUES
(1, 1, 1, '2020-06-13 00:00:00', '1687726161.jpg', 'Test'),
(2, 1, 1, '2020-06-13 00:00:00', '1687726161.jpg', 'Test'),
(3, 1, 1, '2020-06-13 00:00:00', '1687726161.jpg', 'Baru'),
(8, 1, 1, '2020-06-13 15:15:39', '13062020151539image_picker8416800411248704446.jpg', 'Spotnya Keren'),
(9, 1, 1, '2020-06-13 15:16:17', '13062020151617image_picker2098305423856426692.jpg', 'Again'),
(10, 1, 1, '2020-06-13 15:20:56', '13062020152056image_picker2167304523946742731.jpg', ''),
(11, 1, 1, '2020-06-13 15:21:26', '13062020152126image_picker3586796228488533861.jpg', 'Test'),
(12, 1, 1, '2020-06-13 15:22:40', '13062020152240image_picker3257801237527146174.jpg', ''),
(13, 1, 1, '2020-06-13 15:22:49', '13062020152249image_picker9033309892984039819.jpg', ''),
(15, 1, 5, '2020-06-13 16:30:45', '13062020163045image_picker7335297470149856068.jpg', ''),
(16, 1, 3, '2020-06-13 16:35:33', '13062020163533image_picker5398372709508234787.jpg', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `feedbyTempat`
-- (See below for the actual view)
--
CREATE TABLE `feedbyTempat` (
`id` int(11)
,`idMember` int(11)
,`idSpot` int(11)
,`createdDate` datetime
,`photo` text
,`caption` text
,`nm_spot` varchar(255)
,`namaLengkap` text
,`idUploaders` int(11)
,`photoUploaders` text
,`id_tempat` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `likeFeed`
--

CREATE TABLE `likeFeed` (
  `id` int(11) NOT NULL,
  `idUsers` int(11) DEFAULT NULL,
  `idFeed` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `likeTempatWisata`
--

CREATE TABLE `likeTempatWisata` (
  `id` int(11) NOT NULL,
  `idTempat` int(11) DEFAULT NULL,
  `idMember` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `email` text DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `namaLengkap` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `phone` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `email`, `createdDate`, `namaLengkap`, `photo`, `phone`) VALUES
(1, 'cybereyecommunity@gmail.com', '2020-06-13 04:46:18', 'Edi Kurniawan', 'https://lh3.googleusercontent.com/a-/AOh14GjQVE9Zkqftgz_6O0fuozxzmQ8d1w90BmJSJvbnxg=s96-c', '085642990808'),
(2, 'bramanabram2@gmail.com', '2020-06-13 08:47:30', 'Bram', 'https://lh3.googleusercontent.com/-Vqcpa1b05FM/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclL4uKAJe65QzrgIYYP6thgdCi9yA/s96-c/photo.jpg', '085642990808');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_10_12_183023_create_tb_spot_table', 1),
(5, '2019_10_12_183115_create_tb_tempat_table', 1),
(6, '2019_10_12_183646_create_tb_tempat_kt_table', 1),
(7, '2019_10_12_185828_create_tb_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_logs`
--

CREATE TABLE `tb_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_logs`
--

INSERT INTO `tb_logs` (`id`, `id_user`, `act`, `created_at`, `updated_at`) VALUES
(1, '1', 'on Tempat', '2019-11-06 13:07:53', '2019-11-06 13:07:53'),
(2, '1', 'on Tempat', '2019-11-06 13:08:13', '2019-11-06 13:08:13'),
(3, '1', 'on Tempat', '2019-11-06 13:11:33', '2019-11-06 13:11:33'),
(4, '1', 'on Spot', '2019-11-06 13:11:40', '2019-11-06 13:11:40'),
(5, '1', 'on Spot', '2019-11-06 13:11:52', '2019-11-06 13:11:52'),
(6, '1', 'on Spot', '2019-11-06 13:12:54', '2019-11-06 13:12:54'),
(7, '1', 'on Spot', '2019-11-06 13:13:15', '2019-11-06 13:13:15'),
(8, '1', 'on Spot', '2019-11-06 13:13:39', '2019-11-06 13:13:39'),
(9, '1', 'on Spot', '2019-11-06 13:14:20', '2019-11-06 13:14:20'),
(10, '1', 'on Spot', '2019-11-06 13:14:55', '2019-11-06 13:14:55'),
(11, '1', 'on Spot', '2019-11-06 13:15:22', '2019-11-06 13:15:22'),
(12, '1', 'on Tempat', '2019-11-06 13:15:33', '2019-11-06 13:15:33'),
(13, '1', 'on Tempat', '2019-11-06 13:15:39', '2019-11-06 13:15:39'),
(14, '1', 'on Spot', '2019-11-06 13:15:41', '2019-11-06 13:15:41'),
(15, '1', 'on Spot', '2019-11-06 13:16:07', '2019-11-06 13:16:07'),
(16, '1', 'on Tempat', '2019-11-06 13:19:27', '2019-11-06 13:19:27'),
(17, '1', 'on Spot', '2019-11-06 13:19:37', '2019-11-06 13:19:37'),
(18, '1', 'on Spot', '2019-11-06 13:19:47', '2019-11-06 13:19:47'),
(19, '1', 'on Spot', '2019-11-06 13:19:59', '2019-11-06 13:19:59'),
(20, '1', 'on Spot', '2019-11-06 13:20:44', '2019-11-06 13:20:44'),
(21, '1', 'on Spot', '2019-11-06 13:21:19', '2019-11-06 13:21:19'),
(22, '1', 'on Spot', '2019-11-06 13:21:44', '2019-11-06 13:21:44'),
(23, '1', 'on Spot', '2019-11-06 13:22:41', '2019-11-06 13:22:41'),
(24, '1', 'on Spot', '2019-11-06 13:23:04', '2019-11-06 13:23:04'),
(25, '1', 'on Spot', '2019-11-06 13:23:36', '2019-11-06 13:23:36'),
(26, '1', 'on Spot', '2019-11-06 13:24:06', '2019-11-06 13:24:06'),
(27, '1', 'on Spot', '2019-11-06 13:24:18', '2019-11-06 13:24:18'),
(28, '1', 'on Spot', '2019-11-06 13:25:51', '2019-11-06 13:25:51'),
(29, '1', 'on Spot', '2019-11-06 13:29:35', '2019-11-06 13:29:35'),
(30, '1', 'on Spot', '2019-11-06 13:29:43', '2019-11-06 13:29:43'),
(31, '1', 'on Mengupdate Spot', '2019-11-06 13:34:34', '2019-11-06 13:34:34'),
(32, '1', 'on Spot', '2019-11-06 13:34:35', '2019-11-06 13:34:35'),
(33, '1', 'on Mengupdate Spot', '2019-11-06 13:34:46', '2019-11-06 13:34:46'),
(34, '1', 'on Spot', '2019-11-06 13:34:46', '2019-11-06 13:34:46'),
(35, '1', 'on Spot', '2019-11-06 13:40:29', '2019-11-06 13:40:29'),
(36, '1', 'on Mengupdate Spot', '2019-11-06 13:40:35', '2019-11-06 13:40:35'),
(37, '1', 'on Spot', '2019-11-06 13:40:35', '2019-11-06 13:40:35'),
(38, '1', 'on Spot', '2019-11-06 13:47:24', '2019-11-06 13:47:24'),
(39, '1', 'on Spot', '2019-11-06 13:48:28', '2019-11-06 13:48:28'),
(40, '1', 'on Spot', '2019-11-06 13:48:38', '2019-11-06 13:48:38'),
(41, '1', 'on Mengupdate Spot', '2019-11-06 13:49:48', '2019-11-06 13:49:48'),
(42, '1', 'on Spot', '2019-11-06 13:49:48', '2019-11-06 13:49:48'),
(43, '1', 'on Spot', '2019-11-06 13:50:55', '2019-11-06 13:50:55'),
(44, '1', 'on Spot', '2019-11-06 13:51:37', '2019-11-06 13:51:37'),
(45, '1', 'on Spot', '2019-11-06 13:51:54', '2019-11-06 13:51:54'),
(46, '1', 'on Mengupdate Spot', '2019-11-06 13:52:22', '2019-11-06 13:52:22'),
(47, '1', 'on Spot', '2019-11-06 13:52:22', '2019-11-06 13:52:22'),
(48, '1', 'on Spot', '2019-11-06 13:54:09', '2019-11-06 13:54:09'),
(49, '1', 'on Spot', '2019-11-06 13:55:24', '2019-11-06 13:55:24'),
(50, '1', 'on Mengupdate Spot', '2019-11-06 13:55:41', '2019-11-06 13:55:41'),
(51, '1', 'on Spot', '2019-11-06 13:55:41', '2019-11-06 13:55:41'),
(52, '1', 'on log aktifitas', '2019-11-06 13:56:59', '2019-11-06 13:56:59'),
(53, '1', 'on Tempat', '2019-11-06 13:57:04', '2019-11-06 13:57:04'),
(54, '1', 'on Spot', '2019-11-06 13:57:09', '2019-11-06 13:57:09'),
(55, '1', 'on Spot', '2019-11-06 13:58:05', '2019-11-06 13:58:05'),
(56, '1', 'on Spot', '2019-11-06 13:58:22', '2019-11-06 13:58:22'),
(57, '1', 'on Mengupdate Spot', '2019-11-06 13:58:32', '2019-11-06 13:58:32'),
(58, '1', 'on Spot', '2019-11-06 13:58:32', '2019-11-06 13:58:32'),
(59, '1', 'on Mengupdate Spot', '2019-11-06 13:58:52', '2019-11-06 13:58:52'),
(60, '1', 'on Spot', '2019-11-06 13:58:52', '2019-11-06 13:58:52'),
(61, '1', 'on Spot', '2019-11-06 13:59:32', '2019-11-06 13:59:32'),
(62, '1', 'on Spot', '2019-11-06 13:59:53', '2019-11-06 13:59:53'),
(63, '1', 'on Spot', '2019-11-06 14:00:07', '2019-11-06 14:00:07'),
(64, '1', 'on Spot', '2019-11-06 14:13:25', '2019-11-06 14:13:25'),
(65, '1', 'on Spot', '2019-11-06 14:14:22', '2019-11-06 14:14:22'),
(66, '1', 'on Spot', '2019-11-06 14:14:58', '2019-11-06 14:14:58'),
(67, '1', 'on Spot', '2019-11-06 14:15:23', '2019-11-06 14:15:23'),
(68, '1', 'on Tempat', '2019-11-06 14:15:40', '2019-11-06 14:15:40'),
(69, '1', 'on log aktifitas', '2019-11-06 14:15:56', '2019-11-06 14:15:56'),
(70, '1', 'on Tempat', '2019-11-06 14:16:04', '2019-11-06 14:16:04'),
(71, '1', 'on Tempat', '2019-11-06 14:16:42', '2019-11-06 14:16:42'),
(72, '1', 'on Tempat', '2019-11-06 14:17:04', '2019-11-06 14:17:04'),
(73, '1', 'on Tempat', '2019-11-06 14:17:17', '2019-11-06 14:17:17'),
(74, '1', 'on Spot', '2019-11-06 14:17:23', '2019-11-06 14:17:23'),
(75, '1', 'on Spot', '2019-11-06 14:18:17', '2019-11-06 14:18:17'),
(76, '1', 'on Spot', '2019-11-06 14:19:10', '2019-11-06 14:19:10'),
(77, '1', 'on Spot', '2019-11-06 14:19:32', '2019-11-06 14:19:32'),
(78, '1', 'on Spot', '2019-11-06 14:20:04', '2019-11-06 14:20:04'),
(79, '1', 'on Spot', '2019-11-06 14:20:58', '2019-11-06 14:20:58'),
(80, '1', 'on Spot', '2019-11-06 14:21:18', '2019-11-06 14:21:18'),
(81, '1', 'on Spot', '2019-11-06 14:22:52', '2019-11-06 14:22:52'),
(82, '1', 'on Spot', '2019-11-06 14:23:02', '2019-11-06 14:23:02'),
(83, '1', 'on Spot', '2019-11-06 14:24:01', '2019-11-06 14:24:01'),
(84, '1', 'on Spot', '2019-11-06 14:24:14', '2019-11-06 14:24:14'),
(85, '1', 'on Spot', '2019-11-06 14:24:37', '2019-11-06 14:24:37'),
(86, '1', 'on Tempat', '2019-11-06 14:25:27', '2019-11-06 14:25:27'),
(87, '1', 'on Spot', '2019-11-06 14:26:03', '2019-11-06 14:26:03'),
(88, '1', 'on Spot', '2019-11-06 14:26:42', '2019-11-06 14:26:42'),
(89, '1', 'on Spot', '2019-11-06 14:27:00', '2019-11-06 14:27:00'),
(90, '1', 'on beranda', '2019-11-06 14:28:03', '2019-11-06 14:28:03'),
(91, '1', 'on Spot', '2019-11-06 14:28:47', '2019-11-06 14:28:47'),
(92, '1', 'on Spot', '2019-11-06 14:28:51', '2019-11-06 14:28:51'),
(93, '1', 'on Tempat', '2019-11-06 14:28:53', '2019-11-06 14:28:53'),
(94, '1', 'on Tempat', '2019-11-06 14:30:41', '2019-11-06 14:30:41'),
(95, '1', 'on Spot', '2019-11-06 14:31:31', '2019-11-06 14:31:31'),
(96, '1', 'on Spot', '2019-11-06 14:32:32', '2019-11-06 14:32:32'),
(97, '1', 'on Tempat', '2019-11-06 14:32:42', '2019-11-06 14:32:42'),
(98, '1', 'on Tempat', '2019-11-06 14:32:47', '2019-11-06 14:32:47'),
(99, '1', 'on Tempat', '2019-11-06 14:33:00', '2019-11-06 14:33:00'),
(100, '1', 'on Tempat', '2019-11-06 14:33:08', '2019-11-06 14:33:08'),
(101, '1', 'on Spot', '2019-11-06 14:33:12', '2019-11-06 14:33:12'),
(102, '1', 'on Tempat', '2019-11-06 14:33:24', '2019-11-06 14:33:24'),
(103, '1', 'on beranda', '2019-11-06 14:36:02', '2019-11-06 14:36:02'),
(104, '1', 'on Tempat', '2019-11-06 14:42:39', '2019-11-06 14:42:39'),
(105, '1', 'on beranda', '2019-11-06 14:44:10', '2019-11-06 14:44:10'),
(106, '1', 'on Spot', '2019-11-07 13:54:28', '2019-11-07 13:54:28'),
(107, '1', 'on Tempat', '2019-11-07 13:54:34', '2019-11-07 13:54:34'),
(108, '1', 'on Tempat', '2019-11-07 13:54:36', '2019-11-07 13:54:36'),
(109, '1', 'on Menambah Tempat', '2019-11-07 13:54:59', '2019-11-07 13:54:59'),
(110, '1', 'on Tempat', '2019-11-07 13:55:00', '2019-11-07 13:55:00'),
(111, '1', 'on Menghapus Tempat', '2019-11-07 13:55:15', '2019-11-07 13:55:15'),
(112, '1', 'on Tempat', '2019-11-07 13:55:15', '2019-11-07 13:55:15'),
(113, '1', 'on Tempat', '2019-11-07 14:03:54', '2019-11-07 14:03:54'),
(114, '1', 'on Tempat', '2019-11-07 14:04:15', '2019-11-07 14:04:15'),
(115, '1', 'on Tempat', '2019-11-07 14:09:26', '2019-11-07 14:09:26'),
(116, '1', 'on Tempat', '2019-11-07 14:09:53', '2019-11-07 14:09:53'),
(117, '1', 'on Spot', '2019-11-07 14:49:37', '2019-11-07 14:49:37'),
(118, '1', 'on Mengupdate Spot', '2019-11-07 14:49:49', '2019-11-07 14:49:49'),
(119, '1', 'on Spot', '2019-11-07 14:49:50', '2019-11-07 14:49:50'),
(120, '1', 'on Mengupdate Spot', '2019-11-07 14:49:58', '2019-11-07 14:49:58'),
(121, '1', 'on Spot', '2019-11-07 14:49:59', '2019-11-07 14:49:59'),
(122, '1', 'on Tempat', '2019-11-07 15:40:03', '2019-11-07 15:40:03'),
(123, '1', 'on Mengupdate Tempat', '2019-11-07 15:40:17', '2019-11-07 15:40:17'),
(124, '1', 'on Tempat', '2019-11-07 15:40:17', '2019-11-07 15:40:17'),
(125, '1', 'on Spot', '2019-11-07 17:18:02', '2019-11-07 17:18:02'),
(126, '1', 'on Mengupdate Spot', '2019-11-07 17:18:11', '2019-11-07 17:18:11'),
(127, '1', 'on Spot', '2019-11-07 17:18:11', '2019-11-07 17:18:11'),
(128, '1', 'on Spot', '2019-11-07 17:26:49', '2019-11-07 17:26:49'),
(129, '1', 'on Spot', '2019-11-07 17:29:42', '2019-11-07 17:29:42'),
(130, '1', 'on Spot', '2019-11-07 17:32:36', '2019-11-07 17:32:36'),
(131, '1', 'on Mengupdate Spot', '2019-11-07 17:33:36', '2019-11-07 17:33:36'),
(132, '1', 'on Spot', '2019-11-07 17:33:36', '2019-11-07 17:33:36'),
(133, '1', 'on Mengupdate Spot', '2019-11-07 17:34:22', '2019-11-07 17:34:22'),
(134, '1', 'on Spot', '2019-11-07 17:34:22', '2019-11-07 17:34:22'),
(135, '1', 'on beranda', '2019-11-07 18:39:49', '2019-11-07 18:39:49'),
(136, '1', 'on Tempat', '2019-11-07 18:40:30', '2019-11-07 18:40:30'),
(137, '1', 'on Spot', '2019-11-08 10:30:08', '2019-11-08 10:30:08'),
(138, '1', 'on Tempat', '2019-11-08 10:30:13', '2019-11-08 10:30:13'),
(139, '1', 'on Spot', '2019-11-09 13:46:28', '2019-11-09 13:46:28'),
(140, '1', 'on Spot', '2019-11-09 13:48:07', '2019-11-09 13:48:07'),
(141, '1', 'on Mengupdate Spot', '2019-11-09 13:50:13', '2019-11-09 13:50:13'),
(142, '1', 'on Spot', '2019-11-09 13:50:14', '2019-11-09 13:50:14'),
(143, '1', 'on Tempat', '2019-11-10 05:42:25', '2019-11-10 05:42:25'),
(144, '1', 'on Mengupdate Tempat', '2019-11-10 05:42:49', '2019-11-10 05:42:49'),
(145, '1', 'on Tempat', '2019-11-10 05:42:50', '2019-11-10 05:42:50'),
(146, '1', 'on Mengupdate Tempat', '2019-11-10 05:43:40', '2019-11-10 05:43:40'),
(147, '1', 'on Tempat', '2019-11-10 05:43:40', '2019-11-10 05:43:40'),
(148, '1', 'on Tempat', '2019-11-11 10:47:51', '2019-11-11 10:47:51'),
(149, '1', 'on Spot', '2019-11-12 08:06:37', '2019-11-12 08:06:37'),
(150, '1', 'on Spot', '2019-11-12 08:09:52', '2019-11-12 08:09:52'),
(151, '1', 'on beranda', '2019-11-12 08:10:38', '2019-11-12 08:10:38'),
(152, '1', 'on Tempat', '2019-11-12 08:10:44', '2019-11-12 08:10:44'),
(153, '1', 'on Tempat', '2019-11-12 08:12:18', '2019-11-12 08:12:18'),
(154, '1', 'on Tempat', '2019-11-12 08:13:05', '2019-11-12 08:13:05'),
(155, '1', 'on Tempat', '2019-11-12 08:13:54', '2019-11-12 08:13:54'),
(156, '1', 'on Tempat', '2019-11-12 08:22:26', '2019-11-12 08:22:26'),
(157, '1', 'on Tempat', '2019-11-12 08:22:30', '2019-11-12 08:22:30'),
(158, '1', 'on Spot', '2019-11-12 08:22:34', '2019-11-12 08:22:34'),
(159, '1', 'on Tempat', '2019-11-12 09:05:35', '2019-11-12 09:05:35'),
(160, '1', 'on Tempat', '2019-11-12 09:05:40', '2019-11-12 09:05:40'),
(161, '1', 'on Spot', '2019-11-12 09:05:46', '2019-11-12 09:05:46'),
(162, '1', 'on log aktifitas', '2019-11-12 09:05:50', '2019-11-12 09:05:50'),
(163, '1', 'on beranda', '2019-11-12 09:53:40', '2019-11-12 09:53:40'),
(164, '1', 'on log aktifitas', '2019-11-12 09:53:47', '2019-11-12 09:53:47'),
(165, '1', 'on Tempat', '2019-11-12 10:39:19', '2019-11-12 10:39:19'),
(166, '1', 'on Tempat', '2019-11-12 10:40:17', '2019-11-12 10:40:17'),
(167, '1', 'on Tempat', '2019-11-12 10:40:31', '2019-11-12 10:40:31'),
(168, '1', 'on Spot', '2019-11-14 03:35:31', '2019-11-14 03:35:31'),
(169, '1', 'on Spot', '2019-11-14 03:41:52', '2019-11-14 03:41:52'),
(170, '1', 'on Spot', '2019-11-14 03:42:31', '2019-11-14 03:42:31'),
(171, '1', 'on Tempat', '2019-11-14 03:42:35', '2019-11-14 03:42:35'),
(172, '1', 'on Tempat', '2019-11-14 03:42:38', '2019-11-14 03:42:38'),
(173, '1', 'on Spot', '2019-11-14 03:42:41', '2019-11-14 03:42:41'),
(174, '1', 'on Tempat', '2019-11-14 03:44:54', '2019-11-14 03:44:54'),
(175, '1', 'on Menambah Tempat', '2019-11-14 03:45:26', '2019-11-14 03:45:26'),
(176, '1', 'on Tempat', '2019-11-14 03:45:26', '2019-11-14 03:45:26'),
(177, '1', 'on Tempat', '2019-11-14 03:47:48', '2019-11-14 03:47:48'),
(178, '1', 'on Menghapus Tempat', '2019-11-14 03:47:52', '2019-11-14 03:47:52'),
(179, '1', 'on Tempat', '2019-11-14 03:47:52', '2019-11-14 03:47:52'),
(180, '1', 'on Menambah Tempat', '2019-11-14 03:49:25', '2019-11-14 03:49:25'),
(181, '1', 'on Tempat', '2019-11-14 03:49:25', '2019-11-14 03:49:25'),
(182, '1', 'on Mengupdate Tempat', '2019-11-14 03:49:42', '2019-11-14 03:49:42'),
(183, '1', 'on Tempat', '2019-11-14 03:49:42', '2019-11-14 03:49:42'),
(184, '1', 'on Menghapus Tempat', '2019-11-14 03:49:54', '2019-11-14 03:49:54'),
(185, '1', 'on Tempat', '2019-11-14 03:49:54', '2019-11-14 03:49:54'),
(186, '1', 'on Tempat', '2019-11-14 03:59:23', '2019-11-14 03:59:23'),
(187, '1', 'on Menambah Tempat', '2019-11-14 03:59:35', '2019-11-14 03:59:35'),
(188, '1', 'on Menambah Tempat', '2019-11-14 03:59:39', '2019-11-14 03:59:39'),
(189, '1', 'on Menambah Tempat', '2019-11-14 03:59:45', '2019-11-14 03:59:45'),
(190, '1', 'on Tempat', '2019-11-14 03:59:45', '2019-11-14 03:59:45'),
(191, '1', 'on Mengupdate Tempat', '2019-11-14 03:59:55', '2019-11-14 03:59:55'),
(192, '1', 'on Tempat', '2019-11-14 03:59:55', '2019-11-14 03:59:55'),
(193, '1', 'on Menghapus Tempat', '2019-11-14 03:59:59', '2019-11-14 03:59:59'),
(194, '1', 'on Tempat', '2019-11-14 03:59:59', '2019-11-14 03:59:59'),
(195, '1', 'on Spot', '2019-11-14 04:00:04', '2019-11-14 04:00:04'),
(196, '1', 'on Menambah Spot', '2019-11-14 04:00:22', '2019-11-14 04:00:22'),
(197, '1', 'on Spot', '2019-11-14 04:00:22', '2019-11-14 04:00:22'),
(198, '1', 'on Mengupdate Spot', '2019-11-14 04:00:33', '2019-11-14 04:00:33'),
(199, '1', 'on Spot', '2019-11-14 04:00:34', '2019-11-14 04:00:34'),
(200, '1', 'on Menghapus Spot', '2019-11-14 04:00:39', '2019-11-14 04:00:39'),
(201, '1', 'on Spot', '2019-11-14 04:00:39', '2019-11-14 04:00:39'),
(202, '1', 'on Tempat', '2019-11-14 04:00:43', '2019-11-14 04:00:43'),
(203, '1', 'on beranda', '2019-11-14 04:00:46', '2019-11-14 04:00:46'),
(204, '1', 'on Tempat', '2019-11-14 04:01:43', '2019-11-14 04:01:43'),
(205, '1', 'on Tempat', '2019-11-15 03:11:47', '2019-11-15 03:11:47'),
(206, '1', 'on Menambah Tempat', '2019-11-15 03:12:41', '2019-11-15 03:12:41'),
(207, '1', 'on beranda', '2019-11-15 03:13:01', '2019-11-15 03:13:01'),
(208, '1', 'on beranda', '2019-11-15 03:17:28', '2019-11-15 03:17:28'),
(209, '1', 'on beranda', '2019-11-15 03:18:02', '2019-11-15 03:18:02'),
(210, '1', 'on beranda', '2019-11-15 03:25:18', '2019-11-15 03:25:18'),
(211, '1', 'on beranda', '2019-11-15 03:43:09', '2019-11-15 03:43:09'),
(212, '1', 'on beranda', '2019-11-15 03:48:59', '2019-11-15 03:48:59'),
(213, '1', 'on beranda', '2019-11-15 03:49:22', '2019-11-15 03:49:22'),
(214, '1', 'on Tempat', '2019-11-18 16:55:02', '2019-11-18 16:55:02'),
(215, '1', 'on Tempat', '2019-11-18 16:55:08', '2019-11-18 16:55:08'),
(216, '1', 'on Spot', '2019-11-18 16:55:13', '2019-11-18 16:55:13'),
(217, '1', 'on beranda', '2019-11-27 11:09:11', '2019-11-27 11:09:11'),
(218, '1', 'on beranda', '2019-11-27 11:09:39', '2019-11-27 11:09:39'),
(219, '1', 'on Tempat', '2019-11-27 11:10:50', '2019-11-27 11:10:50'),
(220, '1', 'on beranda', '2019-11-27 11:13:15', '2019-11-27 11:13:15'),
(221, '1', 'on beranda', '2019-11-27 14:48:15', '2019-11-27 14:48:15'),
(222, '1', 'on Tempat', '2019-11-27 14:49:15', '2019-11-27 14:49:15'),
(223, '1', 'on beranda', '2020-02-18 05:41:41', '2020-02-18 05:41:41'),
(224, '1', 'on Tempat', '2020-02-18 05:41:46', '2020-02-18 05:41:46'),
(225, '1', 'on log aktifitas', '2020-02-18 05:42:11', '2020-02-18 05:42:11'),
(226, '1', 'on Tempat', '2020-02-18 05:42:30', '2020-02-18 05:42:30'),
(227, '1', 'on beranda', '2020-06-03 07:55:20', '2020-06-03 07:55:20'),
(228, '1', 'on Tempat', '2020-06-03 07:55:32', '2020-06-03 07:55:32'),
(229, '1', 'on Tempat', '2020-06-03 07:55:38', '2020-06-03 07:55:38'),
(230, '1', 'on Tempat', '2020-06-03 07:55:47', '2020-06-03 07:55:47'),
(231, '1', 'on Spot', '2020-06-03 07:55:54', '2020-06-03 07:55:54'),
(232, '1', 'on Menambah Spot', '2020-06-03 07:56:04', '2020-06-03 07:56:04'),
(233, '1', 'on beranda', '2020-06-03 07:56:16', '2020-06-03 07:56:16'),
(234, '1', 'on Tempat', '2020-06-03 07:56:19', '2020-06-03 07:56:19'),
(235, '1', 'on Tempat', '2020-06-03 07:56:29', '2020-06-03 07:56:29'),
(236, '1', 'on Tempat', '2020-06-03 07:56:35', '2020-06-03 07:56:35'),
(237, '1', 'on beranda', '2020-06-03 07:57:10', '2020-06-03 07:57:10'),
(238, '1', 'on beranda', '2020-06-03 07:57:46', '2020-06-03 07:57:46'),
(239, '1', 'on beranda', '2020-06-03 07:58:11', '2020-06-03 07:58:11'),
(240, '1', 'on Tempat', '2020-06-03 07:58:44', '2020-06-03 07:58:44'),
(241, '1', 'on Tempat', '2020-06-03 07:58:57', '2020-06-03 07:58:57'),
(242, '1', 'on Spot', '2020-06-03 07:59:01', '2020-06-03 07:59:01'),
(243, '1', 'on Menambah Spot', '2020-06-03 07:59:23', '2020-06-03 07:59:23'),
(244, '1', 'on Spot', '2020-06-03 07:59:27', '2020-06-03 07:59:27'),
(245, '1', 'on Menambah Spot', '2020-06-03 07:59:32', '2020-06-03 07:59:32'),
(246, '1', 'on beranda', '2020-06-03 07:59:45', '2020-06-03 07:59:45'),
(247, '1', 'on beranda', '2020-06-03 08:06:12', '2020-06-03 08:06:12'),
(248, '1', 'on beranda', '2020-06-03 08:20:07', '2020-06-03 08:20:07'),
(249, '1', 'on beranda', '2020-06-03 08:20:51', '2020-06-03 08:20:51'),
(250, '1', 'on beranda', '2020-06-03 08:36:17', '2020-06-03 08:36:17'),
(251, '1', 'on Tempat', '2020-06-03 08:36:44', '2020-06-03 08:36:44'),
(252, '1', 'on beranda', '2020-06-03 08:58:53', '2020-06-03 08:58:53'),
(253, '1', 'on beranda', '2020-06-03 09:05:58', '2020-06-03 09:05:58'),
(254, '1', 'on Tempat', '2020-06-03 09:06:22', '2020-06-03 09:06:22'),
(255, '1', 'on Menambah Tempat', '2020-06-03 09:08:46', '2020-06-03 09:08:46'),
(256, '1', 'on Tempat', '2020-06-03 09:08:46', '2020-06-03 09:08:46'),
(257, '1', 'on Mengupdate Tempat', '2020-06-03 09:09:28', '2020-06-03 09:09:28'),
(258, '1', 'on Tempat', '2020-06-03 09:09:29', '2020-06-03 09:09:29'),
(259, '1', 'on Menghapus Tempat', '2020-06-03 09:10:21', '2020-06-03 09:10:21'),
(260, '1', 'on Tempat', '2020-06-03 09:10:22', '2020-06-03 09:10:22'),
(261, '1', 'on Tempat', '2020-06-03 09:10:43', '2020-06-03 09:10:43'),
(262, '1', 'on Menambah Tempat', '2020-06-03 09:11:22', '2020-06-03 09:11:22'),
(263, '1', 'on Tempat', '2020-06-03 09:11:22', '2020-06-03 09:11:22'),
(264, '1', 'on Menghapus Tempat', '2020-06-03 09:11:49', '2020-06-03 09:11:49'),
(265, '1', 'on Tempat', '2020-06-03 09:11:49', '2020-06-03 09:11:49'),
(266, '1', 'on Spot', '2020-06-03 09:12:10', '2020-06-03 09:12:10'),
(267, '1', 'on Menambah Spot', '2020-06-03 09:13:29', '2020-06-03 09:13:29'),
(268, '1', 'on Spot', '2020-06-03 09:13:29', '2020-06-03 09:13:29'),
(269, '1', 'on Mengupdate Spot', '2020-06-03 09:14:05', '2020-06-03 09:14:05'),
(270, '1', 'on Spot', '2020-06-03 09:14:05', '2020-06-03 09:14:05'),
(271, '1', 'on Menghapus Spot', '2020-06-03 09:14:27', '2020-06-03 09:14:27'),
(272, '1', 'on Spot', '2020-06-03 09:14:27', '2020-06-03 09:14:27'),
(273, '1', 'on log aktifitas', '2020-06-03 09:14:32', '2020-06-03 09:14:32'),
(274, '1', 'on beranda', '2020-06-04 02:23:37', '2020-06-04 02:23:37'),
(275, '1', 'on Tempat', '2020-06-04 02:24:54', '2020-06-04 02:24:54'),
(276, '1', 'on Spot', '2020-06-04 02:27:22', '2020-06-04 02:27:22'),
(277, '1', 'on Mengupdate Spot', '2020-06-04 02:27:40', '2020-06-04 02:27:40'),
(278, '1', 'on Spot', '2020-06-04 02:27:40', '2020-06-04 02:27:40'),
(279, '1', 'on Spot', '2020-06-04 02:28:31', '2020-06-04 02:28:31'),
(280, '1', 'on Tempat', '2020-06-04 02:30:18', '2020-06-04 02:30:18'),
(281, '1', 'on Tempat', '2020-06-04 02:32:55', '2020-06-04 02:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `tb_post`
--

CREATE TABLE `tb_post` (
  `id` int(11) NOT NULL,
  `id_spot` bigint(20) DEFAULT NULL,
  `idMember` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `image` text DEFAULT NULL,
  `caption` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_spot`
--

CREATE TABLE `tb_spot` (
  `id_spot` bigint(20) UNSIGNED NOT NULL,
  `nm_spot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tempat` int(10) UNSIGNED NOT NULL,
  `tkt_spot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tren_spot` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `des_spot` text CHARACTER SET latin1 NOT NULL,
  `img_spot` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_spot`
--

INSERT INTO `tb_spot` (`id_spot`, `nm_spot`, `id_tempat`, `tkt_spot`, `tren_spot`, `des_spot`, `img_spot`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'The Baron Hill Of Guci', 1, 'Rp. 15.000', '1', 'Meski sudah memasuki puncak liburan Lebaran, Minggu (9/6/2019), namun objek wisata Pemandian Air Panas Guci, Kabupaten Tegal, masih dipadati wisatawan. Hal ini terlihat dari antrean di pintu masuk area wisata sejak pukul 09.00 WIB hingga sore. Sejak H+1 diperkirakan ada 24.000 pengunjung.  â€œHari ini puncak liburan karena sebagian besar karyawan dan PNS mulai bekerja lagi pada Senin,â€ kata Kepala UPTD Pariwisata Guci Abdul Haris. Dikatakan, jumlah pengunjung Guci dari Lebaran H+1 terus meningkat. \'\'Meski sudah menjamur objek wisata lain semacam wisata desa dan beberapa destinasi namun pesona Guci tidak menyurutkan pengunjung untuk datang dari berbagai kota,\'\' katanya. Apalagi, lanjut Haris, pada liburan kali ini ada penambahan spot baru yakni The Baron Hill. Di tempat ini wisatawan dimanjakan dengan view selfie yang menarik seperti balon udara, sepeda gantung, dan rumah pohon yang instagramable. \'\'Dengan tiket Rp10.000 pengunjung bisa sepuasnya memanfaatkan spot tersebut,\'\' jelasnya. Adapun Kepala Pos Pelayanan AKP Rudi Wihartana mengatakan, antrean kendaraan  yang datang ke Guci tidak separah pada Sabtu (8/6/2019).  Berdasarkan data jumlah Kendaraan yang melintas roda dua 575 unit, roda empat 610 dan bus 14 unit.', '1687726161.jpg', NULL, '2019-11-01 08:33:30', '2019-11-07 14:49:49'),
(2, 'Sepeda Gantung', 1, 'Rp. 20.000', '0', 'Objek Wisata Guci di Kecamatan Bumijawa, Kabupaten Tegal, merupakan maskot pariwisata di daerah ini.\r\nTidak hanya wisatawan lokal yang datang, namun dari sejumlah daerah, bahkan mancanegara.\r\nBerniat menghadirkan daya tarik wisata yang tidak monoton serta untuk terus meningkatkan jumlah pengunjung, pengelola Guci akan menambah wahana lain.\r\nSetelah ada sepeda gantung yang dinamakan The Geong, beberapa wahana baru akan dihadirkan pada awal 2018 mendatang.\r\n\"Investor siap membangunnya pada 2018 besok. Pembangunan saat ini sudah berjalan,\" kata Kepala Sub Bagian Tata Usaha Unit Pelayanan Teknis Daerah (UPTD) Pengelola Objek Wisata Guci, Syamsudin, Senin (25/12/2017).\r\nWahana baru itu yakni kerete gantung (zip train), balon udara, dan flying fox.\r\nKereta gantung akan dibangun di areal parkir yang berada di dekat bukit hingga menuju ke area Pancuran 13.\r\nSedangkan balon udara, akan dibangun di puncak Guci.', '886393574.png', NULL, '2019-11-01 08:35:15', '2019-11-09 13:50:13'),
(3, 'Pemandian Guciku', 1, 'Rp. 25.000', '0', 'GUCIKU HOT WATERBOOM adalah Tempat rekreasi Waterboom Air Panas dengan Aneka Fasilitas seperti Hot Waterboom, Hotel, Villa, Restaurant dan lain lain yang kami persembahkan bagi Anda, Relasi maupun Keluarga Tercinta dengan Pemandangan dan Udara yang sejuk di kaki Gunung Slamet..', '337678376.jpg', NULL, '2019-11-01 08:38:06', '2019-11-07 17:18:11'),
(4, 'Danau Prabalintang', 3, 'Free', '1', 'menyajikan pemandangan danau yang berwarna hijau yang sangat menarik untuk berfoto', '1376744794.jpg', NULL, '2019-11-01 08:40:09', '2019-11-07 17:34:22'),
(5, 'Perahu Bebek', 2, 'Rp. 10.000', '1', 'bermain air sambil menggunakan perahu bebek dangat indah apalagi sama pacar', '406937980.jpg', NULL, '2019-11-01 08:42:00', '2019-11-07 17:33:36'),
(6, 'Jembatan Sindang Kemadu', 2, 'Free', '0', 'berfoto di jembatan sangatlah indah', '1937169044.jpg', NULL, '2019-11-01 08:43:56', '2020-06-04 02:27:40'),
(7, 'a new', 1, 'Rp. 2.134.123.423', '1', 'sdfsf', '1309018604.jpg', '2019-11-14 11:00:39', '2019-11-14 04:00:22', '2019-11-14 04:00:39'),
(8, 'jembatan baru', 1, 'Rp. 2.000', '0', 'eryter eryrtyr', '1340444.jpg', '2020-06-03 16:14:27', '2020-06-03 09:13:29', '2020-06-03 09:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tempat`
--

CREATE TABLE `tb_tempat` (
  `id_tempat` bigint(20) UNSIGNED NOT NULL,
  `nm_tempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kt_tempat` int(10) UNSIGNED NOT NULL,
  `tkt_tempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lok_tempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `des_tempat` text CHARACTER SET latin1 NOT NULL,
  `img_tempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat_tempat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_tempat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_tempat`
--

INSERT INTO `tb_tempat` (`id_tempat`, `nm_tempat`, `id_kt_tempat`, `tkt_tempat`, `lok_tempat`, `des_tempat`, `img_tempat`, `lat_tempat`, `long_tempat`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Guci', 1, 'Rp. 7.000', 'Bumijawa', 'Wisata Guci Tegal menawarkan pesona keindahan alam khas daerah pegunungan Tropis. Hal itu mulai dapat dirasakan pengunjung sejak masih dalam perjalanan. Pemandangan khas berupa Hamparan sawah, kebun strawberry, tomat, wortel, cabai, serta hutan pinus, ditambah suhu sejuk, benar benar khas objek wisata dataran tinggi.\r\nDi lokasi wisata guci Tegal, selain berendam di pemandian, pengunjung juga dapat berendam di sungai yang mengalir di tengah lokasi wisata itu. Air sungai tersebut juga air panas yang memiliki kandungan sama dengan kolam, sebab sumber airnya sama.\r\n\r\n- Sejarah Lokasi Wisata Guci Tegal\r\n\r\nPemandian pemandian air hangat Guci resmi dibuka pada tahun 1974. Asal usul tempat pemandian air panas Guci dimulai dari beberapa pihak terkait melakukan penelitian terkait keberadaan sumber air baru di wilayah ini.\r\nSetelah memang terbukti aman, barulah pada tahun 2015 pemandian Guci dibuka bagi umum. Saat belum populer seperti sekarang, hanya masyarakat sekitar memanfaatkan pemandian tersebut. Dahulu belum ada pancuran-pancuran seperti sekarang, beberapa pengunjung masih menggunakan sumber air panas berada di dibawah gua.\r\nDi bawah gua inilah sekarang akhirnya dibangun pancuran tiga belas. Disana pengunjung bisa melihat patung naga di pancuran itu.\r\n\r\n- Misteri Wisata Guci Tegal\r\n\r\nBerdasarkan cerita masyarakat lokasi, sejarah nama Guci berasal dari zaman Walisongo.\r\nUntuk menyebarkan agama Islam di Jawa Tengah bagian barat, khususnya di sekitar Tegal, diutuslah seorang wali.  Wali tersebut dibekali air yang ditempatkan di dalam sebuah guci atau poci.\r\nMasyarakat percaya bahwa air dalam guci tersebut bisa berkhasiat sehingga berbondong-bondong meminta kepada sang wali. Namun karena jumlah air tersebut jumlahnya terbatas, sedangkan masyarakat yang memintanya begitu banyak, maka sang wali kemudian menancapkan tongkatnya ke tanah. Ketika tongkatnya dicabut, secara ajaib dari lubang bekas tongkat ditancapkan mengalir air panas.\r\nAir panas tersebut sampai kini masih mengalir dan dimanfaatkan masyarakat menjadi pemandian. Lalu, tempat tersebut kemudian terkenal dengan nama Guci. Peristiwa tersebut konon terjadi tengah malam saat Malam Jumat Kliwon. Sehingga, sampai hari ini pada  malam Jumat Kliwon masih banyak masyarakat datang ke Guci untuk berendam. Mereka percaya, jika melakukan hal tersebut hajat mereka akan terkabul.\r\n\r\n- Lokasi Wisata Guci Tegal\r\n\r\nPemandian Air Panas Guci Kab Tegal terletak di provinsi Jawa Tengah, Indonesia. Tepatnya di Jl. Objek Wisata Guci, Kalengan, Sigedong, Bumijawa, Tegal, Jawa Tengah 52466.\r\n\r\n- Tiket Masuk Wisata Guci Tegal\r\n\r\nTiket masuk Wana Wisata Guci Tegal dibedakan antara anak dan dewasa, juga hari biasa dan hari libur. Saat hari biasa Dewasa dikenakan biaya  Rp5000, dan anak-anak dikenakan biaya Rp. 4.500. Biaya itu masih mesti ditambahi dengan biaya polish asuransi.\r\nSaat hari libur Dewasa dikenakan biaya  Rp. 7.000, dan anak-anak dikenakan biaya Rp. 6.500. Biaya itu juga masih mesti ditambahi dengan biaya polish asuransi.\r\n\r\n- Jam Buka Wisata Guci Tegal\r\n\r\nPemandian Air Panas Guci buka jam 06.00 dan tutup jam 21.00. Jam tutupnya mememang relatif malam. Hal ini disebabkan karena keindahan yang khas justru bisa dinikmati saat malam hari.', '1185897476.jpg', '-7.1979170302282265', '109.2018773439072', NULL, '2019-11-01 07:44:40', '2019-11-01 07:44:40'),
(2, 'Sindang Kemadu', 1, 'Rp. 5.000', 'Bumijawa', 'Satu lagi objek wisata unggulan di Kabupaten Tegal. Namanya Sindang Kemadu. Terletak di Desa Muncanglarang, Kecamatan Bumijawa, objek wisata ini menawarkan berbagai wahana yang menarik hingga menantang.\r\n\r\nObjek wisata ini terbilang baru. Kendati sudah dirintis sejak 2013 lalu, Sindang Kemadu baru diresmikan oleh Pemkab Tegal pada akhir 2016. Objek wisata ini bisa dibilang â€˜surgaâ€™ tersembunyi di daerah pegunungan Kabupaten Tegal. Karena, lokasinya berada di tengah hutan yang dekat permukiman warga.\r\nUntuk sampai ke lokasi wisata ini memang gampang-gampang susah. Meski dekat dengan jalan raya Linggapura-Bumijawa, kita mungkin butuh bertanya kepada warga sekitar, karena tidak ada papan petunjung arah atau gerbang masuk di pinggir jalan.\r\n\r\nSaat panturapost.com berkunjung, Minggu, 7 Oktober 2018, objek wisata ini ramai didatangi warga. â€œKalau hari biasa paling 500 pengunjung. Tapi akhir pekan bisa sampai 1.000 pengunjung,â€ ujar Miftahudin, salah satu pengelola Sindang Kemadu.\r\nDia menuturkan, awalnya, wisata ini hanya berbentuk mata air yang di tengah hutan pinus yang tak terawat. Saat itu, banyak warga yang memanfaatkan sindang kemadu untuk mencuci dan mandi. â€œTapi sejak 2013, warga dan kepala desa di sini memperbaiki agar jadi objek wisata,â€ jelas dia.\r\n\r\nUntuk masuk ke objek wisata ini, pengunjung dikenai retribusi Rp 4.000 per orang. Selain menawarkan pemandangan alam dan udara yang sejuk, objek wisata ini juga terdapat berbagai fasilitas dan wahana. Salah satunya sepeda bebek air. Dengan merogoh kocek Rp 15 ribu, kita bisa menikmati wahana ini sepuasnya bersama keluarga di kolam seluas 200Ã—50 meter itu.\r\nAda juga wahana sepeda gantung. Ongkosnya sama yakni Rp 15 ribu. Kita bisa menguji adrenalin dengan naik sepeda di udara. Tentu dengan pengamanan yang memenuhi standar. Selain itu ada juga fasilitas gedung pertemuan hingga kolam renang. Jika pengunjung lapar dan haus, ada warung-warung yang menjajakan makanan dan minuman.\r\n\r\nMenurut Miftahudin, saat ini objek wisata Sindang Kemadu dikelola oleh warga sekitar dan difasilitasi oleh kepala desa. Sebagian hasil retribusi digunakan untuk kemakmuran warga desa.', '743387476.jpg', '-7.1723154838751295', '109.12615082878528', NULL, '2019-11-01 07:48:46', '2019-11-01 07:51:58'),
(3, 'Prabalintang', 1, 'Rp. 10.000', 'Danasari', 'Rute Dan Harga Tiket Masuk Wisata Prabalintang Danasari â€“ Ada yang belum kenal Kota Tegal? Kota yang sangat populer dengan logat ngapaknya ini ternyata juga memiliki tempat wisata keren. Seperti tak mau ketingalan dengan kota lain, Kota Tegal kini telah memiliki wisata alam lengkap dengan fasilitas dan berbagai spot foto. Tempat Wisata ini iyalah Wana Wisata Prabalintang Danasari.\r\nTegal yang  berada di kawasan dataran tinggi Gunung Slamet memiliki kondisi alam yang mendukung. Hutan pinus yang asri dan alami merupakan daya tarik wisatawan mengunjugi lokasi wisata ini. Hal ini pula yang mendorong masyarakat Desa Danasari untuk mengembangkan potensi alam tersebut.\r\n\r\nFasilitas Wana Wisata Prabalintang Danasari Tegal\r\n\r\nFasilitas untuk kenyamanan wisatawan juga menjadi perhatian pengelola. Tempat wisata Tegal ini lengkap dengan fasilitas umum seperti toilet hingga mushola. Selain itu di tempat wisata ini juga wisatawan akan banyak menemui pejual makanan dan minuman.\r\n\r\nBukan hanya keasrian hutan pinusnya saja yang memikat dari Wisata Baru Tegal ini. Di lokasi Wisata Prabalintang ini juga tersedia banyak spot foto kekinian. Spot foto wisata Prabalintang ini antara lain seperti Rumah Pohon, Hammcok, Ayunan, Jembatan Kayu, Meja Kursi unik, dan lain-lain. Di Wisata Alam jateng ini juga terdapat kolam atau rawa alami yang akan menambah kesan eksotis.\r\n\r\nSuhu udaranya yang bersih dan sejuk tentu menjadi rileksasi tersendiri bagi wisatawan. Lokasi Wana Wisata Prabalintang ini juga menjadi salah satu spot camping di Tegal yang kian populer. Alam indah, fasilitas lengkap, Rute Dan Harga Tiket Masuk Wisata Prabalintang Danasari yang mudah dan murah menjadi alasan wisatawan mulai ramai mengunjungi tempat ini.\r\n\r\nHarga Tiket Masuk Wisata Prabalintang Danasari Oktober 2019\r\n\r\nWisatawan tidak akan salah jika mencari tempat wisata yang murah meriah di Jawa Tengah. Sebab untuk mengunjungi Wana Wisata Prabalintang ini wisatawan hanya dibebani biaya sebesar Rp. 5.000 / orang. Bahkan untuk saat ini biaya tersebut sudah termasuk biaya parir sepeda motor. Rute Dan Harga Tiket Masuk Wisata Prabalintang Danasari, selain murah rute menuju lokasi ini juga tidak lah sulit.\r\n\r\nAlamat dan Rute Wisata Prabalintang Tegal Jawa Tengah\r\n\r\nWisata Hits Tegal Jawa Tengah Wana Wisata Prabalintang Danasari ini beralamat di Jl. Raya Danasari, Ladang, Danasari, Tegal, Jawa Tengah ( Gmap ).  Wsiatawan juga dapat mengikuti rute menuju Wisata Prabalintang berikut  ini.\r\n\r\nRute menuju Wisata Prabalintang dari Tegal kota ke selatan menuju arah wisata Guci. Samapi di kawasan Guci lurus terus melalui jalan Bojong hingga sampai gardu Karang Jambu belok kiri ke arah timur. Ikuti jalan tersebut sampai ke Jalan Raya Danasari lalu ambil belok kiri dan 0,5 km lagi sampai di lokasi.', '279692758.jpg', '-7.152302684837015', '109.17820190577322', NULL, '2019-11-01 07:51:30', '2019-11-01 07:51:30'),
(4, 'Pantai Alam Indah', 2, 'Rp. 5.000', 'Tegal Timur', 'Pantai Alam Indah Tegal. Banyak yang bilang tempat ini adalah surganya tegal. Banyak yang mengatakan pula belum pergi ke Tegal bila, belum mengunjungi kawasan ini.\r\n\r\nWisata Pantai Alam Indah Tegal memang menghadirkan daya tarik yang menawan. Tidak salah bisa semua orang selalu merindukan kawasan ini.\r\n\r\nObjek wisata ini bisa dibilang memang berbeda dengan objek wisata pantai lain. Sebut saja, semua pantai di kawasan laut selatan.\r\n\r\nDimana, mereka selalu esoktis dan mempunyai daya magis cukup kuat untuk menarik wisatawan agar berkunjung lagi dan lagi. Walaupun berbeda, daya pikat tempat ini pun masih bisa terasa.\r\n\r\nMengenal Lebih Dekat Pantai Alam Indah Tegal\r\n\r\nSeperti kita tahu, bahwa tegal punya ikon wisata yang setiap orang datang ke tegal pasti selalu singgah. Kawasan tersebut bernama wisata Guci.\r\n\r\nSeiring senada dengan Guci, kawasan wisata ini pun mencoba untuk dikembangkan agar tidak hanya warga tegal saja yang mampu menikmatinya. Melainkan, semua orang bisa juga menikmatinya.\r\n\r\nSebelum berbicara lebih jauh mengenai kawasan ini. Alangkah baiknya, wisatawan membaca terlebih dahulu sejarah dan juga mitos yang berkembang disini.\r\n\r\nTernyata, laut jawa memang menyimpan beragam macam misteri. Tidak hanya di selatannya saja melainkan, di utaranya juga punya.\r\n\r\nKonon katanya disini ada seorang dewi bernama Dewi Ramtasari. Beliau adalah sosok gaib yang menguasai 3 kabupaten sekaligus. Salah satu kabupaten tersebut adalah tegal. Dimana, sosok ini semakin dikenal oleh masyarakat luas melalui kesenian sintren.\r\n\r\nLalu, apa itu sintren? Nah, sintren adalah suatu bentuk tarian. Dimana, seorang penarinya adalah seorang perempuan.\r\n\r\nDiiringi oleh gamelan dan anehnya setelah beberapa menit menari, sosok perempuan ini tidak sadarkan diri. Saat itulah Dewi Ramtasari sudah memasuki raganya. Cukup merinding juga ya!\r\n\r\nSelain melalui kesenian sintren, ada beberapa warga yang katanya pernah melihat sosok dewi ramtasari ini di sekitar pantai.\r\n\r\nSosoknya yang cantik membuat semua orang ingin pergi mengikutinya. Percaya atau tidak begitulah faktanya yang pernah diutarakan oleh salah seorang warga disini dan menjadi sejarah pantai alam indah tegal.', '1303885181.jpg', '-6.848351543082842', '109.1419380714417', NULL, '2019-11-01 07:55:06', '2019-11-01 07:55:06'),
(5, 'Purwahamba Indah', 2, 'Rp. 5.000', 'Suradadi', 'Pantai Purwahamba Indah atau yang populeh dengan nama Purin menjadi destinasi wisata pantai yang berhasil menarik perhatian wisatawan. Pantai yang terkenal dengan panorama yang Indah, juga terdapat wahana rekreasi yang seru.\r\n\r\nObyek wisata ini cocok untuk pengunjung yang ingin menghabiskan liburan bersama keluarga. Menikmati keindahan laut dengan airnya yang jernih, melihat sunset merupakan salah satu aktifitas yang dapat mereka dapatkan di sini.\r\n\r\nDaya Tarik\r\nTidak seperti pantai selatan yang memiliki ciri ombak besar, pantai utara tidak besar, cenderung tenang. Tentu hal ini menjadi daya tarik tersendiri.\r\n\r\nWisatawan yang datang tidak hanya warga lokal, panorama yang ditawarkan pantai ini mampu menarik pengunjung dari luar kota. Pasirnya hitam, lembut dan bersih. Angin berhembus menambah suasana makin menyenangkan.\r\n\r\nSaat matahari mulai terbenam, merupakan waktu yang paling ditunggu-tunggu wisatawan. Mereka mengabadikan pemandangan sunset yang menakjubkan dengan kamera. Pepohonan di pinggir pantai yang rindang membuat kawasan ini bertambah syahdu.\r\n\r\nFasilitas\r\nTak hanya pantai yang indah yang dapat dinikmati wisatawan. Obyek wisata Pantai Purwahamba memiliki fasilitas dan wahana rekreasi menarik.\r\n\r\nDi sini tersedia gazebo, kolam renang, replika pesawat terbang shelter, kafe, meeting room serta toilet. Juga terdapat warung-warung makan yang siap memanjakan lidah pengunjung.\r\n\r\nWahana permainan anak juga tak kalah menarik, ada waterboom, sepeda air, kereta mini, taman ria, kebun binatang mini dan lainnya.\r\n\r\nLokasi dan Tiket\r\nLetaknya yang bersisian dengan Jalur Pantai Utara, membuat Pantai Purwahamba Indah mudah sekali dijangkau. Tepatnya di Jl. Raya Tegal â€“ Pemalang Km. 14 Tegal.\r\n\r\nUntuk tiket masuknya sangat murah Rp 3.000 untuk dewasa, Rp 2.500 untuk anak-anak. Pada akhir pekan atau libur nasional, harga tiket menjadi Rp 3.500 untuk dewasa, sedangkan anak-anak Rp 3.000.', '918532996.jpg', '-6.8717361738065375', '109.25780898618336', NULL, '2019-11-01 07:58:54', '2019-11-01 07:58:54'),
(6, 'Pantai Larangan', 2, 'Free', 'Kramat', 'Sejumlah warga di Pantura Kabupaten Tegal mulai resah. Sebab, Pantai Larangan di Desa Munjungagung, Kecamatan Kramat yang menjadi andalan warga pantura, sekarang diduga beralih fungsi menjadi tempat prostitusi. DPRD meminta agar Satpol PP Kabupaten Tegal segera melakukan razia di lokasi pantai tersebut.\r\n\r\n\"Kami sering dapat informasi dari masyarakat bahwa Pantai Larangan sekarang jadi tempat prostitusi. Banyak warung-warung yang digunakan untuk transaksi seks,\" kata Ketua DPRD Kabupaten Tegal A. Firdaus Assyairozi, Selasa (16/7).\r\n\r\nFirdaus mengemukakan, padahal tempat prostitusi di wilayah Pantura Kabupaten Tegal sudah ditutup secara permanen oleh Pemerintah Kabupaten (Pemkab) Tegal. Firdaus menduga, para Pekerja Seks Komersial (PSK) itu berpindah ke Pantai Larangan. Dia tidak ingin praktik dunia gelap itu menjamur di pantai tersebut.\r\n\r\nTermasuk peredaran minuman keras (miras) yang dengan mudah dijumpai di warung remang-remang yang ada di sana.\r\n\r\n\"Agar tidak menjamur di Pantai Larangan, harus segera ditertibkan,\" perintah Firdaus.\r\n\r\nMenurut pentolan Partai Kebangkitan Bangsa (PKB) Kabupaten Tegal ini, Pantai Larangan merupakan salah satu obyek wisata laut yang beberapa waktu lalu diresmikan Bupati Tegal Umi Azizah. Perkembangannya sangat signifikan dengan banyaknya wisatawan lokal yang berkunjung ke pantai yang berada di pesisir laut Jawa itu.\r\n\r\nNamun sayangnya, muncul embrio warung prostitusi. Kendati secara terselubung, tapi sudah banyak masyarakat yang mengetahui praktik tersebut.\r\n\r\n\"Kami tidak ingin muncul kembali lokalisasi di wilayah Kabupaten Tegal. Harus segera ditangani,\" tegas ketua DPC PKB Kabupaten Tegal itu.\r\n\r\nDia menambahkan, Pantai Larangan berpotensi untuk dikembangkan sebagai obyek wisata laut. Bahkan, keindahan pantai itu bisa bersaing dengan pantai-pantai lainnya di wilayah pantura. Jika pengelolaan pantai itu baik, maka bisa menjadi salah satu ikon Kabupaten Tegal. Sementara itu, akses wisatawan untuk menuju Pantai Larangan juga sangat mudah.', '78889670.jpg', '-6.861296189933708', '109.19093120658624', NULL, '2019-11-01 08:01:25', '2019-11-01 08:01:25'),
(7, 'Taman Poci', 3, 'Free', 'Tegal Timur', 'Wisata Taman Poci Tegal merupakan salah satu tempat wisata yang menjadi Andalan Kota Tegal. Tempat ini adalah tempat wisata yang biasa dikunjungi oleh para wisatawan baik di hari biasa maupun hari libur. Tempat ini sangat asri, nyaman, indah, dan cocok untuk bersantai atau sekedar jalan-jalan di sore hari.\r\n\r\nWisata Taman Poci berada di Desa Panggung, Kecamatan Tegal Timur, Kabupaten Tegal, Provisin Jawa Tengah. Tempat ini telah terdapat di google maps, jadi jika Anda merasa bingung Anda hanya perlu mengikuti petunjuk google maps tersebut. Jika Anda dari luar kota, Anda tidak perlu bingung lagi karena lokasi wisata Taman Poci berdekatan dengan Stasiun Kota Tegal.\r\nWisata Taman Poci Tegal adalah salah satu tempat wisata ang wajib Anda kunjungi ketika datang di Kota Tegal. Walaupun taman ini berukuran kecil, namun karena suasana yang segar, asli, dan nyaman membuat para pengunjung datang ke tempat ini.\r\nSelain berbagai tanaman dan pohon yang asri, terdapat juga patung ceret dan juga cangkir teh yang merupakan ciri khas dari Taman Poci. Jika di sore hari, para pengungjung gemar menghabiskan waktu dengan bersantai dan menikmati jajanan yang ada di sekitar taman.\r\nBagi para remaja, patung ceret teh pocilah yang menjadi daya tarik utama untuk mengambil gambar atau berfoto ria. Selain berfoto, para remaja juga gemar menghabiskan waktu disini bersama orang yang mereka sayangi. Terdapat juga anak-anak kecil yang suka bermain dan berlarian di sekitar taman. Jadi bagi Anda para orang tua yang ingin menghibur si keci,l Anda dapat berkunjung di tempat ini. Anak Anda akan senang bermain dan Anda pun juga dapat bersantai.\r\n\r\nFasilitas\r\nWisata Taman Poci Tegal telah dilengkapi dengan berbagai fasilitas seperti area parkir, kamar mandi, penginapan, dan tempat ibadah. Selain itu, terdapat banyak sekali pedagang kaki lima dengan jajanan khas kota tegal, mulai dari makanan ringan hingga makanan berat. Jadi bagi Anda yang berada di Kota Tegal dan ingin mencari makanan khas Kota Tegal, Anda hanya perlu datang ke Taman Poci.\r\n\r\nTransportasi\r\nBagi wisatawan asal Kota Tegal tentu sudah tidak perlu bingung untuk mendatangi lokasi Wisata Taman Poci. Jika Anda menggunakan kendaraan pribadi, Anda tidak perlu khawatir karena telah banyak rambu-rambu jalan yang menunjukkan arah menuju Taman Teh Poci.\r\nNamun, bagi Anda yang memanfaatkan transportasi umum, Anda dapat menggunakan bis umum atau angkutan yang menuju Desa Panggung, lalu Anda harus naik ojek untuk sampai ke lokasi Wisata Taman Poci.\r\nDemikian sedikit informasi mengenai salah satu tempat wisata Taman Poci di Panggung Tegal Jawa Tengah. Semoga informasi ini dapat memberi ide atau inspirasi bagi Anda yang mencari-cari tempat yang bagus di Kota Tegal. Selamat berwisata.', '2052902374.jpg', '-6.865544470490669', '109.14215326309204', NULL, '2019-11-01 08:03:40', '2019-11-01 08:03:40'),
(8, 'Taman Tegal Sari', 3, 'Rp. 3.000', 'Tegalsari', 'Sudah tau belum ada spot selfie yang lagi hits di Tegal? Ya, Taman Tegalsari. Taman ini berlokasi di Jl. Blanak, Tegalsari atau lebih tepatnya jembatan Jl. Blanak ke utara. Tempat ini hanya bisa diakses kendaraan roda dua, sehingga mobil belum bisa masuk. Tempat ini memang difungsikan sebagai taman terbuka, sehingga didesain khusus untuk aktifitas warga dan menghilangkan kesan kumuh di kampung nelayan.\r\n\r\nTempat ini bisa dikatakan unik, karena kita bisa dengan leluasa melihat kapal nelayan berlalu lalang ataupun hanya sekedar bersandar di pinggiran. Beberapa tanaman hias ditanam agar menambah cantik si Taman Tegasari ini. Gazebo-gazebo dan permainan anak seperti ayunan atau playground juga ditambahkan di sini. Beberapa pedagang jajanan juga kerap kali mangkal, namun semoga tetap bisa menjaga kebersihannya ya.\r\n\r\nTempat yang paling favorit untuk berslfie ria adalah di atas jembatan kayu dengan bentuk melengkung. Tempat ini hits karena bisa menangkap langsung lalu lalang kapal nelayan. Jadi tidak akan menyangka jika lokasi ini masih berada di Tegal. Sip banget jika kita mengambil moment sunset di lokasi ini.\r\n\r\nJadi, sudah merencanakan liburan akhir pekan di Taman Tegalsari ini? Sambil berwisata, kita bisa menanamkan kecintaan akan dunia bahari.', '1158214961.jpg', '-6.851625706550688', '109.12112172798015', NULL, '2019-11-01 08:06:04', '2019-11-01 08:06:04'),
(9, 'Taman Rakyat Slawi', 3, 'Free', 'Slawi', 'Taman Rakyat Slawi Ayu atau sering disingkat Trasa adalah ruang terbuka hijau yang berlokasi di Kecamatan Slawi, Kabupaten Tegal, Jawa Tengah. Taman yang resmi beroperasi swjaj tahun 2013, ini dibangun dalam rangka memenuhi kebutuhan sosial masyarakat Tegal dan sekitarnya, antara lain rekreasi, olahraga, dan pertunjukan seni. Namun demikian juga mewadahu para pelaku UMKM. Trasa memiliki tiga bagian utama (shelter) yakni shelter utara diperuntukkan bagi penjual produk atau oleh-oleh dan kerajinan khas Tegal. Untuk shelter tengah lebih dikhususkan untuk kegiatan-kegiatan masyarakat. Shelter ini terdiri dari panggung yang berjenjang dan alasnya menggunakan lantai khusus yang bisa digunakan sebagai tempat pertunjukan. Sedangkan shelter bagian selatan berisi pedagang kaki lima (PKL) yang menjajakan makanan siap saji', '717040246.jpg', '-6.979719106145931', '109.13921356201172', NULL, '2019-11-01 08:08:22', '2019-11-01 08:08:22'),
(10, 'Balai Kota Lawas', 4, 'Free', 'Tegal Barat', 'Pengunjung dan pedagang dadakan di kawasan Balai kota Lama atau biasa disebut â€ Balwasâ€ mengeluhkan kondisi kawasan Balwas yang terlihat kumuh dan tidak terawat.\r\n\r\nâ€œSangat disayangkan Balaikota lama kota Tegal setiap hari Minggu pastinya  dikunjungi ratusan bahkan mungkin ribuan orang untuk berjalan â€“ jalan, belanja, atau berdagang, namun kondisinya terlihat kumuh dan tak terawat, padahal lokasinya juga berdampingan dengan kantor DPRD kota Tegal,â€ ucap Yani warga Tegalsari saat mengunjungi Balaikota lama, Minggu (15/09/2019) pagi.\r\n\r\nSenada dengan Yani, Musa yang setiap minggunya berjualan mainan anak-anak disana menuturkan Pemkot Tegal terkesan tak peduli dengan kondisi Balaikota lama kota Tegal. â€œSaya sudah bertahun â€“ tahun berjualan disini, dari dulu kondisinya ya begini (kurang terawat), padahal kami yg berjualan disini dimintai uang (retribusi), dana itu untuk apa? Semoga kedepan Balkot lama lebih tertata, lebih cantik sehingga semakin banyak pengunjung yang datang kesini. Kami (pedagang) juga berharap dilibatkan jika nanti ada penataan,â€ ucapnya.\r\n\r\nAda juga pedagang yang menginginkan Balaikota lama lebih bersih dan cantik namun merasa takut untuk menyampaikan kepada Pemkot Tegal. â€œWaduh.. saya ini rakyat kecil, mau bicara takut salah, nanti ujung-ujungnya kami bisa diusir dari sini. Bisa jualan disini saja kami sudah bersyukur. Kalau saya sih penginnya ya lebih rapi, diperhatikan (Pemkot Tegal) supaya tempat ini lebih banyak lagi pengunjungnya,â€ kata Budi.\r\n\r\nBerdasarkan pantauan Kabarberitaku kondisi Balaikota lama kota Tegal terlihat semrawut, kolam ikan & pancuran air terlihat kumuh, banyak sampah dan berbau tak sedap. Akses jalan untuk pengunjung semakin sempit & tak teratur karena para penjual seenaknya menggelar dagangan. Tempat duduk para pengunjung dipenuhi barang dagangan sehingga pengunjung kesulitan mencari tempat duduk.( Susilo/Kbk)', '9178594.jpg', '-6.855725028913542', '109.13750410045361', NULL, '2019-11-01 08:11:44', '2019-11-01 08:11:44'),
(11, 'Menara Waterleideng', 4, 'Free', 'Tegal Barat', 'Kota Tegal tak bisa dilepaskan dari sejarah dan peninggalan-peninggalan zaman kolonial. Terdapat begitu banyak bangunan dan peninggalan Belanda yang hingga kini masih berdiri kokoh di Kota Tegal, salah satunya bangunan menara air PDAM atau Waterleideng Tegal. Berdasarkan buku Profil Bangunan Cagar Budaya Kota Tegal, bangunan tersebut berdiri sejak tahun 1931. Berdiri tegak menjulang ke langit, bangunan ini menyerupai menara Pisa dan tepat di atas pintu menara ini tertulis Anno 1931. Bangunan ini menjadi bukti infrastruktur Kotapraja Tegal yang dikenal sebagai gementee Tegal dalam menyediakan suplai air bersih bagi masyarakat Kota Tegal saat itu. Dibangun oleh Tower Waterleideng beedrif of Province Midden Java sebagai implementasi pelaksanaan politik etis dirancang tahun 1917. Struktur menara ini mempunyai keunikan dan memiliki ketinggian 30 meter, luas bangunan 95 meter, dan luas tanah mencapai 4.058 meter. Sementara itu, panjang bangunan berdiameter 11 meter dan lebar bangunan berdiameter 11 meter. Pada masa pendudukan Jepang tahun 1942 sampai dengan 1945 bangunan ini berfungsi sebagai menara air bersih tetap dengan nama Suwindo yang artinya pipa air. Setelah kemerdekaan, bangunan ini menjadi bagian dari perusahaan Saluran Air Minum (SAM) hingga tahun 1975 berganti menjadi Perusahaan Daerah Air Minum (PDAM). Pada era 1960-an sirine Water Toren Tegal dijadikan sebagai tetenger atau tanda berbuka puasa dan tanda imsak pada Ramadan, masyarakat pun mengenalinya sebagai lenger waterleideng.', '350560682.jpg', '-6.867101188784347', '109.13984527188677', NULL, '2019-11-01 08:14:58', '2019-11-01 08:14:58'),
(12, 'Rita Park', 5, 'Rp. 25.000', 'Tegal Barat', 'Harga Tiket Masuk Rita Park Tegal â€“ Rekreasi bersama keluarga di tempat wisata seperti Dufan Jakarta atau Jatim Park tentunya akan memberikan kenangan tersendiri. Di tempat â€“ tempat tersebut banyak disediakan wahana dan fasilits seru. Lalu bagaimana jika berada di Jawa Tengah tentunya akan terhalang jarak dan waktu  untuk menuju tempat-tempat wisata tersebut? Nah, bagi yang belum tahu Jawa Tengah Khususnya Kota Tegal sudah memiliki tempat wisata dengan berbagai wahana layaknya Dufan dan Jatim Park. Tempat Wisata Tegal ini di berinama Rita Park Tegal.\r\nRita Park Tegal merupakan pusat wahana rekreasi yang berada di Kota Tegal, Jawa Tengah. Taman wisata didirikan di lahan seluas 2,5 Ha dan diresmikan pada Maret 2013 lalu. Selain menyuguhkan wahana yang lengkap, Rita Park Tegal juga menjadi kawasan taman bermain paling luas di Jawa Tengah. Harga Tiket Masuk Rita Park Tegal juga terbilang murah untuk wisata sekelas Rita Park ini. Di samping itu, lokasinya yang berada di jalur Pantura dan juga berdampingan dengan pusat perbelanjaan Rita Super Mall merupakan lokasi yang strategis. Maka tidak heran jika wisata populer Jateng ini selalu ramai pengunjung.\r\n\r\nFasilitas dan Wahana Rita Park Tegal\r\n\r\nWisatawan tidak dijamin tidak akan cepat bosan jika berkunjung ke tempat wisata ini. Berbagai wahana seru siap menambah keceriaan liburan bersama keluarga. Ada sekitar 22 wahana yang bisa di nikmati bersama keluarga, diantaranya :\r\nCircus Travel (Kereta Sirkus)\r\n\r\nPulau Hiu\r\nKuda Putar\r\nRoda-Roda\r\nUndur-Undur\r\nKincir-Kincir\r\nMini Coaster\r\nFlying Tiger (Macan Terbang)\r\nSepeda Terbang\r\nSky Drop\r\nFrog Jump\r\nBom-Bom Car\r\nMini Atv\r\nCircle 360\r\nPirate ship (Perahu Bajak Laut)\r\nSpace Travel (Pesawat Ulang Alik)\r\nSuper Swing\r\nRumah Hantu\r\n5D Cinema\r\nRodeo\r\nKiddy Ride\r\nArea Ketangkasan\r\nSelain wahana permainan Rita park yang begitu lengkap, wisata ini juga menyediakan bermacam-macam fasilitas seperti : area parkir\r\nyang luas, Toilet, Mushola, counter makanan dan minuman, pujasera, stand penjual souvenir, hingga stool\r\ndan shelter untuk sekedar duduk beristirahat di sela kunjungan. Tentunya untuk dapat menikmati wahana dan fasilitas di Rita park ini, wisatawan harus membayar Harga Tiket Masuk Rita Park Tegal.', '1197328707.jpg', '-6.871679927604094', '109.11917209625244', NULL, '2019-11-01 08:17:05', '2019-11-01 08:17:05'),
(13, 'Trans Studio Mini', 5, 'Rp. 20.000', 'Tegal Barat', 'Wahana yang dihadirkan di Trans Studio Mini Tegal antara lain Bumper car, New York Swing , Venture River, Sky Rider, dan yang paling dicari adalah Crazy Cab Coaster, roller coaster indoor dan ada track keluar gedung yang membuat adrenalin semakin dipacu. Crazy Cab Coaster berbentuk seperti mobil-mobilan yang disambung mirip kereta api. Mobil tersebut berasa kecil bagi orang dewasa, namun sesnsasinya jangan ditanya lagi.\r\n\r\nTrans Studio Mini Tegal ini berlokasi di lantai 3 Transmart Tegal, buka setiap hari dari jam 09:00 â€“ 22:00. Tempatnya asyik buat berfoto-foto, apalagi temanya seperti kembali ke zaman purba, karena banyak patung dinosaurus, dan sebagian tempat dibuat seperti broadway yang ada di luar negeri gitu. Dulu banyak yang ingin ke Trans Studio yang ada di Makassar dan Bandung namun terkendala dengan biaya transportasi yang tidak bisa dibilang murah, namun kini di Tegal juga sudah ada.', '1885681689.jpg', '-6.8682411473355405', '109.12311623330322', NULL, '2019-11-01 08:20:34', '2019-11-01 08:20:34'),
(14, 'Rita Super Mall', 6, 'Free', 'Tegal Barat', 'Rita Super Mall Tegal (RSM) adalah sebuah mal yang terletak di Kota Tegal yang dibangun di atas lahan seluas 60.080 mÂ² yang terdiri atas 4 lantai dengan total luasannya 40.000 mÂ²[butuh rujukan]. RSM saat ini merupakan Mall terbesar dan terlengkap yang menakomodir kebutuhan hiburan dan belanja bagi masyarakat kota Tegal dan sekitarnya, mulai beroperasional sejak 30 Juni 2003. Dari 90 total unit ruang usaha, telah terjual sebanyak 96% ruang usaha dari total unit yang tersedia.', '600277603.jpg', '-6.869885765620371', '109.11987042488931', NULL, '2019-11-01 08:22:49', '2019-11-10 05:43:40'),
(15, 'aaaaaaaaaaaa', 1, 'Rp. 34.234', 'aaaa', 'aaaaaaa', '529002694.png', '-6.866332266630624', '109.13683114547734', '2019-11-14 10:47:52', '2019-11-14 03:45:26', '2019-11-14 03:47:52'),
(16, 'aaa n', 1, 'Rp. 11.111.111', 'aaa n', 'aaaaa n', '1966183023.jpg', '-6.876387541015347', '109.15125070114141', '2019-11-14 10:49:54', '2019-11-14 03:49:25', '2019-11-14 03:49:54'),
(17, 'pantai larangan indah', 2, 'Free', 'Tegal', 'sangat indah dlll', '1877275182.png', '-6.850814306498547', '109.16590533255318', '2020-06-03 16:10:22', '2020-06-03 09:08:46', '2020-06-03 09:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tempat_kt`
--

CREATE TABLE `tb_tempat_kt` (
  `id_kt_tempat` bigint(20) UNSIGNED NOT NULL,
  `nm_kt_tempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_kt_tempat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_tempat_kt`
--

INSERT INTO `tb_tempat_kt` (`id_kt_tempat`, `nm_kt_tempat`, `img_kt_tempat`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Gunung', '918172986.png', NULL, '2019-11-01 07:36:45', '2019-11-07 15:40:17'),
(2, 'Pantai', '37796026.png', NULL, '2019-11-01 07:36:57', '2019-11-01 07:36:57'),
(3, 'Taman', '1719052446.png', NULL, '2019-11-01 07:37:25', '2019-11-01 07:37:25'),
(4, 'Sejarah', '636490694.png', NULL, '2019-11-01 07:38:25', '2019-11-01 07:38:25'),
(5, 'Bermain', '1641274987.png', NULL, '2019-11-01 07:38:56', '2019-11-01 07:38:56'),
(6, 'Mall', '1471371367.png', NULL, '2019-11-01 07:39:33', '2019-11-01 07:39:33'),
(9, 'a new', '961413526.jpg', '2019-11-14 10:59:59', '2019-11-14 03:59:45', '2019-11-14 03:59:59'),
(10, 'jalan', '674140512.png', '2020-06-03 16:11:49', '2020-06-03 09:11:22', '2020-06-03 09:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `nama` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `nama`, `status`, `createdDate`) VALUES
(2, 'riyan@gmail.com', 'ba4e586503b7cb15e2b54b9729c066ed', 'Riyan Meidy Prayoga', 1, '2020-04-02 11:18:55'),
(3, 'halimah@gmail.com', 'ba4e586503b7cb15e2b54b9729c066ed', ' Nur Khalimah', 1, '2020-04-02 11:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `trending`
--

CREATE TABLE `trending` (
  `id` int(11) NOT NULL,
  `trendingCounting` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trending`
--

INSERT INTO `trending` (`id`, `trendingCounting`) VALUES
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Riyan Meidy Prayoga', 'riyanmeidyprayoga@gmail.com', NULL, '$2y$10$MruCl0V7aKAPkrDhRA/y.O6y5NLY0tZwXv5wOBKGs06wzFFubJGUK', NULL, '2019-11-01 07:35:06', '2019-11-01 07:35:06');

-- --------------------------------------------------------

--
-- Table structure for table `viewFeed`
--

CREATE TABLE `viewFeed` (
  `id` int(11) NOT NULL,
  `idFeed` int(11) DEFAULT NULL,
  `idMember` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `viewFeed`
--

INSERT INTO `viewFeed` (`id`, `idFeed`, `idMember`, `createdDate`) VALUES
(2, 13, 1, '2020-06-13 15:38:31'),
(3, 12, 1, '2020-06-13 15:37:45'),
(4, 13, 2, '2020-06-13 15:48:05'),
(5, 15, 1, '2020-06-13 16:30:49');

-- --------------------------------------------------------

--
-- Structure for view `feedbyTempat`
--
DROP TABLE IF EXISTS `feedbyTempat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `feedbyTempat`  AS  select `a`.`id` AS `id`,`a`.`idMember` AS `idMember`,`a`.`idSpot` AS `idSpot`,`a`.`createdDate` AS `createdDate`,`a`.`photo` AS `photo`,`a`.`caption` AS `caption`,`b`.`nm_spot` AS `nm_spot`,`d`.`namaLengkap` AS `namaLengkap`,`d`.`id` AS `idUploaders`,`d`.`photo` AS `photoUploaders`,`c`.`id_tempat` AS `id_tempat` from (((`feed` `a` left join `tb_spot` `b` on(`a`.`idSpot` = `b`.`id_spot`)) left join `tb_tempat` `c` on(`b`.`id_tempat` = `c`.`id_tempat`)) left join `members` `d` on(`a`.`idMember` = `d`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feed`
--
ALTER TABLE `feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMember` (`idMember`);

--
-- Indexes for table `likeFeed`
--
ALTER TABLE `likeFeed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likeTempatWisata`
--
ALTER TABLE `likeTempatWisata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMember` (`idMember`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tb_logs`
--
ALTER TABLE `tb_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_post`
--
ALTER TABLE `tb_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMember` (`idMember`);

--
-- Indexes for table `tb_spot`
--
ALTER TABLE `tb_spot`
  ADD PRIMARY KEY (`id_spot`);

--
-- Indexes for table `tb_tempat`
--
ALTER TABLE `tb_tempat`
  ADD PRIMARY KEY (`id_tempat`);

--
-- Indexes for table `tb_tempat_kt`
--
ALTER TABLE `tb_tempat_kt`
  ADD PRIMARY KEY (`id_kt_tempat`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trending`
--
ALTER TABLE `trending`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `viewFeed`
--
ALTER TABLE `viewFeed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMember` (`idMember`),
  ADD KEY `idFeed` (`idFeed`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feed`
--
ALTER TABLE `feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `likeFeed`
--
ALTER TABLE `likeFeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likeTempatWisata`
--
ALTER TABLE `likeTempatWisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_logs`
--
ALTER TABLE `tb_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `tb_post`
--
ALTER TABLE `tb_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_spot`
--
ALTER TABLE `tb_spot`
  MODIFY `id_spot` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_tempat`
--
ALTER TABLE `tb_tempat`
  MODIFY `id_tempat` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_tempat_kt`
--
ALTER TABLE `tb_tempat_kt`
  MODIFY `id_kt_tempat` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trending`
--
ALTER TABLE `trending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `viewFeed`
--
ALTER TABLE `viewFeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feed`
--
ALTER TABLE `feed`
  ADD CONSTRAINT `feed_ibfk_1` FOREIGN KEY (`idMember`) REFERENCES `members` (`id`);

--
-- Constraints for table `likeTempatWisata`
--
ALTER TABLE `likeTempatWisata`
  ADD CONSTRAINT `likeTempatWisata_ibfk_1` FOREIGN KEY (`idMember`) REFERENCES `members` (`id`);

--
-- Constraints for table `tb_post`
--
ALTER TABLE `tb_post`
  ADD CONSTRAINT `tb_post_ibfk_1` FOREIGN KEY (`idMember`) REFERENCES `members` (`id`);

--
-- Constraints for table `viewFeed`
--
ALTER TABLE `viewFeed`
  ADD CONSTRAINT `viewFeed_ibfk_1` FOREIGN KEY (`idMember`) REFERENCES `members` (`id`),
  ADD CONSTRAINT `viewFeed_ibfk_2` FOREIGN KEY (`idFeed`) REFERENCES `feed` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
