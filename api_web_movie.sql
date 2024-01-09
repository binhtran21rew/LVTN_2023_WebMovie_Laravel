-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2024 at 09:42 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_web_movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `total_price` double(8,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `count`, `date`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(42, 1, 4, '2023-12-22', 324000.00, 'đã thanh toán', '2023-12-22 05:39:45', '2023-12-22 05:39:45'),
(43, 1, 2, '2023-12-22', 496000.00, 'đã thanh toán', '2023-12-22 05:51:30', '2023-12-22 05:51:30'),
(44, 1, 2, '2023-01-22', 467000.00, 'đã thanh toán', '2023-12-22 06:00:02', '2023-12-22 06:00:02'),
(45, 1, 3, '2023-01-24', 185000.00, 'đã thanh toán', '2023-12-24 02:37:54', '2023-12-24 02:37:54'),
(46, 1, 1, '2023-02-25', 45000.00, 'đã thanh toán', '2023-12-25 07:19:50', '2023-12-25 07:19:50'),
(47, 1, 2, '2023-12-25', 209000.00, 'đã thanh toán', '2023-12-25 08:29:06', '2023-12-25 08:29:06'),
(48, 1, 2, '2023-12-25', 180000.00, 'đã thanh toán', '2023-12-25 08:30:54', '2023-12-25 08:30:54'),
(49, 22, 2, '2024-01-02', 209000.00, 'đã thanh toán', '2024-01-01 21:59:32', '2024-01-01 21:59:32'),
(50, 22, 2, '2024-01-02', 90000.00, 'đã thanh toán', '2024-01-01 22:03:11', '2024-01-01 22:03:11'),
(51, 22, 3, '2024-01-02', 338000.00, 'đã thanh toán', '2024-01-02 03:19:02', '2024-01-02 03:19:02'),
(52, 1, 3, '2024-01-05', 217000.00, 'đã thanh toán', '2024-01-05 01:10:57', '2024-01-05 01:10:57'),
(53, 1, 2, '2024-01-05', 90000.00, 'đã thanh toán', '2024-01-05 01:16:26', '2024-01-05 01:16:26'),
(55, 1, 2, '2024-01-05', 108000.00, 'đã thanh toán', '2024-01-05 01:23:30', '2024-01-05 01:23:30'),
(56, 1, 2, '2024-01-05', 108000.00, 'đã thanh toán', '2024-01-05 01:25:16', '2024-01-05 01:25:16'),
(57, 1, 2, '2024-01-05', 108000.00, 'đã thanh toán', '2024-01-05 01:27:55', '2024-01-05 01:27:55'),
(58, 1, 2, '2024-01-05', 108000.00, 'đã thanh toán', '2024-01-05 01:30:40', '2024-01-05 01:30:40'),
(60, 1, 1, '2024-01-05', 54000.00, 'đã thanh toán', '2024-01-05 01:42:00', '2024-01-05 01:42:00'),
(63, 1, 3, '2024-01-05', 162000.00, 'đã thanh toán', '2024-01-05 06:30:03', '2024-01-05 06:45:20'),
(64, 1, 1, '2024-01-05', 54000.00, 'đã thanh toán', '2024-01-05 07:21:33', '2024-01-05 07:26:44'),
(65, 1, 1, '2024-01-05', 54000.00, 'đã thanh toán', '2024-01-05 07:29:50', '2024-01-05 07:47:28'),
(67, 1, 1, '2024-01-05', 54000.00, 'đã thanh toán', '2024-01-05 07:33:22', '2024-01-05 07:45:53'),
(68, 1, 1, '2024-01-05', 109000.00, 'đã thanh toán', '2024-01-05 07:39:10', '2024-01-05 07:44:05'),
(70, 1, 3, '2024-01-07', 162000.00, 'đã thanh toán', '2024-01-07 02:00:50', '2024-01-07 02:00:50'),
(71, 1, 2, '2024-01-07', 108000.00, 'đã thanh toán', '2024-01-07 02:06:29', '2024-01-07 02:06:29'),
(72, 1, 3, '2024-01-07', 485000.00, 'đã thanh toán', '2024-01-07 02:09:21', '2024-01-07 02:09:21'),
(73, 1, 2, '2024-01-07', 519000.00, 'đã thanh toán', '2024-01-07 02:35:16', '2024-01-07 02:35:16'),
(74, 1, 2, '2024-01-07', 108000.00, 'đã thanh toán', '2024-01-07 02:41:14', '2024-01-07 02:41:14'),
(75, 1, 2, '2024-01-08', 145000.00, 'đã thanh toán', '2024-01-07 06:56:09', '2024-01-07 06:56:09'),
(76, 1, 3, '2024-01-08', 162000.00, 'đã thanh toán', '2024-01-07 07:06:52', '2024-01-07 07:06:52'),
(77, 1, 3, '2024-01-07', 162000.00, 'đã thanh toán', '2024-01-07 07:09:11', '2024-01-07 07:09:11'),
(85, 2, 2, '2024-01-08', 163000.00, 'đã thanh toán', '2024-01-08 03:15:28', '2024-01-08 06:40:07'),
(86, 1, 1, '2024-01-08', 109000.00, 'đã thanh toán', '2024-01-08 06:36:35', '2024-01-08 06:36:35'),
(87, 1, 2, '2024-01-08', 108000.00, 'đã thanh toán', '2024-01-08 06:38:30', '2024-01-08 06:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `booking_combo`
--

CREATE TABLE `booking_combo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` int(11) NOT NULL,
  `combo_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_combo`
--

INSERT INTO `booking_combo` (`id`, `booking_id`, `combo_id`, `created_at`, `updated_at`) VALUES
(35, 42, 1, NULL, NULL),
(36, 42, 2, NULL, NULL),
(37, 42, 5, NULL, NULL),
(38, 43, 1, NULL, NULL),
(39, 43, 11, NULL, NULL),
(40, 44, 1, NULL, NULL),
(41, 44, 1, NULL, NULL),
(42, 44, 2, NULL, NULL),
(43, 44, 2, NULL, NULL),
(44, 44, 5, NULL, NULL),
(45, 44, 5, NULL, NULL),
(46, 44, 5, NULL, NULL),
(47, 45, 1, NULL, NULL),
(48, 45, 17, NULL, NULL),
(49, 47, 2, NULL, NULL),
(50, 47, 11, NULL, NULL),
(51, 48, 2, NULL, NULL),
(52, 48, 2, NULL, NULL),
(53, 48, 2, NULL, NULL),
(54, 51, 1, NULL, NULL),
(55, 51, 5, NULL, NULL),
(56, 51, 11, NULL, NULL),
(57, 52, 2, NULL, NULL),
(58, 52, 17, NULL, NULL),
(59, 68, 1, NULL, NULL),
(60, 68, 2, NULL, NULL),
(61, 72, 1, NULL, NULL),
(62, 72, 2, NULL, NULL),
(63, 72, 2, NULL, NULL),
(64, 72, 2, NULL, NULL),
(65, 72, 2, NULL, NULL),
(66, 72, 4, NULL, NULL),
(67, 72, 5, NULL, NULL),
(68, 73, 1, NULL, NULL),
(69, 73, 2, NULL, NULL),
(70, 73, 11, NULL, NULL),
(71, 73, 11, NULL, NULL),
(72, 73, 11, NULL, NULL),
(73, 73, 11, NULL, NULL),
(74, 75, 1, NULL, NULL),
(75, 75, 2, NULL, NULL),
(79, 85, 1, NULL, NULL),
(80, 85, 2, NULL, NULL),
(81, 86, 1, NULL, NULL),
(82, 86, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `casts`
--

CREATE TABLE `casts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `casts`
--

INSERT INTO `casts` (`id`, `name`, `profile_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Keanu Reeves', '/storage/cast/1/gvRqTwCg4ow7vsXdgIuH.jpg', '2023-10-30 22:09:02', '2023-11-25 07:40:57', NULL),
(2, 'Donnie Yen', '/storage/cast/1/mazsoHdzrPIEPZptjARg.jpg', '2023-10-30 22:11:54', '2023-10-30 22:11:54', NULL),
(3, 'Bill Skarsgård', '/storage/cast/1/vYYxQQOeX7Tv2crmPBR4.jpg', '2023-10-30 22:12:20', '2023-10-30 22:12:20', NULL),
(4, 'Ian McShane', '/storage/cast/1/m2NoEP8Xi2FIeRoDYZ5o.jpg', '2023-10-30 22:12:38', '2023-10-30 22:12:38', NULL),
(5, 'Casey Likes', '/storage/cast/1/Ai4NWqIM7DRgAgKDPNuA.jpg', '2023-10-30 22:22:55', '2023-10-30 22:22:55', NULL),
(6, 'Emyri Crutchfield', '/storage/cast/1/hN2reKa4QowjYNQwI8QR.jpg', '2023-10-30 22:23:51', '2023-10-30 22:23:51', NULL),
(7, 'Jeremy Davies', '/storage/cast/1/tXietksoLtZlgkZCzrO1.jpg', '2023-10-30 22:24:11', '2023-10-30 22:24:11', NULL),
(10, 'Marlon Brando', '/storage/cast/1/snM9no80CIeoCnRfSHVN.jpg', '2023-11-01 00:01:40', '2023-11-01 00:01:40', NULL),
(12, 'Al Pacino', '/storage/cast/1/jb6f1nDZUEtmCIJNUXRm.jpg', '2023-11-01 00:02:16', '2023-11-01 00:02:16', NULL),
(13, 'Elizabeth Lail', '/storage/cast/1/2XY3OXmuOn0NplgXAENj.jpg', '2023-11-01 00:02:34', '2023-11-01 00:02:34', NULL),
(14, 'Josh Hutcherson', '/storage/cast/1/NRn2r7jjJ9scuzfta2oU.jpg', '2023-11-01 00:02:52', '2023-11-01 00:02:52', NULL),
(15, 'Mary Stuart Masterson', '/storage/cast/1/KnACqfK5BuxKScwVs5NL.jpg', '2023-11-01 00:03:04', '2023-11-01 00:03:04', NULL),
(16, 'Matthew Lillard', '/storage/cast/1/c54eVyERVnHzftRTFwWq.jpg', '2023-11-01 00:03:17', '2023-11-01 00:03:17', NULL),
(17, 'Piper Rubio', '/storage/cast/1/xWeAwPuHQrCmbAEYX40g.jpg', '2023-11-01 00:03:26', '2023-11-01 00:03:26', NULL),
(18, 'Leslie Odom Jr.', '/storage/cast/1/WqqGxpXgfsjqZ0Y778n5.jpg', '2023-11-01 00:08:05', '2023-11-01 00:08:05', NULL),
(19, 'Vin Diesel', '/storage/cast/1/A2ECjPgwykRmY8IlsoR4.jpg', '2023-11-01 00:20:10', '2023-11-01 00:20:10', NULL),
(20, 'Michelle Rodriguez', '/storage/cast/1/YDU7OgJmT7mF5AkGySx8.jpg', '2023-11-01 00:20:20', '2023-11-01 00:20:20', NULL),
(21, 'Tom Hiddleston', '/storage/cast/1/BNfebGCkifpY9YyMFXCR.jpg', '2023-11-01 00:32:27', '2023-11-01 00:32:27', NULL),
(22, 'Sophia Di Martino', '/storage/cast/1/ypmvHSOTkQtiJ2l2ADIC.jpg', '2023-11-01 00:32:40', '2023-11-01 00:32:40', NULL),
(23, 'Gugu Mbatha-Raw', '/storage/cast/1/QR1rFRoUezttPIbQnpkC.jpg', '2023-11-01 00:33:03', '2023-11-01 00:33:03', NULL),
(24, 'Lee Dong-wook', '/storage/cast/1/OGXXtShkjUFZCUfPNszj.jpg', '2023-11-01 00:37:07', '2023-11-01 00:37:07', NULL),
(25, 'Kim Go-eun', '/storage/cast/1/uJ5b5oF094jl6DwDSz1Y.jpg', '2023-11-01 00:37:16', '2023-11-01 00:37:16', NULL),
(26, 'Yook Sung-jae', '/storage/cast/1/RqRvzC1BTycjIwvoPH23.jpg', '2023-11-01 00:37:27', '2023-11-01 00:37:27', NULL),
(27, 'Gong Yoo', '/storage/cast/1/eyQ5B4fl77c6E1g83WAo.jpg', '2023-11-01 00:37:40', '2023-11-01 00:37:40', NULL),
(32, 'aaaaaaaaaaa', '/storage/cast/1/I8LGDrgkRcRfDVAbwXn3.png', '2023-12-12 07:52:36', '2023-12-12 07:52:36', NULL),
(33, 'bbbbbbb', '/storage/cast/1/1m5L0xl3C3HsLPX96Pm2.png', '2023-12-12 07:52:52', '2023-12-12 07:52:52', NULL),
(34, 'ccccccccccc', '/storage/cast/1/0PPmxA1sp62LE1lnZUbK.png', '2023-12-12 07:53:02', '2023-12-12 07:53:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `combofood`
--

CREATE TABLE `combofood` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `detail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `combofood`
--

INSERT INTO `combofood` (`id`, `name`, `price`, `detail`, `count`, `image_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Seven Up', 25000.00, 'Seven Up', 69, '/assets/image/drink.jpg', '2023-12-10 03:48:45', '2024-01-09 00:55:22', NULL),
(2, 'Bắp ngọt', 30000.00, 'Bắp ngọt', 79, '/assets/image/popcorn.jpg', '2023-12-10 03:50:00', '2024-01-09 00:55:22', NULL),
(4, 'combo 1', 89000.00, '2 Seven Up', 100, '/assets/image/combo.jpg', '2023-12-11 03:07:31', '2024-01-07 02:44:36', NULL),
(5, 'combo 2', 89000.00, '3 Seven Up, 1 Bắp ngọt', 100, '/assets/image/combo.jpg', '2023-12-11 03:13:02', '2024-01-07 02:44:19', NULL),
(11, 'combo 3', 89000.00, '2 Seven Up, 1 Bắp ngọt, 1 Bắp 2', 78, '/assets/image/combo.jpg', '2023-12-11 03:30:27', '2024-01-07 02:35:16', NULL),
(17, 'Coca Cola', 25000.00, 'Coca Cola', 80, '/assets/image/drink.jpg', '2023-12-19 07:10:20', '2024-01-09 00:55:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `combo_food`
--

CREATE TABLE `combo_food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_id` int(11) NOT NULL,
  `combo_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `combo_food`
--

INSERT INTO `combo_food` (`id`, `food_id`, `combo_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 2, NULL, NULL, NULL),
(13, 13, 17, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `name`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Seven Up', 'drink', '2023-12-10 03:48:45', '2023-12-19 00:54:24', NULL),
(2, 'Bắp ngọt', 'food', '2023-12-10 03:50:00', '2023-12-10 03:50:00', NULL),
(13, 'Coca Cola', 'drink', '2023-12-19 07:10:20', '2023-12-19 07:10:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Phim Hành Động', '2023-10-30 22:12:54', '2023-10-30 22:12:54', NULL),
(2, 'Phim Gây Cấn', '2023-10-30 22:13:01', '2023-11-25 23:37:31', NULL),
(3, 'Phim Hình Sự', '2023-10-30 22:13:10', '2023-10-30 22:13:10', NULL),
(4, 'Phim Kinh Dị', '2023-10-30 22:39:39', '2023-10-30 22:39:39', NULL),
(5, 'Phim Giả Tượng', '2023-10-30 22:39:46', '2023-10-30 22:39:46', NULL),
(6, 'Phim Hoạt Hình', '2023-11-01 00:08:15', '2023-11-01 00:08:15', NULL),
(7, 'Phim Chính Kịch', '2023-11-01 00:08:20', '2023-11-01 00:08:20', NULL),
(8, 'Sci-Fi & Fantasy', '2023-11-01 00:08:25', '2023-11-01 00:08:25', NULL),
(9, 'Action & Adventure', '2023-11-01 00:08:30', '2023-11-01 00:08:30', NULL),
(10, 'Phim Hài', '2023-11-01 00:08:41', '2023-11-01 00:08:41', NULL),
(12, 'testt', '2023-12-13 01:43:58', '2023-12-13 01:43:58', NULL);

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_29_051459_create_permission_tables', 1),
(6, '2023_10_11_081251_create_movies_table', 1),
(7, '2023_10_11_082020_create_movie_detail_table', 1),
(8, '2023_10_11_090444_create_trailers_table', 1),
(9, '2023_10_11_090845_create_casts_table', 1),
(10, '2023_10_11_091002_create_movie_casts_table', 1),
(11, '2023_10_11_092844_create_genres_table', 1),
(12, '2023_10_11_093152_create_movie_genres_table', 1),
(13, '2023_10_21_100435_create_rooms_table', 1),
(14, '2023_10_21_100607_create_schedules_table', 1),
(15, '2023_10_21_101614_create_seats_table', 1),
(18, '2023_10_21_102615_create_ticket_table', 1),
(19, '2023_11_09_080339_create_cache_table', 2),
(24, '2023_10_21_102013_create_bookings_table', 4),
(25, '2023_12_06_070841_create_payments_table', 5),
(29, '2023_12_01_124123_create_food_table', 6),
(30, '2023_12_01_124331_create_booking_food_table', 6),
(31, '2023_12_01_124514_create_type_table', 6),
(32, '2023_12_01_124816_create_type_food_table', 6),
(33, '2023_12_06_071729_update_payments_table', 7),
(34, '2023_12_10_082752_rename_booking_food_table_to_booking_combo_table', 7),
(35, '2023_12_10_083149_rename_type_food_table_to_combo_food_table', 8),
(36, '2023_12_12_081904_update_trailer_table', 9),
(37, '2023_12_12_132937_update_cast_table', 10),
(38, '2023_12_12_152133_update_movie_table', 11),
(39, '2023_12_12_163341_update_movie_detail_table', 12),
(40, '2023_12_12_164411_update_movie_gernes_table', 13),
(41, '2023_12_12_165248_update_movie_casts_table', 14),
(42, '2023_12_13_084131_update_genres_table', 15),
(43, '2023_12_13_084142_update_rooms_table', 15),
(44, '2023_12_19_083552_update_food_table', 16),
(46, '2023_12_19_083604_update_combo_food_table', 17),
(47, '2023_12_27_081030_update-user-table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 11),
(1, 'App\\Models\\User', 12),
(1, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 24),
(7, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `backdrop_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `release` date NOT NULL,
  `time` time NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `post_path`, `backdrop_path`, `release`, `time`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sát Thủ John Wick: Phần 4', '/storage/movie/1/ws5GhGTOAVTLnGsogvTF.jpg', '/storage/movie/1/9oBe59IIPOOGnKXO7s6q.jpg', '2023-03-22', '01:40:00', 45000, '2023-10-30 22:15:13', '2023-11-25 02:24:44', NULL),
(2, 'Dark Harvest', '/storage/movie/1/aR8BqGpmV2uVKyhfQJoN.jpg', '/storage/movie/1/ldfTMO8yBzd5cUnfgCdO.jpg', '2023-10-11', '01:30:00', 45000, '2023-10-30 22:48:42', '2023-10-30 22:48:42', NULL),
(3, 'Bố Già', '/storage/movie/1/3LDm6VbX2tzrNkcmzXrn.jpg', '/storage/movie/1/r6iWHBwYvrSsAA8UTUiX.jpg', '1972-03-14', '02:00:00', 45000, '2023-11-01 00:12:05', '2023-11-01 00:12:05', NULL),
(4, 'Quỷ Ám: Tín Đồ', '/storage/movie/1/os1bKJcZ0vVilzY1zas0.jpg', '/storage/movie/1/44SBLHBB55SjTNjV9Knl.jpg', '2023-10-04', '01:30:00', 45000, '2023-11-01 00:15:41', '2023-12-12 07:58:09', NULL),
(5, 'Arcane: Liên Minh Huyền Thoại', '/storage/movie/1/KGlaY7v73k1HHJykFTJ4.jpg', '/storage/movie/1/g1oUqAcIqxeYZ1TiWf4z.jpg', '2023-10-26', '01:30:00', 45000, '2023-11-01 00:18:35', '2023-11-01 00:18:35', NULL),
(6, 'Fast & Furious X', '/storage/movie/1/dumvZfjbBCJF2h3CIn6g.jpg', '/storage/movie/1/cilVwcXnD7xnqyQ048rf.jpg', '2023-05-17', '02:15:00', 45000, '2023-11-01 00:28:27', '2023-11-01 00:28:27', NULL),
(7, 'Loki', '/storage/movie/1/GG0AW06mrxyZV2nw8tm6.jpg', '/storage/movie/1/dLTTNEuXDFi4yU5A8YMZ.jpg', '2023-10-26', '01:45:00', 45000, '2023-11-01 00:34:27', '2023-11-01 00:34:27', NULL),
(8, 'Tình Chàng Yêu Tinh', '/storage/movie/1/llrWIlkppv04e0sPyCN6.jpg', '/storage/movie/1/qylpmypU4IyVDA46e2ju.jpg', '2022-03-17', '02:05:00', 45000, '2023-11-01 00:40:34', '2023-11-01 00:40:34', NULL),
(9, 'Nhà Tù Shawshank', '/storage/movie/1/6GgHt8orrZT3hoFgIjOI.jpg', '/storage/movie/1/Bn4C9xh6UPFLKLmdGZNJ.jpg', '2018-03-14', '01:36:00', 45000, '2023-11-01 00:42:55', '2023-11-01 00:42:55', NULL),
(10, 'Ác Quỷ Ma Sơ II', '/storage/movie/1/S2CQwPNQWRtbHjelqg59.jpg', '/storage/movie/1/Nht3ikptqmjEmGwTxxSI.jpg', '2017-06-23', '01:50:00', 45000, '2023-11-01 00:45:10', '2023-11-01 00:45:10', NULL),
(11, 'Năm Đêm Kinh Hoàng', '/storage/movie/1/cfmtC7xIoIIwAtDLy34v.jpg', '/storage/movie/1/gm8xrFYhiu4oZrKguS2U.jpg', '2023-11-09', '02:00:00', 123000, '2023-11-02 06:25:27', '2023-11-02 06:25:27', NULL),
(12, '12 Người Đàn Ông Giận Dữ', '/storage/movie/1/sFQQGa9XJ3mdec1A6MYD.jpg', '/storage/movie/1/aoUfX1MGi5kU7psM9Dnu.jpg', '2023-11-15', '02:25:00', 53000, '2023-11-02 06:27:57', '2024-01-08 08:48:24', NULL),
(49, 'testttttttt', '/storage/movie/1/ty6cFDk2gMxHNmKbqwD9.png', '/storage/movie/1/wrBvaI1H9Ly7qraoTRtp.png', '2023-12-13', '02:03:00', 45000, '2023-12-12 07:53:58', '2023-12-12 09:28:01', '2023-12-12 09:28:01');

-- --------------------------------------------------------

--
-- Table structure for table `movie_casts`
--

CREATE TABLE `movie_casts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` int(11) NOT NULL,
  `cast_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_casts`
--

INSERT INTO `movie_casts` (`id`, `movie_id`, `cast_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 2, 7, NULL, NULL, NULL),
(6, 2, 5, NULL, NULL, NULL),
(7, 2, 6, NULL, NULL, NULL),
(8, 3, 10, NULL, NULL, NULL),
(9, 3, 13, NULL, NULL, NULL),
(10, 3, 6, NULL, NULL, NULL),
(11, 4, 3, NULL, NULL, NULL),
(12, 4, 18, NULL, NULL, NULL),
(13, 4, 4, NULL, NULL, NULL),
(14, 5, 16, NULL, NULL, NULL),
(15, 5, 3, NULL, NULL, NULL),
(16, 5, 1, NULL, NULL, NULL),
(17, 5, 13, NULL, NULL, NULL),
(18, 5, 5, NULL, NULL, NULL),
(19, 6, 19, NULL, NULL, NULL),
(20, 6, 20, NULL, NULL, NULL),
(21, 6, 10, NULL, NULL, NULL),
(22, 7, 21, NULL, NULL, NULL),
(23, 7, 22, NULL, NULL, NULL),
(24, 7, 23, NULL, NULL, NULL),
(25, 7, 1, NULL, NULL, NULL),
(26, 8, 25, NULL, NULL, NULL),
(27, 8, 27, NULL, NULL, NULL),
(28, 8, 24, NULL, NULL, NULL),
(29, 8, 26, NULL, NULL, NULL),
(30, 9, 13, NULL, NULL, NULL),
(31, 9, 10, NULL, NULL, NULL),
(32, 9, 23, NULL, NULL, NULL),
(33, 9, 17, NULL, NULL, NULL),
(34, 10, 1, NULL, NULL, NULL),
(35, 10, 10, NULL, NULL, NULL),
(36, 10, 7, NULL, NULL, NULL),
(37, 10, 6, NULL, NULL, NULL),
(38, 10, 13, NULL, NULL, NULL),
(39, 11, 14, NULL, NULL, NULL),
(40, 11, 12, NULL, NULL, NULL),
(41, 11, 17, NULL, NULL, NULL),
(42, 11, 13, NULL, NULL, NULL),
(43, 12, 6, NULL, NULL, NULL),
(44, 12, 14, NULL, NULL, NULL),
(45, 12, 7, NULL, NULL, NULL),
(46, 12, 20, NULL, NULL, NULL),
(47, 12, 4, NULL, NULL, NULL),
(59, 1, 4, NULL, NULL, NULL),
(60, 1, 1, NULL, NULL, NULL),
(61, 1, 2, NULL, NULL, NULL),
(62, 1, 6, NULL, NULL, NULL),
(63, 1, 13, NULL, NULL, NULL),
(86, 4, 32, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_detail`
--

CREATE TABLE `movie_detail` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overview` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imdb` double(8,2) NOT NULL,
  `status` int(10) NOT NULL COMMENT '0 is upcomming\r\n1 is now playing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_detail`
--

INSERT INTO `movie_detail` (`id`, `movie_id`, `title`, `overview`, `imdb`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Sát Thủ John Wick: Phần 4', 'Sát Thủ John Wick: Chương 4 là câu chuyện của John Wick (Keanu Reeves) đã khám phá ra con đường để đánh bại High Table. Nhưng trước khi có thể kiếm được tự do, Wick phải đối đầu với kẻ thù mới với những liên minh hùng mạnh trên toàn cầu và những lực lượng biến những người bạn cũ thành kẻ thù.', 0.00, 1, '2023-10-30 22:15:13', '2023-11-25 02:24:44', NULL),
(2, 2, 'Dark Harvest', 'Dark Harvest', 0.00, 1, '2023-10-30 22:48:42', '2023-10-30 22:48:42', NULL),
(3, 3, 'Bố Già', 'Một câu chuyện kéo dài từ năm 1945 đến năm 1955, một biên niên sử về gia đình tội phạm Corleone người Mỹ gốc Ý. Khi tộc trưởng gia đình tội phạm có tổ chức, Vito Corleone bị ám sát bởi băng nhóm đối thủ, con trai út của ông, Michael đã phải nhúng tay vào tội ác và chống lại đối thủ với việc phát động một chiến dịch trả thù đẫm máu.', 0.00, 1, '2023-11-01 00:12:05', '2023-11-01 00:12:05', NULL),
(4, 4, 'Quỷ Ám: Tín Đồ', 'Phần tiếp theo của bộ phim năm 1973 kể về một cô bé 12 tuổi bị một thực thể ma quỷ bí ẩn chiếm hữu, buộc mẹ cô phải tìm đến sự giúp đỡ của hai linh mục để cứu cô.', 0.00, 1, '2023-11-01 00:15:41', '2023-11-01 00:15:41', NULL),
(5, 5, 'Arcane: Liên Minh Huyền Thoại', 'Khi hai thành phố song sinh Piltover và Zaun ở thế mâu thuẫn gay gắt, hai chị em chiến đấu ở hai bên chiến tuyến cùng các công nghệ ma thuật và những niềm tin trái chiều.', 0.00, 1, '2023-11-01 00:18:35', '2023-11-01 00:18:35', NULL),
(6, 6, 'Fast & Furious X', 'Dom Toretto và gia đình anh ta là mục tiêu của đứa con trai đầy thù hận của trùm ma túy Hernan Reyes.', 0.00, 0, '2023-11-01 00:28:27', '2023-11-01 00:28:27', NULL),
(7, 7, 'Loki', 'Khi Steve Rogers, Tony Stark và Scott Lang quay trở về cột mốc 2012, ngay khi trận chiến ở New York kết thúc, để “mượn tạm” quyền trượng của Loki. Nhưng một tai nạn bất ngờ xảy đến, khiến Loki nhặt được khối lặp phương Tesseract và tiện thể tẩu thoát. Cuộc trốn thoát này đã dẫn đến dòng thời gian bị rối loạn. Cục TVA – tổ chức bảo vệ tính nguyên vẹn của dòng chảy thời gian, buộc phải can thiệp, đi gô cổ ông thần này về làm việc. Tại đây, Loki có hai lựa chọn, một là giúp TVA ổn định lại thời gian, không thì bị tiêu hủy. Dĩ nhiên Loki chọn lựa chọn thứ nhất. Nhưng đây là nước đi vô cùng mạo hiểm, vì ông thần này thường lọc lừa, “lươn lẹo”, chuyên đâm lén như bản tính tự nhiên của gã.', 0.00, 1, '2023-11-01 00:34:27', '2023-11-01 00:34:27', NULL),
(8, 8, 'Tình Chàng Yêu Tinh', 'Kim Shin, một yêu tinh bất tử, đi tìm cô dâu loài người để rút thanh kiếm vô hình khỏi ngực và tự kết liễu đời mình. Một ngày nọ, học sinh Ji Eun-Tak thú nhận với anh rằng cô là người được chọn.', 0.00, 1, '2023-11-01 00:40:34', '2023-11-01 00:40:34', NULL),
(9, 9, 'Nhà Tù Shawshank', 'Nhà tù Shawshank kể về Andrew, một nhân viên nhà băng, bị kết án chung thân sau khi giết vợ và nhân tình của cô. Anh một mực cho rằng mình bị oan. Andy bị đưa tới nhà tù Shawshank. Tại đây, thế giới ngầm của các phạm nhân, sự hà khắc của hệ thống quản giáo xung đột và giành nhau quyền thống trị. Chỉ có các phạm nhân trung lập là bị kẹt ở giữa và có thể bỏ mạng. Làm quen với tay ‘quản lý chợ đen’ Redding, Andy dần thích nghi với cuộc sống tại Shawshank. Song, kế hoạch lớn hơn việc tồn tại ở nhà tù này đang được anh suy tính. Qua con mắt và lời kể của Redding, cuộc vượt ngục vĩ đại này được kể tuần tự cùng một kết thúc bất ngờ.', 0.00, 0, '2023-11-01 00:42:55', '2023-11-01 00:42:55', NULL),
(10, 10, 'Ác Quỷ Ma Sơ II', 'Năm 1956 tại Pháp, một linh mục bị sát hại dã man, và sơ Irene đến để bắt đầu điều tra. Cô một lần nữa phải đối mặt với một ác quỷ mạnh mẽ.', 0.00, 0, '2023-11-01 00:45:10', '2023-11-01 00:45:10', NULL),
(11, 11, 'Năm Đêm Kinh Hoàng', 'Nhân viên bảo vệ Mike bắt đầu làm việc tại Freddy Fazbear\'s Pizza. Trong đêm làm việc đầu tiên, anh nhận ra mình sẽ không dễ gì vượt qua được ca đêm ở đây. Chẳng mấy chốc, anh sẽ vén màn sự thật đã xảy ra tại Freddy\'s.', 0.00, 0, '2023-11-02 06:25:27', '2023-11-02 06:25:27', NULL),
(12, 12, '12 Người Đàn Ông Giận Dữ', 'Một thanh niên bị tình nghi giết cha ruột của mình. 12 người của bồi thẩm đoàn bắt đầu phiên làm việc của mình và tất cả hội thẩm viên đều muốn kết thúc nhanh chóng vụ án vì các chứng cứ đã quá rõ ràng. Trừ một người duy nhất. Ông không muốn sinh mạng của một con người lại có thể được quyết định chỉ trong vòng chưa đầy 10 phút. Ông có một sự nghi ngờ riêng đối với vụ án kỳ lạ này. Và ông quyết định: tìm cách thuyết phục mọi người. Nhưng ông sẽ làm gì để giúp cậu bé kia và thuyết phục những người trong bồi thẩm đoàn đây?', 0.00, 0, '2023-11-02 06:27:57', '2024-01-08 08:48:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genres`
--

CREATE TABLE `movie_genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movie_genres`
--

INSERT INTO `movie_genres` (`id`, `movie_id`, `genre_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL),
(4, 2, 2, NULL, NULL, NULL),
(5, 2, 5, NULL, NULL, NULL),
(6, 2, 4, NULL, NULL, NULL),
(7, 3, 7, NULL, NULL, NULL),
(8, 3, 3, NULL, NULL, NULL),
(9, 4, 4, NULL, NULL, NULL),
(10, 5, 6, NULL, NULL, NULL),
(11, 5, 7, NULL, NULL, NULL),
(12, 5, 9, NULL, NULL, NULL),
(13, 5, 8, NULL, NULL, NULL),
(14, 6, 1, NULL, NULL, NULL),
(15, 6, 3, NULL, NULL, NULL),
(16, 6, 2, NULL, NULL, NULL),
(17, 7, 7, NULL, NULL, NULL),
(18, 7, 8, NULL, NULL, NULL),
(19, 8, 7, NULL, NULL, NULL),
(20, 8, 8, NULL, NULL, NULL),
(21, 8, 5, NULL, NULL, NULL),
(22, 9, 7, NULL, NULL, NULL),
(23, 9, 3, NULL, NULL, NULL),
(24, 10, 2, NULL, NULL, NULL),
(25, 10, 4, NULL, NULL, NULL),
(26, 10, 5, NULL, NULL, NULL),
(27, 11, 4, NULL, NULL, NULL),
(28, 11, 2, NULL, NULL, NULL),
(29, 12, 7, NULL, NULL, NULL),
(31, 1, 4, NULL, NULL, NULL),
(32, 1, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `date`, `time`, `type`, `price`, `created_at`, `updated_at`) VALUES
('1_tt_148589', 75, '2024-01-08', '09:15:00', 'tt', 145000.00, '2024-01-07 06:56:09', '2024-01-07 06:56:09'),
('1_tt_170549', 70, '2024-01-07', '17:45:00', 'tt', 162000.00, '2024-01-07 02:00:50', '2024-01-07 02:00:50'),
('1_tt_212686', 67, '2024-01-05', '09:45:00', 'tt', 54000.00, '2024-01-05 07:45:53', '2024-01-05 07:45:53'),
('1_tt_252324', 72, '2024-01-07', '17:45:00', 'tt', 485000.00, '2024-01-07 02:09:21', '2024-01-07 02:09:21'),
('1_tt_274628', 74, '2024-01-07', '17:45:00', 'tt', 108000.00, '2024-01-07 02:41:14', '2024-01-07 02:41:14'),
('1_tt_328809', 64, '2024-01-05', '09:26:00', 'tt', 54000.00, '2024-01-05 07:26:44', '2024-01-05 07:26:44'),
('1_tt_42667', 71, '2024-01-07', '17:45:00', 'tt', 108000.00, '2024-01-07 02:06:29', '2024-01-07 02:06:29'),
('1_tt_487934', 68, '2024-01-05', '09:43:00', 'tt', 109000.00, '2024-01-05 07:44:05', '2024-01-05 07:44:05'),
('1_tt_617304', 76, '2024-01-08', '13:15:00', 'tt', 162000.00, '2024-01-07 07:06:52', '2024-01-07 07:06:52'),
('1_tt_65084', 65, '2024-01-05', '09:47:00', 'tt', 54000.00, '2024-01-05 07:47:28', '2024-01-05 07:47:28'),
('1_tt_844005', 86, '2024-01-09', '15:15:00', 'tt', 109000.00, '2024-01-08 06:36:35', '2024-01-08 06:36:35'),
('1_tt_88611', 87, '2024-01-09', '15:15:00', 'tt', 108000.00, '2024-01-08 06:38:30', '2024-01-08 06:38:30'),
('1_tt_900011', 63, '2024-01-05', '09:00:00', 'tt', 162000.00, '2024-01-05 07:00:35', '2024-01-05 07:00:35'),
('1_tt_924760', 73, '2024-01-07', '17:45:00', 'tt', 519000.00, '2024-01-07 02:35:16', '2024-01-07 02:35:16'),
('1_tt_972415', 77, '2024-01-08', '13:15:00', 'tt', 162000.00, '2024-01-07 07:09:11', '2024-01-07 07:09:11'),
('1_tt_988152', 85, '2024-01-08', '08:40:00', 'tt', 163000.00, '2024-01-08 06:40:07', '2024-01-08 06:40:07'),
('1468', 55, '2024-01-05', '03:23:00', 'vnpay', 108000.00, '2024-01-05 01:23:30', '2024-01-05 01:23:30'),
('1602', 58, '2024-01-05', '03:30:00', 'vnpay', 108000.00, '2024-01-05 01:30:40', '2024-01-05 01:30:40'),
('1703248748-KMGGiCOtMtUN', 42, '2023-12-22', '07:39:00', 'momo', 324000.00, '2023-12-22 05:39:45', '2023-12-22 05:39:45'),
('1703249448-hso6AIEFINoe', 43, '2023-12-22', '07:51:00', 'momo', 496000.00, '2023-12-22 05:51:30', '2023-12-22 05:51:30'),
('1703249962-gOWN2FChghEE', 44, '2023-12-22', '07:59:00', 'momo', 467000.00, '2023-12-22 06:00:02', '2023-12-22 06:00:02'),
('1703410415-QiYc9J0OwCYT', 45, '2023-12-24', '04:37:00', 'momo', 185000.00, '2023-12-24 02:37:54', '2023-12-24 02:37:54'),
('1703513945-al8vS0fNBpbT', 46, '2023-12-25', '09:19:00', 'momo', 45000.00, '2023-12-25 07:19:50', '2023-12-25 07:19:50'),
('1703518104-1WeMWrEebEMN', 47, '2023-12-25', '10:29:00', 'momo', 209000.00, '2023-12-25 08:29:06', '2023-12-25 08:29:06'),
('1703518208-aZZkCQblodEk', 48, '2023-12-25', '10:30:00', 'momo', 180000.00, '2023-12-25 08:30:54', '2023-12-25 08:30:54'),
('2211', 50, '2024-01-02', '12:03:00', 'vnpay', 90000.00, '2024-01-01 22:03:11', '2024-01-01 22:03:11'),
('2458', 57, '2024-01-05', '03:27:00', 'vnpay', 108000.00, '2024-01-05 01:27:55', '2024-01-05 01:27:55'),
('5147', 53, '2024-01-05', '03:16:00', 'vnpay', 90000.00, '2024-01-05 01:16:26', '2024-01-05 01:16:26'),
('5726', 49, '2024-01-02', '11:59:00', 'vnpay', 209000.00, '2024-01-01 21:59:32', '2024-01-01 21:59:32'),
('6215', 56, '2024-01-05', '03:25:00', 'vnpay', 108000.00, '2024-01-05 01:25:16', '2024-01-05 01:25:16'),
('6446', 51, '2024-01-02', '05:18:00', 'vnpay', 338000.00, '2024-01-02 03:19:02', '2024-01-02 03:19:02'),
('7012', 52, '2024-01-05', '03:10:00', 'vnpay', 217000.00, '2024-01-05 01:10:57', '2024-01-05 01:10:57'),
('7946', 60, '2024-01-05', '03:41:00', 'vnpay', 54000.00, '2024-01-05 01:42:03', '2024-01-05 01:42:03');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(51, 'admin_get-account', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(52, 'admin_create-account', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(53, 'admin_create-movie', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(54, 'admin_getAdmin-movie', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(55, 'admin_update-movie', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(56, 'admin_delete-movie', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(57, 'admin_create-cast', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(58, 'admin_update-cast', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(59, 'admin_delete-cast', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(60, 'admin_create-trailer', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(61, 'admin_update-trailer', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(62, 'admin_delete-trailer', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(63, 'admin_create-genre', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(64, 'admin_update-genre', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(65, 'admin_delete-genre', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(66, 'admin_create-room', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(67, 'admin_update-room', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(68, 'admin_delete-room', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(69, 'admin_create-schedule', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(70, 'admin_getAll-schedule', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(71, 'admin_get-schedule', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(72, 'admin_update-schedule', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(73, 'admin_create-food', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(75, 'admin_update-food', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(76, 'admin_getAll-booking', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(77, 'admin_getAll-rolePermissions', 'web', '2023-12-15 23:51:55', '2023-12-15 23:51:55'),
(79, 'website-user', 'web', '2023-12-17 05:39:01', '2023-12-17 05:39:01'),
(80, 'admin_delete-rolePermissions', 'web', '2023-12-17 07:08:47', '2023-12-17 07:08:47'),
(81, 'admin_update-account', 'web', '2023-12-18 03:14:14', '2023-12-18 03:14:14'),
(82, 'admin_delete-account', 'web', '2023-12-18 03:14:14', '2023-12-18 03:14:14'),
(83, 'admin_delete-food', 'web', '2023-12-19 01:39:55', '2023-12-19 01:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(83, 'App\\Models\\User', 3, 'binhtran@gmail.com_AdminToken', '18d1909f80d5172b717321c3b14d8422a1df6552d202c1beaa561689d9fc0f2e', '[\"server:user\"]', '2023-12-07 02:51:07', NULL, '2023-12-07 01:08:29', '2023-12-07 02:51:07'),
(98, 'App\\Models\\User', 6, 'user2@gmail.com_AdminToken', 'd090f56a2e2ddd56d6162199e839fe5367384bf07390788578be2ea967e952f2', '[\"server:user\"]', NULL, NULL, '2023-12-14 23:31:53', '2023-12-14 23:31:53'),
(127, 'App\\Models\\User', 16, 'binh0932658710@gmail.com_AdminToken', 'e9541187b71ff39c712013808e62253cfcea6623b63c56c74ee19c9f318a76d4', '[\"server:user\"]', '2023-12-29 06:01:32', NULL, '2023-12-29 05:38:14', '2023-12-29 06:01:32'),
(128, 'App\\Models\\User', 16, 'dh51902489@student.stu.edu.vn_AdminToken', '7fd47b54e7c374a112ce08f64cab0bebf022b8b0b31fb7823083cf980b036049', '[\"server:user\"]', '2023-12-29 08:17:35', NULL, '2023-12-29 06:09:24', '2023-12-29 08:17:35'),
(129, 'App\\Models\\User', 16, 'dh51902489@student.stu.edu.vn_AdminToken', '27618d6239dbff77d68e335af9faba0ea95ba24e9bcf13212e1d22504f6175a7', '[\"server:user\"]', NULL, NULL, '2023-12-29 06:27:38', '2023-12-29 06:27:38'),
(130, 'App\\Models\\User', 17, 'binh0932658710@gmail.com_AdminToken', 'dbd361cdd375fc55eece045d6bd237e794422b3ef74ed0b5bab52f32944c26eb', '[\"server:user\"]', NULL, NULL, '2023-12-29 08:22:19', '2023-12-29 08:22:19'),
(131, 'App\\Models\\User', 18, 'binh0932658710@gmail.com_AdminToken', '8b62f42427fed8651164c0ca1667efe11419c278cea27c601864da3b3548f125', '[\"server:user\"]', '2023-12-29 08:37:46', NULL, '2023-12-29 08:24:44', '2023-12-29 08:37:46'),
(132, 'App\\Models\\User', 19, 'binh0932658710@gmail.com_AdminToken', '43dfd2edeadf91d9dbdfc8684a86db0c29de646b1f01e4e24aec5090f289d24d', '[\"server:user\"]', '2023-12-29 08:41:00', NULL, '2023-12-29 08:39:43', '2023-12-29 08:41:00'),
(133, 'App\\Models\\User', 20, 'binh0932658710@gmail.com_AdminToken', '9f417135fddac09b0956da0824762ba8acf38a2b14c42c3a12185e0f56974b73', '[\"server:user\"]', '2023-12-29 08:51:10', NULL, '2023-12-29 08:44:35', '2023-12-29 08:51:10'),
(134, 'App\\Models\\User', 21, 'binh0932658710@gmail.com_AdminToken', 'f9d2f5949e8ef066ca6c279cc2107ced0015912c80662a9e9ab2441553de1132', '[\"server:user\"]', '2023-12-29 09:16:52', NULL, '2023-12-29 09:14:20', '2023-12-29 09:16:52'),
(140, 'App\\Models\\User', 22, 'binh0932658710@gmail.com_AdminToken', 'db6b744be05a837a0ea1c13e9ba2dce1f0be86b7484743cb278de78f30a4d13f', '[\"server:user\"]', NULL, NULL, '2024-01-02 01:19:05', '2024-01-02 01:19:05'),
(141, 'App\\Models\\User', 22, 'binh0932658710@gmail.com_AdminToken', 'af09061f10d4fd7974e9e718d68e487420686feb5181b352c0984d9eca98188f', '[\"server:user\"]', '2024-01-02 03:21:15', NULL, '2024-01-02 01:19:18', '2024-01-02 03:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-11-01 01:00:45', '2023-11-01 01:00:45'),
(2, 'user', 'web', '2023-11-01 01:00:46', '2023-11-01 01:00:46'),
(7, 'root_admin', 'web', '2023-12-15 03:31:15', '2023-12-15 03:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(51, 7),
(52, 7),
(53, 1),
(53, 7),
(54, 1),
(54, 7),
(55, 1),
(55, 7),
(56, 1),
(56, 7),
(57, 1),
(57, 7),
(58, 1),
(58, 7),
(59, 1),
(59, 7),
(60, 1),
(60, 7),
(61, 1),
(61, 7),
(62, 1),
(62, 7),
(63, 1),
(63, 7),
(64, 1),
(64, 7),
(65, 1),
(65, 7),
(66, 7),
(67, 7),
(68, 7),
(69, 7),
(70, 7),
(71, 7),
(72, 7),
(73, 7),
(75, 7),
(76, 7),
(77, 7),
(79, 2),
(79, 7),
(80, 7),
(81, 7),
(82, 7),
(83, 7);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0 COMMENT '0 is avaiable\r\n1 is hidden\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'phong 1', 0, '2023-11-02 06:55:43', '2023-11-02 06:55:43', NULL),
(2, 'phong 2', 0, '2023-11-04 00:39:22', '2023-11-04 00:39:22', NULL),
(3, 'phong 3', 0, '2023-11-04 00:39:31', '2023-11-04 00:39:31', NULL),
(5, 'phong 4', 0, '2023-11-05 23:43:34', '2023-11-05 23:43:34', NULL),
(6, 'phong 5', 0, '2023-11-05 23:49:47', '2023-11-05 23:49:47', NULL),
(8, 'test moi', 0, '2023-11-26 00:03:26', '2023-12-13 02:35:14', '2023-12-13 02:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `status` int(10) NOT NULL COMMENT '0 is ready\r\n1 is hidden',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `movie_id`, `room_id`, `price`, `date`, `time_start`, `time_end`, `status`, `created_at`, `updated_at`) VALUES
(36, 3, 1, 45000.00, '2023-11-27', '07:15:00', '09:15:00', 0, '2023-11-26 23:04:32', '2023-11-27 06:27:19'),
(37, 4, 1, 50000.00, '2023-11-28', '06:00:00', '07:30:00', 1, '2023-11-27 00:29:02', '2023-11-27 06:37:59'),
(38, 1, 1, 45000.00, '2023-11-30', '06:15:00', '07:55:00', 0, '2023-11-27 01:10:28', '2023-11-27 01:10:28'),
(39, 7, 1, 54000.00, '2023-11-26', '06:15:00', '08:00:00', 1, '2023-11-27 01:11:04', '2023-11-27 06:28:25'),
(40, 5, 1, 45000.00, '2023-12-18', '08:15:00', '09:45:00', 0, '2023-11-27 01:12:13', '2023-11-27 01:12:13'),
(41, 12, 1, 50000.00, '2023-11-26', '08:45:00', '11:10:00', 1, '2023-11-27 01:25:54', '2023-11-27 06:08:12'),
(42, 2, 1, 50000.00, '2023-11-26', '12:45:00', '14:15:00', 1, '2023-11-27 01:52:38', '2023-11-27 03:08:47'),
(43, 3, 2, 45000.00, '2023-11-30', '07:15:00', '09:15:00', 0, '2023-11-28 23:39:42', '2023-11-28 23:39:42'),
(44, 3, 2, 45000.00, '2023-12-01', '07:15:00', '09:15:00', 0, '2023-11-28 23:39:58', '2023-11-28 23:39:58'),
(45, 1, 2, 50000.00, '2023-11-30', '10:15:00', '11:55:00', 0, '2023-11-28 23:40:11', '2023-11-28 23:40:11'),
(46, 1, 2, 44999.00, '2023-11-30', '12:15:00', '13:55:00', 0, '2023-11-28 23:40:30', '2023-11-28 23:40:30'),
(47, 2, 2, 45000.00, '2023-12-01', '04:15:00', '05:45:00', 0, '2023-11-28 23:40:55', '2023-11-28 23:40:55'),
(48, 3, 1, 45000.00, '2023-11-30', '03:45:00', '05:45:00', 0, '2023-11-28 23:42:02', '2023-11-28 23:42:02'),
(49, 3, 1, 45000.00, '2023-11-30', '08:45:00', '10:45:00', 0, '2023-11-28 23:42:16', '2023-11-28 23:42:16'),
(50, 4, 1, 44999.00, '2023-12-01', '06:15:00', '07:45:00', 0, '2023-11-28 23:42:31', '2023-11-28 23:42:31'),
(51, 3, 3, 44999.00, '2023-11-29', '06:15:00', '08:15:00', 0, '2023-11-28 23:43:12', '2023-11-28 23:43:12'),
(52, 3, 3, 50000.00, '2023-11-30', '15:15:00', '17:15:00', 0, '2023-11-29 02:08:57', '2023-11-29 02:08:57'),
(53, 3, 1, 45000.00, '2023-12-06', '13:15:00', '15:15:00', 0, '2023-11-30 22:47:56', '2023-11-30 22:47:56'),
(54, 3, 1, 44999.00, '2023-12-06', '16:15:00', '18:15:00', 0, '2023-11-30 22:48:12', '2023-11-30 22:48:12'),
(55, 11, 1, 44999.00, '2023-12-07', '12:15:00', '14:15:00', 0, '2023-11-30 22:48:28', '2023-11-30 22:48:28'),
(56, 3, 1, 44999.00, '2023-12-08', '12:45:00', '14:45:00', 0, '2023-11-30 22:48:51', '2023-11-30 22:48:51'),
(57, 1, 1, 50000.00, '2023-12-11', '13:15:00', '14:55:00', 0, '2023-12-03 09:18:34', '2023-12-03 09:18:34'),
(58, 4, 1, 45000.00, '2023-12-12', '15:45:00', '17:15:00', 0, '2023-12-03 09:18:53', '2023-12-03 09:18:53'),
(59, 7, 2, 50000.00, '2023-12-18', '08:15:00', '10:00:00', 0, '2023-12-12 09:08:01', '2023-12-12 09:08:01'),
(60, 3, 8, 45000.00, '2023-12-10', '06:15:00', '08:15:00', 0, '2023-12-13 02:25:29', '2023-12-13 02:25:29'),
(61, 7, 3, 45000.00, '2023-12-27', '08:15:00', '10:00:00', 0, '2023-12-19 06:57:27', '2023-12-19 06:57:27'),
(62, 2, 2, 45000.00, '2023-12-28', '08:15:00', '09:45:00', 0, '2023-12-25 08:25:52', '2023-12-25 08:25:52'),
(63, 4, 2, 49998.00, '2024-03-19', '09:15:00', '10:45:00', 0, '2023-12-25 08:26:55', '2023-12-25 08:26:55'),
(64, 5, 2, 45000.00, '2024-02-27', '09:15:00', '10:45:00', 0, '2023-12-25 08:27:21', '2023-12-25 08:27:21'),
(65, 4, 1, 45000.00, '2024-01-03', '09:45:00', '11:15:00', 1, '2023-12-26 11:55:11', '2023-12-26 05:07:39'),
(66, 3, 1, 75000.00, '2024-01-04', '09:15:00', '11:15:00', 0, '2024-01-02 21:25:03', '2024-01-02 21:25:03'),
(67, 4, 1, 75000.00, '2024-01-04', '07:15:00', '08:45:00', 0, '2024-01-02 21:28:26', '2024-01-02 21:28:26'),
(68, 3, 1, 75000.00, '2024-01-05', '05:45:00', '07:45:00', 0, '2024-01-02 21:29:32', '2024-01-02 21:29:32'),
(69, 12, 1, 53000.00, '2024-01-05', '10:15:00', '12:40:00', 0, '2024-01-03 05:22:51', '2024-01-03 05:22:51'),
(70, 1, 1, 45000.00, '2024-01-27', '09:15:00', '10:55:00', 0, '2024-01-05 00:01:46', '2024-01-05 00:01:46'),
(71, 2, 1, 45000.00, '2024-01-27', '11:45:00', '13:15:00', 0, '2024-01-05 00:01:57', '2024-01-05 00:01:57'),
(72, 3, 1, 54000.00, '2024-01-27', '14:15:00', '16:15:00', 0, '2024-01-05 00:02:11', '2024-01-05 00:02:11'),
(73, 4, 1, 54000.00, '2024-01-27', '16:45:00', '18:15:00', 0, '2024-01-05 00:02:23', '2024-01-05 00:02:23'),
(74, 5, 1, 67000.00, '2024-01-27', '19:15:00', '20:45:00', 0, '2024-01-05 00:02:37', '2024-01-05 00:02:37'),
(75, 7, 1, 54000.00, '2024-01-26', '14:15:00', '16:00:00', 0, '2024-01-05 00:02:47', '2024-01-05 00:02:47'),
(76, 8, 1, 54000.00, '2024-01-26', '16:45:00', '18:50:00', 0, '2024-01-05 00:02:57', '2024-01-05 00:02:57'),
(77, 3, 1, 45000.00, '2024-01-26', '11:45:00', '13:45:00', 0, '2024-01-05 00:03:21', '2024-01-05 00:03:21'),
(78, 1, 1, 54000.00, '2024-01-25', '13:45:00', '15:25:00', 0, '2024-01-05 00:03:33', '2024-01-05 00:03:33'),
(79, 5, 1, 54000.00, '2024-01-25', '15:45:00', '17:15:00', 0, '2024-01-05 00:03:46', '2024-01-05 00:03:46'),
(80, 4, 1, 45000.00, '2024-01-25', '11:15:00', '12:45:00', 0, '2024-01-05 00:03:57', '2024-01-05 00:03:57'),
(81, 3, 1, 67000.00, '2024-01-25', '20:15:00', '22:15:00', 0, '2024-01-05 00:04:10', '2024-01-05 00:04:10'),
(82, 7, 1, 45000.00, '2024-01-25', '08:15:00', '10:00:00', 0, '2024-01-05 00:04:22', '2024-01-05 00:04:22'),
(83, 1, 1, 45000.00, '2024-01-24', '10:45:00', '12:25:00', 0, '2024-01-05 00:04:37', '2024-01-05 00:04:37'),
(84, 1, 1, 54000.00, '2024-01-24', '12:45:00', '14:25:00', 0, '2024-01-05 00:04:49', '2024-01-05 00:04:49'),
(85, 1, 1, 67000.00, '2024-01-25', '18:15:00', '19:55:00', 0, '2024-01-05 00:05:03', '2024-01-05 00:05:03'),
(86, 3, 1, 67000.00, '2024-01-07', '20:15:00', '22:15:00', 0, '2024-01-06 08:58:54', '2024-01-06 08:58:54'),
(87, 3, 1, 67000.00, '2024-01-07', '22:45:00', '00:45:00', 0, '2024-01-06 08:59:08', '2024-01-06 08:59:08'),
(88, 3, 1, 54000.00, '2024-01-07', '17:45:00', '19:45:00', 0, '2024-01-06 08:59:27', '2024-01-06 08:59:27'),
(89, 3, 1, 54000.00, '2024-01-07', '15:15:00', '17:15:00', 0, '2024-01-06 08:59:53', '2024-01-06 08:59:53'),
(90, 3, 1, 54000.00, '2024-01-08', '15:15:00', '17:15:00', 0, '2024-01-06 09:00:04', '2024-01-06 09:00:04'),
(91, 3, 1, 54000.00, '2024-01-08', '17:45:00', '19:45:00', 0, '2024-01-06 09:00:15', '2024-01-06 09:00:15'),
(92, 3, 1, 54000.00, '2024-01-09', '15:15:00', '17:15:00', 0, '2024-01-06 09:00:27', '2024-01-06 09:00:27'),
(93, 8, 1, 67000.00, '2024-01-08', '20:15:00', '22:20:00', 0, '2024-01-06 09:00:42', '2024-01-06 09:00:42'),
(94, 8, 1, 67000.00, '2024-01-09', '18:15:00', '20:20:00', 0, '2024-01-06 09:00:52', '2024-01-06 09:00:52'),
(95, 5, 3, 45000.00, '2024-01-08', '09:15:00', '10:45:00', 0, '2024-01-07 06:55:24', '2024-01-07 06:55:24'),
(96, 8, 5, 54000.00, '2024-01-08', '12:15:00', '14:20:00', 0, '2024-01-07 07:00:42', '2024-01-07 07:00:42'),
(97, 8, 5, 54000.00, '2024-01-08', '15:15:00', '17:20:00', 0, '2024-01-07 07:01:09', '2024-01-07 07:01:09'),
(98, 8, 6, 54000.00, '2024-01-08', '13:15:00', '15:20:00', 0, '2024-01-07 07:03:34', '2024-01-07 07:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `room_id`, `number`, `position`, `created_at`, `updated_at`) VALUES
(31, 1, 1, '-48,4', NULL, '2024-01-06 02:35:00'),
(32, 1, 2, '-54,4', NULL, '2024-01-06 03:11:01'),
(33, 1, 3, '-106,5', NULL, '2024-01-06 03:11:01'),
(34, 1, 4, '1,1', NULL, '2024-01-06 03:11:01'),
(35, 1, 5, NULL, NULL, NULL),
(36, 1, 6, NULL, NULL, NULL),
(37, 1, 7, NULL, NULL, NULL),
(38, 1, 8, NULL, NULL, NULL),
(39, 1, 9, '-48,3', NULL, '2024-01-06 02:35:00'),
(40, 1, 10, '-53,4', NULL, '2024-01-06 03:11:01'),
(41, 1, 11, '-107,4', NULL, '2024-01-06 03:11:01'),
(42, 1, 12, NULL, NULL, NULL),
(43, 1, 13, NULL, NULL, NULL),
(44, 1, 14, '-159,-48', NULL, '2024-01-06 03:11:01'),
(45, 1, 15, NULL, NULL, NULL),
(46, 1, 16, NULL, NULL, NULL),
(47, 1, 17, '-49,1', NULL, '2024-01-06 02:35:00'),
(48, 1, 18, '-54,2', NULL, '2024-01-06 03:11:01'),
(49, 1, 19, '-109,3', NULL, '2024-01-06 03:11:01'),
(50, 1, 20, NULL, NULL, NULL),
(51, 1, 21, NULL, NULL, NULL),
(52, 1, 22, '-55,47', NULL, '2024-01-06 03:11:01'),
(53, 1, 23, NULL, NULL, NULL),
(54, 1, 24, NULL, NULL, NULL),
(55, 1, 25, '-49,2', NULL, '2024-01-06 02:35:00'),
(56, 1, 26, '-53,1', NULL, '2024-01-06 03:11:01'),
(57, 1, 27, '-108,1', NULL, '2024-01-06 03:11:01'),
(58, 1, 28, NULL, NULL, NULL),
(59, 1, 29, '155,-1', NULL, '2024-01-06 03:11:01'),
(60, 1, 30, '154,-2', NULL, '2024-01-06 03:11:01'),
(61, 2, 1, NULL, NULL, NULL),
(62, 2, 2, NULL, NULL, NULL),
(63, 2, 3, NULL, NULL, NULL),
(64, 2, 4, NULL, NULL, NULL),
(65, 2, 5, NULL, NULL, NULL),
(66, 2, 6, NULL, NULL, NULL),
(67, 2, 7, NULL, NULL, NULL),
(68, 2, 8, NULL, NULL, NULL),
(69, 2, 9, NULL, NULL, NULL),
(70, 2, 10, NULL, NULL, NULL),
(71, 2, 11, NULL, NULL, NULL),
(72, 2, 12, NULL, NULL, NULL),
(73, 2, 13, NULL, NULL, NULL),
(74, 2, 14, NULL, NULL, NULL),
(75, 2, 15, NULL, NULL, NULL),
(76, 2, 16, NULL, NULL, NULL),
(77, 2, 17, NULL, NULL, NULL),
(78, 2, 18, NULL, NULL, NULL),
(79, 2, 19, NULL, NULL, NULL),
(80, 2, 20, NULL, NULL, NULL),
(81, 2, 21, NULL, NULL, NULL),
(82, 2, 22, NULL, NULL, NULL),
(83, 2, 23, NULL, NULL, NULL),
(84, 2, 24, NULL, NULL, NULL),
(85, 2, 25, NULL, NULL, NULL),
(86, 2, 26, NULL, NULL, NULL),
(87, 2, 27, NULL, NULL, NULL),
(88, 2, 28, NULL, NULL, NULL),
(89, 2, 29, NULL, NULL, NULL),
(90, 2, 30, NULL, NULL, NULL),
(91, 3, 1, NULL, NULL, NULL),
(92, 3, 2, NULL, NULL, NULL),
(93, 3, 3, NULL, NULL, NULL),
(94, 3, 4, NULL, NULL, NULL),
(95, 3, 5, NULL, NULL, NULL),
(96, 3, 6, NULL, NULL, NULL),
(97, 3, 7, NULL, NULL, NULL),
(98, 3, 8, NULL, NULL, NULL),
(99, 3, 9, NULL, NULL, NULL),
(100, 3, 10, NULL, NULL, NULL),
(101, 3, 11, NULL, NULL, NULL),
(102, 3, 12, NULL, NULL, NULL),
(103, 3, 13, NULL, NULL, NULL),
(104, 3, 14, NULL, NULL, NULL),
(105, 3, 15, NULL, NULL, NULL),
(106, 3, 16, NULL, NULL, NULL),
(107, 3, 17, NULL, NULL, NULL),
(108, 3, 18, NULL, NULL, NULL),
(109, 3, 19, NULL, NULL, NULL),
(110, 3, 20, NULL, NULL, NULL),
(111, 3, 21, NULL, NULL, NULL),
(112, 3, 22, NULL, NULL, NULL),
(113, 3, 23, NULL, NULL, NULL),
(114, 3, 24, NULL, NULL, NULL),
(115, 3, 25, NULL, NULL, NULL),
(116, 3, 26, NULL, NULL, NULL),
(117, 3, 27, NULL, NULL, NULL),
(118, 3, 28, NULL, NULL, NULL),
(119, 3, 29, NULL, NULL, NULL),
(120, 3, 30, NULL, NULL, NULL),
(121, 6, 1, NULL, NULL, NULL),
(122, 6, 2, NULL, NULL, NULL),
(123, 6, 3, NULL, NULL, NULL),
(124, 6, 4, NULL, NULL, NULL),
(125, 6, 5, NULL, NULL, NULL),
(126, 6, 6, NULL, NULL, NULL),
(127, 6, 7, NULL, NULL, NULL),
(128, 6, 8, NULL, NULL, NULL),
(129, 6, 9, NULL, NULL, NULL),
(130, 6, 10, NULL, NULL, NULL),
(131, 6, 11, NULL, NULL, NULL),
(132, 6, 12, NULL, NULL, NULL),
(133, 6, 13, NULL, NULL, NULL),
(134, 6, 14, NULL, NULL, NULL),
(135, 6, 15, NULL, NULL, NULL),
(136, 6, 16, NULL, NULL, NULL),
(137, 6, 17, NULL, NULL, NULL),
(138, 6, 18, NULL, NULL, NULL),
(139, 6, 19, NULL, NULL, NULL),
(140, 6, 20, NULL, NULL, NULL),
(141, 6, 21, NULL, NULL, NULL),
(142, 6, 22, NULL, NULL, NULL),
(143, 6, 23, NULL, NULL, NULL),
(144, 6, 24, NULL, NULL, NULL),
(145, 6, 25, NULL, NULL, NULL),
(146, 6, 26, NULL, NULL, NULL),
(147, 6, 27, NULL, NULL, NULL),
(148, 6, 28, NULL, NULL, NULL),
(149, 6, 29, NULL, NULL, NULL),
(150, 6, 30, NULL, NULL, NULL),
(152, 8, 1, NULL, NULL, NULL),
(153, 8, 2, NULL, NULL, NULL),
(154, 8, 3, NULL, NULL, NULL),
(155, 8, 4, NULL, NULL, NULL),
(156, 8, 5, NULL, NULL, NULL),
(157, 8, 6, NULL, NULL, NULL),
(158, 8, 7, NULL, NULL, NULL),
(159, 8, 8, NULL, NULL, NULL),
(160, 8, 9, NULL, NULL, NULL),
(161, 8, 10, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `status` int(10) NOT NULL COMMENT '0 is ready\r\n1 is sold\r\n2 is hidden',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `seat_id`, `schedule_id`, `booking_id`, `status`, `created_at`, `updated_at`) VALUES
(241, 31, 36, NULL, 0, NULL, NULL),
(242, 32, 36, NULL, 0, NULL, NULL),
(243, 33, 36, NULL, 0, NULL, NULL),
(244, 34, 36, NULL, 0, NULL, NULL),
(245, 35, 36, NULL, 0, NULL, NULL),
(246, 36, 36, NULL, 0, NULL, NULL),
(247, 37, 36, NULL, 0, NULL, NULL),
(248, 38, 36, NULL, 0, NULL, NULL),
(249, 39, 36, NULL, 0, NULL, NULL),
(250, 40, 36, NULL, 0, NULL, NULL),
(251, 41, 36, NULL, 0, NULL, NULL),
(252, 42, 36, NULL, 0, NULL, NULL),
(253, 43, 36, NULL, 0, NULL, NULL),
(254, 44, 36, NULL, 0, NULL, NULL),
(255, 45, 36, NULL, 0, NULL, NULL),
(256, 46, 36, NULL, 0, NULL, NULL),
(257, 47, 36, NULL, 0, NULL, NULL),
(258, 48, 36, NULL, 0, NULL, NULL),
(259, 49, 36, NULL, 0, NULL, NULL),
(260, 50, 36, NULL, 0, NULL, NULL),
(261, 51, 36, NULL, 0, NULL, NULL),
(262, 52, 36, NULL, 0, NULL, NULL),
(263, 53, 36, NULL, 0, NULL, NULL),
(264, 54, 36, NULL, 0, NULL, NULL),
(265, 55, 36, NULL, 0, NULL, NULL),
(266, 56, 36, NULL, 0, NULL, NULL),
(267, 57, 36, NULL, 0, NULL, NULL),
(268, 58, 36, NULL, 0, NULL, NULL),
(269, 59, 36, NULL, 0, NULL, NULL),
(270, 60, 36, NULL, 0, NULL, NULL),
(271, 31, 37, NULL, 0, NULL, NULL),
(272, 32, 37, NULL, 0, NULL, NULL),
(273, 33, 37, NULL, 0, NULL, NULL),
(274, 34, 37, NULL, 0, NULL, NULL),
(275, 35, 37, NULL, 0, NULL, NULL),
(276, 36, 37, NULL, 0, NULL, NULL),
(277, 37, 37, NULL, 0, NULL, NULL),
(278, 38, 37, NULL, 0, NULL, NULL),
(279, 39, 37, NULL, 0, NULL, NULL),
(280, 40, 37, NULL, 0, NULL, NULL),
(281, 41, 37, NULL, 0, NULL, NULL),
(282, 42, 37, NULL, 0, NULL, NULL),
(283, 43, 37, NULL, 0, NULL, NULL),
(284, 44, 37, NULL, 0, NULL, NULL),
(285, 45, 37, NULL, 0, NULL, NULL),
(286, 46, 37, NULL, 0, NULL, NULL),
(287, 47, 37, NULL, 0, NULL, NULL),
(288, 48, 37, NULL, 0, NULL, NULL),
(289, 49, 37, NULL, 0, NULL, NULL),
(290, 50, 37, NULL, 0, NULL, NULL),
(291, 51, 37, NULL, 0, NULL, NULL),
(292, 52, 37, NULL, 0, NULL, NULL),
(293, 53, 37, NULL, 0, NULL, NULL),
(294, 54, 37, NULL, 0, NULL, NULL),
(295, 55, 37, NULL, 0, NULL, NULL),
(296, 56, 37, NULL, 0, NULL, NULL),
(297, 57, 37, NULL, 0, NULL, NULL),
(298, 58, 37, NULL, 0, NULL, NULL),
(299, 59, 37, NULL, 0, NULL, NULL),
(300, 60, 37, NULL, 0, NULL, NULL),
(301, 31, 38, NULL, 0, NULL, NULL),
(302, 32, 38, NULL, 0, NULL, NULL),
(303, 33, 38, NULL, 0, NULL, NULL),
(304, 34, 38, NULL, 0, NULL, NULL),
(305, 35, 38, NULL, 0, NULL, NULL),
(306, 36, 38, NULL, 0, NULL, NULL),
(307, 37, 38, NULL, 0, NULL, NULL),
(308, 38, 38, NULL, 0, NULL, NULL),
(309, 39, 38, NULL, 0, NULL, NULL),
(310, 40, 38, NULL, 0, NULL, NULL),
(311, 41, 38, NULL, 0, NULL, NULL),
(312, 42, 38, NULL, 0, NULL, NULL),
(313, 43, 38, NULL, 0, NULL, NULL),
(314, 44, 38, NULL, 0, NULL, NULL),
(315, 45, 38, NULL, 0, NULL, NULL),
(316, 46, 38, NULL, 0, NULL, NULL),
(317, 47, 38, NULL, 0, NULL, NULL),
(318, 48, 38, NULL, 0, NULL, NULL),
(319, 49, 38, NULL, 0, NULL, NULL),
(320, 50, 38, NULL, 0, NULL, NULL),
(321, 51, 38, NULL, 0, NULL, NULL),
(322, 52, 38, NULL, 0, NULL, NULL),
(323, 53, 38, NULL, 0, NULL, NULL),
(324, 54, 38, NULL, 0, NULL, NULL),
(325, 55, 38, NULL, 0, NULL, NULL),
(326, 56, 38, NULL, 0, NULL, NULL),
(327, 57, 38, NULL, 0, NULL, NULL),
(328, 58, 38, NULL, 0, NULL, NULL),
(329, 59, 38, NULL, 0, NULL, NULL),
(330, 60, 38, NULL, 0, NULL, NULL),
(331, 31, 39, NULL, 0, NULL, NULL),
(332, 32, 39, NULL, 0, NULL, NULL),
(333, 33, 39, NULL, 0, NULL, NULL),
(334, 34, 39, NULL, 0, NULL, NULL),
(335, 35, 39, NULL, 0, NULL, NULL),
(336, 36, 39, NULL, 0, NULL, NULL),
(337, 37, 39, NULL, 0, NULL, NULL),
(338, 38, 39, NULL, 0, NULL, NULL),
(339, 39, 39, NULL, 0, NULL, NULL),
(340, 40, 39, NULL, 0, NULL, NULL),
(341, 41, 39, NULL, 0, NULL, NULL),
(342, 42, 39, NULL, 0, NULL, NULL),
(343, 43, 39, NULL, 0, NULL, NULL),
(344, 44, 39, NULL, 0, NULL, NULL),
(345, 45, 39, NULL, 0, NULL, NULL),
(346, 46, 39, NULL, 0, NULL, NULL),
(347, 47, 39, NULL, 0, NULL, NULL),
(348, 48, 39, NULL, 0, NULL, NULL),
(349, 49, 39, NULL, 0, NULL, NULL),
(350, 50, 39, NULL, 0, NULL, NULL),
(351, 51, 39, NULL, 0, NULL, NULL),
(352, 52, 39, NULL, 0, NULL, NULL),
(353, 53, 39, NULL, 0, NULL, NULL),
(354, 54, 39, NULL, 0, NULL, NULL),
(355, 55, 39, NULL, 0, NULL, NULL),
(356, 56, 39, NULL, 0, NULL, NULL),
(357, 57, 39, NULL, 0, NULL, NULL),
(358, 58, 39, NULL, 0, NULL, NULL),
(359, 59, 39, NULL, 0, NULL, NULL),
(360, 60, 39, NULL, 0, NULL, NULL),
(361, 31, 40, NULL, 0, NULL, NULL),
(362, 32, 40, NULL, 0, NULL, NULL),
(363, 33, 40, NULL, 0, NULL, NULL),
(364, 34, 40, NULL, 0, NULL, NULL),
(365, 35, 40, NULL, 0, NULL, NULL),
(366, 36, 40, NULL, 0, NULL, NULL),
(367, 37, 40, NULL, 0, NULL, NULL),
(368, 38, 40, NULL, 0, NULL, NULL),
(369, 39, 40, NULL, 0, NULL, NULL),
(370, 40, 40, NULL, 0, NULL, NULL),
(371, 41, 40, NULL, 0, NULL, NULL),
(372, 42, 40, NULL, 0, NULL, NULL),
(373, 43, 40, NULL, 0, NULL, NULL),
(374, 44, 40, NULL, 0, NULL, NULL),
(375, 45, 40, NULL, 0, NULL, NULL),
(376, 46, 40, NULL, 0, NULL, NULL),
(377, 47, 40, NULL, 0, NULL, NULL),
(378, 48, 40, NULL, 0, NULL, NULL),
(379, 49, 40, NULL, 0, NULL, NULL),
(380, 50, 40, NULL, 0, NULL, NULL),
(381, 51, 40, NULL, 0, NULL, NULL),
(382, 52, 40, NULL, 0, NULL, NULL),
(383, 53, 40, NULL, 0, NULL, NULL),
(384, 54, 40, NULL, 0, NULL, NULL),
(385, 55, 40, NULL, 0, NULL, NULL),
(386, 56, 40, NULL, 0, NULL, NULL),
(387, 57, 40, NULL, 0, NULL, NULL),
(388, 58, 40, NULL, 0, NULL, NULL),
(389, 59, 40, NULL, 0, NULL, NULL),
(390, 60, 40, NULL, 0, NULL, NULL),
(391, 31, 41, NULL, 0, NULL, NULL),
(392, 32, 41, NULL, 0, NULL, NULL),
(393, 33, 41, NULL, 0, NULL, NULL),
(394, 34, 41, NULL, 0, NULL, NULL),
(395, 35, 41, NULL, 0, NULL, NULL),
(396, 36, 41, NULL, 0, NULL, NULL),
(397, 37, 41, NULL, 0, NULL, NULL),
(398, 38, 41, NULL, 0, NULL, NULL),
(399, 39, 41, NULL, 0, NULL, NULL),
(400, 40, 41, NULL, 0, NULL, NULL),
(401, 41, 41, NULL, 0, NULL, NULL),
(402, 42, 41, NULL, 0, NULL, NULL),
(403, 43, 41, NULL, 0, NULL, NULL),
(404, 44, 41, NULL, 0, NULL, NULL),
(405, 45, 41, NULL, 0, NULL, NULL),
(406, 46, 41, NULL, 0, NULL, NULL),
(407, 47, 41, NULL, 0, NULL, NULL),
(408, 48, 41, NULL, 0, NULL, NULL),
(409, 49, 41, NULL, 0, NULL, NULL),
(410, 50, 41, NULL, 0, NULL, NULL),
(411, 51, 41, NULL, 0, NULL, NULL),
(412, 52, 41, NULL, 0, NULL, NULL),
(413, 53, 41, NULL, 0, NULL, NULL),
(414, 54, 41, NULL, 0, NULL, NULL),
(415, 55, 41, NULL, 0, NULL, NULL),
(416, 56, 41, NULL, 0, NULL, NULL),
(417, 57, 41, NULL, 0, NULL, NULL),
(418, 58, 41, NULL, 0, NULL, NULL),
(419, 59, 41, NULL, 0, NULL, NULL),
(420, 60, 41, NULL, 0, NULL, NULL),
(421, 31, 42, NULL, 0, NULL, NULL),
(422, 32, 42, NULL, 0, NULL, NULL),
(423, 33, 42, NULL, 0, NULL, NULL),
(424, 34, 42, NULL, 0, NULL, NULL),
(425, 35, 42, NULL, 0, NULL, NULL),
(426, 36, 42, NULL, 0, NULL, NULL),
(427, 37, 42, NULL, 0, NULL, NULL),
(428, 38, 42, NULL, 0, NULL, NULL),
(429, 39, 42, NULL, 0, NULL, NULL),
(430, 40, 42, NULL, 0, NULL, NULL),
(431, 41, 42, NULL, 0, NULL, NULL),
(432, 42, 42, NULL, 0, NULL, NULL),
(433, 43, 42, NULL, 0, NULL, NULL),
(434, 44, 42, NULL, 0, NULL, NULL),
(435, 45, 42, NULL, 0, NULL, NULL),
(436, 46, 42, NULL, 0, NULL, NULL),
(437, 47, 42, NULL, 0, NULL, NULL),
(438, 48, 42, NULL, 0, NULL, NULL),
(439, 49, 42, NULL, 0, NULL, NULL),
(440, 50, 42, NULL, 0, NULL, NULL),
(441, 51, 42, NULL, 0, NULL, NULL),
(442, 52, 42, NULL, 0, NULL, NULL),
(443, 53, 42, NULL, 0, NULL, NULL),
(444, 54, 42, NULL, 0, NULL, NULL),
(445, 55, 42, NULL, 0, NULL, NULL),
(446, 56, 42, NULL, 0, NULL, NULL),
(447, 57, 42, NULL, 0, NULL, NULL),
(448, 58, 42, NULL, 0, NULL, NULL),
(449, 59, 42, NULL, 0, NULL, NULL),
(450, 60, 42, NULL, 0, NULL, NULL),
(451, 61, 43, NULL, 0, NULL, NULL),
(452, 62, 43, NULL, 0, NULL, NULL),
(453, 63, 43, NULL, 0, NULL, NULL),
(454, 64, 43, NULL, 0, NULL, NULL),
(455, 65, 43, NULL, 0, NULL, NULL),
(456, 66, 43, NULL, 0, NULL, NULL),
(457, 67, 43, NULL, 0, NULL, NULL),
(458, 68, 43, NULL, 0, NULL, NULL),
(459, 69, 43, NULL, 0, NULL, NULL),
(460, 70, 43, NULL, 0, NULL, NULL),
(461, 71, 43, NULL, 0, NULL, NULL),
(462, 72, 43, NULL, 0, NULL, NULL),
(463, 73, 43, NULL, 0, NULL, NULL),
(464, 74, 43, NULL, 0, NULL, NULL),
(465, 75, 43, NULL, 0, NULL, NULL),
(466, 76, 43, NULL, 0, NULL, NULL),
(467, 77, 43, NULL, 0, NULL, NULL),
(468, 78, 43, NULL, 0, NULL, NULL),
(469, 79, 43, NULL, 0, NULL, NULL),
(470, 80, 43, NULL, 0, NULL, NULL),
(471, 81, 43, NULL, 0, NULL, NULL),
(472, 82, 43, NULL, 0, NULL, NULL),
(473, 83, 43, NULL, 0, NULL, NULL),
(474, 84, 43, NULL, 0, NULL, NULL),
(475, 85, 43, NULL, 0, NULL, NULL),
(476, 86, 43, NULL, 0, NULL, NULL),
(477, 87, 43, NULL, 0, NULL, NULL),
(478, 88, 43, NULL, 0, NULL, NULL),
(479, 89, 43, NULL, 0, NULL, NULL),
(480, 90, 43, NULL, 0, NULL, NULL),
(481, 61, 44, NULL, 0, NULL, NULL),
(482, 62, 44, NULL, 0, NULL, NULL),
(483, 63, 44, NULL, 0, NULL, NULL),
(484, 64, 44, NULL, 0, NULL, NULL),
(485, 65, 44, NULL, 0, NULL, NULL),
(486, 66, 44, NULL, 0, NULL, NULL),
(487, 67, 44, NULL, 0, NULL, NULL),
(488, 68, 44, NULL, 0, NULL, NULL),
(489, 69, 44, NULL, 0, NULL, NULL),
(490, 70, 44, NULL, 0, NULL, NULL),
(491, 71, 44, NULL, 0, NULL, NULL),
(492, 72, 44, NULL, 0, NULL, NULL),
(493, 73, 44, NULL, 0, NULL, NULL),
(494, 74, 44, NULL, 0, NULL, NULL),
(495, 75, 44, NULL, 0, NULL, NULL),
(496, 76, 44, NULL, 0, NULL, NULL),
(497, 77, 44, NULL, 0, NULL, NULL),
(498, 78, 44, NULL, 0, NULL, NULL),
(499, 79, 44, NULL, 0, NULL, NULL),
(500, 80, 44, NULL, 0, NULL, NULL),
(501, 81, 44, NULL, 0, NULL, NULL),
(502, 82, 44, NULL, 0, NULL, NULL),
(503, 83, 44, NULL, 0, NULL, NULL),
(504, 84, 44, NULL, 0, NULL, NULL),
(505, 85, 44, NULL, 0, NULL, NULL),
(506, 86, 44, NULL, 0, NULL, NULL),
(507, 87, 44, NULL, 0, NULL, NULL),
(508, 88, 44, NULL, 0, NULL, NULL),
(509, 89, 44, NULL, 0, NULL, NULL),
(510, 90, 44, NULL, 0, NULL, NULL),
(511, 61, 45, NULL, 0, NULL, NULL),
(512, 62, 45, NULL, 0, NULL, NULL),
(513, 63, 45, NULL, 0, NULL, NULL),
(514, 64, 45, NULL, 0, NULL, NULL),
(515, 65, 45, NULL, 0, NULL, NULL),
(516, 66, 45, NULL, 0, NULL, NULL),
(517, 67, 45, NULL, 0, NULL, NULL),
(518, 68, 45, NULL, 0, NULL, NULL),
(519, 69, 45, NULL, 0, NULL, NULL),
(520, 70, 45, NULL, 0, NULL, NULL),
(521, 71, 45, NULL, 0, NULL, NULL),
(522, 72, 45, NULL, 0, NULL, NULL),
(523, 73, 45, NULL, 0, NULL, NULL),
(524, 74, 45, NULL, 0, NULL, NULL),
(525, 75, 45, NULL, 0, NULL, NULL),
(526, 76, 45, NULL, 0, NULL, NULL),
(527, 77, 45, NULL, 0, NULL, NULL),
(528, 78, 45, NULL, 0, NULL, NULL),
(529, 79, 45, NULL, 0, NULL, NULL),
(530, 80, 45, NULL, 0, NULL, NULL),
(531, 81, 45, NULL, 0, NULL, NULL),
(532, 82, 45, NULL, 0, NULL, NULL),
(533, 83, 45, NULL, 0, NULL, NULL),
(534, 84, 45, NULL, 0, NULL, NULL),
(535, 85, 45, NULL, 0, NULL, NULL),
(536, 86, 45, NULL, 0, NULL, NULL),
(537, 87, 45, NULL, 0, NULL, NULL),
(538, 88, 45, NULL, 0, NULL, NULL),
(539, 89, 45, NULL, 0, NULL, NULL),
(540, 90, 45, NULL, 0, NULL, NULL),
(541, 61, 46, NULL, 0, NULL, NULL),
(542, 62, 46, NULL, 0, NULL, NULL),
(543, 63, 46, NULL, 0, NULL, NULL),
(544, 64, 46, NULL, 0, NULL, NULL),
(545, 65, 46, NULL, 0, NULL, NULL),
(546, 66, 46, NULL, 0, NULL, NULL),
(547, 67, 46, NULL, 0, NULL, NULL),
(548, 68, 46, NULL, 0, NULL, NULL),
(549, 69, 46, NULL, 0, NULL, NULL),
(550, 70, 46, NULL, 0, NULL, NULL),
(551, 71, 46, NULL, 0, NULL, NULL),
(552, 72, 46, NULL, 0, NULL, NULL),
(553, 73, 46, NULL, 0, NULL, NULL),
(554, 74, 46, NULL, 0, NULL, NULL),
(555, 75, 46, NULL, 0, NULL, NULL),
(556, 76, 46, NULL, 0, NULL, NULL),
(557, 77, 46, NULL, 0, NULL, NULL),
(558, 78, 46, NULL, 0, NULL, NULL),
(559, 79, 46, NULL, 0, NULL, NULL),
(560, 80, 46, NULL, 0, NULL, NULL),
(561, 81, 46, NULL, 0, NULL, NULL),
(562, 82, 46, NULL, 0, NULL, NULL),
(563, 83, 46, NULL, 0, NULL, NULL),
(564, 84, 46, NULL, 0, NULL, NULL),
(565, 85, 46, NULL, 0, NULL, NULL),
(566, 86, 46, NULL, 0, NULL, NULL),
(567, 87, 46, NULL, 0, NULL, NULL),
(568, 88, 46, NULL, 0, NULL, NULL),
(569, 89, 46, NULL, 0, NULL, NULL),
(570, 90, 46, NULL, 0, NULL, NULL),
(571, 61, 47, NULL, 0, NULL, NULL),
(572, 62, 47, NULL, 0, NULL, NULL),
(573, 63, 47, NULL, 0, NULL, NULL),
(574, 64, 47, NULL, 0, NULL, NULL),
(575, 65, 47, NULL, 0, NULL, NULL),
(576, 66, 47, NULL, 0, NULL, NULL),
(577, 67, 47, NULL, 0, NULL, NULL),
(578, 68, 47, NULL, 0, NULL, NULL),
(579, 69, 47, NULL, 0, NULL, NULL),
(580, 70, 47, NULL, 0, NULL, NULL),
(581, 71, 47, NULL, 0, NULL, NULL),
(582, 72, 47, NULL, 0, NULL, NULL),
(583, 73, 47, NULL, 0, NULL, NULL),
(584, 74, 47, NULL, 0, NULL, NULL),
(585, 75, 47, NULL, 0, NULL, NULL),
(586, 76, 47, NULL, 0, NULL, NULL),
(587, 77, 47, NULL, 0, NULL, NULL),
(588, 78, 47, NULL, 0, NULL, NULL),
(589, 79, 47, NULL, 0, NULL, NULL),
(590, 80, 47, NULL, 0, NULL, NULL),
(591, 81, 47, NULL, 0, NULL, NULL),
(592, 82, 47, NULL, 0, NULL, NULL),
(593, 83, 47, NULL, 0, NULL, NULL),
(594, 84, 47, NULL, 0, NULL, NULL),
(595, 85, 47, NULL, 0, NULL, NULL),
(596, 86, 47, NULL, 0, NULL, NULL),
(597, 87, 47, NULL, 0, NULL, NULL),
(598, 88, 47, NULL, 0, NULL, NULL),
(599, 89, 47, NULL, 0, NULL, NULL),
(600, 90, 47, NULL, 0, NULL, NULL),
(601, 31, 48, NULL, 0, NULL, NULL),
(602, 32, 48, NULL, 0, NULL, NULL),
(603, 33, 48, NULL, 0, NULL, NULL),
(604, 34, 48, NULL, 0, NULL, NULL),
(605, 35, 48, NULL, 0, NULL, NULL),
(606, 36, 48, NULL, 0, NULL, NULL),
(607, 37, 48, NULL, 0, NULL, NULL),
(608, 38, 48, NULL, 0, NULL, NULL),
(609, 39, 48, NULL, 0, NULL, NULL),
(610, 40, 48, NULL, 0, NULL, NULL),
(611, 41, 48, NULL, 0, NULL, NULL),
(612, 42, 48, NULL, 0, NULL, NULL),
(613, 43, 48, NULL, 0, NULL, NULL),
(614, 44, 48, NULL, 0, NULL, NULL),
(615, 45, 48, NULL, 0, NULL, NULL),
(616, 46, 48, NULL, 0, NULL, NULL),
(617, 47, 48, NULL, 0, NULL, NULL),
(618, 48, 48, NULL, 0, NULL, NULL),
(619, 49, 48, NULL, 0, NULL, NULL),
(620, 50, 48, NULL, 0, NULL, NULL),
(621, 51, 48, NULL, 0, NULL, NULL),
(622, 52, 48, NULL, 0, NULL, NULL),
(623, 53, 48, NULL, 0, NULL, NULL),
(624, 54, 48, NULL, 0, NULL, NULL),
(625, 55, 48, NULL, 0, NULL, NULL),
(626, 56, 48, NULL, 0, NULL, NULL),
(627, 57, 48, NULL, 0, NULL, NULL),
(628, 58, 48, NULL, 0, NULL, NULL),
(629, 59, 48, NULL, 0, NULL, NULL),
(630, 60, 48, NULL, 0, NULL, NULL),
(631, 31, 49, NULL, 0, NULL, NULL),
(632, 32, 49, NULL, 0, NULL, NULL),
(633, 33, 49, NULL, 0, NULL, NULL),
(634, 34, 49, NULL, 0, NULL, NULL),
(635, 35, 49, NULL, 0, NULL, NULL),
(636, 36, 49, NULL, 0, NULL, NULL),
(637, 37, 49, NULL, 0, NULL, NULL),
(638, 38, 49, NULL, 0, NULL, NULL),
(639, 39, 49, NULL, 0, NULL, NULL),
(640, 40, 49, NULL, 0, NULL, NULL),
(641, 41, 49, NULL, 0, NULL, NULL),
(642, 42, 49, NULL, 0, NULL, NULL),
(643, 43, 49, NULL, 0, NULL, NULL),
(644, 44, 49, NULL, 0, NULL, NULL),
(645, 45, 49, NULL, 0, NULL, NULL),
(646, 46, 49, NULL, 0, NULL, NULL),
(647, 47, 49, NULL, 0, NULL, NULL),
(648, 48, 49, NULL, 0, NULL, NULL),
(649, 49, 49, NULL, 0, NULL, NULL),
(650, 50, 49, NULL, 0, NULL, NULL),
(651, 51, 49, NULL, 0, NULL, NULL),
(652, 52, 49, NULL, 0, NULL, NULL),
(653, 53, 49, NULL, 0, NULL, NULL),
(654, 54, 49, NULL, 0, NULL, NULL),
(655, 55, 49, NULL, 0, NULL, NULL),
(656, 56, 49, NULL, 0, NULL, NULL),
(657, 57, 49, NULL, 0, NULL, NULL),
(658, 58, 49, NULL, 0, NULL, NULL),
(659, 59, 49, NULL, 0, NULL, NULL),
(660, 60, 49, NULL, 0, NULL, NULL),
(661, 31, 50, NULL, 0, NULL, NULL),
(662, 32, 50, NULL, 0, NULL, NULL),
(663, 33, 50, NULL, 0, NULL, NULL),
(664, 34, 50, NULL, 0, NULL, NULL),
(665, 35, 50, NULL, 0, NULL, NULL),
(666, 36, 50, NULL, 0, NULL, NULL),
(667, 37, 50, NULL, 0, NULL, NULL),
(668, 38, 50, NULL, 0, NULL, NULL),
(669, 39, 50, NULL, 0, NULL, NULL),
(670, 40, 50, NULL, 0, NULL, NULL),
(671, 41, 50, NULL, 0, NULL, NULL),
(672, 42, 50, NULL, 0, NULL, NULL),
(673, 43, 50, NULL, 0, NULL, NULL),
(674, 44, 50, NULL, 0, NULL, NULL),
(675, 45, 50, NULL, 0, NULL, NULL),
(676, 46, 50, NULL, 0, NULL, NULL),
(677, 47, 50, NULL, 0, NULL, NULL),
(678, 48, 50, NULL, 0, NULL, NULL),
(679, 49, 50, NULL, 0, NULL, NULL),
(680, 50, 50, NULL, 0, NULL, NULL),
(681, 51, 50, NULL, 0, NULL, NULL),
(682, 52, 50, NULL, 0, NULL, NULL),
(683, 53, 50, NULL, 0, NULL, NULL),
(684, 54, 50, NULL, 0, NULL, NULL),
(685, 55, 50, NULL, 0, NULL, NULL),
(686, 56, 50, NULL, 0, NULL, NULL),
(687, 57, 50, NULL, 0, NULL, NULL),
(688, 58, 50, NULL, 0, NULL, NULL),
(689, 59, 50, NULL, 0, NULL, NULL),
(690, 60, 50, NULL, 0, NULL, NULL),
(691, 91, 51, NULL, 0, NULL, NULL),
(692, 92, 51, NULL, 0, NULL, NULL),
(693, 93, 51, NULL, 0, NULL, NULL),
(694, 94, 51, NULL, 0, NULL, NULL),
(695, 95, 51, NULL, 0, NULL, NULL),
(696, 96, 51, NULL, 0, NULL, NULL),
(697, 97, 51, NULL, 0, NULL, NULL),
(698, 98, 51, NULL, 0, NULL, NULL),
(699, 99, 51, NULL, 0, NULL, NULL),
(700, 100, 51, NULL, 0, NULL, NULL),
(701, 101, 51, NULL, 0, NULL, NULL),
(702, 102, 51, NULL, 0, NULL, NULL),
(703, 103, 51, NULL, 0, NULL, NULL),
(704, 104, 51, NULL, 0, NULL, NULL),
(705, 105, 51, NULL, 0, NULL, NULL),
(706, 106, 51, NULL, 0, NULL, NULL),
(707, 107, 51, NULL, 0, NULL, NULL),
(708, 108, 51, NULL, 0, NULL, NULL),
(709, 109, 51, NULL, 0, NULL, NULL),
(710, 110, 51, NULL, 0, NULL, NULL),
(711, 111, 51, NULL, 0, NULL, NULL),
(712, 112, 51, NULL, 0, NULL, NULL),
(713, 113, 51, NULL, 0, NULL, NULL),
(714, 114, 51, NULL, 0, NULL, NULL),
(715, 115, 51, NULL, 0, NULL, NULL),
(716, 116, 51, NULL, 0, NULL, NULL),
(717, 117, 51, NULL, 0, NULL, NULL),
(718, 118, 51, NULL, 0, NULL, NULL),
(719, 119, 51, NULL, 0, NULL, NULL),
(720, 120, 51, NULL, 0, NULL, NULL),
(721, 91, 52, NULL, 0, NULL, NULL),
(722, 92, 52, NULL, 0, NULL, NULL),
(723, 93, 52, NULL, 0, NULL, NULL),
(724, 94, 52, NULL, 0, NULL, NULL),
(725, 95, 52, NULL, 0, NULL, NULL),
(726, 96, 52, NULL, 0, NULL, NULL),
(727, 97, 52, NULL, 0, NULL, NULL),
(728, 98, 52, NULL, 0, NULL, NULL),
(729, 99, 52, NULL, 0, NULL, NULL),
(730, 100, 52, NULL, 0, NULL, NULL),
(731, 101, 52, NULL, 0, NULL, NULL),
(732, 102, 52, NULL, 0, NULL, NULL),
(733, 103, 52, NULL, 0, NULL, NULL),
(734, 104, 52, NULL, 0, NULL, NULL),
(735, 105, 52, NULL, 0, NULL, NULL),
(736, 106, 52, NULL, 0, NULL, NULL),
(737, 107, 52, NULL, 0, NULL, NULL),
(738, 108, 52, NULL, 0, NULL, NULL),
(739, 109, 52, NULL, 0, NULL, NULL),
(740, 110, 52, NULL, 0, NULL, NULL),
(741, 111, 52, NULL, 0, NULL, NULL),
(742, 112, 52, NULL, 0, NULL, NULL),
(743, 113, 52, NULL, 0, NULL, NULL),
(744, 114, 52, NULL, 0, NULL, NULL),
(745, 115, 52, NULL, 0, NULL, NULL),
(746, 116, 52, NULL, 0, NULL, NULL),
(747, 117, 52, NULL, 0, NULL, NULL),
(748, 118, 52, NULL, 0, NULL, NULL),
(749, 119, 52, NULL, 0, NULL, NULL),
(750, 120, 52, NULL, 0, NULL, NULL),
(751, 31, 53, NULL, 0, NULL, NULL),
(752, 32, 53, NULL, 0, NULL, NULL),
(753, 33, 53, NULL, 0, NULL, NULL),
(754, 34, 53, NULL, 0, NULL, NULL),
(755, 35, 53, NULL, 0, NULL, NULL),
(756, 36, 53, NULL, 0, NULL, NULL),
(757, 37, 53, NULL, 0, NULL, NULL),
(758, 38, 53, NULL, 0, NULL, NULL),
(759, 39, 53, NULL, 0, NULL, NULL),
(760, 40, 53, NULL, 0, NULL, NULL),
(761, 41, 53, NULL, 0, NULL, NULL),
(762, 42, 53, NULL, 0, NULL, NULL),
(763, 43, 53, NULL, 0, NULL, NULL),
(764, 44, 53, NULL, 0, NULL, NULL),
(765, 45, 53, NULL, 0, NULL, NULL),
(766, 46, 53, NULL, 0, NULL, NULL),
(767, 47, 53, NULL, 0, NULL, NULL),
(768, 48, 53, NULL, 0, NULL, NULL),
(769, 49, 53, NULL, 0, NULL, NULL),
(770, 50, 53, NULL, 0, NULL, NULL),
(771, 51, 53, NULL, 0, NULL, NULL),
(772, 52, 53, NULL, 0, NULL, NULL),
(773, 53, 53, NULL, 0, NULL, NULL),
(774, 54, 53, NULL, 0, NULL, NULL),
(775, 55, 53, NULL, 0, NULL, NULL),
(776, 56, 53, NULL, 0, NULL, NULL),
(777, 57, 53, NULL, 0, NULL, NULL),
(778, 58, 53, NULL, 0, NULL, NULL),
(779, 59, 53, NULL, 0, NULL, NULL),
(780, 60, 53, NULL, 0, NULL, NULL),
(781, 31, 54, NULL, 0, NULL, NULL),
(782, 32, 54, NULL, 0, NULL, NULL),
(783, 33, 54, NULL, 0, NULL, NULL),
(784, 34, 54, NULL, 0, NULL, NULL),
(785, 35, 54, NULL, 0, NULL, NULL),
(786, 36, 54, NULL, 0, NULL, NULL),
(787, 37, 54, NULL, 0, NULL, NULL),
(788, 38, 54, NULL, 0, NULL, NULL),
(789, 39, 54, NULL, 0, NULL, NULL),
(790, 40, 54, NULL, 0, NULL, NULL),
(791, 41, 54, NULL, 0, NULL, NULL),
(792, 42, 54, NULL, 0, NULL, NULL),
(793, 43, 54, NULL, 0, NULL, NULL),
(794, 44, 54, NULL, 0, NULL, NULL),
(795, 45, 54, NULL, 0, NULL, NULL),
(796, 46, 54, NULL, 0, NULL, NULL),
(797, 47, 54, NULL, 0, NULL, NULL),
(798, 48, 54, NULL, 0, NULL, NULL),
(799, 49, 54, NULL, 0, NULL, NULL),
(800, 50, 54, NULL, 0, NULL, NULL),
(801, 51, 54, NULL, 0, NULL, NULL),
(802, 52, 54, NULL, 0, NULL, NULL),
(803, 53, 54, NULL, 0, NULL, NULL),
(804, 54, 54, NULL, 0, NULL, NULL),
(805, 55, 54, NULL, 0, NULL, NULL),
(806, 56, 54, NULL, 0, NULL, NULL),
(807, 57, 54, NULL, 0, NULL, NULL),
(808, 58, 54, NULL, 0, NULL, NULL),
(809, 59, 54, NULL, 0, NULL, NULL),
(810, 60, 54, NULL, 0, NULL, NULL),
(811, 31, 55, NULL, 0, NULL, NULL),
(812, 32, 55, NULL, 0, NULL, NULL),
(813, 33, 55, NULL, 0, NULL, NULL),
(814, 34, 55, NULL, 0, NULL, NULL),
(815, 35, 55, NULL, 0, NULL, NULL),
(816, 36, 55, NULL, 0, NULL, NULL),
(817, 37, 55, NULL, 0, NULL, NULL),
(818, 38, 55, NULL, 0, NULL, NULL),
(819, 39, 55, NULL, 0, NULL, NULL),
(820, 40, 55, NULL, 0, NULL, NULL),
(821, 41, 55, NULL, 0, NULL, NULL),
(822, 42, 55, NULL, 0, NULL, NULL),
(823, 43, 55, NULL, 0, NULL, NULL),
(824, 44, 55, NULL, 0, NULL, NULL),
(825, 45, 55, NULL, 0, NULL, NULL),
(826, 46, 55, NULL, 0, NULL, NULL),
(827, 47, 55, NULL, 0, NULL, NULL),
(828, 48, 55, NULL, 0, NULL, NULL),
(829, 49, 55, NULL, 0, NULL, NULL),
(830, 50, 55, NULL, 0, NULL, NULL),
(831, 51, 55, NULL, 0, NULL, NULL),
(832, 52, 55, NULL, 0, NULL, NULL),
(833, 53, 55, NULL, 0, NULL, NULL),
(834, 54, 55, NULL, 0, NULL, NULL),
(835, 55, 55, NULL, 0, NULL, NULL),
(836, 56, 55, NULL, 0, NULL, NULL),
(837, 57, 55, NULL, 0, NULL, NULL),
(838, 58, 55, NULL, 0, NULL, NULL),
(839, 59, 55, NULL, 0, NULL, NULL),
(840, 60, 55, NULL, 0, NULL, NULL),
(841, 31, 56, NULL, 0, NULL, '2023-12-03 02:09:57'),
(842, 32, 56, NULL, 0, NULL, '2023-12-03 02:09:57'),
(843, 33, 56, NULL, 0, NULL, '2023-12-06 03:58:35'),
(844, 34, 56, NULL, 0, NULL, '2023-12-06 03:58:35'),
(845, 35, 56, NULL, 0, NULL, '2023-12-06 03:58:35'),
(846, 36, 56, NULL, 0, NULL, '2023-12-06 03:58:35'),
(847, 37, 56, NULL, 0, NULL, NULL),
(848, 38, 56, NULL, 0, NULL, NULL),
(849, 39, 56, NULL, 0, NULL, NULL),
(850, 40, 56, NULL, 0, NULL, NULL),
(851, 41, 56, NULL, 0, NULL, '2023-12-07 01:10:47'),
(852, 42, 56, NULL, 0, NULL, '2023-12-07 01:57:56'),
(853, 43, 56, NULL, 0, NULL, '2023-12-07 01:57:56'),
(854, 44, 56, NULL, 0, NULL, '2023-12-07 01:57:56'),
(855, 45, 56, NULL, 0, NULL, NULL),
(856, 46, 56, NULL, 0, NULL, NULL),
(857, 47, 56, NULL, 0, NULL, NULL),
(858, 48, 56, NULL, 0, NULL, NULL),
(859, 49, 56, NULL, 0, NULL, '2023-12-07 01:10:47'),
(860, 50, 56, NULL, 0, NULL, '2023-12-03 06:28:10'),
(861, 51, 56, NULL, 0, NULL, NULL),
(862, 52, 56, NULL, 0, NULL, NULL),
(863, 53, 56, NULL, 0, NULL, NULL),
(864, 54, 56, NULL, 0, NULL, NULL),
(865, 55, 56, NULL, 0, NULL, NULL),
(866, 56, 56, NULL, 0, NULL, NULL),
(867, 57, 56, NULL, 0, NULL, '2023-12-07 01:10:47'),
(868, 58, 56, NULL, 0, NULL, '2023-12-03 06:28:10'),
(869, 59, 56, NULL, 0, NULL, NULL),
(870, 60, 56, NULL, 0, NULL, NULL),
(871, 31, 57, NULL, 0, NULL, '2023-12-03 09:19:54'),
(872, 32, 57, NULL, 0, NULL, NULL),
(873, 33, 57, NULL, 0, NULL, '2023-12-03 09:20:09'),
(874, 34, 57, NULL, 0, NULL, '2023-12-08 19:18:13'),
(875, 35, 57, NULL, 0, NULL, '2023-12-08 19:18:13'),
(876, 36, 57, NULL, 0, NULL, '2023-12-08 19:18:13'),
(877, 37, 57, NULL, 0, NULL, NULL),
(878, 38, 57, NULL, 0, NULL, NULL),
(879, 39, 57, NULL, 0, NULL, NULL),
(880, 40, 57, NULL, 0, NULL, NULL),
(881, 41, 57, NULL, 0, NULL, '2023-12-03 09:20:09'),
(882, 42, 57, NULL, 0, NULL, '2023-12-03 09:20:09'),
(883, 43, 57, NULL, 0, NULL, NULL),
(884, 44, 57, NULL, 0, NULL, NULL),
(885, 45, 57, NULL, 0, NULL, NULL),
(886, 46, 57, NULL, 0, NULL, NULL),
(887, 47, 57, NULL, 0, NULL, NULL),
(888, 48, 57, NULL, 0, NULL, NULL),
(889, 49, 57, NULL, 0, NULL, NULL),
(890, 50, 57, NULL, 0, NULL, NULL),
(891, 51, 57, NULL, 0, NULL, NULL),
(892, 52, 57, NULL, 0, NULL, NULL),
(893, 53, 57, NULL, 0, NULL, NULL),
(894, 54, 57, NULL, 0, NULL, NULL),
(895, 55, 57, NULL, 0, NULL, NULL),
(896, 56, 57, NULL, 0, NULL, NULL),
(897, 57, 57, NULL, 0, NULL, NULL),
(898, 58, 57, NULL, 0, NULL, NULL),
(899, 59, 57, NULL, 0, NULL, NULL),
(900, 60, 57, NULL, 0, NULL, NULL),
(901, 31, 58, NULL, 0, NULL, NULL),
(902, 32, 58, NULL, 0, NULL, NULL),
(903, 33, 58, NULL, 0, NULL, '2023-12-03 09:21:16'),
(904, 34, 58, NULL, 0, NULL, '2023-12-03 09:21:01'),
(905, 35, 58, NULL, 0, NULL, '2023-12-03 09:21:16'),
(906, 36, 58, NULL, 0, NULL, '2023-12-03 09:21:16'),
(907, 37, 58, NULL, 0, NULL, NULL),
(908, 38, 58, NULL, 0, NULL, NULL),
(909, 39, 58, NULL, 0, NULL, NULL),
(910, 40, 58, NULL, 0, NULL, NULL),
(911, 41, 58, NULL, 0, NULL, '2023-12-03 09:21:16'),
(912, 42, 58, NULL, 0, NULL, '2023-12-03 09:21:01'),
(913, 43, 58, NULL, 0, NULL, '2023-12-03 09:21:16'),
(914, 44, 58, NULL, 0, NULL, '2023-12-03 09:21:16'),
(915, 45, 58, NULL, 0, NULL, NULL),
(916, 46, 58, NULL, 0, NULL, NULL),
(917, 47, 58, NULL, 0, NULL, NULL),
(918, 48, 58, NULL, 0, NULL, NULL),
(919, 49, 58, NULL, 0, NULL, NULL),
(920, 50, 58, NULL, 0, NULL, '2023-12-03 09:21:01'),
(921, 51, 58, NULL, 0, NULL, NULL),
(922, 52, 58, NULL, 0, NULL, NULL),
(923, 53, 58, NULL, 0, NULL, NULL),
(924, 54, 58, NULL, 0, NULL, NULL),
(925, 55, 58, NULL, 0, NULL, NULL),
(926, 56, 58, NULL, 0, NULL, NULL),
(927, 57, 58, NULL, 0, NULL, NULL),
(928, 58, 58, NULL, 0, NULL, '2023-12-03 09:21:01'),
(929, 59, 58, NULL, 0, NULL, NULL),
(930, 60, 58, NULL, 0, NULL, NULL),
(931, 61, 59, NULL, 0, NULL, NULL),
(932, 62, 59, NULL, 0, NULL, NULL),
(933, 63, 59, NULL, 0, NULL, NULL),
(934, 64, 59, NULL, 0, NULL, NULL),
(935, 65, 59, NULL, 0, NULL, NULL),
(936, 66, 59, NULL, 0, NULL, NULL),
(937, 67, 59, NULL, 0, NULL, NULL),
(938, 68, 59, NULL, 0, NULL, NULL),
(939, 69, 59, NULL, 0, NULL, NULL),
(940, 70, 59, NULL, 0, NULL, NULL),
(941, 71, 59, NULL, 0, NULL, NULL),
(942, 72, 59, NULL, 0, NULL, NULL),
(943, 73, 59, NULL, 0, NULL, NULL),
(944, 74, 59, NULL, 0, NULL, NULL),
(945, 75, 59, NULL, 0, NULL, NULL),
(946, 76, 59, NULL, 0, NULL, NULL),
(947, 77, 59, NULL, 0, NULL, NULL),
(948, 78, 59, NULL, 0, NULL, NULL),
(949, 79, 59, NULL, 0, NULL, NULL),
(950, 80, 59, NULL, 0, NULL, NULL),
(951, 81, 59, NULL, 0, NULL, NULL),
(952, 82, 59, NULL, 0, NULL, NULL),
(953, 83, 59, NULL, 0, NULL, NULL),
(954, 84, 59, NULL, 0, NULL, NULL),
(955, 85, 59, NULL, 0, NULL, NULL),
(956, 86, 59, NULL, 0, NULL, NULL),
(957, 87, 59, NULL, 0, NULL, NULL),
(958, 88, 59, NULL, 0, NULL, NULL),
(959, 89, 59, NULL, 0, NULL, NULL),
(960, 90, 59, NULL, 0, NULL, NULL),
(961, 152, 60, NULL, 0, NULL, NULL),
(962, 153, 60, NULL, 0, NULL, NULL),
(963, 154, 60, NULL, 0, NULL, NULL),
(964, 155, 60, NULL, 0, NULL, NULL),
(965, 156, 60, NULL, 0, NULL, NULL),
(966, 157, 60, NULL, 0, NULL, NULL),
(967, 158, 60, NULL, 0, NULL, NULL),
(968, 159, 60, NULL, 0, NULL, NULL),
(969, 160, 60, NULL, 0, NULL, NULL),
(970, 161, 60, NULL, 0, NULL, NULL),
(971, 91, 61, 44, 1, NULL, '2023-12-22 06:00:02'),
(972, 92, 61, 44, 1, NULL, '2023-12-22 06:00:02'),
(973, 93, 61, 42, 1, NULL, '2023-12-22 05:39:45'),
(974, 94, 61, 42, 1, NULL, '2023-12-22 05:39:45'),
(975, 95, 61, 42, 1, NULL, '2023-12-22 05:39:45'),
(976, 96, 61, 42, 1, NULL, '2023-12-22 05:39:45'),
(977, 97, 61, NULL, 0, NULL, NULL),
(978, 98, 61, NULL, 0, NULL, NULL),
(979, 99, 61, NULL, 0, NULL, NULL),
(980, 100, 61, NULL, 0, NULL, NULL),
(981, 101, 61, 45, 1, NULL, '2023-12-24 02:37:54'),
(982, 102, 61, 45, 1, NULL, '2023-12-24 02:37:54'),
(983, 103, 61, 45, 1, NULL, '2023-12-24 02:37:54'),
(984, 104, 61, NULL, 0, NULL, '2023-12-22 03:32:52'),
(985, 105, 61, NULL, 0, NULL, NULL),
(986, 106, 61, NULL, 0, NULL, NULL),
(987, 107, 61, 43, 1, NULL, '2023-12-22 05:51:30'),
(988, 108, 61, 43, 1, NULL, '2023-12-22 05:51:30'),
(989, 109, 61, NULL, 0, NULL, NULL),
(990, 110, 61, NULL, 0, NULL, NULL),
(991, 111, 61, NULL, 0, NULL, NULL),
(992, 112, 61, NULL, 0, NULL, NULL),
(993, 113, 61, NULL, 0, NULL, NULL),
(994, 114, 61, NULL, 0, NULL, NULL),
(995, 115, 61, NULL, 0, NULL, NULL),
(996, 116, 61, 46, 1, NULL, '2023-12-25 07:19:50'),
(997, 117, 61, NULL, 0, NULL, '2023-12-22 03:35:30'),
(998, 118, 61, NULL, 0, NULL, '2023-12-22 03:35:30'),
(999, 119, 61, NULL, 0, NULL, '2023-12-22 03:37:14'),
(1000, 120, 61, NULL, 0, NULL, NULL),
(1001, 61, 62, 48, 1, NULL, '2023-12-25 08:30:54'),
(1002, 62, 62, 48, 1, NULL, '2023-12-25 08:30:54'),
(1003, 63, 62, NULL, 0, NULL, NULL),
(1004, 64, 62, NULL, 0, NULL, NULL),
(1005, 65, 62, NULL, 0, NULL, NULL),
(1006, 66, 62, NULL, 0, NULL, NULL),
(1007, 67, 62, NULL, 0, NULL, NULL),
(1008, 68, 62, NULL, 0, NULL, NULL),
(1009, 69, 62, NULL, 0, NULL, NULL),
(1010, 70, 62, NULL, 0, NULL, NULL),
(1011, 71, 62, NULL, 0, NULL, NULL),
(1012, 72, 62, NULL, 0, NULL, NULL),
(1013, 73, 62, NULL, 0, NULL, NULL),
(1014, 74, 62, NULL, 0, NULL, NULL),
(1015, 75, 62, NULL, 0, NULL, NULL),
(1016, 76, 62, NULL, 0, NULL, NULL),
(1017, 77, 62, NULL, 0, NULL, NULL),
(1018, 78, 62, NULL, 0, NULL, NULL),
(1019, 79, 62, NULL, 0, NULL, NULL),
(1020, 80, 62, NULL, 0, NULL, NULL),
(1021, 81, 62, NULL, 0, NULL, NULL),
(1022, 82, 62, NULL, 0, NULL, NULL),
(1023, 83, 62, NULL, 0, NULL, NULL),
(1024, 84, 62, NULL, 0, NULL, NULL),
(1025, 85, 62, NULL, 0, NULL, NULL),
(1026, 86, 62, NULL, 0, NULL, NULL),
(1027, 87, 62, NULL, 0, NULL, NULL),
(1028, 88, 62, NULL, 0, NULL, NULL),
(1029, 89, 62, NULL, 0, NULL, NULL),
(1030, 90, 62, NULL, 0, NULL, NULL),
(1031, 61, 63, NULL, 0, NULL, NULL),
(1032, 62, 63, NULL, 0, NULL, NULL),
(1033, 63, 63, NULL, 0, NULL, NULL),
(1034, 64, 63, NULL, 0, NULL, NULL),
(1035, 65, 63, NULL, 0, NULL, NULL),
(1036, 66, 63, NULL, 0, NULL, NULL),
(1037, 67, 63, NULL, 0, NULL, NULL),
(1038, 68, 63, NULL, 0, NULL, NULL),
(1039, 69, 63, NULL, 0, NULL, NULL),
(1040, 70, 63, NULL, 0, NULL, NULL),
(1041, 71, 63, NULL, 0, NULL, NULL),
(1042, 72, 63, NULL, 0, NULL, NULL),
(1043, 73, 63, NULL, 0, NULL, NULL),
(1044, 74, 63, NULL, 0, NULL, NULL),
(1045, 75, 63, NULL, 0, NULL, NULL),
(1046, 76, 63, NULL, 0, NULL, NULL),
(1047, 77, 63, NULL, 0, NULL, NULL),
(1048, 78, 63, NULL, 0, NULL, NULL),
(1049, 79, 63, NULL, 0, NULL, NULL),
(1050, 80, 63, NULL, 0, NULL, NULL),
(1051, 81, 63, NULL, 0, NULL, NULL),
(1052, 82, 63, NULL, 0, NULL, NULL),
(1053, 83, 63, NULL, 0, NULL, NULL),
(1054, 84, 63, NULL, 0, NULL, NULL),
(1055, 85, 63, NULL, 0, NULL, NULL),
(1056, 86, 63, NULL, 0, NULL, NULL),
(1057, 87, 63, NULL, 0, NULL, NULL),
(1058, 88, 63, NULL, 0, NULL, NULL),
(1059, 89, 63, NULL, 0, NULL, NULL),
(1060, 90, 63, NULL, 0, NULL, NULL),
(1061, 61, 64, 47, 1, NULL, '2023-12-25 08:29:06'),
(1062, 62, 64, 47, 1, NULL, '2023-12-25 08:29:06'),
(1063, 63, 64, 49, 1, NULL, '2024-01-01 21:59:32'),
(1064, 64, 64, 49, 1, NULL, '2024-01-01 21:59:32'),
(1065, 65, 64, 50, 1, NULL, '2024-01-01 22:03:11'),
(1066, 66, 64, 50, 1, NULL, '2024-01-01 22:03:11'),
(1067, 67, 64, NULL, 0, NULL, NULL),
(1068, 68, 64, NULL, 0, NULL, NULL),
(1069, 69, 64, 51, 1, NULL, '2024-01-02 03:19:02'),
(1070, 70, 64, 51, 1, NULL, '2024-01-02 03:19:02'),
(1071, 71, 64, 51, 1, NULL, '2024-01-02 03:19:02'),
(1072, 72, 64, NULL, 0, NULL, NULL),
(1073, 73, 64, NULL, 0, NULL, NULL),
(1074, 74, 64, NULL, 0, NULL, NULL),
(1075, 75, 64, NULL, 0, NULL, NULL),
(1076, 76, 64, NULL, 0, NULL, NULL),
(1077, 77, 64, NULL, 0, NULL, NULL),
(1078, 78, 64, NULL, 0, NULL, NULL),
(1079, 79, 64, NULL, 0, NULL, NULL),
(1080, 80, 64, NULL, 0, NULL, NULL),
(1081, 81, 64, NULL, 0, NULL, NULL),
(1082, 82, 64, NULL, 0, NULL, NULL),
(1083, 83, 64, NULL, 0, NULL, NULL),
(1084, 84, 64, NULL, 0, NULL, NULL),
(1085, 85, 64, NULL, 0, NULL, NULL),
(1086, 86, 64, NULL, 0, NULL, NULL),
(1087, 87, 64, NULL, 0, NULL, NULL),
(1088, 88, 64, NULL, 0, NULL, NULL),
(1089, 89, 64, NULL, 0, NULL, NULL),
(1090, 90, 64, NULL, 0, NULL, NULL),
(1091, 31, 65, NULL, 0, NULL, NULL),
(1092, 32, 65, NULL, 0, NULL, NULL),
(1093, 33, 65, NULL, 0, NULL, NULL),
(1094, 34, 65, NULL, 0, NULL, NULL),
(1095, 35, 65, NULL, 0, NULL, NULL),
(1096, 36, 65, NULL, 0, NULL, NULL),
(1097, 37, 65, NULL, 0, NULL, NULL),
(1098, 38, 65, NULL, 0, NULL, NULL),
(1099, 39, 65, NULL, 0, NULL, NULL),
(1100, 40, 65, NULL, 0, NULL, NULL),
(1101, 41, 65, NULL, 0, NULL, NULL),
(1102, 42, 65, NULL, 0, NULL, NULL),
(1103, 43, 65, NULL, 0, NULL, NULL),
(1104, 44, 65, NULL, 0, NULL, NULL),
(1105, 45, 65, NULL, 0, NULL, NULL),
(1106, 46, 65, NULL, 0, NULL, NULL),
(1107, 47, 65, NULL, 0, NULL, NULL),
(1108, 48, 65, NULL, 0, NULL, NULL),
(1109, 49, 65, NULL, 0, NULL, NULL),
(1110, 50, 65, NULL, 0, NULL, NULL),
(1111, 51, 65, NULL, 0, NULL, NULL),
(1112, 52, 65, NULL, 0, NULL, NULL),
(1113, 53, 65, NULL, 0, NULL, NULL),
(1114, 54, 65, NULL, 0, NULL, NULL),
(1115, 55, 65, NULL, 0, NULL, NULL),
(1116, 56, 65, NULL, 0, NULL, NULL),
(1117, 57, 65, NULL, 0, NULL, NULL),
(1118, 58, 65, NULL, 0, NULL, NULL),
(1119, 59, 65, NULL, 0, NULL, NULL),
(1120, 60, 65, NULL, 0, NULL, NULL),
(1121, 31, 66, NULL, 0, NULL, NULL),
(1122, 32, 66, NULL, 0, NULL, NULL),
(1123, 33, 66, NULL, 0, NULL, NULL),
(1124, 34, 66, NULL, 0, NULL, NULL),
(1125, 35, 66, NULL, 0, NULL, NULL),
(1126, 36, 66, NULL, 0, NULL, NULL),
(1127, 37, 66, NULL, 0, NULL, NULL),
(1128, 38, 66, NULL, 0, NULL, NULL),
(1129, 39, 66, NULL, 0, NULL, NULL),
(1130, 40, 66, NULL, 0, NULL, NULL),
(1131, 41, 66, NULL, 0, NULL, NULL),
(1132, 42, 66, NULL, 0, NULL, NULL),
(1133, 43, 66, NULL, 0, NULL, NULL),
(1134, 44, 66, NULL, 0, NULL, NULL),
(1135, 45, 66, NULL, 0, NULL, NULL),
(1136, 46, 66, NULL, 0, NULL, NULL),
(1137, 47, 66, NULL, 0, NULL, NULL),
(1138, 48, 66, NULL, 0, NULL, NULL),
(1139, 49, 66, NULL, 0, NULL, NULL),
(1140, 50, 66, NULL, 0, NULL, NULL),
(1141, 51, 66, NULL, 0, NULL, NULL),
(1142, 52, 66, NULL, 0, NULL, NULL),
(1143, 53, 66, NULL, 0, NULL, NULL),
(1144, 54, 66, NULL, 0, NULL, NULL),
(1145, 55, 66, NULL, 0, NULL, NULL),
(1146, 56, 66, NULL, 0, NULL, NULL),
(1147, 57, 66, NULL, 0, NULL, NULL),
(1148, 58, 66, NULL, 0, NULL, NULL),
(1149, 59, 66, NULL, 0, NULL, NULL),
(1150, 60, 66, NULL, 0, NULL, NULL),
(1151, 31, 67, NULL, 0, NULL, NULL),
(1152, 32, 67, NULL, 0, NULL, NULL),
(1153, 33, 67, NULL, 0, NULL, NULL),
(1154, 34, 67, NULL, 0, NULL, NULL),
(1155, 35, 67, NULL, 0, NULL, NULL),
(1156, 36, 67, NULL, 0, NULL, NULL),
(1157, 37, 67, NULL, 0, NULL, NULL),
(1158, 38, 67, NULL, 0, NULL, NULL),
(1159, 39, 67, NULL, 0, NULL, NULL),
(1160, 40, 67, NULL, 0, NULL, NULL),
(1161, 41, 67, NULL, 0, NULL, NULL),
(1162, 42, 67, NULL, 0, NULL, NULL),
(1163, 43, 67, NULL, 0, NULL, NULL),
(1164, 44, 67, NULL, 0, NULL, NULL),
(1165, 45, 67, NULL, 0, NULL, NULL),
(1166, 46, 67, NULL, 0, NULL, NULL),
(1167, 47, 67, NULL, 0, NULL, NULL),
(1168, 48, 67, NULL, 0, NULL, NULL),
(1169, 49, 67, NULL, 0, NULL, NULL),
(1170, 50, 67, NULL, 0, NULL, NULL),
(1171, 51, 67, NULL, 0, NULL, NULL),
(1172, 52, 67, NULL, 0, NULL, NULL),
(1173, 53, 67, NULL, 0, NULL, NULL),
(1174, 54, 67, NULL, 0, NULL, NULL),
(1175, 55, 67, NULL, 0, NULL, NULL),
(1176, 56, 67, NULL, 0, NULL, NULL),
(1177, 57, 67, NULL, 0, NULL, NULL),
(1178, 58, 67, NULL, 0, NULL, NULL),
(1179, 59, 67, NULL, 0, NULL, NULL),
(1180, 60, 67, NULL, 0, NULL, NULL),
(1181, 31, 68, NULL, 0, NULL, NULL),
(1182, 32, 68, NULL, 0, NULL, NULL),
(1183, 33, 68, NULL, 0, NULL, NULL),
(1184, 34, 68, NULL, 0, NULL, NULL),
(1185, 35, 68, NULL, 0, NULL, NULL),
(1186, 36, 68, NULL, 0, NULL, NULL),
(1187, 37, 68, NULL, 0, NULL, NULL),
(1188, 38, 68, NULL, 0, NULL, NULL),
(1189, 39, 68, NULL, 0, NULL, NULL),
(1190, 40, 68, NULL, 0, NULL, NULL),
(1191, 41, 68, NULL, 0, NULL, NULL),
(1192, 42, 68, NULL, 0, NULL, NULL),
(1193, 43, 68, NULL, 0, NULL, NULL),
(1194, 44, 68, NULL, 0, NULL, NULL),
(1195, 45, 68, NULL, 0, NULL, NULL),
(1196, 46, 68, NULL, 0, NULL, NULL),
(1197, 47, 68, NULL, 0, NULL, NULL),
(1198, 48, 68, NULL, 0, NULL, NULL),
(1199, 49, 68, NULL, 0, NULL, NULL),
(1200, 50, 68, NULL, 0, NULL, NULL),
(1201, 51, 68, NULL, 0, NULL, NULL),
(1202, 52, 68, NULL, 0, NULL, NULL),
(1203, 53, 68, NULL, 0, NULL, NULL),
(1204, 54, 68, NULL, 0, NULL, NULL),
(1205, 55, 68, NULL, 0, NULL, NULL),
(1206, 56, 68, NULL, 0, NULL, NULL),
(1207, 57, 68, NULL, 0, NULL, NULL),
(1208, 58, 68, NULL, 0, NULL, NULL),
(1209, 59, 68, NULL, 0, NULL, NULL),
(1210, 60, 68, NULL, 0, NULL, NULL),
(1211, 31, 69, NULL, 0, NULL, NULL),
(1212, 32, 69, NULL, 0, NULL, NULL),
(1213, 33, 69, NULL, 0, NULL, NULL),
(1214, 34, 69, NULL, 0, NULL, NULL),
(1215, 35, 69, NULL, 0, NULL, NULL),
(1216, 36, 69, NULL, 0, NULL, NULL),
(1217, 37, 69, NULL, 0, NULL, NULL),
(1218, 38, 69, NULL, 0, NULL, NULL),
(1219, 39, 69, NULL, 0, NULL, NULL),
(1220, 40, 69, NULL, 0, NULL, NULL),
(1221, 41, 69, NULL, 0, NULL, NULL),
(1222, 42, 69, NULL, 0, NULL, NULL),
(1223, 43, 69, NULL, 0, NULL, NULL),
(1224, 44, 69, NULL, 0, NULL, NULL),
(1225, 45, 69, NULL, 0, NULL, NULL),
(1226, 46, 69, NULL, 0, NULL, NULL),
(1227, 47, 69, NULL, 0, NULL, NULL),
(1228, 48, 69, NULL, 0, NULL, NULL),
(1229, 49, 69, NULL, 0, NULL, NULL),
(1230, 50, 69, NULL, 0, NULL, NULL),
(1231, 51, 69, NULL, 0, NULL, NULL),
(1232, 52, 69, NULL, 0, NULL, NULL),
(1233, 53, 69, NULL, 0, NULL, NULL),
(1234, 54, 69, NULL, 0, NULL, NULL),
(1235, 55, 69, NULL, 0, NULL, NULL),
(1236, 56, 69, NULL, 0, NULL, NULL),
(1237, 57, 69, NULL, 0, NULL, NULL),
(1238, 58, 69, NULL, 0, NULL, NULL),
(1239, 59, 69, NULL, 0, NULL, NULL),
(1240, 60, 69, NULL, 0, NULL, NULL),
(1241, 31, 70, NULL, 0, NULL, NULL),
(1242, 32, 70, NULL, 0, NULL, NULL),
(1243, 33, 70, NULL, 0, NULL, NULL),
(1244, 34, 70, NULL, 0, NULL, NULL),
(1245, 35, 70, NULL, 0, NULL, NULL),
(1246, 36, 70, NULL, 0, NULL, NULL),
(1247, 37, 70, NULL, 0, NULL, NULL),
(1248, 38, 70, NULL, 0, NULL, NULL),
(1249, 39, 70, NULL, 0, NULL, NULL),
(1250, 40, 70, NULL, 0, NULL, NULL),
(1251, 41, 70, NULL, 0, NULL, NULL),
(1252, 42, 70, NULL, 0, NULL, NULL),
(1253, 43, 70, NULL, 0, NULL, NULL),
(1254, 44, 70, NULL, 0, NULL, NULL),
(1255, 45, 70, NULL, 0, NULL, NULL),
(1256, 46, 70, NULL, 0, NULL, NULL),
(1257, 47, 70, NULL, 0, NULL, NULL),
(1258, 48, 70, NULL, 0, NULL, NULL),
(1259, 49, 70, NULL, 0, NULL, NULL),
(1260, 50, 70, NULL, 0, NULL, NULL),
(1261, 51, 70, NULL, 0, NULL, NULL),
(1262, 52, 70, NULL, 0, NULL, NULL),
(1263, 53, 70, NULL, 0, NULL, NULL),
(1264, 54, 70, NULL, 0, NULL, NULL),
(1265, 55, 70, NULL, 0, NULL, NULL),
(1266, 56, 70, NULL, 0, NULL, NULL),
(1267, 57, 70, NULL, 0, NULL, NULL),
(1268, 58, 70, NULL, 0, NULL, NULL),
(1269, 59, 70, NULL, 0, NULL, NULL),
(1270, 60, 70, NULL, 0, NULL, NULL),
(1271, 31, 71, NULL, 0, NULL, NULL),
(1272, 32, 71, NULL, 0, NULL, NULL),
(1273, 33, 71, NULL, 0, NULL, NULL),
(1274, 34, 71, NULL, 0, NULL, NULL),
(1275, 35, 71, NULL, 0, NULL, NULL),
(1276, 36, 71, NULL, 0, NULL, NULL),
(1277, 37, 71, NULL, 0, NULL, NULL),
(1278, 38, 71, NULL, 0, NULL, NULL),
(1279, 39, 71, NULL, 0, NULL, NULL),
(1280, 40, 71, NULL, 0, NULL, NULL),
(1281, 41, 71, NULL, 0, NULL, NULL),
(1282, 42, 71, NULL, 0, NULL, NULL),
(1283, 43, 71, NULL, 0, NULL, NULL),
(1284, 44, 71, NULL, 0, NULL, NULL),
(1285, 45, 71, NULL, 0, NULL, NULL),
(1286, 46, 71, NULL, 0, NULL, NULL),
(1287, 47, 71, NULL, 0, NULL, NULL),
(1288, 48, 71, NULL, 0, NULL, NULL),
(1289, 49, 71, NULL, 0, NULL, NULL),
(1290, 50, 71, NULL, 0, NULL, NULL),
(1291, 51, 71, NULL, 0, NULL, NULL),
(1292, 52, 71, NULL, 0, NULL, NULL),
(1293, 53, 71, NULL, 0, NULL, NULL),
(1294, 54, 71, NULL, 0, NULL, NULL),
(1295, 55, 71, NULL, 0, NULL, NULL),
(1296, 56, 71, NULL, 0, NULL, NULL),
(1297, 57, 71, NULL, 0, NULL, NULL),
(1298, 58, 71, NULL, 0, NULL, NULL),
(1299, 59, 71, NULL, 0, NULL, NULL),
(1300, 60, 71, NULL, 0, NULL, NULL),
(1301, 31, 72, NULL, 0, NULL, NULL),
(1302, 32, 72, NULL, 0, NULL, NULL),
(1303, 33, 72, 55, 1, NULL, '2024-01-05 01:23:30'),
(1304, 34, 72, 55, 1, NULL, '2024-01-05 01:23:30'),
(1305, 35, 72, 56, 1, NULL, '2024-01-05 01:25:16'),
(1306, 36, 72, 56, 1, NULL, '2024-01-05 01:25:16'),
(1307, 37, 72, NULL, 0, NULL, NULL),
(1308, 38, 72, NULL, 0, NULL, NULL),
(1309, 39, 72, NULL, 0, NULL, NULL),
(1310, 40, 72, NULL, 0, NULL, NULL),
(1311, 41, 72, 58, 1, NULL, '2024-01-05 01:30:40'),
(1312, 42, 72, 58, 1, NULL, '2024-01-05 01:30:40'),
(1313, 43, 72, 57, 1, NULL, '2024-01-05 01:27:55'),
(1314, 44, 72, 57, 1, NULL, '2024-01-05 01:27:55'),
(1315, 45, 72, 65, 1, NULL, '2024-01-05 07:29:53'),
(1316, 46, 72, 67, 1, NULL, '2024-01-05 07:33:26'),
(1317, 47, 72, NULL, 0, NULL, NULL),
(1318, 48, 72, NULL, 0, NULL, NULL),
(1319, 49, 72, 52, 1, NULL, '2024-01-05 01:10:58'),
(1320, 50, 72, 52, 1, NULL, '2024-01-05 01:10:58'),
(1321, 51, 72, 52, 1, NULL, '2024-01-05 01:10:58'),
(1322, 52, 72, 60, 1, NULL, '2024-01-05 01:42:03'),
(1323, 53, 72, 68, 1, NULL, '2024-01-05 07:39:13'),
(1324, 54, 72, NULL, 0, NULL, NULL),
(1325, 55, 72, NULL, 0, NULL, NULL),
(1326, 56, 72, NULL, 0, NULL, NULL),
(1327, 57, 72, 63, 1, NULL, '2024-01-05 06:30:07'),
(1328, 58, 72, 63, 1, NULL, '2024-01-05 06:30:07'),
(1329, 59, 72, 63, 1, NULL, '2024-01-05 06:30:07'),
(1330, 60, 72, 64, 1, NULL, '2024-01-05 07:21:39'),
(1331, 31, 73, NULL, 0, NULL, NULL),
(1332, 32, 73, NULL, 0, NULL, NULL),
(1333, 33, 73, NULL, 0, NULL, NULL),
(1334, 34, 73, NULL, 0, NULL, NULL),
(1335, 35, 73, NULL, 0, NULL, NULL),
(1336, 36, 73, NULL, 0, NULL, NULL),
(1337, 37, 73, NULL, 0, NULL, NULL),
(1338, 38, 73, NULL, 0, NULL, NULL),
(1339, 39, 73, NULL, 0, NULL, NULL),
(1340, 40, 73, NULL, 0, NULL, NULL),
(1341, 41, 73, NULL, 0, NULL, NULL),
(1342, 42, 73, NULL, 0, NULL, NULL),
(1343, 43, 73, NULL, 0, NULL, NULL),
(1344, 44, 73, NULL, 0, NULL, NULL),
(1345, 45, 73, NULL, 0, NULL, NULL),
(1346, 46, 73, NULL, 0, NULL, NULL),
(1347, 47, 73, NULL, 0, NULL, NULL),
(1348, 48, 73, NULL, 0, NULL, NULL),
(1349, 49, 73, NULL, 0, NULL, NULL),
(1350, 50, 73, NULL, 0, NULL, NULL),
(1351, 51, 73, NULL, 0, NULL, NULL),
(1352, 52, 73, NULL, 0, NULL, NULL),
(1353, 53, 73, NULL, 0, NULL, NULL),
(1354, 54, 73, NULL, 0, NULL, NULL),
(1355, 55, 73, NULL, 0, NULL, NULL),
(1356, 56, 73, NULL, 0, NULL, NULL),
(1357, 57, 73, NULL, 0, NULL, NULL),
(1358, 58, 73, NULL, 0, NULL, NULL),
(1359, 59, 73, NULL, 0, NULL, NULL),
(1360, 60, 73, NULL, 0, NULL, NULL),
(1361, 31, 74, NULL, 0, NULL, NULL),
(1362, 32, 74, NULL, 0, NULL, NULL),
(1363, 33, 74, NULL, 0, NULL, NULL),
(1364, 34, 74, NULL, 0, NULL, NULL),
(1365, 35, 74, NULL, 0, NULL, NULL),
(1366, 36, 74, NULL, 0, NULL, NULL),
(1367, 37, 74, NULL, 0, NULL, NULL),
(1368, 38, 74, NULL, 0, NULL, NULL),
(1369, 39, 74, NULL, 0, NULL, NULL),
(1370, 40, 74, NULL, 0, NULL, NULL),
(1371, 41, 74, NULL, 0, NULL, NULL),
(1372, 42, 74, NULL, 0, NULL, NULL),
(1373, 43, 74, NULL, 0, NULL, NULL),
(1374, 44, 74, NULL, 0, NULL, NULL),
(1375, 45, 74, NULL, 0, NULL, NULL),
(1376, 46, 74, NULL, 0, NULL, NULL),
(1377, 47, 74, NULL, 0, NULL, NULL),
(1378, 48, 74, NULL, 0, NULL, NULL),
(1379, 49, 74, NULL, 0, NULL, NULL),
(1380, 50, 74, NULL, 0, NULL, NULL),
(1381, 51, 74, NULL, 0, NULL, NULL),
(1382, 52, 74, NULL, 0, NULL, NULL),
(1383, 53, 74, NULL, 0, NULL, NULL),
(1384, 54, 74, NULL, 0, NULL, NULL),
(1385, 55, 74, NULL, 0, NULL, NULL),
(1386, 56, 74, NULL, 0, NULL, NULL),
(1387, 57, 74, NULL, 0, NULL, NULL),
(1388, 58, 74, NULL, 0, NULL, NULL),
(1389, 59, 74, NULL, 0, NULL, NULL),
(1390, 60, 74, NULL, 0, NULL, NULL),
(1391, 31, 75, NULL, 0, NULL, NULL),
(1392, 32, 75, NULL, 0, NULL, NULL),
(1393, 33, 75, NULL, 0, NULL, NULL),
(1394, 34, 75, NULL, 0, NULL, NULL),
(1395, 35, 75, NULL, 0, NULL, NULL),
(1396, 36, 75, NULL, 0, NULL, NULL),
(1397, 37, 75, NULL, 0, NULL, NULL),
(1398, 38, 75, NULL, 0, NULL, NULL),
(1399, 39, 75, NULL, 0, NULL, NULL),
(1400, 40, 75, NULL, 0, NULL, NULL),
(1401, 41, 75, NULL, 0, NULL, NULL),
(1402, 42, 75, NULL, 0, NULL, NULL),
(1403, 43, 75, NULL, 0, NULL, NULL),
(1404, 44, 75, NULL, 0, NULL, NULL),
(1405, 45, 75, NULL, 0, NULL, NULL),
(1406, 46, 75, NULL, 0, NULL, NULL),
(1407, 47, 75, NULL, 0, NULL, NULL),
(1408, 48, 75, NULL, 0, NULL, NULL),
(1409, 49, 75, NULL, 0, NULL, NULL),
(1410, 50, 75, NULL, 0, NULL, NULL),
(1411, 51, 75, NULL, 0, NULL, NULL),
(1412, 52, 75, NULL, 0, NULL, NULL),
(1413, 53, 75, NULL, 0, NULL, NULL),
(1414, 54, 75, NULL, 0, NULL, NULL),
(1415, 55, 75, NULL, 0, NULL, NULL),
(1416, 56, 75, NULL, 0, NULL, NULL),
(1417, 57, 75, NULL, 0, NULL, NULL),
(1418, 58, 75, NULL, 0, NULL, NULL),
(1419, 59, 75, NULL, 0, NULL, NULL),
(1420, 60, 75, NULL, 0, NULL, NULL),
(1421, 31, 76, NULL, 0, NULL, NULL),
(1422, 32, 76, NULL, 0, NULL, NULL),
(1423, 33, 76, NULL, 0, NULL, NULL),
(1424, 34, 76, NULL, 0, NULL, NULL),
(1425, 35, 76, NULL, 0, NULL, NULL),
(1426, 36, 76, NULL, 0, NULL, NULL),
(1427, 37, 76, NULL, 0, NULL, NULL),
(1428, 38, 76, NULL, 0, NULL, NULL),
(1429, 39, 76, NULL, 0, NULL, NULL),
(1430, 40, 76, NULL, 0, NULL, NULL),
(1431, 41, 76, NULL, 0, NULL, NULL),
(1432, 42, 76, NULL, 0, NULL, NULL),
(1433, 43, 76, NULL, 0, NULL, NULL),
(1434, 44, 76, NULL, 0, NULL, NULL),
(1435, 45, 76, NULL, 0, NULL, NULL),
(1436, 46, 76, NULL, 0, NULL, NULL),
(1437, 47, 76, NULL, 0, NULL, NULL),
(1438, 48, 76, NULL, 0, NULL, NULL),
(1439, 49, 76, NULL, 0, NULL, NULL),
(1440, 50, 76, NULL, 0, NULL, NULL),
(1441, 51, 76, NULL, 0, NULL, NULL),
(1442, 52, 76, NULL, 0, NULL, NULL),
(1443, 53, 76, NULL, 0, NULL, NULL),
(1444, 54, 76, NULL, 0, NULL, NULL),
(1445, 55, 76, NULL, 0, NULL, NULL),
(1446, 56, 76, NULL, 0, NULL, NULL),
(1447, 57, 76, NULL, 0, NULL, NULL),
(1448, 58, 76, NULL, 0, NULL, NULL),
(1449, 59, 76, NULL, 0, NULL, NULL),
(1450, 60, 76, NULL, 0, NULL, NULL),
(1451, 31, 77, NULL, 0, NULL, NULL),
(1452, 32, 77, NULL, 0, NULL, NULL),
(1453, 33, 77, 53, 1, NULL, '2024-01-05 01:16:26'),
(1454, 34, 77, 53, 1, NULL, '2024-01-05 01:16:26'),
(1455, 35, 77, NULL, 0, NULL, NULL),
(1456, 36, 77, NULL, 0, NULL, NULL),
(1457, 37, 77, NULL, 0, NULL, NULL),
(1458, 38, 77, NULL, 0, NULL, NULL),
(1459, 39, 77, NULL, 0, NULL, NULL),
(1460, 40, 77, NULL, 0, NULL, NULL),
(1461, 41, 77, NULL, 0, NULL, NULL),
(1462, 42, 77, NULL, 0, NULL, NULL),
(1463, 43, 77, NULL, 0, NULL, NULL),
(1464, 44, 77, NULL, 0, NULL, NULL),
(1465, 45, 77, NULL, 0, NULL, NULL),
(1466, 46, 77, NULL, 0, NULL, NULL),
(1467, 47, 77, NULL, 0, NULL, NULL),
(1468, 48, 77, NULL, 0, NULL, NULL),
(1469, 49, 77, NULL, 0, NULL, NULL),
(1470, 50, 77, NULL, 0, NULL, NULL),
(1471, 51, 77, NULL, 0, NULL, NULL),
(1472, 52, 77, NULL, 0, NULL, NULL),
(1473, 53, 77, NULL, 0, NULL, NULL),
(1474, 54, 77, NULL, 0, NULL, NULL),
(1475, 55, 77, NULL, 0, NULL, NULL),
(1476, 56, 77, NULL, 0, NULL, NULL),
(1477, 57, 77, NULL, 0, NULL, NULL),
(1478, 58, 77, NULL, 0, NULL, NULL),
(1479, 59, 77, NULL, 0, NULL, NULL),
(1480, 60, 77, NULL, 0, NULL, NULL),
(1481, 31, 78, NULL, 0, NULL, NULL),
(1482, 32, 78, NULL, 0, NULL, NULL),
(1483, 33, 78, NULL, 0, NULL, NULL),
(1484, 34, 78, NULL, 0, NULL, NULL),
(1485, 35, 78, NULL, 0, NULL, NULL),
(1486, 36, 78, NULL, 0, NULL, NULL),
(1487, 37, 78, NULL, 0, NULL, NULL),
(1488, 38, 78, NULL, 0, NULL, NULL),
(1489, 39, 78, NULL, 0, NULL, NULL),
(1490, 40, 78, NULL, 0, NULL, NULL),
(1491, 41, 78, NULL, 0, NULL, NULL),
(1492, 42, 78, NULL, 0, NULL, NULL),
(1493, 43, 78, NULL, 0, NULL, NULL),
(1494, 44, 78, NULL, 0, NULL, NULL),
(1495, 45, 78, NULL, 0, NULL, NULL),
(1496, 46, 78, NULL, 0, NULL, NULL),
(1497, 47, 78, NULL, 0, NULL, NULL),
(1498, 48, 78, NULL, 0, NULL, NULL),
(1499, 49, 78, NULL, 0, NULL, NULL),
(1500, 50, 78, NULL, 0, NULL, NULL),
(1501, 51, 78, NULL, 0, NULL, NULL),
(1502, 52, 78, NULL, 0, NULL, NULL),
(1503, 53, 78, NULL, 0, NULL, NULL),
(1504, 54, 78, NULL, 0, NULL, NULL),
(1505, 55, 78, NULL, 0, NULL, NULL),
(1506, 56, 78, NULL, 0, NULL, NULL),
(1507, 57, 78, NULL, 0, NULL, NULL),
(1508, 58, 78, NULL, 0, NULL, NULL),
(1509, 59, 78, NULL, 0, NULL, NULL),
(1510, 60, 78, NULL, 0, NULL, NULL),
(1511, 31, 79, NULL, 0, NULL, NULL),
(1512, 32, 79, NULL, 0, NULL, NULL),
(1513, 33, 79, NULL, 0, NULL, NULL),
(1514, 34, 79, NULL, 0, NULL, NULL),
(1515, 35, 79, NULL, 0, NULL, NULL),
(1516, 36, 79, NULL, 0, NULL, NULL),
(1517, 37, 79, NULL, 0, NULL, NULL),
(1518, 38, 79, NULL, 0, NULL, NULL),
(1519, 39, 79, NULL, 0, NULL, NULL),
(1520, 40, 79, NULL, 0, NULL, NULL),
(1521, 41, 79, NULL, 0, NULL, NULL),
(1522, 42, 79, NULL, 0, NULL, NULL),
(1523, 43, 79, NULL, 0, NULL, NULL),
(1524, 44, 79, NULL, 0, NULL, NULL),
(1525, 45, 79, NULL, 0, NULL, NULL),
(1526, 46, 79, NULL, 0, NULL, NULL),
(1527, 47, 79, NULL, 0, NULL, NULL),
(1528, 48, 79, NULL, 0, NULL, NULL),
(1529, 49, 79, NULL, 0, NULL, NULL),
(1530, 50, 79, NULL, 0, NULL, NULL),
(1531, 51, 79, NULL, 0, NULL, NULL),
(1532, 52, 79, NULL, 0, NULL, NULL),
(1533, 53, 79, NULL, 0, NULL, NULL),
(1534, 54, 79, NULL, 0, NULL, NULL),
(1535, 55, 79, NULL, 0, NULL, NULL),
(1536, 56, 79, NULL, 0, NULL, NULL),
(1537, 57, 79, NULL, 0, NULL, NULL),
(1538, 58, 79, NULL, 0, NULL, NULL),
(1539, 59, 79, NULL, 0, NULL, NULL),
(1540, 60, 79, NULL, 0, NULL, NULL),
(1541, 31, 80, NULL, 0, NULL, NULL),
(1542, 32, 80, NULL, 0, NULL, NULL),
(1543, 33, 80, NULL, 0, NULL, NULL),
(1544, 34, 80, NULL, 0, NULL, NULL),
(1545, 35, 80, NULL, 0, NULL, NULL),
(1546, 36, 80, NULL, 0, NULL, NULL),
(1547, 37, 80, NULL, 0, NULL, NULL),
(1548, 38, 80, NULL, 0, NULL, NULL),
(1549, 39, 80, NULL, 0, NULL, NULL),
(1550, 40, 80, NULL, 0, NULL, NULL),
(1551, 41, 80, NULL, 0, NULL, NULL),
(1552, 42, 80, NULL, 0, NULL, NULL),
(1553, 43, 80, NULL, 0, NULL, NULL),
(1554, 44, 80, NULL, 0, NULL, NULL),
(1555, 45, 80, NULL, 0, NULL, NULL),
(1556, 46, 80, NULL, 0, NULL, NULL),
(1557, 47, 80, NULL, 0, NULL, NULL),
(1558, 48, 80, NULL, 0, NULL, NULL),
(1559, 49, 80, NULL, 0, NULL, NULL),
(1560, 50, 80, NULL, 0, NULL, NULL),
(1561, 51, 80, NULL, 0, NULL, NULL),
(1562, 52, 80, NULL, 0, NULL, NULL),
(1563, 53, 80, NULL, 0, NULL, NULL),
(1564, 54, 80, NULL, 0, NULL, NULL),
(1565, 55, 80, NULL, 0, NULL, NULL),
(1566, 56, 80, NULL, 0, NULL, NULL),
(1567, 57, 80, NULL, 0, NULL, NULL),
(1568, 58, 80, NULL, 0, NULL, NULL),
(1569, 59, 80, NULL, 0, NULL, NULL),
(1570, 60, 80, NULL, 0, NULL, NULL),
(1571, 31, 81, NULL, 0, NULL, NULL),
(1572, 32, 81, NULL, 0, NULL, NULL),
(1573, 33, 81, NULL, 0, NULL, NULL),
(1574, 34, 81, NULL, 0, NULL, NULL),
(1575, 35, 81, NULL, 0, NULL, NULL),
(1576, 36, 81, NULL, 0, NULL, NULL),
(1577, 37, 81, NULL, 0, NULL, NULL),
(1578, 38, 81, NULL, 0, NULL, NULL),
(1579, 39, 81, NULL, 0, NULL, NULL),
(1580, 40, 81, NULL, 0, NULL, NULL),
(1581, 41, 81, NULL, 0, NULL, NULL),
(1582, 42, 81, NULL, 0, NULL, NULL),
(1583, 43, 81, NULL, 0, NULL, NULL),
(1584, 44, 81, NULL, 0, NULL, NULL),
(1585, 45, 81, NULL, 0, NULL, NULL),
(1586, 46, 81, NULL, 0, NULL, NULL),
(1587, 47, 81, NULL, 0, NULL, NULL),
(1588, 48, 81, NULL, 0, NULL, NULL),
(1589, 49, 81, NULL, 0, NULL, NULL),
(1590, 50, 81, NULL, 0, NULL, NULL),
(1591, 51, 81, NULL, 0, NULL, NULL),
(1592, 52, 81, NULL, 0, NULL, NULL),
(1593, 53, 81, NULL, 0, NULL, NULL),
(1594, 54, 81, NULL, 0, NULL, NULL),
(1595, 55, 81, NULL, 0, NULL, NULL),
(1596, 56, 81, NULL, 0, NULL, NULL),
(1597, 57, 81, NULL, 0, NULL, NULL),
(1598, 58, 81, NULL, 0, NULL, NULL),
(1599, 59, 81, NULL, 0, NULL, NULL),
(1600, 60, 81, NULL, 0, NULL, NULL),
(1601, 31, 82, NULL, 0, NULL, NULL),
(1602, 32, 82, NULL, 0, NULL, NULL),
(1603, 33, 82, NULL, 0, NULL, NULL),
(1604, 34, 82, NULL, 0, NULL, NULL),
(1605, 35, 82, NULL, 0, NULL, NULL),
(1606, 36, 82, NULL, 0, NULL, NULL),
(1607, 37, 82, NULL, 0, NULL, NULL),
(1608, 38, 82, NULL, 0, NULL, NULL),
(1609, 39, 82, NULL, 0, NULL, NULL),
(1610, 40, 82, NULL, 0, NULL, NULL),
(1611, 41, 82, NULL, 0, NULL, NULL),
(1612, 42, 82, NULL, 0, NULL, NULL),
(1613, 43, 82, NULL, 0, NULL, NULL),
(1614, 44, 82, NULL, 0, NULL, NULL),
(1615, 45, 82, NULL, 0, NULL, NULL),
(1616, 46, 82, NULL, 0, NULL, NULL),
(1617, 47, 82, NULL, 0, NULL, NULL),
(1618, 48, 82, NULL, 0, NULL, NULL),
(1619, 49, 82, NULL, 0, NULL, NULL),
(1620, 50, 82, NULL, 0, NULL, NULL),
(1621, 51, 82, NULL, 0, NULL, NULL),
(1622, 52, 82, NULL, 0, NULL, NULL),
(1623, 53, 82, NULL, 0, NULL, NULL),
(1624, 54, 82, NULL, 0, NULL, NULL),
(1625, 55, 82, NULL, 0, NULL, NULL),
(1626, 56, 82, NULL, 0, NULL, NULL),
(1627, 57, 82, NULL, 0, NULL, NULL),
(1628, 58, 82, NULL, 0, NULL, NULL),
(1629, 59, 82, NULL, 0, NULL, NULL),
(1630, 60, 82, NULL, 0, NULL, NULL),
(1631, 31, 83, NULL, 0, NULL, NULL),
(1632, 32, 83, NULL, 0, NULL, NULL),
(1633, 33, 83, NULL, 0, NULL, NULL),
(1634, 34, 83, NULL, 0, NULL, NULL),
(1635, 35, 83, NULL, 0, NULL, NULL),
(1636, 36, 83, NULL, 0, NULL, NULL),
(1637, 37, 83, NULL, 0, NULL, NULL),
(1638, 38, 83, NULL, 0, NULL, NULL),
(1639, 39, 83, NULL, 0, NULL, NULL),
(1640, 40, 83, NULL, 0, NULL, NULL),
(1641, 41, 83, NULL, 0, NULL, NULL),
(1642, 42, 83, NULL, 0, NULL, NULL),
(1643, 43, 83, NULL, 0, NULL, NULL),
(1644, 44, 83, NULL, 0, NULL, NULL),
(1645, 45, 83, NULL, 0, NULL, NULL),
(1646, 46, 83, NULL, 0, NULL, NULL),
(1647, 47, 83, NULL, 0, NULL, NULL),
(1648, 48, 83, NULL, 0, NULL, NULL),
(1649, 49, 83, NULL, 0, NULL, NULL);
INSERT INTO `ticket` (`id`, `seat_id`, `schedule_id`, `booking_id`, `status`, `created_at`, `updated_at`) VALUES
(1650, 50, 83, NULL, 0, NULL, NULL),
(1651, 51, 83, NULL, 0, NULL, NULL),
(1652, 52, 83, NULL, 0, NULL, NULL),
(1653, 53, 83, NULL, 0, NULL, NULL),
(1654, 54, 83, NULL, 0, NULL, NULL),
(1655, 55, 83, NULL, 0, NULL, NULL),
(1656, 56, 83, NULL, 0, NULL, NULL),
(1657, 57, 83, NULL, 0, NULL, NULL),
(1658, 58, 83, NULL, 0, NULL, NULL),
(1659, 59, 83, NULL, 0, NULL, NULL),
(1660, 60, 83, NULL, 0, NULL, NULL),
(1661, 31, 84, NULL, 0, NULL, NULL),
(1662, 32, 84, NULL, 0, NULL, NULL),
(1663, 33, 84, NULL, 0, NULL, NULL),
(1664, 34, 84, NULL, 0, NULL, NULL),
(1665, 35, 84, NULL, 0, NULL, NULL),
(1666, 36, 84, NULL, 0, NULL, NULL),
(1667, 37, 84, NULL, 0, NULL, NULL),
(1668, 38, 84, NULL, 0, NULL, NULL),
(1669, 39, 84, NULL, 0, NULL, NULL),
(1670, 40, 84, NULL, 0, NULL, NULL),
(1671, 41, 84, NULL, 0, NULL, NULL),
(1672, 42, 84, NULL, 0, NULL, NULL),
(1673, 43, 84, NULL, 0, NULL, NULL),
(1674, 44, 84, NULL, 0, NULL, NULL),
(1675, 45, 84, NULL, 0, NULL, NULL),
(1676, 46, 84, NULL, 0, NULL, NULL),
(1677, 47, 84, NULL, 0, NULL, NULL),
(1678, 48, 84, NULL, 0, NULL, NULL),
(1679, 49, 84, NULL, 0, NULL, NULL),
(1680, 50, 84, NULL, 0, NULL, NULL),
(1681, 51, 84, NULL, 0, NULL, NULL),
(1682, 52, 84, NULL, 0, NULL, NULL),
(1683, 53, 84, NULL, 0, NULL, NULL),
(1684, 54, 84, NULL, 0, NULL, NULL),
(1685, 55, 84, NULL, 0, NULL, NULL),
(1686, 56, 84, NULL, 0, NULL, NULL),
(1687, 57, 84, NULL, 0, NULL, NULL),
(1688, 58, 84, NULL, 0, NULL, NULL),
(1689, 59, 84, NULL, 0, NULL, NULL),
(1690, 60, 84, NULL, 0, NULL, NULL),
(1691, 31, 85, NULL, 0, NULL, NULL),
(1692, 32, 85, NULL, 0, NULL, NULL),
(1693, 33, 85, NULL, 0, NULL, NULL),
(1694, 34, 85, NULL, 0, NULL, NULL),
(1695, 35, 85, NULL, 0, NULL, NULL),
(1696, 36, 85, NULL, 0, NULL, NULL),
(1697, 37, 85, NULL, 0, NULL, NULL),
(1698, 38, 85, NULL, 0, NULL, NULL),
(1699, 39, 85, NULL, 0, NULL, NULL),
(1700, 40, 85, NULL, 0, NULL, NULL),
(1701, 41, 85, NULL, 0, NULL, NULL),
(1702, 42, 85, NULL, 0, NULL, NULL),
(1703, 43, 85, NULL, 0, NULL, NULL),
(1704, 44, 85, NULL, 0, NULL, NULL),
(1705, 45, 85, NULL, 0, NULL, NULL),
(1706, 46, 85, NULL, 0, NULL, NULL),
(1707, 47, 85, NULL, 0, NULL, NULL),
(1708, 48, 85, NULL, 0, NULL, NULL),
(1709, 49, 85, NULL, 0, NULL, NULL),
(1710, 50, 85, NULL, 0, NULL, NULL),
(1711, 51, 85, NULL, 0, NULL, NULL),
(1712, 52, 85, NULL, 0, NULL, NULL),
(1713, 53, 85, NULL, 0, NULL, NULL),
(1714, 54, 85, NULL, 0, NULL, NULL),
(1715, 55, 85, NULL, 0, NULL, NULL),
(1716, 56, 85, NULL, 0, NULL, NULL),
(1717, 57, 85, NULL, 0, NULL, NULL),
(1718, 58, 85, NULL, 0, NULL, NULL),
(1719, 59, 85, NULL, 0, NULL, NULL),
(1720, 60, 85, NULL, 0, NULL, NULL),
(1721, 31, 86, NULL, 0, NULL, NULL),
(1722, 32, 86, NULL, 0, NULL, NULL),
(1723, 33, 86, NULL, 0, NULL, NULL),
(1724, 34, 86, NULL, 0, NULL, NULL),
(1725, 35, 86, NULL, 0, NULL, NULL),
(1726, 36, 86, NULL, 0, NULL, NULL),
(1727, 37, 86, NULL, 0, NULL, NULL),
(1728, 38, 86, NULL, 0, NULL, NULL),
(1729, 39, 86, NULL, 0, NULL, NULL),
(1730, 40, 86, NULL, 0, NULL, NULL),
(1731, 41, 86, NULL, 0, NULL, NULL),
(1732, 42, 86, NULL, 0, NULL, NULL),
(1733, 43, 86, NULL, 0, NULL, NULL),
(1734, 44, 86, NULL, 0, NULL, NULL),
(1735, 45, 86, NULL, 0, NULL, NULL),
(1736, 46, 86, NULL, 0, NULL, NULL),
(1737, 47, 86, NULL, 0, NULL, NULL),
(1738, 48, 86, NULL, 0, NULL, NULL),
(1739, 49, 86, NULL, 0, NULL, NULL),
(1740, 50, 86, NULL, 0, NULL, NULL),
(1741, 51, 86, NULL, 0, NULL, NULL),
(1742, 52, 86, NULL, 0, NULL, NULL),
(1743, 53, 86, NULL, 0, NULL, NULL),
(1744, 54, 86, NULL, 0, NULL, NULL),
(1745, 55, 86, NULL, 0, NULL, NULL),
(1746, 56, 86, NULL, 0, NULL, NULL),
(1747, 57, 86, NULL, 0, NULL, NULL),
(1748, 58, 86, NULL, 0, NULL, NULL),
(1749, 59, 86, NULL, 0, NULL, NULL),
(1750, 60, 86, NULL, 0, NULL, NULL),
(1751, 31, 87, NULL, 0, NULL, NULL),
(1752, 32, 87, NULL, 0, NULL, NULL),
(1753, 33, 87, NULL, 0, NULL, NULL),
(1754, 34, 87, NULL, 0, NULL, NULL),
(1755, 35, 87, NULL, 0, NULL, NULL),
(1756, 36, 87, NULL, 0, NULL, NULL),
(1757, 37, 87, NULL, 0, NULL, NULL),
(1758, 38, 87, NULL, 0, NULL, NULL),
(1759, 39, 87, NULL, 0, NULL, NULL),
(1760, 40, 87, NULL, 0, NULL, NULL),
(1761, 41, 87, NULL, 0, NULL, NULL),
(1762, 42, 87, NULL, 0, NULL, NULL),
(1763, 43, 87, NULL, 0, NULL, NULL),
(1764, 44, 87, NULL, 0, NULL, NULL),
(1765, 45, 87, NULL, 0, NULL, NULL),
(1766, 46, 87, NULL, 0, NULL, NULL),
(1767, 47, 87, NULL, 0, NULL, NULL),
(1768, 48, 87, NULL, 0, NULL, NULL),
(1769, 49, 87, NULL, 0, NULL, NULL),
(1770, 50, 87, NULL, 0, NULL, NULL),
(1771, 51, 87, NULL, 0, NULL, NULL),
(1772, 52, 87, NULL, 0, NULL, NULL),
(1773, 53, 87, NULL, 0, NULL, NULL),
(1774, 54, 87, NULL, 0, NULL, NULL),
(1775, 55, 87, NULL, 0, NULL, NULL),
(1776, 56, 87, NULL, 0, NULL, NULL),
(1777, 57, 87, NULL, 0, NULL, NULL),
(1778, 58, 87, NULL, 0, NULL, NULL),
(1779, 59, 87, NULL, 0, NULL, NULL),
(1780, 60, 87, NULL, 0, NULL, NULL),
(1781, 31, 88, 70, 1, NULL, '2024-01-07 02:00:50'),
(1782, 32, 88, 70, 1, NULL, '2024-01-07 02:00:50'),
(1783, 33, 88, 70, 1, NULL, '2024-01-07 02:00:50'),
(1784, 34, 88, NULL, 0, NULL, NULL),
(1785, 35, 88, NULL, 0, NULL, NULL),
(1786, 36, 88, NULL, 0, NULL, NULL),
(1787, 37, 88, NULL, 0, NULL, NULL),
(1788, 38, 88, NULL, 0, NULL, NULL),
(1789, 39, 88, 71, 1, NULL, '2024-01-07 02:06:29'),
(1790, 40, 88, 71, 1, NULL, '2024-01-07 02:06:29'),
(1791, 41, 88, 74, 1, NULL, '2024-01-07 02:41:14'),
(1792, 42, 88, NULL, 0, NULL, NULL),
(1793, 43, 88, NULL, 0, NULL, NULL),
(1794, 44, 88, NULL, 0, NULL, NULL),
(1795, 45, 88, NULL, 0, NULL, NULL),
(1796, 46, 88, NULL, 0, NULL, NULL),
(1797, 47, 88, 73, 1, NULL, '2024-01-07 02:35:16'),
(1798, 48, 88, 73, 1, NULL, '2024-01-07 02:35:16'),
(1799, 49, 88, 74, 1, NULL, '2024-01-07 02:41:14'),
(1800, 50, 88, NULL, 0, NULL, NULL),
(1801, 51, 88, NULL, 0, NULL, NULL),
(1802, 52, 88, NULL, 0, NULL, NULL),
(1803, 53, 88, NULL, 0, NULL, NULL),
(1804, 54, 88, NULL, 0, NULL, NULL),
(1805, 55, 88, 72, 1, NULL, '2024-01-07 02:09:21'),
(1806, 56, 88, 72, 1, NULL, '2024-01-07 02:09:21'),
(1807, 57, 88, 72, 1, NULL, '2024-01-07 02:09:21'),
(1808, 58, 88, NULL, 0, NULL, NULL),
(1809, 59, 88, NULL, 0, NULL, NULL),
(1810, 60, 88, NULL, 0, NULL, NULL),
(1811, 31, 89, NULL, 0, NULL, NULL),
(1812, 32, 89, NULL, 0, NULL, NULL),
(1813, 33, 89, NULL, 0, NULL, NULL),
(1814, 34, 89, NULL, 0, NULL, NULL),
(1815, 35, 89, NULL, 0, NULL, NULL),
(1816, 36, 89, NULL, 0, NULL, NULL),
(1817, 37, 89, NULL, 0, NULL, NULL),
(1818, 38, 89, NULL, 0, NULL, NULL),
(1819, 39, 89, NULL, 0, NULL, NULL),
(1820, 40, 89, NULL, 0, NULL, NULL),
(1821, 41, 89, NULL, 0, NULL, NULL),
(1822, 42, 89, NULL, 0, NULL, NULL),
(1823, 43, 89, NULL, 0, NULL, NULL),
(1824, 44, 89, NULL, 0, NULL, NULL),
(1825, 45, 89, NULL, 0, NULL, NULL),
(1826, 46, 89, NULL, 0, NULL, NULL),
(1827, 47, 89, NULL, 0, NULL, NULL),
(1828, 48, 89, NULL, 0, NULL, NULL),
(1829, 49, 89, NULL, 0, NULL, NULL),
(1830, 50, 89, NULL, 0, NULL, NULL),
(1831, 51, 89, NULL, 0, NULL, NULL),
(1832, 52, 89, NULL, 0, NULL, NULL),
(1833, 53, 89, NULL, 0, NULL, NULL),
(1834, 54, 89, NULL, 0, NULL, NULL),
(1835, 55, 89, NULL, 0, NULL, NULL),
(1836, 56, 89, NULL, 0, NULL, NULL),
(1837, 57, 89, NULL, 0, NULL, NULL),
(1838, 58, 89, NULL, 0, NULL, NULL),
(1839, 59, 89, NULL, 0, NULL, NULL),
(1840, 60, 89, NULL, 0, NULL, NULL),
(1841, 31, 90, NULL, 0, NULL, NULL),
(1842, 32, 90, NULL, 0, NULL, '2024-01-08 00:40:12'),
(1843, 33, 90, NULL, 0, NULL, '2024-01-08 00:40:12'),
(1844, 34, 90, NULL, 0, NULL, NULL),
(1845, 35, 90, NULL, 0, NULL, NULL),
(1846, 36, 90, NULL, 0, NULL, NULL),
(1847, 37, 90, NULL, 0, NULL, NULL),
(1848, 38, 90, NULL, 0, NULL, NULL),
(1849, 39, 90, NULL, 0, NULL, NULL),
(1850, 40, 90, NULL, 0, NULL, NULL),
(1851, 41, 90, NULL, 0, NULL, NULL),
(1852, 42, 90, NULL, 0, NULL, NULL),
(1853, 43, 90, NULL, 0, NULL, NULL),
(1854, 44, 90, NULL, 0, NULL, NULL),
(1855, 45, 90, NULL, 0, NULL, NULL),
(1856, 46, 90, NULL, 0, NULL, NULL),
(1857, 47, 90, NULL, 0, NULL, NULL),
(1858, 48, 90, NULL, 0, NULL, NULL),
(1859, 49, 90, NULL, 0, NULL, NULL),
(1860, 50, 90, NULL, 0, NULL, NULL),
(1861, 51, 90, NULL, 0, NULL, NULL),
(1862, 52, 90, NULL, 0, NULL, NULL),
(1863, 53, 90, NULL, 0, NULL, NULL),
(1864, 54, 90, NULL, 0, NULL, NULL),
(1865, 55, 90, NULL, 0, NULL, NULL),
(1866, 56, 90, NULL, 0, NULL, NULL),
(1867, 57, 90, NULL, 0, NULL, NULL),
(1868, 58, 90, NULL, 0, NULL, NULL),
(1869, 59, 90, NULL, 0, NULL, NULL),
(1870, 60, 90, NULL, 0, NULL, NULL),
(1871, 31, 91, NULL, 0, NULL, '2024-01-08 03:54:00'),
(1872, 32, 91, NULL, 0, NULL, '2024-01-08 03:54:00'),
(1873, 33, 91, NULL, 0, NULL, '2024-01-08 03:54:00'),
(1874, 34, 91, NULL, 0, NULL, NULL),
(1875, 35, 91, NULL, 0, NULL, NULL),
(1876, 36, 91, NULL, 0, NULL, NULL),
(1877, 37, 91, NULL, 0, NULL, NULL),
(1878, 38, 91, NULL, 0, NULL, NULL),
(1879, 39, 91, NULL, 0, NULL, '2024-01-08 02:05:51'),
(1880, 40, 91, NULL, 0, NULL, '2024-01-08 02:05:51'),
(1881, 41, 91, NULL, 0, NULL, '2024-01-08 02:05:51'),
(1882, 42, 91, NULL, 0, NULL, NULL),
(1883, 43, 91, NULL, 0, NULL, NULL),
(1884, 44, 91, NULL, 0, NULL, NULL),
(1885, 45, 91, NULL, 0, NULL, NULL),
(1886, 46, 91, NULL, 0, NULL, NULL),
(1887, 47, 91, NULL, 0, NULL, NULL),
(1888, 48, 91, NULL, 0, NULL, NULL),
(1889, 49, 91, NULL, 0, NULL, NULL),
(1890, 50, 91, NULL, 0, NULL, NULL),
(1891, 51, 91, NULL, 0, NULL, NULL),
(1892, 52, 91, NULL, 0, NULL, NULL),
(1893, 53, 91, NULL, 0, NULL, NULL),
(1894, 54, 91, NULL, 0, NULL, NULL),
(1895, 55, 91, NULL, 0, NULL, NULL),
(1896, 56, 91, NULL, 0, NULL, NULL),
(1897, 57, 91, NULL, 0, NULL, NULL),
(1898, 58, 91, NULL, 0, NULL, NULL),
(1899, 59, 91, NULL, 0, NULL, NULL),
(1900, 60, 91, NULL, 0, NULL, NULL),
(1901, 31, 92, 85, 1, NULL, '2024-01-08 03:15:31'),
(1902, 32, 92, 85, 1, NULL, '2024-01-08 03:15:31'),
(1903, 33, 92, 86, 1, NULL, '2024-01-08 06:36:35'),
(1904, 34, 92, NULL, 0, NULL, NULL),
(1905, 35, 92, NULL, 0, NULL, NULL),
(1906, 36, 92, NULL, 0, NULL, NULL),
(1907, 37, 92, NULL, 0, NULL, NULL),
(1908, 38, 92, NULL, 0, NULL, NULL),
(1909, 39, 92, 87, 1, NULL, '2024-01-08 06:38:30'),
(1910, 40, 92, 87, 1, NULL, '2024-01-08 06:38:30'),
(1911, 41, 92, NULL, 0, NULL, '2024-01-09 00:57:02'),
(1912, 42, 92, NULL, 0, NULL, NULL),
(1913, 43, 92, NULL, 0, NULL, NULL),
(1914, 44, 92, NULL, 0, NULL, NULL),
(1915, 45, 92, NULL, 0, NULL, NULL),
(1916, 46, 92, NULL, 0, NULL, NULL),
(1917, 47, 92, NULL, 0, NULL, '2024-01-09 00:57:02'),
(1918, 48, 92, NULL, 0, NULL, '2024-01-09 00:57:02'),
(1919, 49, 92, NULL, 0, NULL, '2024-01-09 00:52:01'),
(1920, 50, 92, NULL, 0, NULL, NULL),
(1921, 51, 92, NULL, 0, NULL, NULL),
(1922, 52, 92, NULL, 0, NULL, NULL),
(1923, 53, 92, NULL, 0, NULL, NULL),
(1924, 54, 92, NULL, 0, NULL, NULL),
(1925, 55, 92, NULL, 0, NULL, NULL),
(1926, 56, 92, NULL, 0, NULL, NULL),
(1927, 57, 92, NULL, 0, NULL, NULL),
(1928, 58, 92, NULL, 0, NULL, NULL),
(1929, 59, 92, NULL, 0, NULL, NULL),
(1930, 60, 92, NULL, 0, NULL, NULL),
(1931, 31, 93, NULL, 0, NULL, NULL),
(1932, 32, 93, NULL, 0, NULL, NULL),
(1933, 33, 93, NULL, 0, NULL, NULL),
(1934, 34, 93, NULL, 0, NULL, NULL),
(1935, 35, 93, NULL, 0, NULL, NULL),
(1936, 36, 93, NULL, 0, NULL, NULL),
(1937, 37, 93, NULL, 0, NULL, NULL),
(1938, 38, 93, NULL, 0, NULL, NULL),
(1939, 39, 93, NULL, 0, NULL, NULL),
(1940, 40, 93, NULL, 0, NULL, NULL),
(1941, 41, 93, NULL, 0, NULL, NULL),
(1942, 42, 93, NULL, 0, NULL, NULL),
(1943, 43, 93, NULL, 0, NULL, NULL),
(1944, 44, 93, NULL, 0, NULL, NULL),
(1945, 45, 93, NULL, 0, NULL, NULL),
(1946, 46, 93, NULL, 0, NULL, NULL),
(1947, 47, 93, NULL, 0, NULL, NULL),
(1948, 48, 93, NULL, 0, NULL, NULL),
(1949, 49, 93, NULL, 0, NULL, NULL),
(1950, 50, 93, NULL, 0, NULL, NULL),
(1951, 51, 93, NULL, 0, NULL, NULL),
(1952, 52, 93, NULL, 0, NULL, NULL),
(1953, 53, 93, NULL, 0, NULL, NULL),
(1954, 54, 93, NULL, 0, NULL, NULL),
(1955, 55, 93, NULL, 0, NULL, NULL),
(1956, 56, 93, NULL, 0, NULL, NULL),
(1957, 57, 93, NULL, 0, NULL, NULL),
(1958, 58, 93, NULL, 0, NULL, NULL),
(1959, 59, 93, NULL, 0, NULL, NULL),
(1960, 60, 93, NULL, 0, NULL, NULL),
(1961, 31, 94, NULL, 0, NULL, NULL),
(1962, 32, 94, NULL, 0, NULL, NULL),
(1963, 33, 94, NULL, 0, NULL, NULL),
(1964, 34, 94, NULL, 0, NULL, NULL),
(1965, 35, 94, NULL, 0, NULL, NULL),
(1966, 36, 94, NULL, 0, NULL, NULL),
(1967, 37, 94, NULL, 0, NULL, NULL),
(1968, 38, 94, NULL, 0, NULL, NULL),
(1969, 39, 94, NULL, 0, NULL, NULL),
(1970, 40, 94, NULL, 0, NULL, NULL),
(1971, 41, 94, NULL, 0, NULL, NULL),
(1972, 42, 94, NULL, 0, NULL, NULL),
(1973, 43, 94, NULL, 0, NULL, NULL),
(1974, 44, 94, NULL, 0, NULL, NULL),
(1975, 45, 94, NULL, 0, NULL, NULL),
(1976, 46, 94, NULL, 0, NULL, NULL),
(1977, 47, 94, NULL, 0, NULL, NULL),
(1978, 48, 94, NULL, 0, NULL, NULL),
(1979, 49, 94, NULL, 0, NULL, NULL),
(1980, 50, 94, NULL, 0, NULL, NULL),
(1981, 51, 94, NULL, 0, NULL, NULL),
(1982, 52, 94, NULL, 0, NULL, NULL),
(1983, 53, 94, NULL, 0, NULL, NULL),
(1984, 54, 94, NULL, 0, NULL, NULL),
(1985, 55, 94, NULL, 0, NULL, NULL),
(1986, 56, 94, NULL, 0, NULL, NULL),
(1987, 57, 94, NULL, 0, NULL, NULL),
(1988, 58, 94, NULL, 0, NULL, NULL),
(1989, 59, 94, NULL, 0, NULL, NULL),
(1990, 60, 94, NULL, 0, NULL, NULL),
(1991, 91, 95, 75, 1, NULL, '2024-01-07 06:56:09'),
(1992, 92, 95, 75, 1, NULL, '2024-01-07 06:56:09'),
(1993, 93, 95, NULL, 0, NULL, NULL),
(1994, 94, 95, NULL, 0, NULL, NULL),
(1995, 95, 95, NULL, 0, NULL, NULL),
(1996, 96, 95, NULL, 0, NULL, NULL),
(1997, 97, 95, NULL, 0, NULL, NULL),
(1998, 98, 95, NULL, 0, NULL, NULL),
(1999, 99, 95, NULL, 0, NULL, NULL),
(2000, 100, 95, NULL, 0, NULL, NULL),
(2001, 101, 95, NULL, 0, NULL, NULL),
(2002, 102, 95, NULL, 0, NULL, NULL),
(2003, 103, 95, NULL, 0, NULL, NULL),
(2004, 104, 95, NULL, 0, NULL, NULL),
(2005, 105, 95, NULL, 0, NULL, NULL),
(2006, 106, 95, NULL, 0, NULL, NULL),
(2007, 107, 95, NULL, 0, NULL, NULL),
(2008, 108, 95, NULL, 0, NULL, NULL),
(2009, 109, 95, NULL, 0, NULL, NULL),
(2010, 110, 95, NULL, 0, NULL, NULL),
(2011, 111, 95, NULL, 0, NULL, NULL),
(2012, 112, 95, NULL, 0, NULL, NULL),
(2013, 113, 95, NULL, 0, NULL, NULL),
(2014, 114, 95, NULL, 0, NULL, NULL),
(2015, 115, 95, NULL, 0, NULL, NULL),
(2016, 116, 95, NULL, 0, NULL, NULL),
(2017, 117, 95, NULL, 0, NULL, NULL),
(2018, 118, 95, NULL, 0, NULL, NULL),
(2019, 119, 95, NULL, 0, NULL, NULL),
(2020, 120, 95, NULL, 0, NULL, NULL),
(2021, 121, 98, 76, 1, NULL, '2024-01-07 07:06:52'),
(2022, 122, 98, 76, 1, NULL, '2024-01-07 07:06:52'),
(2023, 123, 98, NULL, 0, NULL, NULL),
(2024, 124, 98, NULL, 0, NULL, NULL),
(2025, 125, 98, NULL, 0, NULL, NULL),
(2026, 126, 98, NULL, 0, NULL, NULL),
(2027, 127, 98, NULL, 0, NULL, NULL),
(2028, 128, 98, NULL, 0, NULL, NULL),
(2029, 129, 98, 76, 1, NULL, '2024-01-07 07:06:52'),
(2030, 130, 98, 77, 1, NULL, '2024-01-07 07:09:11'),
(2031, 131, 98, NULL, 0, NULL, NULL),
(2032, 132, 98, NULL, 0, NULL, NULL),
(2033, 133, 98, NULL, 0, NULL, NULL),
(2034, 134, 98, NULL, 0, NULL, NULL),
(2035, 135, 98, NULL, 0, NULL, NULL),
(2036, 136, 98, NULL, 0, NULL, NULL),
(2037, 137, 98, 77, 1, NULL, '2024-01-07 07:09:11'),
(2038, 138, 98, 77, 1, NULL, '2024-01-07 07:09:11'),
(2039, 139, 98, NULL, 0, NULL, NULL),
(2040, 140, 98, NULL, 0, NULL, NULL),
(2041, 141, 98, NULL, 0, NULL, NULL),
(2042, 142, 98, NULL, 0, NULL, NULL),
(2043, 143, 98, NULL, 0, NULL, NULL),
(2044, 144, 98, NULL, 0, NULL, NULL),
(2045, 145, 98, NULL, 0, NULL, NULL),
(2046, 146, 98, NULL, 0, NULL, NULL),
(2047, 147, 98, NULL, 0, NULL, NULL),
(2048, 148, 98, NULL, 0, NULL, NULL),
(2049, 149, 98, NULL, 0, NULL, NULL),
(2050, 150, 98, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trailers`
--

CREATE TABLE `trailers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trailers`
--

INSERT INTO `trailers` (`id`, `key`, `movie_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'eKl7NyhV6VA', 1, '2023-10-30 22:20:59', '2023-11-25 07:32:43', NULL),
(2, '9gNI2IhY870', 2, '2023-10-30 22:52:43', '2023-10-30 22:52:43', NULL),
(3, 'lcK6CG1MN9s', 4, '2023-11-01 00:21:35', '2023-11-01 00:21:35', NULL),
(4, 'wA6iB3OZDus', 3, '2023-11-01 00:22:53', '2023-11-01 00:22:53', NULL),
(5, 'RHElv9Kk9gY', 5, '2023-11-01 00:26:28', '2023-11-01 00:26:28', NULL),
(6, 'cg5z7wgOUig', 6, '2023-11-01 00:30:34', '2023-11-01 00:30:34', NULL),
(7, 'R6o1UWEBVQA', 7, '2023-11-01 00:34:44', '2023-11-01 00:34:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` int(11) NOT NULL DEFAULT 0,
  `point` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `gender`, `phone`, `point`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin root 1', 'admin@gmail.com', 'male', 1234567891, 0, '2023-12-29 02:41:31', '$2y$10$CN6V1wr..dIjSf6xe23Wmup0CwXREdOLoYKDx/Uv6Oy5GMbsZStgK', NULL, '2023-11-01 01:00:46', '2023-12-29 02:41:32'),
(2, 'user', 'user@gmail.com', 'male', 123456789, 0, NULL, '$2y$10$EI0ir73M/InaZzqCk0AnjeKCCBXdVihyML6e4Sh9ByLKfzWvzz3JW', NULL, '2023-11-01 01:00:46', '2023-11-01 01:00:46'),
(3, 'Binhtran', 'binhtran@gmail.com', '', 0, 0, NULL, '$2y$10$CxHasdmg1OOOX/be3gQj9e2jT3L/tRgLuj8CTzzKIjIAdMVfehd0e', NULL, '2023-12-01 23:41:15', '2023-12-01 23:41:15'),
(4, 'user1', 'user1@gmail.com', '', 0, 0, NULL, '$2y$10$zZRFc5GL46wVBWV9frj4aOfz5T4QdFV8kvOEBGtabKwIp43ACJkL.', NULL, '2023-12-14 23:23:17', '2023-12-14 23:23:17'),
(7, 'user2', 'user2@gmail.com', '', 0, 0, NULL, '$2y$10$ZH0xTx6Jg6jiPdyCfkeODus9TyZImCaGCPuGkXBqJwLNoesN2dGVK', NULL, '2023-12-14 23:32:58', '2023-12-14 23:32:58'),
(11, 'admin2', 'admin2@gmail.com', '', 1234567891, 0, NULL, '$2y$10$4MYRInfphPfVFQJWtSnh9OjLJpl7YmPX7u768Fi3Ndqvgw7gA3er6', NULL, '2023-12-15 00:49:35', '2023-12-15 00:49:35'),
(12, 'admin3', 'admin3@gmail.com', '', 123456789, 0, NULL, '$2y$10$MDMw/rgtxQozE4JmNg4uxOfhmZIyqmIrq/j0odAslvXUSClXy18OK', NULL, '2023-12-15 01:00:40', '2023-12-15 01:00:40'),
(13, 'admintest', 'AdminTest@gmail.com', '', 1234567899, 0, NULL, '$2y$10$txQz7Bp4Sk./pNcAsHG2meLcWq8Y/Xm230egS53w86vVIKcHX.jOi', NULL, '2023-12-18 01:03:38', '2023-12-18 01:03:38'),
(22, 'binhtran', 'binh0932658710@gmail.com', '', 0, 0, '2023-12-29 23:20:59', '$2y$10$iJ5tLVA6X/TMPL8IswABN.SMeDLilEZlas0qaO70N1Xe17oL/papW', NULL, '2023-12-29 23:19:58', '2023-12-29 23:20:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_id_unique` (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `booking_combo`
--
ALTER TABLE `booking_combo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_food_booking_id_foreign` (`booking_id`),
  ADD KEY `booking_food_combo_id_foreign` (`combo_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `casts`
--
ALTER TABLE `casts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `casts_id_unique` (`id`);

--
-- Indexes for table `combofood`
--
ALTER TABLE `combofood`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `combofood_id_unique` (`id`);

--
-- Indexes for table `combo_food`
--
ALTER TABLE `combo_food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_food_combo_id_foreign` (`combo_id`),
  ADD KEY `type_food_food_id_foreign` (`food_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `food_id_unique` (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `genres_id_unique` (`id`),
  ADD UNIQUE KEY `genres_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `movies_id_unique` (`id`);

--
-- Indexes for table `movie_casts`
--
ALTER TABLE `movie_casts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_casts_movie_id_foreign` (`movie_id`),
  ADD KEY `movie_casts_cast_id_foreign` (`cast_id`);

--
-- Indexes for table `movie_detail`
--
ALTER TABLE `movie_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `movie_detail_id_unique` (`id`),
  ADD KEY `movie_detail_movie_id_foreign` (`movie_id`);

--
-- Indexes for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_genres_movie_id_foreign` (`movie_id`),
  ADD KEY `movie_genres_genre_id_foreign` (`genre_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_id_unique` (`id`),
  ADD KEY `payments_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rooms_id_unique` (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `schedules_id_unique` (`id`),
  ADD KEY `schedules_movie_id_foreign` (`movie_id`),
  ADD KEY `schedules_room_id_foreign` (`room_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seats_id_unique` (`id`),
  ADD KEY `seats_room_id_foreign` (`room_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_id_unique` (`id`),
  ADD KEY `ticket_seat_id_foreign` (`seat_id`),
  ADD KEY `ticket_schedule_id_foreign` (`schedule_id`),
  ADD KEY `ticket_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `trailers`
--
ALTER TABLE `trailers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trailers_movie_id_foreign` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `booking_combo`
--
ALTER TABLE `booking_combo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `casts`
--
ALTER TABLE `casts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `combofood`
--
ALTER TABLE `combofood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `combo_food`
--
ALTER TABLE `combo_food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `movie_casts`
--
ALTER TABLE `movie_casts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `movie_detail`
--
ALTER TABLE `movie_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `movie_genres`
--
ALTER TABLE `movie_genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2051;

--
-- AUTO_INCREMENT for table `trailers`
--
ALTER TABLE `trailers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `booking_combo`
--
ALTER TABLE `booking_combo`
  ADD CONSTRAINT `booking_food_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `booking_food_combo_id_foreign` FOREIGN KEY (`combo_id`) REFERENCES `combofood` (`id`);

--
-- Constraints for table `combo_food`
--
ALTER TABLE `combo_food`
  ADD CONSTRAINT `type_food_combo_id_foreign` FOREIGN KEY (`combo_id`) REFERENCES `combofood` (`id`),
  ADD CONSTRAINT `type_food_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_casts`
--
ALTER TABLE `movie_casts`
  ADD CONSTRAINT `movie_casts_cast_id_foreign` FOREIGN KEY (`cast_id`) REFERENCES `casts` (`id`),
  ADD CONSTRAINT `movie_casts_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `movie_detail`
--
ALTER TABLE `movie_detail`
  ADD CONSTRAINT `movie_detail_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  ADD CONSTRAINT `movie_genres_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movie_detail` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `schedules_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `ticket_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `ticket_seat_id_foreign` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`);

--
-- Constraints for table `trailers`
--
ALTER TABLE `trailers`
  ADD CONSTRAINT `trailers_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
