-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2025 at 08:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sozllwze_123`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `api_token` varchar(64) DEFAULT NULL,
  `tsc` varchar(255) DEFAULT NULL,
  `ts` tinyint(1) DEFAULT 0,
  `tv` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `status`, `email_verified_at`, `image`, `password`, `remember_token`, `api_token`, `tsc`, `ts`, `tv`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@example.com', 'admin', 1, NULL, '6893b0836a6441754509443.png', '$2y$10$ZOWPSwbB7098UQHq/GZX5uGq43wfuDDjMBNASktSNK55T/4jC/xvy', 'JPq0OZbOMQTjzjh3LSywUIITwYnnznRBE7jWr2k2hKqkjoHJhRv5JMrZClM1', 'mMxKL7QZEJLqN3d1T2V1gesd3eg0rf04TrJjSVSvE5ktxZGtc4eip3uvUmNd', NULL, 0, 1, NULL, '2025-08-07 12:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'New member registered', 1, '/admin/manage/users/detail/1', '2025-07-03 23:45:37', '2025-07-03 23:49:51'),
(2, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 1, '#', '2025-07-03 23:45:39', '2025-07-03 23:47:19'),
(3, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-07-03 23:48:01', '2025-07-03 23:48:01'),
(4, 2, 'New member registered', 0, '/admin/manage/users/detail/2', '2025-07-03 23:48:18', '2025-07-03 23:48:18'),
(5, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-07-03 23:48:20', '2025-07-03 23:48:20'),
(6, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-07-03 23:50:23', '2025-07-03 23:50:23'),
(7, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-07-03 21:05:46', '2025-07-03 21:05:46'),
(8, 3, 'New member registered', 0, '/admin/manage/users/detail/3', '2025-07-03 21:17:45', '2025-07-03 21:17:45'),
(9, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-07-03 21:32:41', '2025-07-03 21:32:41'),
(10, 4, 'New member registered', 0, '/admin/manage/users/detail/4', '2025-07-03 22:09:54', '2025-07-03 22:09:54'),
(11, 5, 'New member registered', 0, '/admin/manage/users/detail/5', '2025-07-03 23:57:54', '2025-07-03 23:57:54'),
(12, 4, 'Plan Subscribe from rrrrrr', 0, '/admin/manage/users/detail/4', '2025-07-16 08:57:21', '2025-07-16 08:57:21'),
(13, 6, 'New member registered', 0, '/admin/manage/users/detail/6', '2025-07-16 09:28:13', '2025-07-16 09:28:13'),
(14, 1, 'Plan Subscribe from mohammed', 0, '/admin/manage/users/detail/1', '2025-07-16 09:47:21', '2025-07-16 09:47:21'),
(15, 7, 'New member registered', 0, '/admin/manage/users/detail/7', '2025-07-16 11:14:57', '2025-07-16 11:14:57'),
(16, 1, 'Plan Subscribe from mohammed', 0, '/admin/manage/users/detail/1', '2025-07-16 23:38:26', '2025-07-16 23:38:26'),
(17, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-07-17 02:53:24', '2025-07-17 02:53:24'),
(18, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-07-17 02:54:55', '2025-07-17 02:54:55'),
(19, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-07-17 03:04:37', '2025-07-17 03:04:37'),
(20, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-07-17 12:32:05', '2025-07-17 12:32:05'),
(21, 3, 'New support ticket has opened', 0, '/admin/support/tickets/view/1', '2025-07-28 08:25:25', '2025-07-28 08:25:25'),
(22, 7, 'Deposit request from 212121', 0, '/admin/manage/deposits/details/5', '2025-07-28 12:06:46', '2025-07-28 12:06:46'),
(23, 7, 'Deposit request from 212121', 0, '/admin/manage/deposits/details/6', '2025-07-28 12:08:17', '2025-07-28 12:08:17'),
(24, 8, 'New member registered', 0, '/admin/manage/users/detail/8', '2025-07-31 23:16:54', '2025-07-31 23:16:54'),
(25, 9, 'New member registered', 0, '/admin/manage/users/detail/9', '2025-08-07 02:27:26', '2025-08-07 02:27:26'),
(26, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2025-08-07 05:30:59', '2025-08-07 05:30:59'),
(27, 0, 'SMTP Error: Could not authenticate.', 0, '#', '2025-08-07 05:31:16', '2025-08-07 05:31:16'),
(28, 10, 'New member registered', 0, '/admin/manage/users/detail/10', '2025-08-07 06:08:56', '2025-08-07 06:08:56'),
(29, 10, 'Plan Subscribe from 1232323', 0, '/admin/manage/users/detail/10', '2025-08-15 16:39:23', '2025-08-15 16:39:23'),
(30, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-08-15 16:41:02', '2025-08-15 16:41:02'),
(31, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-08-15 16:55:53', '2025-08-15 16:55:53'),
(32, 2, 'Plan Subscribe from 123123', 0, 'http://127.0.0.1/admin/manage/users/detail/2', '2025-08-15 17:05:39', '2025-08-15 17:05:39'),
(33, 2, 'Plan Subscribe from 123123', 0, 'http://127.0.0.1/admin/manage/users/detail/2', '2025-08-15 17:06:02', '2025-08-15 17:06:02'),
(34, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-08-15 17:08:34', '2025-08-15 17:08:34'),
(35, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-08-15 17:11:45', '2025-08-15 17:11:45'),
(36, 2, 'Plan Subscribe from 123123', 0, '/admin/manage/users/detail/2', '2025-08-15 17:14:52', '2025-08-15 17:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `ad_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ad_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `redirect_url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `allocated_credits` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `ad_type_id`, `user_id`, `ad_name`, `title`, `code`, `redirect_url`, `image`, `resolution`, `allocated_credits`, `status`, `created_at`, `updated_at`) VALUES
(36, 16, NULL, 'Leaderboard Banner', 'ad-1', 'ad_q5eg', 'https://wstacks.com/', '657abf4d13b7b1702543181.png', '728x90', 0, 1, '2023-12-14 07:57:38', '2023-12-14 08:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `ad_types`
--

CREATE TABLE `ad_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `width` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ad_types`
--

INSERT INTO `ad_types` (`id`, `name`, `type`, `width`, `height`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(13, 'Square', 'image', '250', '250', '250x250', 1, '2023-12-14 07:45:17', '2023-12-14 07:45:17'),
(14, 'Small Square', 'image', '200', '200', '200x200', 1, '2023-12-14 07:45:38', '2023-12-14 07:45:38'),
(15, 'Banner', 'image', '468', '60', '468x60', 1, '2023-12-14 07:45:58', '2023-12-14 07:45:58'),
(16, 'Leaderboard Banner', 'image', '728', '90', '728x90', 1, '2023-12-14 07:46:15', '2023-12-14 07:46:15'),
(17, 'Skyscraper', 'image', '120', '600', '120x600', 1, '2023-12-14 07:46:52', '2023-12-14 07:46:52'),
(18, 'Wide Skyscraper', 'image', '160', '600', '160x600', 1, '2023-12-14 07:47:12', '2023-12-14 07:47:12'),
(19, 'Large Leaderboard', 'image', '970', '90', '970x90', 1, '2023-12-14 07:47:49', '2023-12-14 07:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `apify_actors`
--

CREATE TABLE `apify_actors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `actor_id` varchar(255) NOT NULL,
  `metric` varchar(50) NOT NULL DEFAULT 'followers',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value_field` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `apify_actors`
--

INSERT INTO `apify_actors` (`id`, `name`, `actor_id`, `metric`, `created_at`, `updated_at`, `value_field`) VALUES
(1, 'Facebook Followers', 'apify~facebook-pages-scraper', 'startUrls', '2025-07-31 08:44:17', '2025-08-08 12:42:41', 'followers'),
(2, 'instagram follo', 'apify~instagram-profile-scraper', 'usernames', '2025-07-31 09:16:08', '2025-08-08 12:46:48', 'followersCount'),
(3, 'tiktok', 'karamelo~tiktok-profile-scraper', 'urls', '2025-07-31 09:16:35', '2025-08-08 12:48:37', 'followerCount'),
(4, 'Facebook Likes', 'mina_safwat~facebook-post-scraper-ppr', 'url', '2025-08-07 22:32:06', '2025-08-13 05:29:37', 'data.statistics.reaction_count.count'),
(5, 'facebook comment', 'mina_safwat~facebook-post-scraper-ppr', 'url', '2025-08-08 12:50:59', '2025-08-13 05:29:33', 'data.statistics.comment_count'),
(6, 'facebook share', 'mina_safwat~facebook-post-scraper-ppr', 'url', '2025-08-08 12:52:18', '2025-08-13 05:29:29', 'data.statistics.shares_count');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `apify_actor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `min_points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `apify_actor_id`, `image`, `status`, `created_at`, `updated_at`, `min_points`) VALUES
(1, 'متابعين فيسبوك 🔥', 1, '6892b5d64e8cd1754445270.png', 1, '2025-07-03 21:14:51', '2025-08-08 07:57:14', 15),
(2, 'متابعين إنستغرام 🔥', 2, '6892b5f4111541754445300.png', 1, '2025-07-03 21:21:06', '2025-08-08 07:57:10', 6),
(3, 'متابعين تيك توك 🔥', 3, '6892b5f92f9f31754445305.jpg', 1, '2025-08-01 05:31:42', '2025-08-06 01:55:05', 4),
(4, 'لايكات فيسبوك🔥', 4, 'sRnEARTwSw6azeKSFUqaXyvcIhpGwFEYP0DHAKOX.png', 1, '2025-08-06 07:04:37', '2025-08-08 12:49:02', 13),
(5, 'تعليقات فيسبوك🔥', 5, 'MrY8T60VDD00NjmwSOhDuBlJ5FKASf2yWABpOpCY.png', 1, '2025-08-08 12:50:07', '2025-08-08 12:51:46', 20),
(6, 'مشاركات فيسبوك🔥', 6, 'IDrzxb6P3HLT83Gt29ikQc0BXH3kPYDx88qWDD5I.png', 1, '2025-08-08 12:52:45', '2025-08-08 12:52:51', 20);

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `who` bigint(20) UNSIGNED NOT NULL,
  `level` varchar(255) NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `main_amo` decimal(28,8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `trx` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `plan_id` int(11) DEFAULT NULL,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `original_amount_lyd` decimal(28,8) DEFAULT NULL,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `plan_id`, `method_code`, `amount`, `original_amount_lyd`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 101, 3.00000000, NULL, 'USD', 1.03000000, 1.00000000, 4.03000000, NULL, '0', '', 'SBT75OQVHZ81', 0, 0, 0, NULL, '2025-07-03 21:56:39', '2025-07-03 21:56:39'),
(2, 3, 1, 101, 10.00000000, NULL, 'USD', 1.10000000, 1.00000000, 11.10000000, NULL, '0', '', 'Z1714QUBEGHJ', 0, 0, 0, NULL, '2025-07-03 22:08:49', '2025-07-03 22:08:49'),
(3, 3, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', '49Y9C1ZMPCRG', 0, 0, 0, NULL, '2025-07-28 11:33:14', '2025-07-28 11:33:14'),
(4, 3, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', '5VCE3JHW1OA8', 0, 0, 0, NULL, '2025-07-28 11:50:11', '2025-07-28 11:50:11'),
(5, 7, NULL, 1000, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, '[]', '0', '', 'NH9CCBSJJGVM', 0, 2, 0, NULL, '2025-07-28 12:06:25', '2025-07-28 12:06:46'),
(6, 7, NULL, 1000, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, '[]', '0', '', '1KR89GCFCKX2', 0, 2, 0, NULL, '2025-07-28 12:07:52', '2025-07-28 12:08:17'),
(7, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'VS4UC5SPPBRS', 0, 0, 0, NULL, '2025-07-28 12:08:54', '2025-07-28 12:08:54'),
(8, 7, NULL, 115, 4.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 4.00000000, NULL, '0', '', 'HXAU9RRC7R2G', 0, 0, 0, NULL, '2025-07-28 12:27:35', '2025-07-28 12:27:35'),
(9, 7, NULL, 115, 4.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 4.00000000, NULL, '0', '', 'TR4U53EBKDJ5', 0, 0, 0, NULL, '2025-07-28 12:32:10', '2025-07-28 12:32:10'),
(10, 7, NULL, 115, 4.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 4.00000000, NULL, '0', '', 'ACO5BWY3ANA3', 0, 0, 0, NULL, '2025-07-28 12:32:29', '2025-07-28 12:32:29'),
(11, 7, NULL, 115, 4.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 4.00000000, NULL, '0', '', '6AZMU6MQQ554', 0, 0, 0, NULL, '2025-07-28 12:34:25', '2025-07-28 12:34:25'),
(12, 7, NULL, 115, 4.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 4.00000000, NULL, '0', '', 'YTFHZVXFGTTD', 0, 0, 0, NULL, '2025-07-28 12:34:49', '2025-07-28 12:34:49'),
(13, 7, NULL, 115, 3.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 3.00000000, NULL, '0', '', 'HAUR3TOST3YE', 0, 0, 0, NULL, '2025-07-28 12:37:01', '2025-07-28 12:37:01'),
(14, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', 'YXDQ2KGGQ351', 0, 0, 0, NULL, '2025-07-28 12:37:10', '2025-07-28 12:37:10'),
(15, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', 'G4EWUD3ZGJSU', 0, 0, 0, NULL, '2025-07-28 12:41:00', '2025-07-28 12:41:00'),
(16, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', '29NARDKGPHVB', 0, 0, 0, NULL, '2025-07-28 12:43:13', '2025-07-28 12:43:13'),
(17, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', 'QNKWY87PVFOM', 0, 0, 0, NULL, '2025-07-28 12:48:07', '2025-07-28 12:48:07'),
(18, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', 'TD3O695TPD6G', 0, 0, 0, NULL, '2025-07-28 12:57:12', '2025-07-28 12:57:12'),
(19, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', 'YS98YNGF82SH', 0, 0, 0, NULL, '2025-07-28 13:13:19', '2025-07-28 13:13:19'),
(20, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', '1T353ROPXEDZ', 0, 0, 0, NULL, '2025-07-28 13:19:51', '2025-07-28 13:19:51'),
(21, 7, NULL, 115, 11.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 11.00000000, NULL, '0', '', 'OGUKVQ8S6JSE', 0, 0, 0, NULL, '2025-07-28 14:05:56', '2025-07-28 14:05:56'),
(22, 7, NULL, 115, 34.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 34.00000000, NULL, '0', '', '5JWC63W52FKY', 0, 0, 0, NULL, '2025-07-28 14:43:43', '2025-07-28 14:43:43'),
(23, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', '96Q7TP9S4G68', 0, 0, 0, NULL, '2025-07-28 14:58:41', '2025-07-28 14:58:41'),
(24, 7, NULL, 115, 2.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 2.00000000, NULL, '0', '', 'V5SK5J1AH13Z', 0, 0, 0, NULL, '2025-07-28 15:14:56', '2025-07-28 15:14:56'),
(25, 7, NULL, 115, 33.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 33.00000000, NULL, '0', '', '5BMC9OKQM9OP', 0, 0, 0, NULL, '2025-07-28 15:28:12', '2025-07-28 15:28:12'),
(26, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '52E3CENCM1J8', 0, 0, 0, NULL, '2025-07-28 15:36:51', '2025-07-28 15:36:51'),
(27, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'K7YU3T7V2CBE', 0, 0, 0, NULL, '2025-07-29 04:07:20', '2025-07-29 04:07:20'),
(28, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'XJ1RMTFR2GD4', 0, 0, 0, NULL, '2025-07-29 04:37:40', '2025-07-29 04:37:40'),
(29, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', '5WB5XHT94BAJ', 0, 0, 0, NULL, '2025-07-29 05:03:26', '2025-07-29 05:03:26'),
(30, 7, NULL, 115, 2.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 2.00000000, NULL, '0', '', 'G9PAWUMUHR5S', 0, 0, 0, NULL, '2025-07-29 05:28:11', '2025-07-29 05:28:11'),
(31, 7, NULL, 115, 11.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 11.00000000, NULL, '0', '', '6KEBOTWVG779', 0, 0, 0, NULL, '2025-07-29 06:01:12', '2025-07-29 06:01:12'),
(32, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '9TQAYRF3YBHJ', 0, 0, 0, NULL, '2025-07-29 07:26:25', '2025-07-29 07:26:25'),
(33, 7, NULL, 115, 11.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 11.00000000, NULL, '0', '', 'HEOMR9S5KSMT', 0, 0, 0, NULL, '2025-07-29 07:27:08', '2025-07-29 07:27:08'),
(34, 7, NULL, 115, 10.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 10.00000000, NULL, '0', '', '3GQSU3O2E2ZP', 0, 0, 0, NULL, '2025-07-29 07:55:54', '2025-07-29 07:55:54'),
(35, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '91638G97GBMY', 0, 0, 0, NULL, '2025-07-29 08:16:32', '2025-07-29 08:16:32'),
(36, 2, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'PDGUJVG5QAUA', 0, 0, 0, NULL, '2025-07-29 09:10:18', '2025-07-29 09:10:18'),
(37, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'B2BM4EWN3ERY', 0, 0, 0, NULL, '2025-07-29 09:23:57', '2025-07-29 09:23:57'),
(38, 2, NULL, 115, 2.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 2.00000000, NULL, '0', '', 'W8AA4VUOZ1J3', 0, 0, 0, NULL, '2025-07-29 09:41:36', '2025-07-29 09:41:36'),
(39, 2, NULL, 115, 2.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 2.00000000, NULL, '0', '', 'J3NSSPJYJPXS', 0, 0, 0, NULL, '2025-07-29 09:42:22', '2025-07-29 09:42:22'),
(40, 6, NULL, 115, 5.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'TEY5JQUC4SP6', 0, 0, 0, NULL, '2025-07-29 10:02:24', '2025-07-29 10:02:24'),
(41, 8, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'C6QVJFDQHB64', 0, 0, 0, NULL, '2025-08-01 03:11:02', '2025-08-01 03:11:02'),
(42, 7, NULL, 115, 7.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 7.00000000, NULL, '0', '', 'PR7KW67ERMER', 0, 0, 0, NULL, '2025-08-01 02:58:02', '2025-08-01 02:58:02'),
(43, 1, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '2F4AH7N9F7XK', 0, 0, 0, NULL, '2025-08-01 23:02:39', '2025-08-01 23:02:39'),
(44, 2, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '747DEZKCG37N', 0, 0, 0, NULL, '2025-08-01 23:09:40', '2025-08-01 23:09:40'),
(45, 8, NULL, 115, 4.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 4.00000000, NULL, '0', '', 'J3MFZT7BMBH4', 0, 0, 0, NULL, '2025-08-05 21:09:01', '2025-08-05 21:09:01'),
(46, 7, NULL, 115, 3.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 3.00000000, NULL, '0', '', 'JRBMBE47JHMD', 0, 0, 0, NULL, '2025-08-06 16:41:41', '2025-08-06 16:41:41'),
(47, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'C3UVNOQGB7XF', 0, 0, 0, NULL, '2025-08-07 03:34:14', '2025-08-07 03:34:14'),
(48, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '4HZMGZN8RVXD', 0, 0, 0, NULL, '2025-08-07 04:26:19', '2025-08-07 04:26:19'),
(49, 10, NULL, 115, 2.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 2.00000000, NULL, '0', '', '3Y1VJD8TDO6T', 0, 0, 0, NULL, '2025-08-07 06:12:29', '2025-08-07 06:12:29'),
(50, 10, NULL, 115, 2.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 2.00000000, NULL, '0', '', 'MRCQZ3VBSSUV', 0, 0, 0, NULL, '2025-08-07 06:15:33', '2025-08-07 06:15:33'),
(51, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '5HRTXXU8HPNB', 0, 0, 0, NULL, '2025-08-07 06:38:32', '2025-08-07 06:38:32'),
(52, 10, NULL, 115, 2.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 2.00000000, NULL, '0', '', '53NVWCR4UZEM', 0, 0, 0, NULL, '2025-08-07 06:39:00', '2025-08-07 06:39:00'),
(53, 10, NULL, 115, 3.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 3.00000000, NULL, '0', '', '7H2VX54E6VKB', 0, 0, 0, NULL, '2025-08-07 06:40:22', '2025-08-07 06:40:22'),
(54, 10, NULL, 115, 3.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 3.00000000, NULL, '0', '', '74F7XTMFUPZV', 0, 0, 0, NULL, '2025-08-07 07:23:48', '2025-08-07 07:23:48'),
(55, 10, NULL, 115, 2.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 2.00000000, NULL, '0', '', 'N31TC2MEQ1J1', 0, 0, 0, NULL, '2025-08-07 07:35:31', '2025-08-07 07:35:31'),
(56, 10, NULL, 115, 4.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 4.00000000, NULL, '0', '', '8M2PNO9UWC5N', 0, 0, 0, NULL, '2025-08-07 07:40:26', '2025-08-07 07:40:26'),
(57, 10, NULL, 115, 5.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'FW1UJWBTQ1KY', 0, 0, 0, NULL, '2025-08-07 07:43:15', '2025-08-07 07:43:15'),
(58, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'QZT7JCYFA7JY', 0, 0, 0, NULL, '2025-08-07 07:57:45', '2025-08-07 07:57:45'),
(59, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '7E3ZDQ5XZ6EY', 0, 0, 0, NULL, '2025-08-07 08:04:54', '2025-08-07 08:04:54'),
(60, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'VJ75JAKGJ5ND', 0, 0, 0, NULL, '2025-08-07 08:07:05', '2025-08-07 08:07:05'),
(61, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'MC6WYP3OXMUY', 0, 0, 0, NULL, '2025-08-07 08:07:59', '2025-08-07 08:07:59'),
(62, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'XHBE4Z6HDWP1', 0, 0, 0, NULL, '2025-08-07 08:08:56', '2025-08-07 08:08:56'),
(63, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'C6UBDUF57HOG', 0, 0, 0, NULL, '2025-08-07 08:10:30', '2025-08-07 08:10:30'),
(64, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'JY3ZPM49GE6E', 0, 0, 0, NULL, '2025-08-07 08:16:03', '2025-08-07 08:16:03'),
(65, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'V4G4VC3G3ZQY', 0, 0, 0, NULL, '2025-08-07 08:22:05', '2025-08-07 08:22:05'),
(66, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'W7RSQD2PQJHF', 0, 0, 0, NULL, '2025-08-07 08:24:04', '2025-08-07 08:24:04'),
(67, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'Z6AFG4EGJBST', 0, 0, 0, NULL, '2025-08-07 08:31:30', '2025-08-07 08:31:30'),
(68, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, '\"Libyana payment confirmed for phone: 920000000\"', '0', '', '7R8EK4MU542V', 0, 1, 0, NULL, '2025-08-07 08:33:50', '2025-08-07 08:34:09'),
(69, 10, NULL, 115, 100.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 100.00000000, '\"Libyana payment confirmed for phone: 920000000\"', '0', '', '4DX637PCNAQ5', 0, 1, 0, NULL, '2025-08-07 08:38:25', '2025-08-07 08:39:12'),
(70, 2, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'EZ59JMO34SUC', 0, 0, 0, NULL, '2025-08-07 10:18:45', '2025-08-07 10:18:45'),
(71, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'WXKJSYRM9SX8', 0, 0, 0, NULL, '2025-08-07 11:29:33', '2025-08-07 11:29:33'),
(72, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'OXAV2F7TA24V', 0, 0, 0, NULL, '2025-08-07 12:01:47', '2025-08-07 12:01:47'),
(73, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '8WG5YETPW445', 0, 0, 0, NULL, '2025-08-11 06:37:51', '2025-08-11 06:37:51'),
(74, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'AOCPXNCJOJSN', 0, 0, 0, NULL, '2025-08-11 06:41:23', '2025-08-11 06:41:23'),
(75, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'S36ENTOTFUQZ', 0, 0, 0, NULL, '2025-08-11 06:46:31', '2025-08-11 06:46:31'),
(76, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'MDQ7BYXMRVP4', 0, 0, 0, NULL, '2025-08-11 06:59:38', '2025-08-11 06:59:38'),
(77, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', '3ECMY2ZQJ273', 0, 0, 0, NULL, '2025-08-11 07:03:42', '2025-08-11 07:03:42'),
(78, 7, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'HMJ3KQGN6X6X', 0, 0, 0, NULL, '2025-08-11 07:09:30', '2025-08-11 07:09:30'),
(79, 7, NULL, 115, 9.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 9.00000000, NULL, '0', '', 'UXVO9DOAGGNN', 0, 0, 0, NULL, '2025-08-11 07:10:54', '2025-08-11 07:10:54'),
(80, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'VSKDPQ6PA2V5', 0, 0, 0, NULL, '2025-08-11 07:12:57', '2025-08-11 07:12:57'),
(81, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'C32RJSJ8K3U7', 0, 0, 0, NULL, '2025-08-11 07:32:24', '2025-08-11 07:32:24'),
(82, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'PVGA7WKZREJT', 0, 0, 0, NULL, '2025-08-11 07:51:21', '2025-08-11 07:51:21'),
(83, 10, NULL, 115, 3.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 3.00000000, NULL, '0', '', 'URE22ZYQU3GN', 0, 0, 0, NULL, '2025-08-11 07:56:07', '2025-08-11 07:56:07'),
(84, 10, NULL, 115, 1.00000000, NULL, 'LYD', 0.00000000, 1.00000000, 1.00000000, NULL, '0', '', 'AD367ZE2FMFB', 0, 0, 0, NULL, '2025-08-11 08:07:54', '2025-08-11 08:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Live Chat(Tawk.to)', 'Key location is shown bellow', 'chat-png.png', '<script>\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\n                        (function(){\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\n                        s1.async=true;\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\n                        s1.charset=\"UTF-8\";\n                        s1.setAttribute(\"crossorigin\",\"*\");\n                        s0.parentNode.insertBefore(s1,s0);\n                        })();\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"55\"}}', 'twak.png', 1, NULL, '2019-10-18 23:16:05', '2025-08-01 02:56:30'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha2.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2025-08-01 02:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'manual_deposit', '[]', '2025-07-28 11:44:10', '2025-07-28 11:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) DEFAULT NULL,
  `data_values` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"website\",\"like4like\",\"social page promotion\",\"credits earn\"],\"description\":\"Discover a secure and user-friendly exchange platform. Trade cryptocurrencies effortlessly with advanced features. Join now for seamless transactions!\",\"social_title\":\"Follow Exchange\",\"social_description\":\"Discover a secure and user-friendly exchange platform. Trade cryptocurrencies effortlessly with advanced features. Join now for seamless transactions!\",\"image\":\"66361cc2b9a971714822338.png\"}', '2020-07-04 23:42:52', '2024-05-04 11:34:08'),
(24, 'about.content', '{\"has_image\":\"1\",\"top_heading\":\"What We Provide\",\"heading\":\"Best Follow Exchange Platform In The WorldWide\",\"description\":\"The platform\'s versatility shines through its feature-rich interface, enabling users to launch follow campaigns, track their engagement statistics, and manage their credits effortlessly. Boasting support for over 10 payment gateways, FExchange ensures accessibility and convenience for users worldwide.\",\"about_image\":\"662e2ae50ae071714301669.png\"}', '2020-10-28 00:51:20', '2024-05-05 12:09:50'),
(25, 'blog.content', '{\"top_heading\":\"Blogs\",\"heading\":\"Our Latest Blogs\",\"sub_heading\":\"Offering users an avenue to bolster their online presence through reciprocal interactions.\"}', '2020-10-28 00:51:34', '2024-05-05 12:10:41'),
(26, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Get More Free Instagram Likes\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum orem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam.<\\/p><h3>How to Earn<\\/h3><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quiLorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem it. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime<\\/p>\",\"blog_image\":\"6635c3e7910031714799591.png\"}', '2020-10-28 00:57:19', '2024-05-04 11:02:29'),
(27, 'contact_us.content', '{\"has_image\":\"1\",\"title\":\"Auctor gravida vestibulu\",\"short_details\":\"Lorem ipsum dolor, sit amet consectetur adipisicing elit\",\"email_address\":\"admin@test.com\",\"contact_details\":\"688967896896\",\"contact_number\":\"9876897689698\",\"latitude\":\"876768\",\"longitude\":\"67867868\",\"website_footer\":\"<p>Copyright 2024. All rights reserved.<\\/p>\",\"contact_image\":\"6635d4dbc87141714803931.png\"}', '2020-10-28 00:59:19', '2024-05-04 06:25:31'),
(28, 'counter.content', '{\"heading\":\"Clients\",\"subheading\":\"Auctor gravida vestibulu\"}', '2020-10-28 01:04:02', '2022-09-28 14:02:14'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2020-11-12 04:07:30', '2024-04-28 12:38:29'),
(33, 'feature.content', '{\"heading\":\"asdf\",\"sub_heading\":\"asdf\"}', '2021-01-03 23:40:54', '2021-01-03 23:40:55'),
(34, 'feature.element', '{\"title\":\"asdf\",\"description\":\"asdf\",\"feature_icon\":\"asdf\"}', '2021-01-03 23:41:02', '2021-01-03 23:41:02'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', '2021-03-06 01:12:10', '2021-03-06 01:12:10'),
(36, 'service.content', '{\"trx_type\":\"deposit\",\"heading\":\"asdf fffff\",\"subheading\":\"555\"}', '2021-03-06 01:27:34', '2022-03-30 08:07:06'),
(39, 'banner.content', '{\"has_image\":\"1\",\"top_heading\":\"SIMPLE, QUICK, SECURED\",\"heading\":\"Biggest Action Exchange Platform\",\"sub_heading\":\"Exchange likes, follows, subscriptions etc\",\"banner_image\":\"6635bf68159241714798440.png\"}', '2021-05-02 06:09:30', '2024-05-05 12:01:57'),
(41, 'cookie.data', '{\"short_desc\":\"We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \\\"Accept\\\", you consent to our use of cookies.\",\"description\":\"<h4>GDPR, cookies and compliance&nbsp;<\\/h4><ul><li>The&nbsp;General Data Protection Regulation (GDPR)&nbsp;is an EU legislation that governs all collection and processing of personal data from individuals inside the EU.<\\/li><li>Under the EU\\u2019s GDPR, it is the&nbsp;legal responsibility of website owners and operators&nbsp;to make sure that personal data is collected and processed lawfully.<\\/li><li>A website outside of the EU is required to comply with the GDPR if it collects&nbsp;data from users inside the EU.<\\/li><\\/ul><p>&nbsp;<\\/p><p>Even though cookies are mentioned only once in the GDPR,&nbsp;cookie consent&nbsp;is nonetheless a cornerstone of compliance for websites with EU-located users.<\\/p><p>This is because&nbsp;one of the most common ways for personal data to be collected and shared online is through website cookies. The GDPR sets out specific rules for the use of cookies.<\\/p><p>That\\u2019s why end-user consent to cookies is the GDPR\\u2019s most used legal basis that allows websites to process personal data and use cookies.&nbsp;<\\/p>\",\"status\":1}', '2020-07-04 23:42:52', '2023-02-18 09:03:29'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p><p>\\u00a0<\\/p><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.\\u00a0<\\/p><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p>\"}', '2021-06-09 08:50:42', '2022-12-17 06:01:31'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p><p>\\u00a0<\\/p><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.\\u00a0<\\/p><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p>\"}', '2021-06-09 08:51:18', '2022-12-17 06:01:43'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', '2020-07-04 23:42:52', '2022-05-11 03:57:17'),
(45, 'feature.element', '{\"title\":\"sytry\",\"description\":\"ertyerty\",\"feature_icon\":\"<i class=\\\"fas fa-address-book\\\"><\\/i>\"}', '2022-10-17 10:23:22', '2022-10-17 10:23:22'),
(46, 'feature.element', '{\"title\":\"sytry\",\"description\":\"ertyerty\",\"feature_icon\":\"<i class=\\\"fas fa-address-book\\\"><\\/i>\"}', '2022-10-17 10:23:22', '2022-10-17 10:23:22'),
(51, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Modus melioreex has in decore\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum orem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam.<\\/p><h3>How to Earn<\\/h3><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quiLorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem it. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime<\\/p>\",\"blog_image\":\"6635c3f2edb381714799602.png\"}', '2023-03-21 08:45:08', '2024-05-04 10:05:19'),
(52, 'about.element', '{\"icon\":\"<i class=\\\"fas fa-users\\\"><\\/i>\",\"title\":\"Join our Community\",\"description\":\"Embark on your social media journey with a startup bonus of 30 credits when you become part of our vibrant community.\"}', '2024-04-28 10:57:33', '2024-04-28 10:57:33'),
(53, 'about.element', '{\"icon\":\"<i class=\\\"fas fa-store\\\"><\\/i>\",\"title\":\"Showcase\",\"description\":\"Promote the platform that matters most to you by adding your social network page to our community.\"}', '2024-04-28 10:58:42', '2024-04-28 10:58:42'),
(54, 'about.element', '{\"icon\":\"<i class=\\\"fas fa-file-invoice-dollar\\\"><\\/i>\",\"title\":\"Earn Credits\",\"description\":\"Whether you prefer to buy credits or enjoy the perks of free credits.\"}', '2024-04-28 10:59:26', '2024-04-28 11:02:59'),
(55, 'about.element', '{\"icon\":\"<i class=\\\"fas fa-fire\\\"><\\/i>\",\"title\":\"Boost Your Presence\",\"description\":\"Witness your followers and likes soar as you actively participate in our community.\"}', '2024-04-28 10:59:53', '2024-04-28 10:59:53'),
(56, 'support.content', '{\"top_heading\":\"Support Social\",\"heading\":\"We Support All Major Social Media Networks\"}', '2024-04-28 11:25:30', '2024-04-28 11:25:30'),
(57, 'support.element', '{\"has_image\":[\"1\"],\"title\":\"Followers, Shares on Facebook\",\"description\":\"Looking to boost your social media presence? Our service offers free likes, followers, and shares on Facebook, helping you reach a wider audience and increase engagement\",\"support_image\":\"662e32c0e86dd1714303680.png\"}', '2024-04-28 11:28:00', '2024-05-01 10:38:14'),
(58, 'support.element', '{\"has_image\":[\"1\"],\"title\":\"Likes,Shares on Instagram\",\"description\":\"Looking to boost your social media presence? Our service offers free likes, followers, and shares on Facebook, helping you reach a wider audience and increase engagement\",\"support_image\":\"662e32d8b58721714303704.png\"}', '2024-04-28 11:28:24', '2024-05-01 10:38:31'),
(59, 'support.element', '{\"has_image\":[\"1\"],\"title\":\"Likes, Shares on Tiktkok\",\"description\":\"Looking to boost your social media presence? Our service offers free likes, followers, and shares on Facebook, helping you reach a wider audience and increase engagement\",\"support_image\":\"662e32f0a815b1714303728.png\"}', '2024-04-28 11:28:48', '2024-05-01 10:38:46'),
(60, 'faq.content', '{\"has_image\":\"1\",\"top_heading\":\"FAQ\",\"heading\":\"Frequently Asked Questions\",\"faq_image\":\"662e37b9d7ddd1714304953.png\"}', '2024-04-28 11:49:04', '2024-04-28 11:49:14'),
(61, 'faq.element', '{\"question\":\"Where can I find Follower?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-04-28 11:50:21', '2024-04-28 11:50:21'),
(62, 'faq.element', '{\"question\":\"What skills do I need?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-04-28 11:50:43', '2024-04-28 11:50:43'),
(63, 'faq.element', '{\"question\":\"I have Received my withdrawal?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-04-28 11:51:05', '2024-04-28 11:54:01'),
(64, 'faq.element', '{\"question\":\"I have not Receive My Withdrawal\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-04-28 11:52:59', '2024-04-28 11:52:59'),
(65, 'faq.element', '{\"question\":\"What are the payment options available?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-04-28 11:55:28', '2024-04-28 11:55:28'),
(66, 'faq.element', '{\"question\":\"How long does it take to gain followers?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-04-28 11:55:37', '2024-04-28 11:55:37'),
(67, 'reffer.content', '{\"has_image\":\"1\",\"heading\":\"Refer and  Earn\",\"description\":\"Unlock incredible rewards with our referral program! By inviting friends and colleagues to join our platform, you not only help them enhance their social media presence but also earn lucrative bonuses for yourself. In our Referral section, you can effortlessly track your referral\'s progress and watch your credits soar. With each successful referral, you stand to collect over 2,000 credits in bonuses. But it doesn\'t stop there \\u2013 the more referrals you accumulate, the more you can earn. Join now and start maximizing your rewards today\",\"reffer_image\":\"6635c26669d661714799206.png\"}', '2024-04-28 11:59:43', '2024-05-04 05:06:46'),
(68, 'testimonial.content', '{\"top_heading\":\"Say Client\",\"heading\":\"Client Feedback\",\"sub_heading\":\"Offering users an avenue to bolster their online presence through reciprocal interactions.\"}', '2024-04-28 12:07:49', '2024-05-05 12:11:25'),
(69, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"John Doe\",\"designation\":\"Software Engineer\",\"star_count\":\"5\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet minima sunt nesciunt cupiditate atque? Beatae voluptate nihil tempora provident? Nostrum obcaecati totam\",\"client_image\":\"662e3c48364d21714306120.png\"}', '2024-04-28 12:08:40', '2024-04-28 12:08:40'),
(70, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Jack Ma\",\"designation\":\"CEO and Founder\",\"star_count\":\"5\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet minima sunt nesciunt cupiditate atque? Beatae voluptate nihil tempora provident? Nostrum obcaecati totam\",\"client_image\":\"662e3c64585ac1714306148.png\"}', '2024-04-28 12:09:08', '2024-04-28 12:09:08'),
(71, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Dolland\",\"designation\":\"Polititian\",\"star_count\":\"4\",\"description\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Amet minima sunt nesciunt cupiditate atque? Beatae voluptate nihil tempora provident? Nostrum obcaecati totam\",\"client_image\":\"662e3c7cbcf401714306172.png\"}', '2024-04-28 12:09:32', '2024-04-28 12:09:32'),
(72, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Modus melioreex has in decore\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum orem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam.<\\/p><p>\\u00a0<\\/p><h3>How to Earn<\\/h3><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quiLorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem it. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime<\\/p>\",\"blog_image\":\"6635c3ff47b751714799615.png\"}', '2024-04-28 12:27:38', '2024-05-04 05:13:35'),
(73, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', '2024-04-28 12:38:47', '2024-04-28 12:38:47'),
(74, 'social_icon.element', '{\"title\":\"LinkedIn\",\"social_icon\":\"<i class=\\\"fab fa-linkedin\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\\/\"}', '2024-04-28 12:39:13', '2024-04-28 12:39:13'),
(75, 'plan.content', '{\"top_heading\":\"Buy Credits\",\"heading\":\"Popular Credits Plan\",\"sub_heading\":\"Offering users an avenue to bolster their online presence through reciprocal interactions.\"}', '2024-04-29 05:23:33', '2024-05-05 12:11:10'),
(76, 'faq.element', '{\"question\":\"Where can I find Follower?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-05-01 09:58:08', '2024-05-01 09:58:08'),
(77, 'footer_important_links.element', '{\"title\":\"Login\",\"url\":\"\\/user\\/login\"}', '2024-05-01 10:00:02', '2024-05-01 10:00:02'),
(78, 'footer_important_links.element', '{\"title\":\"Contact\",\"url\":\"\\/contact\"}', '2024-05-01 10:00:16', '2024-05-01 10:00:16'),
(79, 'footer_important_links.element', '{\"title\":\"Buy Credits\",\"url\":\"\\/plan\"}', '2024-05-01 10:00:30', '2025-08-07 07:15:08'),
(80, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Best time to post on Social\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum orem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam.<\\/p><h3>How to Earn<\\/h3><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quiLorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem it. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime<\\/p>\",\"blog_image\":\"663607c7c9c161714816967.png\"}', '2024-05-04 10:02:47', '2024-05-04 11:03:05'),
(81, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Modus melioreex has in decore\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum orem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam.<\\/p><h3>How to Earn<\\/h3><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quiLorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem it. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime<\\/p>\",\"blog_image\":\"663607ea727301714817002.png\"}', '2024-05-04 10:03:22', '2024-05-04 10:03:22'),
(82, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Modus melioreex has in decore\",\"description\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum orem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam.<\\/p><h3>How to Earn<\\/h3><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quiLorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem it. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime dolorum. Impedit, quibusdam. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis atque excepturi cupiditate soluta nisi aperiam illum maxime<\\/p>\",\"blog_image\":\"663607fd6edba1714817021.png\"}', '2024-05-04 10:03:41', '2024-05-04 10:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"abdocenter@gmail.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2025-07-03 21:34:33'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"---------------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:01'),
(3, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"-----------\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"--------------------\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"example.com\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:10:37'),
(4, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"--------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2022-11-26 07:49:18'),
(5, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"-------------------\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:14'),
(6, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(7, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"------------\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"--------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(8, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"------------\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"---------\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"-------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:00:15'),
(9, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:51'),
(10, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:48'),
(11, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"------------\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"-----------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(12, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51M8Ks2CL65BWuH7eCBcWsLP2yPfWaLtfJVxG3zfii7cCWJE1izM4jkhucmBSm6izmVtSGZyp0JDYYCVmx9E4WmQY004gfnctzD\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51M8Ks2CL65BWuH7eju6khGxJMpeeFuw2Rwrjr8UYCz6ZnQ3PiFxb1gVu1i1dBto9MQrnjkBimHkFJgNcqsrJHTak0010kCY41h\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"abcd\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2022-12-18 08:28:03'),
(49, 1, 1000, 'Manual', 'manual', 0, '[]', '[]', 0, NULL, '<p>&nbsp;<img src=\"https://seeklogo.com/images/L/libyana-logo-A209AE50E7-seeklogo.com.png\" alt=\"Libyana Logo\">&nbsp;</p><h4><a href=\"https://www.youtube.com/watch?v=HYJf2_Hr8lQ\">شرح شحن الموقع اضغط هنا</a></h4><h4><strong>الرجاء الانتظار 5 دقائق في حالة فشل التأكيد والمحاولة مرة أخرى.</strong></h4><h4>في حال وجود أي مشكلة <a href=\"https://abdocenter.com/tickets\">افتح تذكرة من هنا</a></h4><p>سعر دولار الشحن اليوم:</p><p>جاري التحميل...</p><p>رقم التحويل (ليبيانا):</p><p>جاري جلب أرقام التحويل...</p><p>رقم الهاتف:&nbsp;</p><p>المبلغ:&nbsp;</p><p>&nbsp;تأكيد التحويل&nbsp;</p><p>// جلب اسم المستخدم من صفحة /account async function getUsername() { try { const res = await fetch(\"/account\"); const html = await res.text(); const div = document.createElement(\"div\"); div.innerHTML = html; const username = div.querySelector(\"#username\"); return username ? username.value : null; } catch { return null; } } // جلب معلومات الدفع async function fetchPaymentInfo() { try { const res = await fetch(\"https://inanastore.com/api/stores/payment_info/4\"); const data = await res.json(); // سعر الصرف document.getElementById(\"rate\").innerText = `1 USD = ${data.rate || \"?\"} LYD`; // أرقام التحويل const container = document.getElementById(\"numberInputsContainer\"); const loader = document.getElementById(\"loadingNumbers\"); loader.style.display = \"none\"; if (data.number &amp;&amp; data.number.length &gt; 0) { data.number.forEach((num, index) =&gt; { const group = document.createElement(\"div\"); group.className = \"input-group\"; const span = document.createElement(\"span\"); span.className = \"badge-success\"; span.id = `num-${index}`; span.innerText = num; const btn = document.createElement(\"button\"); btn.className = \"btn-copy\"; btn.innerText = \"نسخ\"; btn.onclick = () =&gt; { navigator.clipboard.writeText(num); const msg = group.querySelector(\".copy-message\"); msg.style.display = \"block\"; setTimeout(() =&gt; msg.style.display = \"none\", 2000); }; const msg = document.createElement(\"div\"); msg.className = \"copy-message\"; msg.innerText = \"تم النسخ!\"; group.append(span, btn, msg); container.appendChild(group); }); } else { loader.innerText = \"لم يتم العثور على أرقام.\"; } } catch (err) { document.getElementById(\"rate\").innerText = \"خطأ في تحميل البيانات.\"; document.getElementById(\"loadingNumbers\").innerText = \"فشل في جلب أرقام التحويل.\"; } } // تأكيد التحويل async function confirmTransfer() { const btn = document.getElementById(\"payButton\"); btn.disabled = true; const username = await getUsername(); if (!username) { return showMessage(\"لم يتم العثور على اسم المستخدم. تأكد من تسجيل الدخول.\", \"error\"); } const phone = document.getElementById(\"phone\").value.trim(); const amount = parseFloat(document.getElementById(\"amount\").value); const regex = /^(92|94)\\d{7}$/; if (!regex.test(phone)) { btn.disabled = false; return showMessage(\"رقم الهاتف غير صالح. يجب أن يبدأ بـ 92 أو 94 ويتكون من 9 أرقام.\", \"error\"); } if (isNaN(amount) || amount &lt;= 0) { btn.disabled = false; return showMessage(\"يرجى إدخال مبلغ صالح أكبر من صفر.\", \"error\"); } try { const lang = document.documentElement.lang || \"ar\"; const url = `https://inanastore.com/api/stores/payment_link_check?phone=${phone}&amp;amount=${amount}&amp;user_name=${username}&amp;store_id=4&amp;lang=${lang}`; const res = await fetch(url); const result = await res.json(); if (result.message.includes(\"Success\")) { showMessage(\"✅ تم تأكيد التحويل بنجاح.\", \"success\"); setTimeout(() =&gt; location.reload(), 5000); } else { showMessage(result.message || \"فشل في تأكيد التحويل.\", \"error\"); } } catch { showMessage(\"حدث خطأ أثناء تأكيد التحويل.\", \"error\"); } finally { btn.disabled = false; } } // عرض رسالة function showMessage(msg, type) { const box = document.getElementById(\"message\"); box.innerHTML = `&lt;div class=\"alert alert-${type === \'error\' ? \'error\' : \'success\'}\"&gt;${msg}&lt;/div&gt;`; } // بدء تحميل البيانات fetchPaymentInfo();&nbsp;</p>', '2024-05-04 08:39:13', '2025-07-28 12:09:37'),
(50, 0, 115, 'Libyana', 'Libyana', 1, '[]', '[]', 0, NULL, 'Libyana payment gateway', '2025-07-28 04:00:00', '2025-07-28 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) DEFAULT NULL,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(3, 'Libyana - LYD', 'LYD', '1', 115, 'Libyana', 1.00000000, 100.00000000, 0.00, 0.00000000, 1.00000000, NULL, '{}', '2025-07-28 04:00:00', '2025-07-28 04:00:00'),
(4, 'Manual', 'lyd', '', 1000, 'manual', 1.00000000, 111.00000000, 0.00, 0.00000000, 1.00000000, NULL, NULL, '2025-07-28 12:05:48', '2025-07-28 12:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) DEFAULT NULL,
  `cur_text` varchar(40) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_body` varchar(255) DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `base_color` varchar(40) DEFAULT NULL,
  `secondary_color` varchar(40) DEFAULT NULL,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text DEFAULT NULL,
  `global_shortcodes` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) DEFAULT NULL,
  `deduct_credits` int(11) DEFAULT 1,
  `add_credits` int(11) DEFAULT NULL,
  `given_credits` int(11) DEFAULT NULL,
  `auto_approved` int(11) DEFAULT NULL,
  `system_info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `apify_token` varchar(255) DEFAULT NULL,
  `daily_login_credits` int(11) NOT NULL DEFAULT 0,
  `withdraw_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `withdraw_notify_email` varchar(255) DEFAULT NULL,
  `withdraw_rate_phone` decimal(5,2) NOT NULL DEFAULT 0.00,
  `withdraw_rate_usdt` decimal(5,2) NOT NULL DEFAULT 0.00,
  `withdraw_min_phone` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_min_usdt` decimal(16,8) NOT NULL DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `registration`, `active_template`, `deduct_credits`, `add_credits`, `given_credits`, `auto_approved`, `system_info`, `created_at`, `updated_at`, `apify_token`, `daily_login_credits`, `withdraw_rate`, `withdraw_notify_email`, `withdraw_rate_phone`, `withdraw_rate_usdt`, `withdraw_min_phone`, `withdraw_min_usdt`) VALUES
(1, 'جهاد الدبانة', 'USD', '$', 'abdo@debana.x10.mx', '<p>Hi {{fullname}} ({{username}}),&nbsp;</p><p>{{message}}</p>', 'Hi {{fullname}} ({{username}}), \r\n{{message}}', 'Minstack', '4430b5', '060662', '{\"name\":\"smtp\",\"host\":\"mail.debana.x10.mx\",\"port\":\"587\",\"enc\":\"tls\",\"username\":\"abdo@debana.x10.mx\",\"password\":\"Ab3@1234\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":null,\"password\":null},\"message_bird\":{\"api_key\":null},\"nexmo\":{\"api_key\":\"85c23125\",\"api_secret\":\"Qjd2wvzDFhPMNuAG\"},\"sms_broadcast\":{\"username\":null,\"password\":null},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":null,\"apiv2_key\":null},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 'default', 1, 1, 20, 1, '[]', NULL, '2025-08-15 17:36:28', 'apify_api_nxCJCbtOMUCoFKopmamxA1HQXonguB25NEj3', 1, 0.00, NULL, 0.50, 0.70, 4.00000000, 66.00000000);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 1, '2020-07-06 03:47:55', '2025-07-28 10:46:29'),
(14, 'Spanish', 'es', NULL, 0, 0, '2023-02-15 11:06:57', '2023-02-15 11:06:57'),
(16, 'عربي', 'ar', NULL, 0, 0, '2025-07-28 09:15:36', '2025-07-28 10:46:29');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `min_points_spent` bigint(20) UNSIGNED NOT NULL,
  `priority` tinyint(3) UNSIGNED NOT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `min_points_spent`, `priority`, `badge`, `is_active`, `created_at`, `updated_at`) VALUES
(3, '700', 777, 10, NULL, 1, '2025-08-15 13:44:41', '2025-08-15 16:27:51'),
(9, '44', 900, 1, NULL, 1, '2025-08-15 16:28:29', '2025-08-15 16:28:29'),
(10, '500', 500, 1, NULL, 1, '2025-08-15 16:29:06', '2025-08-15 16:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `level_benefits`
--

CREATE TABLE `level_benefits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` decimal(12,4) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `level_benefits`
--

INSERT INTO `level_benefits` (`id`, `level_id`, `type`, `value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 3, 'bonus_points_percent', 4.0000, 0, '2025-08-15 15:09:58', '2025-08-15 15:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) DEFAULT NULL,
  `sent_from` varchar(40) DEFAULT NULL,
  `sent_to` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_logs`
--

INSERT INTO `notification_logs` (`id`, `user_id`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `created_at`, `updated_at`) VALUES
(1, 0, 'smtp', 'no-reply@baronmeddy.com', 'abdocenter1000@gmail.com', 'SMTP Configuration Success', '<p>Hi abdocenter1000 (abdocenter1000@gmail.com),&nbsp;</p><p>Your email notification setting is configured successfully for جهاد الدبانة</p>', 'email', '2025-07-03 21:06:02', '2025-07-03 21:06:02'),
(2, 0, 'smtp', 'no-reply@baronmeddy.com', 'abdocenter1000@gmail.com', 'SMTP Configuration Success', '<p>Hi abdocenter1000 (abdocenter1000@gmail.com),&nbsp;</p><p>Your email notification setting is configured successfully for جهاد الدبانة</p>', 'email', '2025-07-03 21:07:06', '2025-07-03 21:07:06'),
(3, 2, 'smtp', 'no-reply@baronmeddy.com', 'abdocenter1000@gmail.com', 'Your Account has been Credited', '<p>Hi abdo ali (123123),&nbsp;</p><p><div><div style=\"font-family: Montserrat, sans-serif;\">12.00 USD has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : 6VGSZ1RWGUAR</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">12.00&nbsp; USD&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">12</span></div></p>', 'email', '2025-07-03 21:08:39', '2025-07-03 21:08:39'),
(4, 2, 'smtp', 'no-reply@baronmeddy.com', 'abdocenter1000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo ali (123123),&nbsp;</p><p><p>You\'ve subscribed to <strong>10</strong> plan. The price <strong>10.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 2.00 {{currency}}</strong></p></p>', 'email', '2025-07-03 21:32:42', '2025-07-03 21:32:42'),
(5, 2, 'smtp', 'no-reply@baronmeddy.com', 'abdocenter1000@gmail.com', 'Your Account has been Debited', '<p>Hi abdo ali (123123),&nbsp;</p><p><div style=\"font-family: Montserrat, sans-serif;\">2.00 USD has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : BBXAR5NO9AXF</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">0.00&nbsp; USD</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: 2</div></p>', 'email', '2025-07-03 21:43:51', '2025-07-03 21:43:51'),
(6, 0, 'smtp', 'no-reply@baronmeddy.com', 'abdocenter1000@gmail.com', 'SMTP Configuration Success', '<p>Hi abdocenter1000 (abdocenter1000@gmail.com),&nbsp;</p><p>Your email notification setting is configured successfully for جهاد الدبانة</p>', 'email', '2025-08-07 05:31:33', '2025-08-07 05:31:33'),
(7, 0, 'smtp', 'no-reply@baronmeddy.com', 'abdocenter1000@gmail.com', 'SMTP Configuration Success', '<p>Hi abdocenter1000 (abdocenter1000@gmail.com),&nbsp;</p><p>Your email notification setting is configured successfully for جهاد الدبانة</p>', 'email', '2025-08-07 05:32:54', '2025-08-07 05:32:54'),
(8, 0, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'SMTP Configuration Success', '<p>Hi abdocenter1000 (abdocenter1000@gmail.com),&nbsp;</p><p>Your email notification setting is configured successfully for جهاد الدبانة</p>', 'email', '2025-08-07 05:35:45', '2025-08-07 05:35:45'),
(9, 0, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'SMTP Configuration Success', '<p>Hi abdocenter1000 (abdocenter1000@gmail.com),&nbsp;</p><p>Your email notification setting is configured successfully for جهاد الدبانة</p>', 'email', '2025-08-07 05:37:09', '2025-08-07 05:37:09'),
(10, 9, 'smtp', 'abdo@debana.x10.mx', 'abdocentrer1000@gmail.com', 'Please verify your email address', '<p>Hi 123123 123 (abdo123),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;959972</span></font></div></div></p>', 'email', '2025-08-07 05:39:07', '2025-08-07 05:39:07'),
(11, 9, 'smtp', 'abdo@debana.x10.mx', 'abdocentrer1000@gmail.com', 'Please verify your email address', '<p>Hi 123123 123 (abdo123),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;885053</span></font></div></div></p>', 'email', '2025-08-07 05:41:27', '2025-08-07 05:41:27'),
(12, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'Please verify your email address', '<p>Hi abdo ali (123123),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;523564</span></font></div></div></p>', 'email', '2025-08-07 05:42:15', '2025-08-07 05:42:15'),
(13, 9, 'smtp', 'abdo@debana.x10.mx', 'abdocentrer1000@gmail.com', 'Please verify your email address', '<p>Hi 123123 123 (abdo123),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;875575</span></font></div></div></p>', 'email', '2025-08-07 06:02:50', '2025-08-07 06:02:50'),
(14, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'Please verify your email address', '<p>Hi abdo ali (123123),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;681722</span></font></div></div></p>', 'email', '2025-08-07 06:03:08', '2025-08-07 06:03:08'),
(15, 10, 'smtp', 'abdo@debana.x10.mx', 'abdocenter10000@gmail.com', 'Please verify your email address', '<p>Hi @1232323 (1232323),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;543460</span></font></div></div></p>', 'email', '2025-08-07 06:08:58', '2025-08-07 06:08:58'),
(16, 10, 'smtp', 'abdo@debana.x10.mx', 'abdocenter10000@gmail.com', 'Your Account has been Credited', '<p>Hi abdo 123123 (1232323),&nbsp;</p><p><div><div style=\"font-family: Montserrat, sans-serif;\">12.00 USD has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : 5E56BWAB43PA</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">12.00&nbsp; USD&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">1212</span></div></p>', 'email', '2025-08-07 06:10:42', '2025-08-07 06:10:42'),
(17, 9, 'smtp', 'abdo@debana.x10.mx', 'abdocentrer1000@gmail.com', 'Please verify your email address', '<p>Hi 123123 123 (abdo123),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;887147</span></font></div></div></p>', 'email', '2025-08-11 07:41:39', '2025-08-11 07:41:39'),
(18, 10, 'smtp', 'abdo@debana.x10.mx', 'abdocenter10000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo 123123 (1232323),&nbsp;</p><p><p>You\'ve subscribed to <strong>0</strong> plan. The price <strong>1.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 131.50 {{currency}}</strong></p></p>', 'email', '2025-08-15 16:39:27', '2025-08-15 16:39:27'),
(19, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo ali (123123),&nbsp;</p><p><p>You\'ve subscribed to <strong>0</strong> plan. The price <strong>1.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 369.00 {{currency}}</strong></p></p>', 'email', '2025-08-15 16:41:05', '2025-08-15 16:41:05'),
(20, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo ali (123123),&nbsp;</p><p><p>You\'ve subscribed to <strong>0</strong> plan. The price <strong>1.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 368.00 {{currency}}</strong></p></p>', 'email', '2025-08-15 16:55:56', '2025-08-15 16:55:56'),
(21, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo ali (123123),&nbsp;</p><p><p>You\'ve subscribed to <strong>0</strong> plan. The price <strong>1.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 367.00 {{currency}}</strong></p></p>', 'email', '2025-08-15 17:05:44', '2025-08-15 17:05:44'),
(22, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo ali (123123),&nbsp;</p><p><p>You\'ve subscribed to <strong>0</strong> plan. The price <strong>1.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 366.00 {{currency}}</strong></p></p>', 'email', '2025-08-15 17:06:05', '2025-08-15 17:06:05'),
(23, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo ali (123123),&nbsp;</p><p><p>You\'ve subscribed to <strong>0</strong> plan. The price <strong>1.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 365.00 {{currency}}</strong></p></p>', 'email', '2025-08-15 17:08:37', '2025-08-15 17:08:37'),
(24, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo ali (123123),&nbsp;</p><p><p>You\'ve subscribed to <strong>0</strong> plan. The price <strong>1.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 364.00 {{currency}}</strong></p></p>', 'email', '2025-08-15 17:11:47', '2025-08-15 17:11:47'),
(25, 2, 'smtp', 'abdo@debana.x10.mx', 'abdocenter1000@gmail.com', 'You\'ve subscribed successfully', '<p>Hi abdo ali (123123),&nbsp;</p><p><p>You\'ve subscribed to <strong>0</strong> plan. The price <strong>1.00 {{currency}}</strong>. The transaction number is #<strong></strong>. Your current is<strong> 363.00 {{currency}}</strong></p></p>', 'email', '2025-08-15 17:14:55', '2025-08-15 17:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-09-21 13:04:13'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(18, 'PLAN SUBSCRIBE', 'Subscribed Plan', 'You\'ve subscribed successfully', '<p>You\'ve subscribed to <strong>{{plan_name}}</strong> plan. The price <strong>{{amount}} {{currency}}</strong>. The transaction number is #<strong>{{trx}}</strong>. Your current is<strong> {{post_balance}} {{currency}}</strong></p>', 'You\'ve subscribed to {{plan_name}} plan. The price {{amount}} {{currency}}. The transaction number is #{{trx}}. Your current is {{post_balance}} {{currency}}', '{\"amount\":\"Price of the plan\",\"plan_name\":\"Name of plan\",\"trx\":\"Transaction number\",\"post_balance\":\"Balance after transactions\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(19, 'REFERRAL_COMMISSION', 'Referral Commission', 'Referral commission got successfully', '<p>You have got <strong>{{amount}} {{currency}} </strong>referral commission as<strong> {{level}}</strong>. Your current balance is <strong>{{post_balance}} {{currency}} </strong>and the transaction number is <strong>{{trx}}</strong></p>', '<p>You have got <strong>{{amount}} {{currency}} </strong>referral commission as<strong> {{level}}</strong>. Your current balance is <strong>{{post_balance}} {{currency}} </strong>and the transaction number is <strong>{{trx}}</strong></p>', '{\"amount\":\"Amount of commission\",\"post_balance\":\"Balance after commission\",\"trx\":\"Transaction number\",\"level\":\"Level of referral\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(20, 'REFFERAL_LINK', 'Reffer User', 'Refferel Link', '<p><strong>{{username}} </strong>reffered you.</p><p><strong>Please click below to sign up&nbsp; {{link}} .&nbsp;</strong><br>&nbsp;</p>', '<div><b>{{username}} </b>reffered you.</div><div><b>Please click below to sign up&nbsp; {{link}} . <a href=\"{{link}}\"></a><br></b></div><div><br></div>', '{\"link\":\"Refferal Link\",\"username\":\"Username\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `slug` varchar(40) DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 'presets.default.', '[\"about\",\"support\",\"plan\",\"faq\",\"reffer\",\"testimonial\",\"blog\"]', 1, '2020-07-11 06:23:58', '2024-04-29 05:26:10'),
(4, 'About', 'about', 'presets.default.', '[\"about\",\"faq\"]', 0, '2020-10-22 01:14:43', '2024-05-04 10:36:10'),
(5, 'Buy Credits', 'plan', 'presets.default.', NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(19, 'Blog', 'blog', 'presets.default.', NULL, 1, '2024-04-29 04:50:07', '2024-04-29 04:50:07'),
(20, 'Contact', 'contact', 'presets.default.', NULL, 1, '2024-04-29 04:50:07', '2024-04-29 04:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(28,8) NOT NULL,
  `credits` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `price`, `credits`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, '10', 10.00000000, 12, '[null]', 1, '2025-07-03 21:32:27', '2025-07-03 21:32:27'),
(2, '12', 12.00000000, 12, '[\"12\"]', 1, '2025-07-16 04:38:18', '2025-07-16 04:38:18'),
(3, '1222', 1.00000000, 111111, '[null]', 1, '2025-07-17 03:04:24', '2025-07-17 03:04:24'),
(4, '0', 1.00000000, 999, '[null]', 1, '2025-07-31 17:50:56', '2025-07-31 17:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `proofs`
--

CREATE TABLE `proofs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `screenshort` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proofs`
--

INSERT INTO `proofs` (`id`, `user_id`, `service_id`, `screenshort`, `created_at`, `updated_at`) VALUES
(1, 5, 4, '68670f7cb2ab21751584636.jpg', '2025-07-04 06:17:16', '2025-07-04 06:17:16'),
(2, 5, 8, '68671486011551751585926.jpg', '2025-07-04 06:38:46', '2025-07-04 06:38:46'),
(3, 5, 9, '686714e11383e1751586017.jpg', '2025-07-04 06:40:17', '2025-07-04 06:40:17'),
(4, 5, 12, '6867389c594f91751595164.jpg', '2025-07-04 09:12:44', '2025-07-04 09:12:44'),
(5, 5, 19, '68674f4474eb61751600964.jpg', '2025-07-04 10:49:24', '2025-07-04 10:49:24'),
(6, 5, 14, '6867558a5671f1751602570.jpg', '2025-07-04 11:16:10', '2025-07-04 11:16:10'),
(7, 5, 11, '68675e0d49fe61751604749.png', '2025-07-04 11:52:29', '2025-07-04 11:52:29'),
(8, 5, 3, '68676870c06921751607408.png', '2025-07-04 12:36:48', '2025-07-04 12:36:48');

-- --------------------------------------------------------

--
-- Table structure for table `refferals`
--

CREATE TABLE `refferals` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `percent` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `report` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `platform` enum('facebook','instagram','tiktok') DEFAULT NULL,
  `link_description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `allocated_credits` int(11) NOT NULL DEFAULT 0,
  `spent_credits` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `credit_value` int(11) NOT NULL DEFAULT 1,
  `credit_per_click` int(11) DEFAULT 1,
  `metric` varchar(255) NOT NULL DEFAULT 'followers'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `category_id`, `name`, `link`, `platform`, `link_description`, `status`, `allocated_credits`, `spent_credits`, `created_at`, `updated_at`, `credit_value`, `credit_per_click`, `metric`) VALUES
(22, 7, 3, 'tiktok', 'https://www.tiktok.com/@wxf45', 'tiktok', '', 1, 1, 1, '2025-07-31 07:43:27', '2025-08-02 01:00:59', 1, 1, 'followers'),
(23, 7, 3, 'tik', 'https://www.tiktok.com/@wxf45', 'tiktok', '', 1, 1, 0, '2025-07-31 09:17:23', '2025-08-01 05:34:42', 1, 1, 'followers'),
(24, 7, 1, 'fb', 'https://www.facebook.com/AbdoCenter1', 'facebook', '', 1, 1, 1, '2025-07-31 10:15:40', '2025-07-31 10:17:13', 1, 1, 'followers'),
(25, 7, 1, 'fb', 'https://www.facebook.com/AbdoCenter1', 'facebook', '', 1, 1, 1, '2025-07-31 10:52:21', '2025-07-31 11:04:44', 1, 1, 'followers'),
(26, 7, 1, 'fb2', 'https://www.facebook.com/AbdoCenter1', 'facebook', '', 1, 1, 1, '2025-07-31 10:52:43', '2025-07-31 16:58:26', 1, 1, 'followers'),
(32, 7, 1, 'fbb', 'https://www.facebook.com/AbdoCenter1', 'facebook', '', 1, 4, 1, '2025-07-31 13:12:38', '2025-07-31 16:13:43', 1, 1, 'followers'),
(33, 7, 1, 'fbbbb', 'https://www.facebook.com/AbdoCenter1', 'facebook', '', 1, 3, 1, '2025-07-31 13:13:03', '2025-08-02 00:52:13', 1, 1, 'followers'),
(34, 7, 3, 'toktok', 'https://www.tiktok.com/@wxf455', 'tiktok', '', 1, 5, 1, '2025-07-31 13:56:53', '2025-08-02 00:51:49', 1, 1, 'followers'),
(35, 7, 2, 'iu', 'https://www.instagram.com/abdocenter', 'instagram', '', 1, 1, 2, '2025-07-31 17:22:11', '2025-08-06 16:38:48', 1, 1, 'followers'),
(36, 2, 1, 'fb', 'https://www.facebook.com/AbdoCenter1', 'facebook', '', 1, 9, 0, '2025-07-31 17:26:18', '2025-07-31 17:26:18', 1, 1, 'followers'),
(37, 2, 1, 'in', 'https://www.instagram.com/abdocenter/', 'instagram', '', 1, 8, 1, '2025-07-31 17:26:29', '2025-07-31 23:36:10', 1, 1, 'followers'),
(38, 2, 1, 'tik', 'https://www.tiktok.com/@wxf45', 'tiktok', '', 1, 6, 0, '2025-07-31 17:26:56', '2025-08-02 00:59:46', 1, 1, 'followers'),
(39, 8, 1, 'For likes', 'https://www.facebook.com/ahmed.abozed.2025', 'facebook', '<p>https://www.facebook.com/share/p/1BLoQEbwxf/</p>', 1, 1, 0, '2025-07-31 23:34:51', '2025-08-02 03:53:55', 1, 1, 'followers'),
(40, 2, 1, 'inst', 'https://www.instagram.com/malak_said97', 'instagram', '', 1, 3, 1, '2025-08-01 03:04:04', '2025-08-01 22:49:05', 1, 1, 'followers'),
(41, 2, 3, 'متابعين تيك توك', 'https://www.tiktok.com/@wxf45', 'tiktok', '', 1, 5, 0, '2025-08-01 22:51:36', '2025-08-02 00:59:19', 1, 1, 'followers'),
(42, 2, 2, 'متابعين انستقرام', 'https://www.instagram.com/abdocenter/', 'instagram', '', 1, 2, 1, '2025-08-01 22:56:27', '2025-08-02 03:46:11', 1, 1, 'followers'),
(43, 2, 2, 'انستقرام', 'https://www.instagram.com/abdocenter.tn', 'instagram', '', 1, 66, 2, '2025-08-01 22:58:33', '2025-08-08 00:16:14', 1, 1, 'followers'),
(44, 8, 1, '2', 'https://www.facebook.com/AbdoCenter1', 'facebook', '', 1, 15, 3, '2025-08-05 22:42:56', '2025-08-06 04:34:28', 1, 1, 'followers'),
(45, 7, 3, '5', 'https://www.tiktok.com/@wxf45', 'tiktok', '', 1, 5, 0, '2025-08-06 16:56:54', '2025-08-06 16:56:54', 1, 1, 'followers'),
(46, 7, 3, '5', 'https://www.tiktok.com/@wxf45', 'tiktok', '', 1, 5, 0, '2025-08-06 16:56:54', '2025-08-06 16:56:54', 1, 1, 'followers'),
(47, 10, 2, '12', 'https://www.instagram.com/abdocenter', 'instagram', '', 0, 12, 0, '2025-08-07 06:11:31', '2025-08-13 07:36:45', 1, 1, 'followers'),
(48, 3, 4, 'تعليقات فيسبوك', 'https://www.facebook.com/AbdoCenter1/posts/pfbid02jMCTnQ4esuTb7eJnjU6fqb3FDN1ok1ENab8QugwpHQkBQeM4jXJsMLFNTAVApJLyl?rdid=9kM9B4V5J6APOfxi#', 'facebook', '', 0, 13, 0, '2025-08-07 22:35:37', '2025-08-13 07:24:26', 1, 1, 'followers'),
(49, 2, 4, 'لايك منشور فيسبوك', 'https://www.facebook.com/AbdoCenter1/posts/pfbid029kTF1zaD3u5DhrCHirrruXcCgVnHeJawmPqC8pj5D1zrtcWpaVWikYx6hZLwdXiSl?comment_id=1420403799243500', 'facebook', '', 1, 127, 0, '2025-08-08 13:02:46', '2025-08-08 13:02:46', 1, 1, 'followers'),
(50, 2, 2, 'insta', 'https://www.instagram.com/abdocenter/', 'instagram', '', 1, 9, 0, '2025-08-08 13:06:22', '2025-08-08 13:06:22', 1, 1, 'followers');

-- --------------------------------------------------------

--
-- Table structure for table `service_views`
--

CREATE TABLE `service_views` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `view_date` varchar(255) DEFAULT NULL,
  `credits` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_views`
--

INSERT INTO `service_views` (`id`, `service_id`, `user_id`, `view_date`, `credits`, `created_at`, `updated_at`) VALUES
(1, 3, 7, '2025-07-17', 99, '2025-07-17 12:32:31', '2025-07-17 12:32:31'),
(2, 5, 7, '2025-07-17', 99, '2025-07-17 12:33:38', '2025-07-17 12:33:38'),
(3, 6, 2, '2025-07-17', 5, '2025-07-17 12:35:30', '2025-07-17 12:35:30'),
(4, 6, 5, '2025-07-17', 4, '2025-07-17 12:36:13', '2025-07-17 12:36:13'),
(5, 3, 4, '2025-07-17', 98, '2025-07-17 13:17:17', '2025-07-17 13:17:17'),
(6, 5, 4, '2025-07-17', 98, '2025-07-17 13:17:42', '2025-07-17 13:17:42'),
(7, 6, 4, '2025-07-17', 5, '2025-07-17 13:18:05', '2025-07-17 13:18:05'),
(8, 9, 7, '2025-07-17', 12, '2025-07-17 13:37:11', '2025-07-17 13:37:11'),
(9, 11, 4, '2025-07-17', 55, '2025-07-17 13:49:08', '2025-07-17 13:49:08'),
(10, 5, 1, '2025-07-28', 97, '2025-07-28 04:34:27', '2025-07-28 04:34:27'),
(11, 9, 1, '2025-07-28', 11, '2025-07-28 04:36:23', '2025-07-28 04:36:23'),
(12, 13, 2, '2025-07-28', 18, '2025-07-28 04:38:30', '2025-07-28 04:38:30'),
(13, 13, 6, '2025-07-28', 17, '2025-07-28 04:39:30', '2025-07-28 04:39:30'),
(14, 6, 3, '2025-07-28', 4, '2025-07-28 04:41:45', '2025-07-28 04:41:45'),
(15, 10, 3, '2025-07-28', 1, '2025-07-28 05:10:10', '2025-07-28 05:10:10'),
(16, 8, 3, '2025-07-28', 1, '2025-07-28 05:11:35', '2025-07-28 05:11:35'),
(17, 7, 3, '2025-07-28', 1, '2025-07-28 06:35:46', '2025-07-28 06:35:46'),
(18, 15, 3, '2025-07-28', 1, '2025-07-28 07:29:44', '2025-07-28 07:29:44'),
(19, 16, 3, '2025-07-28', 1, '2025-07-28 07:33:42', '2025-07-28 07:33:42'),
(20, 17, 3, '2025-07-28', 1, '2025-07-28 07:44:41', '2025-07-28 07:44:41'),
(21, 18, 3, '2025-07-28', 1, '2025-07-28 07:45:50', '2025-07-28 07:45:50'),
(22, 5, 3, '2025-07-28', 1, '2025-07-28 07:49:52', '2025-07-28 07:49:52'),
(23, 13, 3, '2025-07-28', 1, '2025-07-28 07:51:15', '2025-07-28 07:51:15'),
(24, 9, 3, '2025-07-28', 1, '2025-07-28 07:51:50', '2025-07-28 07:51:50'),
(25, 3, 3, '2025-07-28', 1, '2025-07-28 08:05:59', '2025-07-28 08:05:59'),
(26, 14, 2, '2025-07-28', 1, '2025-07-28 08:39:44', '2025-07-28 08:39:44'),
(27, 19, 3, '2025-07-28', 1, '2025-07-28 08:40:10', '2025-07-28 08:40:10'),
(28, 20, 2, '2025-07-29', 1, '2025-07-29 09:50:57', '2025-07-29 09:50:57'),
(29, 7, 2, '2025-07-29', 1, '2025-07-29 09:52:00', '2025-07-29 09:52:00'),
(30, 10, 2, '2025-07-29', 1, '2025-07-29 09:53:03', '2025-07-29 09:53:03'),
(31, 5, 6, '2025-07-29', 1, '2025-07-29 09:56:03', '2025-07-29 09:56:03'),
(32, 21, 2, '2025-07-29', 1, '2025-07-29 09:57:27', '2025-07-29 09:57:27'),
(33, 1, 2, '2025-07-29', 1, '2025-07-29 09:57:58', '2025-07-29 09:57:58'),
(34, 13, 7, '2025-07-31', 1, '2025-07-31 06:31:42', '2025-07-31 06:31:42'),
(35, 16, 7, '2025-07-31', 1, '2025-07-31 06:47:56', '2025-07-31 06:47:56'),
(36, 22, 2, '2025-07-31', 1, '2025-07-31 09:52:56', '2025-07-31 09:52:56'),
(37, 24, 2, '2025-07-31', 1, '2025-07-31 10:17:13', '2025-07-31 10:17:13'),
(38, 25, 2, '2025-07-31', 1, '2025-07-31 11:04:44', '2025-07-31 11:04:44'),
(39, 15, 7, '2025-07-31', 1, '2025-07-31 11:40:58', '2025-07-31 11:40:58'),
(40, 9, 2, '2025-07-31', 1, '2025-07-31 12:02:54', '2025-07-31 12:02:54'),
(41, 32, 2, '2025-07-31', 1, '2025-07-31 16:13:43', '2025-07-31 16:13:43'),
(42, 26, 2, '2025-07-31', 1, '2025-07-31 16:58:26', '2025-07-31 16:58:26'),
(43, 34, 2, '2025-07-31', 1, '2025-07-31 16:59:41', '2025-07-31 16:59:41'),
(44, 35, 8, '2025-07-31', 1, '2025-07-31 23:27:09', '2025-07-31 23:27:09'),
(45, 37, 8, '2025-07-31', 1, '2025-07-31 23:36:10', '2025-07-31 23:36:10'),
(46, 40, 8, '2025-07-31', 1, '2025-08-01 03:07:13', '2025-08-01 03:07:13'),
(47, 35, 2, '2025-08-01', 1, '2025-08-01 22:32:32', '2025-08-01 22:32:32'),
(48, 33, 2, '2025-08-01', 1, '2025-08-01 22:47:22', '2025-08-01 22:47:22'),
(49, 43, 1, '2025-08-01', 1, '2025-08-01 23:01:22', '2025-08-01 23:01:22'),
(50, 42, 8, '2025-08-01', 1, '2025-08-02 03:46:11', '2025-08-02 03:46:11'),
(51, 44, 2, '2025-08-06', 1, '2025-08-06 04:28:05', '2025-08-06 04:28:05'),
(52, 44, 7, '2025-08-06', 1, '2025-08-06 04:30:56', '2025-08-06 04:30:56'),
(53, 44, 6, '2025-08-06', 1, '2025-08-06 04:34:28', '2025-08-06 04:34:28'),
(54, 43, 3, '2025-08-07', 1, '2025-08-08 00:16:14', '2025-08-08 00:16:14');

-- --------------------------------------------------------

--
-- Table structure for table `social_checks`
--

CREATE TABLE `social_checks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `followers_before` bigint(20) UNSIGNED NOT NULL,
  `followers_after` bigint(20) UNSIGNED DEFAULT NULL,
  `difference` bigint(20) DEFAULT NULL,
  `status` enum('pending','confirmed','failed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `social_checks`
--

INSERT INTO `social_checks` (`id`, `service_id`, `user_id`, `followers_before`, `followers_after`, `difference`, `status`, `created_at`, `updated_at`) VALUES
(1, 19, 7, 0, 0, NULL, 'pending', '2025-07-31 06:02:31', '2025-07-31 06:13:00'),
(2, 15, 7, 0, NULL, NULL, 'failed', '2025-07-31 07:24:52', '2025-07-31 07:28:37'),
(3, 15, 7, 0, NULL, NULL, 'pending', '2025-07-31 07:28:38', '2025-07-31 07:28:38'),
(4, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 07:44:38', '2025-07-31 07:51:49'),
(5, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 07:51:53', '2025-07-31 07:54:05'),
(6, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 07:54:11', '2025-07-31 07:58:53'),
(7, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 07:58:57', '2025-07-31 08:46:17'),
(8, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 08:46:23', '2025-07-31 08:53:53'),
(9, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 08:53:58', '2025-07-31 08:56:00'),
(10, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 08:56:06', '2025-07-31 08:56:29'),
(11, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 08:56:33', '2025-07-31 09:08:54'),
(12, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:08:55', '2025-07-31 09:09:09'),
(13, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:09:10', '2025-07-31 09:09:49'),
(14, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:09:50', '2025-07-31 09:11:41'),
(15, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:11:42', '2025-07-31 09:12:29'),
(16, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:12:33', '2025-07-31 09:24:32'),
(17, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:17:40', '2025-07-31 09:17:48'),
(18, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:17:49', '2025-07-31 09:23:26'),
(19, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:23:27', '2025-07-31 09:42:16'),
(20, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:24:33', '2025-07-31 09:26:33'),
(21, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:26:34', '2025-07-31 09:30:13'),
(22, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:30:14', '2025-07-31 09:39:43'),
(23, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:39:44', '2025-07-31 09:40:29'),
(24, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:40:33', '2025-07-31 09:47:15'),
(25, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:42:17', '2025-07-31 09:42:48'),
(26, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:42:49', '2025-07-31 09:43:31'),
(27, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:43:37', '2025-07-31 09:46:53'),
(28, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:46:54', '2025-07-31 09:59:14'),
(29, 22, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:47:16', '2025-07-31 09:48:07'),
(30, 22, 2, 0, 17287, 17287, 'confirmed', '2025-07-31 09:48:12', '2025-07-31 09:52:56'),
(31, 22, 2, 17287, 17287, 0, 'failed', '2025-07-31 09:53:20', '2025-07-31 09:58:42'),
(32, 22, 2, 0, NULL, NULL, 'pending', '2025-07-31 09:53:26', '2025-07-31 09:53:26'),
(33, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 09:59:24', '2025-07-31 10:02:08'),
(34, 23, 2, 0, NULL, NULL, 'failed', '2025-07-31 10:02:23', '2025-07-31 10:45:22'),
(35, 24, 2, 0, 17287, 17287, 'confirmed', '2025-07-31 10:16:18', '2025-07-31 10:17:13'),
(36, 24, 2, 0, NULL, NULL, 'pending', '2025-07-31 10:17:44', '2025-07-31 10:17:44'),
(37, 23, 2, 0, 0, 0, 'failed', '2025-07-31 10:45:30', '2025-07-31 13:39:08'),
(38, 25, 2, 17287, 17288, 1, 'confirmed', '2025-07-31 10:52:44', '2025-07-31 11:04:44'),
(39, 26, 2, 0, 0, 0, 'failed', '2025-07-31 11:03:59', '2025-07-31 12:38:41'),
(40, 25, 2, 0, NULL, NULL, 'pending', '2025-07-31 11:05:14', '2025-07-31 11:05:14'),
(41, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 12:38:39', '2025-07-31 12:38:39'),
(42, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 12:39:11', '2025-07-31 12:39:11'),
(43, 32, 2, 0, 0, 0, 'failed', '2025-07-31 13:18:47', '2025-07-31 13:19:11'),
(44, 32, 2, 0, 0, 0, 'failed', '2025-07-31 13:21:40', '2025-07-31 13:22:08'),
(45, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 13:38:32', '2025-07-31 13:38:32'),
(46, 23, 2, 0, NULL, NULL, 'pending', '2025-07-31 13:39:01', '2025-07-31 13:39:01'),
(47, 33, 2, 0, 0, 0, 'failed', '2025-07-31 13:42:25', '2025-07-31 13:43:32'),
(48, 33, 2, 0, NULL, NULL, 'pending', '2025-07-31 13:43:04', '2025-07-31 13:43:04'),
(49, 33, 2, 0, NULL, NULL, 'pending', '2025-07-31 13:47:01', '2025-07-31 13:47:01'),
(50, 33, 2, 0, 0, 0, 'failed', '2025-07-31 13:49:59', '2025-07-31 13:50:57'),
(51, 33, 2, 17288, 17288, 0, 'failed', '2025-07-31 13:54:36', '2025-07-31 13:55:15'),
(52, 23, 2, 0, NULL, NULL, 'pending', '2025-07-31 13:55:46', '2025-07-31 13:55:46'),
(53, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 13:57:18', '2025-07-31 13:57:18'),
(54, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:04:51', '2025-07-31 14:04:51'),
(55, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:10:34', '2025-07-31 14:10:34'),
(56, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:13:08', '2025-07-31 14:13:08'),
(57, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:13:55', '2025-07-31 14:13:55'),
(58, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:17:54', '2025-07-31 14:17:54'),
(59, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:21:33', '2025-07-31 14:21:33'),
(60, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:23:00', '2025-07-31 14:23:00'),
(61, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:23:57', '2025-07-31 14:23:57'),
(62, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:26:22', '2025-07-31 14:26:22'),
(63, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:26:35', '2025-07-31 14:26:35'),
(64, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:29:12', '2025-07-31 14:29:12'),
(65, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:32:33', '2025-07-31 14:32:33'),
(66, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:35:59', '2025-07-31 14:35:59'),
(67, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:37:05', '2025-07-31 14:37:05'),
(68, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:37:21', '2025-07-31 14:37:21'),
(69, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 14:40:21', '2025-07-31 14:40:21'),
(70, 32, 2, 17287, 17287, 0, 'failed', '2025-07-31 15:03:40', '2025-07-31 15:06:34'),
(71, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:07:04', '2025-07-31 15:07:04'),
(72, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:11:49', '2025-07-31 15:11:49'),
(73, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:13:46', '2025-07-31 15:13:46'),
(74, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:15:04', '2025-07-31 15:15:04'),
(75, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:15:21', '2025-07-31 15:15:21'),
(76, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:19:28', '2025-07-31 15:19:28'),
(77, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:25:53', '2025-07-31 15:25:53'),
(78, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:27:52', '2025-07-31 15:27:52'),
(79, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:29:52', '2025-07-31 15:29:52'),
(80, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:36:46', '2025-07-31 15:36:46'),
(81, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:39:10', '2025-07-31 15:39:10'),
(82, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:40:45', '2025-07-31 15:40:45'),
(83, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:42:29', '2025-07-31 15:42:29'),
(84, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:44:31', '2025-07-31 15:44:31'),
(85, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:44:34', '2025-07-31 15:44:34'),
(86, 32, 2, 17287, 1, -17286, 'failed', '2025-07-31 15:46:01', '2025-07-31 15:46:19'),
(87, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:52:33', '2025-07-31 15:52:33'),
(88, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:53:29', '2025-07-31 15:53:29'),
(89, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:54:46', '2025-07-31 15:54:46'),
(90, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 15:57:19', '2025-07-31 15:57:19'),
(91, 32, 2, 17287, NULL, NULL, 'pending', '2025-07-31 16:02:10', '2025-07-31 16:02:10'),
(92, 32, 2, 17287, NULL, NULL, 'pending', '2025-07-31 16:04:41', '2025-07-31 16:04:41'),
(93, 32, 2, 0, 17287, 17287, 'confirmed', '2025-07-31 16:12:20', '2025-07-31 16:13:43'),
(94, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:14:20', '2025-07-31 16:14:20'),
(95, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:15:55', '2025-07-31 16:15:55'),
(96, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:21:43', '2025-07-31 16:21:43'),
(97, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:23:05', '2025-07-31 16:23:05'),
(98, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:25:06', '2025-07-31 16:25:06'),
(99, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:27:48', '2025-07-31 16:27:48'),
(100, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:29:35', '2025-07-31 16:29:35'),
(101, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:31:11', '2025-07-31 16:31:11'),
(102, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:32:00', '2025-07-31 16:32:00'),
(103, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:32:18', '2025-07-31 16:32:18'),
(104, 32, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:32:41', '2025-07-31 16:32:41'),
(105, 32, 2, 17287, NULL, NULL, 'pending', '2025-07-31 16:33:33', '2025-07-31 16:33:33'),
(106, 32, 2, 17287, NULL, NULL, 'pending', '2025-07-31 16:34:35', '2025-07-31 16:34:35'),
(107, 26, 2, 17287, NULL, NULL, 'pending', '2025-07-31 16:35:01', '2025-07-31 16:35:01'),
(108, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:36:29', '2025-07-31 16:36:29'),
(109, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:39:06', '2025-07-31 16:39:06'),
(110, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:40:08', '2025-07-31 16:40:08'),
(111, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:42:24', '2025-07-31 16:42:24'),
(112, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:44:17', '2025-07-31 16:44:17'),
(113, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:44:42', '2025-07-31 16:44:42'),
(114, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:47:21', '2025-07-31 16:47:21'),
(115, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:47:32', '2025-07-31 16:47:32'),
(116, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:48:31', '2025-07-31 16:48:31'),
(117, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:48:52', '2025-07-31 16:48:52'),
(118, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:51:29', '2025-07-31 16:51:29'),
(119, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:51:34', '2025-07-31 16:51:34'),
(120, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:52:07', '2025-07-31 16:52:07'),
(121, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:53:49', '2025-07-31 16:53:49'),
(122, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:53:58', '2025-07-31 16:53:58'),
(123, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:55:18', '2025-07-31 16:55:18'),
(124, 26, 2, 0, 17287, 17287, 'confirmed', '2025-07-31 16:55:56', '2025-07-31 16:58:26'),
(125, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:57:16', '2025-07-31 16:57:16'),
(126, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:58:44', '2025-07-31 16:58:44'),
(127, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 16:59:02', '2025-07-31 16:59:02'),
(128, 34, 2, 0, 426, 426, 'confirmed', '2025-07-31 16:59:27', '2025-07-31 16:59:41'),
(129, 26, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:00:12', '2025-07-31 17:00:12'),
(130, 33, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:01:01', '2025-07-31 17:01:01'),
(131, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:06:25', '2025-07-31 17:06:25'),
(132, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:06:44', '2025-07-31 17:06:44'),
(133, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:07:13', '2025-07-31 17:07:13'),
(134, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:09:20', '2025-07-31 17:09:20'),
(135, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:09:45', '2025-07-31 17:09:45'),
(136, 33, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:10:59', '2025-07-31 17:10:59'),
(137, 34, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:11:37', '2025-07-31 17:11:37'),
(138, 33, 2, 0, NULL, NULL, 'pending', '2025-07-31 17:11:44', '2025-07-31 17:11:44'),
(139, 34, 2, 426, NULL, NULL, 'pending', '2025-07-31 17:23:56', '2025-07-31 17:23:56'),
(140, 33, 2, 17287, 17287, 0, 'failed', '2025-07-31 17:24:07', '2025-07-31 17:24:55'),
(141, 35, 2, 70868, 70868, 0, 'failed', '2025-07-31 17:24:09', '2025-07-31 17:24:38'),
(142, 34, 2, 426, NULL, NULL, 'pending', '2025-07-31 17:24:57', '2025-07-31 17:24:57'),
(143, 38, 7, 1393, 1393, 0, 'failed', '2025-07-31 17:27:20', '2025-07-31 17:27:39'),
(144, 37, 7, 70868, 70868, 0, 'failed', '2025-07-31 17:27:26', '2025-07-31 17:27:41'),
(145, 36, 7, 17287, 17287, 0, 'failed', '2025-07-31 17:27:32', '2025-07-31 17:27:56'),
(146, 23, 2, 112900, 112900, 0, 'failed', '2025-07-31 17:46:16', '2025-07-31 17:46:46'),
(147, 35, 2, 70868, 70868, 0, 'failed', '2025-07-31 17:46:18', '2025-07-31 17:46:52'),
(148, 33, 2, 17287, 17287, 0, 'failed', '2025-07-31 17:46:22', '2025-07-31 17:47:11'),
(149, 24, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:22:05', '2025-07-31 23:22:05'),
(150, 24, 8, 17278, 17278, 0, 'failed', '2025-07-31 23:22:06', '2025-07-31 23:22:54'),
(151, 24, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:22:42', '2025-07-31 23:22:42'),
(152, 24, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:22:52', '2025-07-31 23:22:52'),
(153, 26, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:24:32', '2025-07-31 23:24:32'),
(154, 35, 8, 70868, 70867, -1, 'failed', '2025-07-31 23:24:35', '2025-07-31 23:24:45'),
(155, 24, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:24:54', '2025-07-31 23:24:54'),
(156, 35, 8, 70867, NULL, NULL, 'pending', '2025-07-31 23:25:12', '2025-07-31 23:25:12'),
(157, 35, 8, 70868, 70868, 0, 'failed', '2025-07-31 23:25:15', '2025-07-31 23:25:33'),
(158, 22, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:25:25', '2025-07-31 23:25:25'),
(159, 35, 8, 70868, 70868, 0, 'failed', '2025-07-31 23:25:25', '2025-07-31 23:26:13'),
(160, 35, 8, 70868, NULL, NULL, 'pending', '2025-07-31 23:26:06', '2025-07-31 23:26:06'),
(161, 35, 8, 70867, 70868, 1, 'confirmed', '2025-07-31 23:26:48', '2025-07-31 23:27:09'),
(162, 35, 8, 70868, NULL, NULL, 'pending', '2025-07-31 23:27:02', '2025-07-31 23:27:02'),
(163, 37, 8, 70867, NULL, NULL, 'pending', '2025-07-31 23:35:36', '2025-07-31 23:35:36'),
(164, 37, 8, 70867, 70868, 1, 'confirmed', '2025-07-31 23:35:52', '2025-07-31 23:36:10'),
(165, 26, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:37:49', '2025-07-31 23:37:49'),
(166, 24, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:38:00', '2025-07-31 23:38:00'),
(167, 32, 8, 17278, NULL, NULL, 'pending', '2025-07-31 23:38:01', '2025-07-31 23:38:01'),
(168, 40, 8, 954, 954, 0, 'failed', '2025-08-01 03:06:07', '2025-08-01 03:06:28'),
(169, 40, 8, 954, 955, 1, 'confirmed', '2025-08-01 03:06:53', '2025-08-01 03:07:13'),
(170, 39, 7, 0, NULL, NULL, 'pending', '2025-08-01 05:45:27', '2025-08-01 05:45:27'),
(171, 35, 2, 70777, NULL, NULL, 'pending', '2025-08-01 22:25:04', '2025-08-01 22:25:04'),
(172, 35, 2, 70776, 70777, 1, 'confirmed', '2025-08-01 22:32:13', '2025-08-01 22:32:32'),
(173, 23, 2, 112900, NULL, NULL, 'pending', '2025-08-01 22:35:13', '2025-08-01 22:35:13'),
(174, 23, 2, 112900, 112900, 0, 'failed', '2025-08-01 22:37:20', '2025-08-01 22:38:22'),
(175, 23, 2, 112900, 112900, 0, 'failed', '2025-08-01 22:39:09', '2025-08-01 22:39:35'),
(176, 23, 2, 112900, 112900, 0, 'failed', '2025-08-01 22:40:08', '2025-08-01 22:40:25'),
(177, 33, 2, 17264, 17263, -1, 'failed', '2025-08-01 22:42:12', '2025-08-01 22:44:14'),
(178, 33, 2, 17263, 17264, 1, 'confirmed', '2025-08-01 22:44:51', '2025-08-01 22:47:22'),
(179, 43, 1, 6322, 6323, 1, 'confirmed', '2025-08-01 23:00:40', '2025-08-01 23:01:22'),
(180, 23, 2, 112900, 112900, 0, 'failed', '2025-08-02 00:39:52', '2025-08-02 00:40:15'),
(181, 23, 2, 112900, 112900, 0, 'failed', '2025-08-02 00:40:34', '2025-08-02 00:41:14'),
(182, 22, 8, 1394, NULL, NULL, 'pending', '2025-08-02 00:55:24', '2025-08-02 00:55:24'),
(183, 22, 8, 1394, NULL, NULL, 'pending', '2025-08-02 01:00:23', '2025-08-02 01:00:23'),
(184, 22, 8, 112900, NULL, NULL, 'pending', '2025-08-02 01:01:17', '2025-08-02 01:01:17'),
(185, 25, 8, 17262, NULL, NULL, 'pending', '2025-08-02 01:02:20', '2025-08-02 01:02:20'),
(186, 42, 8, 70777, NULL, NULL, 'pending', '2025-08-02 03:45:01', '2025-08-02 03:45:01'),
(187, 42, 8, 70777, NULL, NULL, 'pending', '2025-08-02 03:45:26', '2025-08-02 03:45:26'),
(188, 42, 8, 70776, 70777, 1, 'confirmed', '2025-08-02 03:45:46', '2025-08-02 03:46:11'),
(189, 43, 8, 6324, NULL, NULL, 'pending', '2025-08-05 21:52:27', '2025-08-05 21:52:27'),
(190, 43, 8, 6324, 6324, 0, 'failed', '2025-08-05 22:01:19', '2025-08-05 22:01:37'),
(191, 44, 2, 17251, 17252, 1, 'confirmed', '2025-08-06 04:27:39', '2025-08-06 04:28:05'),
(192, 44, 2, 17251, NULL, NULL, 'pending', '2025-08-06 04:29:23', '2025-08-06 04:29:23'),
(193, 44, 7, 17251, 17252, 1, 'confirmed', '2025-08-06 04:30:23', '2025-08-06 04:30:56'),
(194, 44, 6, 17252, 17253, 1, 'confirmed', '2025-08-06 04:32:47', '2025-08-06 04:34:28'),
(195, 39, 7, 0, 0, 0, 'failed', '2025-08-06 16:39:12', '2025-08-06 16:39:31'),
(196, 40, 7, 949, 949, 0, 'failed', '2025-08-06 16:55:33', '2025-08-06 16:55:50'),
(197, 43, 10, 6308, NULL, NULL, 'pending', '2025-08-07 10:28:57', '2025-08-07 10:28:57'),
(198, 43, 10, 6308, NULL, NULL, 'pending', '2025-08-07 10:31:44', '2025-08-07 10:31:44'),
(199, 43, 10, 6308, 6308, 0, 'failed', '2025-08-07 10:32:37', '2025-08-07 10:33:05'),
(200, 43, 10, 6308, NULL, NULL, 'pending', '2025-08-07 10:49:43', '2025-08-07 10:49:43'),
(201, 45, 3, 112900, NULL, NULL, 'pending', '2025-08-07 21:11:41', '2025-08-07 21:11:41'),
(202, 35, 3, 0, NULL, NULL, 'pending', '2025-08-07 23:15:21', '2025-08-07 23:15:21'),
(203, 35, 3, 0, NULL, NULL, 'pending', '2025-08-07 23:15:42', '2025-08-07 23:15:42'),
(204, 42, 3, 0, NULL, NULL, 'pending', '2025-08-07 23:37:48', '2025-08-07 23:37:48'),
(205, 42, 3, 0, NULL, NULL, 'pending', '2025-08-07 23:39:20', '2025-08-07 23:39:20'),
(206, 42, 3, 0, NULL, NULL, 'pending', '2025-08-07 23:39:33', '2025-08-07 23:39:33'),
(207, 42, 3, 0, NULL, NULL, 'pending', '2025-08-07 23:43:02', '2025-08-07 23:43:02'),
(208, 42, 3, 0, NULL, NULL, 'pending', '2025-08-07 23:43:23', '2025-08-07 23:43:23'),
(209, 42, 3, 70598, NULL, NULL, 'pending', '2025-08-08 00:11:40', '2025-08-08 00:11:40'),
(210, 33, 3, 17248, NULL, NULL, 'pending', '2025-08-08 00:12:46', '2025-08-08 00:12:46'),
(211, 23, 3, 112900, NULL, NULL, 'pending', '2025-08-08 00:13:54', '2025-08-08 00:13:54'),
(212, 43, 3, 6305, 6306, 1, 'confirmed', '2025-08-08 00:15:39', '2025-08-08 00:16:14'),
(213, 48, 2, 17248, NULL, NULL, 'pending', '2025-08-08 00:16:47', '2025-08-08 00:16:47'),
(214, 45, 3, 0, NULL, NULL, 'pending', '2025-08-08 00:23:11', '2025-08-08 00:23:11'),
(215, 45, 3, 0, NULL, NULL, 'pending', '2025-08-08 00:24:23', '2025-08-08 00:24:23'),
(216, 45, 3, 112900, NULL, NULL, 'pending', '2025-08-08 00:24:41', '2025-08-08 00:24:41'),
(217, 40, 3, 948, NULL, NULL, 'pending', '2025-08-08 05:09:50', '2025-08-08 05:09:50'),
(218, 40, 3, 948, NULL, NULL, 'pending', '2025-08-08 05:10:04', '2025-08-08 05:10:04'),
(219, 23, 2, 112900, NULL, NULL, 'pending', '2025-08-08 05:11:20', '2025-08-08 05:11:20'),
(220, 41, 3, 0, NULL, NULL, 'pending', '2025-08-08 05:21:35', '2025-08-08 05:21:35'),
(221, 41, 3, 0, NULL, NULL, 'pending', '2025-08-08 05:21:38', '2025-08-08 05:21:38'),
(222, 47, 2, 70591, NULL, NULL, 'pending', '2025-08-08 05:35:14', '2025-08-08 05:35:14'),
(223, 47, 2, 70591, NULL, NULL, 'pending', '2025-08-08 06:00:48', '2025-08-08 06:00:48'),
(224, 47, 2, 70591, NULL, NULL, 'pending', '2025-08-08 06:00:54', '2025-08-08 06:00:54'),
(225, 47, 2, 70591, NULL, NULL, 'pending', '2025-08-08 06:01:12', '2025-08-08 06:01:12'),
(226, 47, 2, 70591, NULL, NULL, 'pending', '2025-08-08 06:01:25', '2025-08-08 06:01:25'),
(227, 41, 3, 112900, NULL, NULL, 'pending', '2025-08-08 06:04:36', '2025-08-08 06:04:36'),
(228, 45, 2, 112900, NULL, NULL, 'pending', '2025-08-08 07:05:29', '2025-08-08 07:05:29'),
(229, 48, 2, 17250, NULL, NULL, 'pending', '2025-08-08 07:18:07', '2025-08-08 07:18:07'),
(230, 45, 2, 0, NULL, NULL, 'pending', '2025-08-08 07:52:21', '2025-08-08 07:52:21'),
(231, 45, 2, 0, NULL, NULL, 'pending', '2025-08-08 07:56:24', '2025-08-08 07:56:24'),
(232, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 07:57:20', '2025-08-08 07:57:20'),
(233, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 07:58:12', '2025-08-08 07:58:12'),
(234, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 07:58:42', '2025-08-08 07:58:42'),
(235, 45, 2, 0, NULL, NULL, 'pending', '2025-08-08 08:02:10', '2025-08-08 08:02:10'),
(236, 45, 2, 0, NULL, NULL, 'pending', '2025-08-08 08:02:19', '2025-08-08 08:02:19'),
(237, 45, 2, 112900, NULL, NULL, 'pending', '2025-08-08 08:07:59', '2025-08-08 08:07:59'),
(238, 45, 2, 112900, NULL, NULL, 'pending', '2025-08-08 08:24:07', '2025-08-08 08:24:07'),
(239, 45, 2, 112900, NULL, NULL, 'pending', '2025-08-08 08:25:08', '2025-08-08 08:25:08'),
(240, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 08:25:25', '2025-08-08 08:25:25'),
(241, 48, 2, 17249, NULL, NULL, 'pending', '2025-08-08 08:25:54', '2025-08-08 08:25:54'),
(242, 35, 3, 70591, NULL, NULL, 'pending', '2025-08-08 08:38:24', '2025-08-08 08:38:24'),
(243, 48, 2, 0, NULL, NULL, 'pending', '2025-08-08 08:57:41', '2025-08-08 08:57:41'),
(244, 48, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:19:09', '2025-08-08 09:19:09'),
(245, 48, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:20:55', '2025-08-08 09:20:55'),
(246, 47, 2, 70591, NULL, NULL, 'pending', '2025-08-08 09:23:24', '2025-08-08 09:23:24'),
(247, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:23:59', '2025-08-08 09:23:59'),
(248, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:25:32', '2025-08-08 09:25:32'),
(249, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:26:54', '2025-08-08 09:26:54'),
(250, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:28:58', '2025-08-08 09:28:58'),
(251, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:34:39', '2025-08-08 09:34:39'),
(252, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:35:31', '2025-08-08 09:35:31'),
(253, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 09:46:52', '2025-08-08 09:46:52'),
(254, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 10:03:47', '2025-08-08 10:03:47'),
(255, 45, 2, 112900, NULL, NULL, 'pending', '2025-08-08 10:07:49', '2025-08-08 10:07:49'),
(256, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 10:12:12', '2025-08-08 10:12:12'),
(257, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 10:12:47', '2025-08-08 10:12:47'),
(258, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 10:53:07', '2025-08-08 10:53:07'),
(259, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 10:57:16', '2025-08-08 10:57:16'),
(260, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:04:17', '2025-08-08 11:04:17'),
(261, 23, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:04:33', '2025-08-08 11:04:33'),
(262, 23, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:06:22', '2025-08-08 11:06:22'),
(263, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:06:30', '2025-08-08 11:06:30'),
(264, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:06:53', '2025-08-08 11:06:53'),
(265, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:06:58', '2025-08-08 11:06:58'),
(266, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:07:02', '2025-08-08 11:07:02'),
(267, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:07:07', '2025-08-08 11:07:07'),
(268, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:07:42', '2025-08-08 11:07:42'),
(269, 46, 2, 112900, NULL, NULL, 'pending', '2025-08-08 11:08:48', '2025-08-08 11:08:48'),
(270, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:09:00', '2025-08-08 11:09:00'),
(271, 46, 2, 112900, NULL, NULL, 'pending', '2025-08-08 11:09:23', '2025-08-08 11:09:23'),
(272, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:09:40', '2025-08-08 11:09:40'),
(273, 46, 2, 112900, NULL, NULL, 'pending', '2025-08-08 11:09:59', '2025-08-08 11:09:59'),
(274, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:13:04', '2025-08-08 11:13:04'),
(275, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:15:03', '2025-08-08 11:15:03'),
(276, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:17:27', '2025-08-08 11:17:27'),
(277, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:20:15', '2025-08-08 11:20:15'),
(278, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:21:16', '2025-08-08 11:21:16'),
(279, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:22:23', '2025-08-08 11:22:23'),
(280, 46, 2, 112900, NULL, NULL, 'pending', '2025-08-08 11:26:31', '2025-08-08 11:26:31'),
(281, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:29:24', '2025-08-08 11:29:24'),
(282, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:40:57', '2025-08-08 11:40:57'),
(283, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:48:51', '2025-08-08 11:48:51'),
(284, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 11:50:01', '2025-08-08 11:50:01'),
(285, 46, 2, 0, NULL, NULL, 'pending', '2025-08-08 12:01:30', '2025-08-08 12:01:30'),
(286, 47, 2, 0, 0, 0, 'failed', '2025-08-08 12:01:39', '2025-08-08 12:02:27'),
(287, 23, 2, 0, NULL, NULL, 'pending', '2025-08-08 12:23:31', '2025-08-08 12:23:31'),
(288, 23, 2, 112900, NULL, NULL, 'pending', '2025-08-08 12:26:16', '2025-08-08 12:26:16'),
(289, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 12:26:32', '2025-08-08 12:26:32'),
(290, 47, 2, 0, NULL, NULL, 'pending', '2025-08-08 12:31:02', '2025-08-08 12:31:02'),
(291, 48, 2, 0, NULL, NULL, 'pending', '2025-08-08 12:33:24', '2025-08-08 12:33:24'),
(292, 48, 2, 0, NULL, NULL, 'pending', '2025-08-08 12:41:56', '2025-08-08 12:41:56'),
(293, 39, 2, 0, NULL, NULL, 'pending', '2025-08-08 12:43:10', '2025-08-08 12:43:10'),
(294, 44, 3, 17249, NULL, NULL, 'pending', '2025-08-08 12:45:41', '2025-08-08 12:45:41'),
(295, 47, 2, 70590, NULL, NULL, 'pending', '2025-08-08 12:47:29', '2025-08-08 12:47:29'),
(296, 48, 2, 179, NULL, NULL, 'pending', '2025-08-08 12:48:20', '2025-08-08 12:48:20'),
(297, 48, 2, 179, NULL, NULL, 'pending', '2025-08-08 13:11:13', '2025-08-08 13:11:13'),
(298, 25, 6, 17253, 17253, 0, 'failed', '2025-08-13 05:29:22', '2025-08-13 05:30:24'),
(299, 48, 6, 466, 466, 0, 'failed', '2025-08-13 05:29:54', '2025-08-13 05:30:21'),
(300, 49, 6, 180, 180, 0, 'failed', '2025-08-13 05:29:59', '2025-08-13 05:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_attachments`
--

INSERT INTO `support_attachments` (`id`, `support_message_id`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 1, '6886a755e83671753655125.png', '2025-07-28 08:25:25', '2025-07-28 08:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `support_ticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '13123123', '2025-07-28 08:25:25', '2025-07-28 08:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `ticket` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `priority`, `last_reply`, `created_at`, `updated_at`) VALUES
(1, 3, '111 111', 'netflix.4kac9@gmail.com', '300680', '123123123', 0, 3, '2025-07-28 04:25:25', '2025-07-28 08:25:25', '2025-07-28 08:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `remark`, `created_at`, `updated_at`) VALUES
(1, 2, 12.00000000, 0.00000000, 12.00000000, '+', '6VGSZ1RWGUAR', '12', 'balance_add', '2025-07-03 21:08:39', '2025-07-03 21:08:39'),
(2, 2, 10.00000000, 0.00000000, 2.00000000, '-', 'RXJ3N9O7RJA1', 'Subscribe  plan', 'Subscribe_Plan', '2025-07-03 21:32:41', '2025-07-03 21:32:41'),
(3, 2, 2.00000000, 0.00000000, 0.00000000, '-', 'BBXAR5NO9AXF', '2', 'balance_subtract', '2025-07-03 21:43:51', '2025-07-03 21:43:51'),
(4, 4, 22.00000000, 0.00000000, 22.00000000, '+', 'XQ2EJBP6QX5Z', '2', 'balance_add', '2025-07-16 08:57:06', '2025-07-16 08:57:06'),
(5, 4, 12.00000000, 0.00000000, 10.00000000, '-', 'CNEAYYPVGJJJ', 'Subscribe  plan', 'Subscribe_Plan', '2025-07-16 08:57:21', '2025-07-16 08:57:21'),
(6, 1, 22.00000000, 0.00000000, 22.00000000, '+', 'GWR9ZBN57XFG', '22', 'balance_add', '2025-07-16 09:37:37', '2025-07-16 09:37:37'),
(7, 1, 12.00000000, 0.00000000, 10.00000000, '-', 'ZONVRXQ6JWEM', 'Subscribe  plan', 'Subscribe_Plan', '2025-07-16 09:47:21', '2025-07-16 09:47:21'),
(8, 1, 10.00000000, 0.00000000, 0.00000000, '-', '3NM1E2YU8QZ4', 'Subscribe  plan', 'Subscribe_Plan', '2025-07-16 23:38:26', '2025-07-16 23:38:26'),
(9, 2, 333.00000000, 0.00000000, 333.00000000, '+', '2TAAME5WKJ1O', '3', 'balance_add', '2025-07-17 02:53:09', '2025-07-17 02:53:09'),
(10, 2, 10.00000000, 0.00000000, 323.00000000, '-', 'HJRMJCRJKOYP', 'Subscribe  plan', 'Subscribe_Plan', '2025-07-17 02:53:24', '2025-07-17 02:53:24'),
(11, 2, 12.00000000, 0.00000000, 311.00000000, '-', '4SYV97DT9MQ4', 'Subscribe  plan', 'Subscribe_Plan', '2025-07-17 02:54:55', '2025-07-17 02:54:55'),
(12, 2, 1.00000000, 0.00000000, 310.00000000, '-', 'HW5WUUFE9SZG', 'Subscribe  plan', 'Subscribe_Plan', '2025-07-17 03:04:37', '2025-07-17 03:04:37'),
(13, 2, 1.00000000, 0.00000000, 309.00000000, '-', 'ZTACQBAXYGOU', 'Subscribe  plan', 'Subscribe_Plan', '2025-07-17 12:32:05', '2025-07-17 12:32:05'),
(14, 2, 10.00000000, 0.00000000, 319.00000000, '+', '8E9OJPOT2PS4', '????? ???', 'balance_add', '2025-07-28 13:11:57', '2025-07-28 13:11:57'),
(15, 2, 10.00000000, 0.00000000, 329.00000000, '+', 'WWUJMDMDY7XH', '????? ???', 'balance_add', '2025-07-28 13:36:35', '2025-07-28 13:36:35'),
(16, 2, 10.00000000, 0.00000000, 359.00000000, '+', 'H6J6U6X7A1XO', '????? ???', 'balance_add', '2025-07-28 13:48:33', '2025-07-28 13:48:33'),
(17, 2, 10.00000000, 0.00000000, 369.00000000, '+', 'SZNMT9PUKA14', '????? ???', 'balance_add', '2025-07-28 14:05:17', '2025-07-28 14:05:17'),
(18, 7, 50.00000000, 0.00000000, 50.00000000, '+', 'ZTNP5MCYQK93', 'رصيد من PowerShell', 'balance_add', '2025-07-28 14:57:36', '2025-07-28 14:57:36'),
(19, 7, 10.00000000, 0.00000000, 60.00000000, '+', 'DUYNZDWUYGSW', 'رصيد من PowerShell', 'balance_add', '2025-07-28 14:58:06', '2025-07-28 14:58:06'),
(20, 7, 10.00000000, 0.00000000, 70.00000000, '+', '4PV6BPFS4GZT', 'رصيد من PowerShell', 'balance_add', '2025-07-28 15:35:28', '2025-07-28 15:35:28'),
(21, 7, 10.00000000, 0.00000000, 80.00000000, '+', 'F18E8K44D5U2', 'رصيد من PowerShell', 'balance_add', '2025-07-28 16:17:20', '2025-07-28 16:17:20'),
(22, 7, 10.00000000, 0.00000000, 90.00000000, '+', 'Q37W9ZXURG95', 'رصيد من PowerShell', 'balance_add', '2025-07-28 16:31:07', '2025-07-28 16:31:07'),
(23, 7, 0.10000000, 0.00000000, 90.10000000, '+', 'DZ2BWGZ6YSX4', 'تفاصيل', 'balance_add', '2025-07-28 16:57:19', '2025-07-28 16:57:19'),
(24, 7, 1.00000000, 0.00000000, 91.10000000, '+', 'R16ATMGTXR74', 'test', 'balance_add', '2025-07-28 17:05:56', '2025-07-28 17:05:56'),
(25, 7, 0.10000000, 0.00000000, 91.20000000, '+', 'G5C77BCVPY85', '111.68870d491e603/10', 'balance_add', '2025-07-28 17:06:06', '2025-07-28 17:06:06'),
(26, 7, 1.00000000, 0.00000000, 92.20000000, '+', '62EKMX6FFXYQ', '926536457.6886c7d2e2a19/10', 'balance_add', '2025-07-28 17:07:36', '2025-07-28 17:07:36'),
(27, 7, 0.10000000, 0.00000000, 92.30000000, '+', '1Q93G9QZH21A', '920000000.6887d5f7acbf9/10', 'balance_add', '2025-07-29 05:59:20', '2025-07-29 05:59:20'),
(28, 7, 1.10000000, 0.00000000, 93.40000000, '+', 'T3YVZKYYGJY4', '926536457.6887d1708f528/10', 'balance_add', '2025-07-29 06:01:18', '2025-07-29 06:01:18'),
(29, 7, 0.01000000, 0.00000000, 93.41000000, '+', '4AWQ3YXGHSDK', '920000000.6887f1c7b41a0/111', 'balance_add', '2025-07-29 07:55:34', '2025-07-29 07:55:34'),
(30, 7, 0.01000000, 0.00000000, 93.42000000, '+', 'VYQ25EAJTQ9A', '920000000.6887f28ba1ba8/111', 'balance_add', '2025-07-29 07:58:45', '2025-07-29 07:58:45'),
(31, 7, 0.11000000, 0.00000000, 93.53000000, '+', '7JG143ZR8G8B', '920000000.68880629c05c5/111', 'balance_add', '2025-07-29 09:22:29', '2025-07-29 09:22:29'),
(32, 7, 0.01000000, 0.00000000, 93.54000000, '+', 'VQJ4O58QC8VV', '920000000.688808d2854c4/111', 'balance_add', '2025-07-29 09:33:41', '2025-07-29 09:33:41'),
(33, 8, 0.09000000, 0.00000000, 0.09000000, '+', 'WW6QCMQFBRMZ', '923333333.688ba3d7bbe05/11.5', 'balance_add', '2025-08-01 03:12:19', '2025-08-01 03:12:19'),
(34, 1, 1.00000000, 0.00000000, 1.00000000, '+', 'RHT8OKY8QFHM', '926536457.688ce689e3f17/2', 'balance_add', '2025-08-01 23:11:35', '2025-08-01 23:11:35'),
(35, 8, 10.00000000, 0.00000000, 10.09000000, '+', 'Z6TKD51QJNOE', '925964473.688e345443e28/2', 'balance_add', '2025-08-05 21:22:06', '2025-08-05 21:22:06'),
(36, 7, 5.00000000, 0.00000000, 30.00000000, '+', 'YKVV2UFHYKNZ', 'Daily login bonus', 'daily_login_bonus', '2025-08-06 05:05:25', '2025-08-06 05:05:25'),
(37, 2, 5.00000000, 0.00000000, 220927.00000000, '+', '6WX9CQU296K5', 'Daily login bonus', 'daily_login_bonus', '2025-08-06 05:06:35', '2025-08-06 05:06:35'),
(38, 7, 0.50000000, 0.00000000, 94.04000000, '+', 'WE513D93EHQP', '926536457.6893cae2c6b58/2', 'balance_add', '2025-08-07 04:19:39', '2025-08-07 04:19:39'),
(39, 7, 5.00000000, 0.00000000, 35.00000000, '+', 'P3OZV57OQ978', 'Daily login bonus', 'daily_login_bonus', '2025-08-07 05:38:15', '2025-08-07 05:38:15'),
(40, 10, 12.00000000, 0.00000000, 12.00000000, '+', '5E56BWAB43PA', '1212', 'balance_add', '2025-08-07 06:10:42', '2025-08-07 06:10:42'),
(41, 10, 50.00000000, 0.00000000, 62.00000000, '+', 'CD8UM8XGRQPY', '920000000.6893ef9118c95/2', 'balance_add', '2025-08-07 06:13:15', '2025-08-07 06:13:15'),
(42, 10, 50.00000000, 0.00000000, 112.00000000, '+', 'G83GREDW3WQF', '920000000.6893f03fcb372/2', 'balance_add', '2025-08-07 06:16:02', '2025-08-07 06:16:02'),
(43, 10, 6.00000000, 0.00000000, 118.00000000, '+', 'CRR5DQNE3P5S', '920000000.6893f4bfb0bed/2', 'balance_add', '2025-08-07 06:37:17', '2025-08-07 06:37:17'),
(44, 10, 1.00000000, 0.00000000, 119.00000000, '+', 'WW39JV2BVCZ6', '920000000.6893f5b5dbfe8/2', 'balance_add', '2025-08-07 06:39:23', '2025-08-07 06:39:23'),
(45, 10, 1.50000000, 0.00000000, 120.50000000, '+', '5YO8HY31XPFX', '920000000.689400447182a/2', 'balance_add', '2025-08-07 07:24:43', '2025-08-07 07:24:43'),
(46, 10, 2.00000000, 0.00000000, 122.50000000, '+', 'WNZ8FRQSQ1H9', '920000000.6894004d2400a/2', 'balance_add', '2025-08-07 07:40:34', '2025-08-07 07:40:34'),
(47, 10, 2.50000000, 0.00000000, 125.00000000, '+', 'D1QVUH3F1RUJ', '920000000.6894005623b5e/2', 'balance_add', '2025-08-07 07:43:24', '2025-08-07 07:43:24'),
(48, 10, 0.50000000, 0.00000000, 125.50000000, '+', 'DQGFF4JCRWEE', '920000000.689405c55931c/2', 'balance_add', '2025-08-07 07:57:52', '2025-08-07 07:57:52'),
(49, 10, 0.50000000, 0.00000000, 126.00000000, '+', 'EWWJSEVY2GZE', '920000000.689405caf4035/2', 'balance_add', '2025-08-07 08:05:01', '2025-08-07 08:05:01'),
(50, 10, 0.50000000, 0.00000000, 126.50000000, '+', '9B2QT6EGV6WY', '920000000.689405cf8bd07/2', 'balance_add', '2025-08-07 08:07:11', '2025-08-07 08:07:11'),
(51, 10, 0.50000000, 0.00000000, 127.00000000, '+', 'TCZ81CA9KMN9', '920000000.689405d490404/2', 'balance_add', '2025-08-07 08:10:53', '2025-08-07 08:10:53'),
(52, 10, 0.50000000, 0.00000000, 127.50000000, '+', 'YEH6UJHBE7B9', '920000000.689405d9ab343/2', 'balance_add', '2025-08-07 08:16:33', '2025-08-07 08:16:33'),
(53, 10, 0.50000000, 0.00000000, 128.00000000, '+', '3T7OCF2XJE1K', '920000000.689405ded9dee/2', 'balance_add', '2025-08-07 08:22:12', '2025-08-07 08:22:12'),
(54, 10, 0.50000000, 0.00000000, 128.50000000, '+', 'Y74WO93ZV875', '920000000.68940e27c6301/2', 'balance_add', '2025-08-07 08:24:09', '2025-08-07 08:24:09'),
(55, 10, 0.50000000, 0.00000000, 129.00000000, '+', '3E67QW4US2NX', '920000000.68940e2cacd25/2', 'balance_add', '2025-08-07 08:27:30', '2025-08-07 08:27:30'),
(56, 10, 0.50000000, 0.00000000, 129.50000000, '+', 'AZ7RUVU7OSD3', '920000000.68940e3176f21/2', 'balance_add', '2025-08-07 08:30:58', '2025-08-07 08:30:58'),
(57, 10, 0.50000000, 0.00000000, 130.00000000, '+', 'FRK36VGU4627', '920000000.68940e3689bd1/2', 'balance_add', '2025-08-07 08:31:45', '2025-08-07 08:31:45'),
(58, 10, 0.50000000, 0.00000000, 130.50000000, '+', 'HVE84BN7SRVQ', '920000000.68940e3b045b1/2', 'balance_add', '2025-08-07 08:34:08', '2025-08-07 08:34:08'),
(59, 10, 0.50000000, 0.00000000, 131.00000000, '+', 'WMFDNVR4S6UY', '920000000.689411c89bd3e/2', 'balance_add', '2025-08-07 08:39:12', '2025-08-07 08:39:12'),
(60, 2, 1.00000000, 0.00000000, 220928.00000000, '+', '48EVHTAKV3A4', 'Daily login bonus', 'daily_login_bonus', '2025-08-07 09:18:13', '2025-08-07 09:18:13'),
(61, 2, 0.50000000, 0.00000000, 369.50000000, '+', 'UC1ZK9R9AJHE', '920000000.689411cd9b572/2', 'balance_add', '2025-08-07 10:18:59', '2025-08-07 10:18:59'),
(62, 2, 0.50000000, 0.00000000, 370.00000000, '+', 'XBZNZHS1KH8N', '920000000.6894348951cf5/2', 'balance_add', '2025-08-07 11:07:58', '2025-08-07 11:07:58'),
(63, 10, 0.50000000, 0.00000000, 131.50000000, '+', '885AQRDZYPBC', '920000000.6894348f19fd7/2', 'balance_add', '2025-08-07 12:07:07', '2025-08-07 12:07:07'),
(64, 3, 1.00000000, 0.00000000, 272.00000000, '+', '2JOZRE2BJGD7', 'Daily login bonus', 'daily_login_bonus', '2025-08-07 21:11:19', '2025-08-07 21:11:19'),
(65, 3, 1.00000000, 0.00000000, 339.00000000, '+', 'UONWATCZ3528', 'Daily login bonus', 'daily_login_bonus', '2025-08-08 05:09:36', '2025-08-08 05:09:36'),
(66, 2, 1.00000000, 0.00000000, 220863.00000000, '+', 'KWYHXWWTBUON', 'Daily login bonus', 'daily_login_bonus', '2025-08-08 05:10:22', '2025-08-08 05:10:22'),
(67, 7, 0.50000000, 0.00000000, 94.54000000, '+', '2DW7Z23SYJ3V', '920000000.68943495bb3d6/2', 'balance_add', '2025-08-11 06:39:04', '2025-08-11 06:39:04'),
(68, 7, 0.50000000, 0.00000000, 95.04000000, '+', 'T67Q2VHE9XV9', '920000000.6894349aaf5ff/2', 'balance_add', '2025-08-11 06:41:31', '2025-08-11 06:41:31'),
(69, 7, 0.50000000, 0.00000000, 95.54000000, '+', 'QOTJ9X22TF77', '920000000.6894349f79f80/2', 'balance_add', '2025-08-11 06:59:49', '2025-08-11 06:59:49'),
(70, 10, 0.50000000, 0.00000000, 132.00000000, '+', '3R1RV3JGZKGW', '920000000.689943c64906c/2', 'balance_add', '2025-08-11 07:32:40', '2025-08-11 07:32:40'),
(71, 10, 0.50000000, 0.00000000, 132.50000000, '+', 'Y1YQZ6XC1247', '920000000.68994df3802bc/2', 'balance_add', '2025-08-11 07:57:11', '2025-08-11 07:57:11'),
(72, 3, 1.00000000, 0.00000000, 340.00000000, '+', 'XSER4N14FMHF', 'Daily login bonus', 'daily_login_bonus', '2025-08-13 06:46:17', '2025-08-13 06:46:17'),
(73, 3, 22.00000000, 0.00000000, 340.00000000, '+', 'ZTEX9BPPRTUA', 'Withdraw cancelled', 'withdraw_cancelled', '2025-08-13 07:20:17', '2025-08-13 07:20:17'),
(74, 3, 333.00000000, 0.00000000, -326.00000000, '-', 'MVDQZC85WWYS', 'Withdraw approved', 'withdraw_approved', '2025-08-13 07:24:40', '2025-08-13 07:24:40'),
(75, 10, 999.00000000, 0.00000000, 999.00000000, '+', '5WX8G4Q9STR9', 'Withdraw cancelled', 'withdraw_cancelled', '2025-08-13 07:43:42', '2025-08-13 07:43:42'),
(76, 10, 99.00000000, 0.00000000, 801.00000000, '-', 'EYUTTVFNZQTZ', 'Withdraw approved', 'withdraw_approved', '2025-08-13 07:46:26', '2025-08-13 07:46:26'),
(77, 10, 100.00000000, 0.00000000, 687.00000000, '+', 'BWBYOCVM69ET', 'Withdraw cancelled (refund)', 'withdraw_cancelled', '2025-08-13 08:35:44', '2025-08-13 08:35:44'),
(78, 2, 1.00000000, 0.00000000, 220864.00000000, '+', 'FZM6T8BJ4CUK', 'Daily login bonus', 'daily_login_bonus', '2025-08-13 04:29:09', '2025-08-13 04:29:09'),
(79, 10, 31.00000000, 0.00000000, 611.00000000, '+', 'VVOZOSYV6K7K', 'Withdraw cancelled (refund)', 'withdraw_cancelled', '2025-08-13 05:54:41', '2025-08-13 05:54:41'),
(80, 10, 12.00000000, 0.00000000, 623.00000000, '+', '31QACFYP92S2', 'Withdraw cancelled (refund)', 'withdraw_cancelled', '2025-08-13 05:54:48', '2025-08-13 05:54:48'),
(81, 10, 66.00000000, 0.00000000, 647.00000000, '+', 'M3QPGSBG9MUS', 'Withdraw cancelled (refund)', 'withdraw_cancelled', '2025-08-13 06:26:03', '2025-08-13 06:26:03'),
(82, 10, 456.00000000, 0.00000000, 647.00000000, '+', '7K8TVC9SD65G', 'Withdraw cancelled (refund)', 'withdraw_cancelled', '2025-08-13 06:27:17', '2025-08-13 06:27:17'),
(83, 10, 55.00000000, 0.00000000, 559.00000000, '+', 'RY9OUR7Y5ZXH', 'Withdraw cancelled (refund)', 'withdraw_cancelled', '2025-08-13 06:43:15', '2025-08-13 06:43:15'),
(84, 10, 22.00000000, 0.00000000, 613.00000000, '+', 'JP4N7FX38O3X', 'Withdraw cancelled (refund)', 'withdraw_cancelled', '2025-08-13 07:32:39', '2025-08-13 07:32:39'),
(85, 10, 1.00000000, 0.00000000, 131.50000000, '-', 'CNSFEUC242Y1', 'Subscribe  plan', 'Subscribe_Plan', '2025-08-15 16:39:23', '2025-08-15 16:39:23'),
(86, 2, 1.00000000, 0.00000000, 220865.00000000, '+', '7JKW25MZB82R', 'Daily login bonus', 'daily_login_bonus', '2025-08-15 16:40:53', '2025-08-15 16:40:53'),
(87, 2, 1.00000000, 0.00000000, 369.00000000, '-', '2U5UV5C6W6JK', 'Subscribe  plan', 'Subscribe_Plan', '2025-08-15 16:41:02', '2025-08-15 16:41:02'),
(88, 2, 1.00000000, 0.00000000, 368.00000000, '-', 'VKE599SQ3STS', 'Subscribe  plan', 'Subscribe_Plan', '2025-08-15 16:55:53', '2025-08-15 16:55:53'),
(89, 2, 1.00000000, 0.00000000, 367.00000000, '-', 'MZ57QXMBOD3H', 'Subscribe  plan', 'Subscribe_Plan', '2025-08-15 17:05:39', '2025-08-15 17:05:39'),
(90, 2, 1.00000000, 0.00000000, 366.00000000, '-', '7EOAJ48RY86U', 'Subscribe  plan', 'Subscribe_Plan', '2025-08-15 17:06:02', '2025-08-15 17:06:02'),
(91, 2, 1.00000000, 0.00000000, 365.00000000, '-', 'WKV6NXYEQY1D', 'Subscribe  plan', 'Subscribe_Plan', '2025-08-15 17:08:34', '2025-08-15 17:08:34'),
(92, 2, 1.00000000, 0.00000000, 364.00000000, '-', 'W3UDXX35JWFM', 'Subscribe  plan', 'Subscribe_Plan', '2025-08-15 17:11:45', '2025-08-15 17:11:45'),
(93, 2, 1.00000000, 0.00000000, 363.00000000, '-', 'ZHMWZ6ATXYYV', 'Subscribe  plan', 'Subscribe_Plan', '2025-08-15 17:14:52', '2025-08-15 17:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `credits` int(11) DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `reg_step` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `last_daily_login_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `ref_by`, `balance`, `credits`, `password`, `image`, `address`, `status`, `kyc_data`, `kv`, `ev`, `sv`, `reg_step`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `remember_token`, `last_daily_login_at`, `created_at`, `updated_at`) VALUES
(1, 'Mohammed', 'Aldeeb', 'mohammed', 'memo20t80@gmail.com', 'LY', '218949008261', 0, 1.00000000, 121, '$2y$10$4.wABPoitPbIMM8Dfi36SOk8yBrQGlujGft7GNX8KPH08PgN2i.OC', NULL, 'eyJpdiI6Ikc3MWYzaEVGZHVJSlNCblVzVzNOaXc9PSIsInZhbHVlIjoiSXRlMjdXbEFsOGIvTkVtV3JVYmpSV09Ca2VGOGF2am52Z2FJRTQ2ODJ3V3RpOTNHd1NvalZUZUd6a3h5bVdCVU1uWnFCK0JQZ2xQdVc0dTZuUEtBOVhwZkpuTzdyRVlIVzFoMGNsakF4OGdWSTkvbEpwSmgvZWxrckpBNHJhZEsiLCJtYWMiOiIxMDM5ZDRlYzUwMmFmNmU5YjA1NjU1MjA0MGY2YzI1MzhmZjdjMTYyYTljMWU0MDJkYzBiYzA5M2Q4ZDBjNDcwIiwidGFnIjoiIn0=', 1, NULL, 0, 0, 0, 1, '953838', '2025-08-07 01:44:18', 0, 1, NULL, NULL, '4uMm56oiBwaKps7AGXdQthUv65fKDNM11wI9e74kpCrJcaxv7Go6BeCoDHkh', NULL, '2025-07-03 23:45:37', '2025-08-07 07:12:28'),
(2, 'abdo', 'ali', '123123', 'abdocenter1000@gmail.com', 'LY', '218913363413', 0, 363.00000000, 227843, '$2y$10$QO9G6AxqB2wMRha3TeCBp.E.GMqPPntkWNECB2LLixooZwxzYf/.m', '123123/2/6894285d615e41754540125.jpg', 'eyJpdiI6Ik42MGk3MWFnbENvSkpmaXRNVmkxcXc9PSIsInZhbHVlIjoidmRDMWFXSExqVHNZemxGMzVwdVlxeHJXVkxxT3BwcERIWVN4Nk91RkQzVnFRV0hEczdzQktORFpmVzQ4VjhmbldacktrcmVpWkthcE5DS3AzWm1KQ21SLzBYbjY0MFEzaUZWMi9rTzdvY2FEeVIyMGNsd1NxVEFsdVRxa0dtd0QiLCJtYWMiOiIzMWQ1OTAwODcxNzEzYzNiNzM0MzMyYzdkMGVkNWY5NGEzNzI4MDM3NDA5NmE1ZjllMmM0Y2IyZTNjMzljOTJhIiwidGFnIjoiIn0=', 1, NULL, 0, 1, 0, 1, NULL, NULL, 0, 1, NULL, NULL, 'uMPEAWVxNgbYB49Gng4TzgPkHHpIKLYNiTyZUvpwgJCKijMF6fJ95peo1yPj', '2025-08-15 16:40:53', '2025-07-03 23:48:18', '2025-08-15 18:03:43'),
(3, '111', '111', 'tl6udf456', 'netflix.4kac9@gmail.com', 'LY', '21811111111', 0, 0.00000000, -326, '$2y$10$3V.DpS4ZZmhO8mgWuenW2..ZiORcFiZZ4n/bnnbQXNa4ibjU5kzVW', NULL, NULL, 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-08-13 06:46:17', '2025-07-03 21:17:45', '2025-08-13 07:24:40'),
(4, '234234', '234234', 'rrrrrr', '234@gmail.com', 'LY', '218234234234', 0, 10.00000000, 189, '$2y$10$TAQ5ue7T/SwsR9OdiNjs.ucMP02o5Q2HK10qXgTaXiRoMH2nQzV1q', NULL, NULL, 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2025-07-03 22:09:54', '2025-07-31 12:02:54'),
(5, 'abdo123', '123', 'tl6udf4562', '2342@gmail.com', 'LY', '218234234', 0, 0.00000000, 41, '$2y$10$AGhA3TlFMqTkFHW8B9tMK.5blh07WCp7ntzBHHWpuC9IpaSlf36xK', NULL, NULL, 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2025-07-03 23:57:54', '2025-07-17 12:36:13'),
(6, 'abdo', '1212', '121212', '12121000@gmail.com', 'LY', '218121212', 0, 0.00000000, 31, '$2y$10$3XxGcQrPv/RFdrr2OggmrOBXjn7eyn45zGap7nOK/lS9sjzZbhhcy', NULL, NULL, 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2025-07-16 09:28:13', '2025-08-06 04:34:28'),
(7, '2121', '212', '212121', '1212r1000@gmail.com', 'LY', '21812121', 0, 95.54000000, 35, '$2y$10$2OsEXJh.9fjTPAX9tPDiHuYsZstLBzisyEQ6G8byXjGjHB2OaPqwe', '212121/7/6893c6cea78551754515150.png', 'eyJpdiI6IkFrNnAzL0dnaTBlYnVmNk5RZktvYXc9PSIsInZhbHVlIjoiMWovUG5rYVBiRUZaMFFhTytDOVIyQ1JFcWYwVlJTUEw4S3FKTVNnelUxNjV1UGRoN2ZrRG55WnBWeE41R05oNW5xRWdTNHZEK3dpNzEvS01WN0VRZmVKMWYwSWVwTjdiSGZOWHRiWERhYlE9IiwibWFjIjoiZjlkYjEwYzJmMWQ4OGMzYTZmYmU0MTljNTdmZDI5YzFhYmQ5OGFiMTBkYjBkZjg4ZWFjNmQyZWExNTU2NDhmNSIsInRhZyI6IiJ9', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, '9l7KXjxCg5DBRBDoODq5wCIcHqDoqEaTCW7A9lEv09aB04L04xomPqnupbV2', '2025-08-07 05:38:15', '2025-07-16 11:14:57', '2025-08-11 06:59:49'),
(8, 'Its', 'Me', 'wwwwwwwwww', 'alsalam3laykom33@gmail.com', 'LY', '218922463247', 0, 10.09000000, 968, '$2y$10$UgkbSmHXp4zh5Tq1m4R3G.oT7pjLexDYb2Ef7Tox3nLZFDGeWRRKW', NULL, 'eyJpdiI6IktFZndMWFEyNU01ME92Yk5EMW8zRGc9PSIsInZhbHVlIjoiVG84cWdYTUVyWkVGNDJTSkcya2l1UGpwY2lPNVNCRTRUa0hUWHlPb0hMQVpYOWp5aXFac3JxQXoyVmRPY0Fib05lZFBqMWxkbDVOVEYwbUV3ai9ZVGtvNkRMWno2YjIzaHQyaDBhenRRZGVNcTdISWxxbnFZRTdQWXN1NFFMMUQiLCJtYWMiOiJmMDUzMTMxNzM3MGRhYmZhODc1YWU4Yjk3NGY4ZTMwMzMzOTI3NGU2ZDhjNGI4MmM5NGIxYzdhNTY2MmM0MGFkIiwidGFnIjoiIn0=', 1, NULL, 0, 0, 0, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2025-07-31 23:16:54', '2025-08-07 07:12:19'),
(9, '123123', '123', 'abdo123', 'abdocentrer1000@gmail.com', 'LY', '218926536457', 0, 0.00000000, 999, '$2y$10$c3DkiD8GLPkcWNOSQ306Yua2ELSF8NA8cQOgIf9WYceOUCUdLLDr6', NULL, 'eyJpdiI6Im5ETEJrSmZMdWR1QnFpT1ZSeG1aakE9PSIsInZhbHVlIjoiT0tzSy92eXRUaFdKNS95dVpYTW4xZVRKUTh4Nk9QOVdvcjMxRFhFTG1mOVBsUnFZdXFtWVRHOHNEcTcxVjh6djBHcjk4VGtMWTZ5d2tWYWtmdmNaMkNOdkNsaXZ0dGN2bUZJQWkyTE16RXFFRkZJcXlwbjVoVXhEcDR5VTRRQk0iLCJtYWMiOiJjNDVjYjk4OTdlMWVlYjJhYTBmOTliMjJkMDYyZmE5MGQxODYwODAyZTI4YzM3NjYwNmMxNWM3YjY4MDhkMzUxIiwidGFnIjoiIn0=', 1, NULL, 0, 0, 0, 1, '887147', '2025-08-11 03:41:39', 0, 1, NULL, NULL, NULL, NULL, '2025-08-07 02:27:26', '2025-08-11 07:41:39'),
(10, 'abdo', '123123', '1232323', 'abdocenter10000@gmail.com', 'LY', '218123123123', 2, 131.50000000, 1612, '$2y$10$aTlJttsCiCiWrsFVg41raOVMyi34Og.BJRMI.YjlLDdMhAgYjapMa', NULL, 'eyJpdiI6ImlMNHJIbFBDOWNNeWIyYTh2TEFBcFE9PSIsInZhbHVlIjoicm5jQVlUMkJkMXV5aTE3cVBwdUtBWWhDN2ZLbk1qVEIxUFBZVlFGOXBuWmNHQWZoYTQvUWUxMU1YL0gzc2x5SkxNOGJNYitIQlZEWTZKNElheDlkbnByZlNuWXRXSmpMYTJheml5cEd3bUNtM2xtYWdwby9LYTFHdXJYR2VLQVBDNTZVa0tzSGNlV2dBRkMrS1pFbjF3PT0iLCJtYWMiOiI3ZDE0ZmY2MDZjOGZkOGIwOTliM2IzNDZhNWQ1OTk0MzVmNTVhOGU2ODc5NDQ3NzA2OThmNzRlMGZmMmY0Y2Y2IiwidGFnIjoiIn0=', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, '2025-08-07 06:08:56', '2025-08-15 16:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_levels`
--

CREATE TABLE `user_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `points_spent_total` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `achieved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_level_histories`
--

CREATE TABLE `user_level_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `from_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `points_spent_total_at_change` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 1, '41.254.80.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-03 23:45:37', '2025-07-03 23:45:37'),
(2, 2, '41.254.70.47', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-03 23:48:18', '2025-07-03 23:48:18'),
(3, 3, '41.254.70.47', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-03 21:17:45', '2025-07-03 21:17:45'),
(4, 4, '41.254.70.47', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-03 22:09:54', '2025-07-03 22:09:54'),
(5, 5, '41.254.70.47', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-03 23:57:54', '2025-07-03 23:57:54'),
(6, 2, '41.254.70.47', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-04 02:54:10', '2025-07-04 02:54:10'),
(7, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-15 23:43:37', '2025-07-15 23:43:37'),
(8, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-16 09:25:04', '2025-07-16 09:25:04'),
(9, 6, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-16 09:28:13', '2025-07-16 09:28:13'),
(10, 7, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-16 11:14:57', '2025-07-16 11:14:57'),
(11, 2, '169.197.85.174', '', 'United States', 'US', '-97.822', '37.751', 'Chrome', 'Windows 10', '2025-07-16 12:24:21', '2025-07-16 12:24:21'),
(12, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-16 12:32:47', '2025-07-16 12:32:47'),
(13, 7, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-16 12:48:38', '2025-07-16 12:48:38'),
(14, 7, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-16 23:20:59', '2025-07-16 23:20:59'),
(15, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-16 23:21:22', '2025-07-16 23:21:22'),
(16, 7, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 00:11:06', '2025-07-17 00:11:06'),
(17, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 00:20:52', '2025-07-17 00:20:52'),
(18, 6, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 00:21:16', '2025-07-17 00:21:16'),
(19, 6, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 00:28:46', '2025-07-17 00:28:46'),
(20, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 00:29:05', '2025-07-17 00:29:05'),
(21, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 01:15:44', '2025-07-17 01:15:44'),
(22, 7, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 01:20:24', '2025-07-17 01:20:24'),
(23, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 02:57:25', '2025-07-17 02:57:25'),
(24, 2, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 05:58:14', '2025-07-17 05:58:14'),
(25, 7, '41.254.70.126', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-17 05:58:33', '2025-07-17 05:58:33'),
(26, 7, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-28 04:32:07', '2025-07-28 04:32:07'),
(27, 2, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-28 04:34:56', '2025-07-28 04:34:56'),
(28, 6, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-28 04:39:08', '2025-07-28 04:39:08'),
(29, 2, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-28 06:36:38', '2025-07-28 06:36:38'),
(30, 7, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-28 12:06:15', '2025-07-28 12:06:15'),
(31, 7, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-28 12:32:02', '2025-07-28 12:32:02'),
(32, 7, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-28 14:05:48', '2025-07-28 14:05:48'),
(33, 7, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-28 14:09:54', '2025-07-28 14:09:54'),
(34, 2, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-29 09:10:08', '2025-07-29 09:10:08'),
(35, 2, '41.254.87.165', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-29 09:42:11', '2025-07-29 09:42:11'),
(36, 2, '41.254.82.213', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-31 07:44:30', '2025-07-31 07:44:30'),
(37, 2, '41.254.82.213', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-07-31 12:02:43', '2025-07-31 12:02:43'),
(38, 8, '41.254.84.224', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Linux', '2025-07-31 23:16:54', '2025-07-31 23:16:54'),
(39, 2, '41.254.82.213', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-01 03:02:30', '2025-08-01 03:02:30'),
(40, 7, '41.254.82.213', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-01 05:34:02', '2025-08-01 05:34:02'),
(41, 7, '41.254.82.213', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-01 02:57:05', '2025-08-01 02:57:05'),
(42, 2, '102.164.96.36', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Linux', '2025-08-01 22:08:47', '2025-08-01 22:08:47'),
(43, 1, '102.164.96.36', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Handheld Browser', 'Android', '2025-08-01 22:53:46', '2025-08-01 22:53:46'),
(44, 8, '41.254.81.169', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Linux', '2025-08-02 03:43:39', '2025-08-02 03:43:39'),
(45, 2, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-06 04:25:47', '2025-08-06 04:25:47'),
(46, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-06 05:05:25', '2025-08-06 05:05:25'),
(47, 2, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-06 05:06:35', '2025-08-06 05:06:35'),
(48, 2, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-06 05:06:48', '2025-08-06 05:06:48'),
(49, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-06 16:38:26', '2025-08-06 16:38:26'),
(50, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-06 16:48:50', '2025-08-06 16:48:50'),
(51, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-06 16:50:11', '2025-08-06 16:50:11'),
(52, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-06 17:08:23', '2025-08-06 17:08:23'),
(53, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 01:15:12', '2025-08-07 01:15:12'),
(54, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 01:44:30', '2025-08-07 01:44:30'),
(55, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 01:46:48', '2025-08-07 01:46:48'),
(56, 9, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 02:27:26', '2025-08-07 02:27:26'),
(57, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 03:18:59', '2025-08-07 03:18:59'),
(58, 7, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 05:38:15', '2025-08-07 05:38:15'),
(59, 10, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 06:08:56', '2025-08-07 06:08:56'),
(60, 2, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 09:18:13', '2025-08-07 09:18:13'),
(61, 3, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 21:11:19', '2025-08-07 21:11:19'),
(62, 2, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-07 22:35:53', '2025-08-07 22:35:53'),
(63, 3, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-08 05:09:36', '2025-08-08 05:09:36'),
(64, 2, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-08 05:10:22', '2025-08-08 05:10:22'),
(65, 2, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-08 07:05:12', '2025-08-08 07:05:12'),
(66, 3, '41.254.81.104', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-08 07:38:04', '2025-08-08 07:38:04'),
(67, 3, '41.254.81.162', 'Tripoli', 'Libya', 'LY', '13.1796', '32.8908', 'Chrome', 'Windows 10', '2025-08-13 06:46:17', '2025-08-13 06:46:17'),
(68, 2, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-13 04:29:09', '2025-08-13 04:29:09'),
(69, 2, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-15 16:40:53', '2025-08-15 16:40:53'),
(70, 2, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2025-08-15 16:55:11', '2025-08-15 16:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `binance_id` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `cancelled_by` varchar(255) DEFAULT NULL,
  `credits` decimal(24,8) NOT NULL,
  `rate` decimal(24,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `phone`, `binance_id`, `method`, `status`, `cancelled_by`, `credits`, `rate`, `created_at`, `updated_at`) VALUES
(23, 10, '920000000', NULL, 'phone', '2', NULL, 456.00000000, 0.50000000, '2025-08-13 06:27:01', '2025-08-13 06:27:17'),
(24, 10, '234234', NULL, 'phone', '2', NULL, 234.00000000, 0.50000000, '2025-08-13 06:29:21', '2025-08-13 06:29:24'),
(25, 10, '234234234', NULL, 'phone', '2', NULL, 23.00000000, 0.50000000, '2025-08-13 06:29:47', '2025-08-13 06:29:54'),
(26, 10, NULL, '345345', 'usdt', '2', 'user', 345.00000000, 0.70000000, '2025-08-13 06:40:30', '2025-08-13 06:40:48'),
(27, 10, NULL, '123', 'usdt', '1', NULL, 34.00000000, 0.70000000, '2025-08-13 06:42:51', '2025-08-13 06:43:13'),
(28, 10, NULL, '345', 'usdt', '2', 'admin', 55.00000000, 0.70000000, '2025-08-13 06:42:58', '2025-08-13 06:43:15'),
(29, 10, '5345345', NULL, 'phone', '2', 'user', 54.00000000, 0.50000000, '2025-08-13 06:43:03', '2025-08-13 06:43:21'),
(30, 10, NULL, '234442', 'usdt', '2', 'user', 23.00000000, 0.70000000, '2025-08-13 06:43:58', '2025-08-13 07:32:23'),
(31, 10, '1111111111111', NULL, 'phone', '2', 'user', 11.00000000, 0.50000000, '2025-08-13 07:32:10', '2025-08-13 07:32:28'),
(32, 10, NULL, '222222222222', 'usdt', '2', 'admin', 22.00000000, 0.70000000, '2025-08-13 07:32:18', '2025-08-13 07:32:39'),
(33, 10, '920000000', NULL, 'phone', '2', 'user', 1.00000000, 0.50000000, '2025-08-15 16:33:39', '2025-08-15 16:34:06'),
(34, 10, NULL, '2134324', 'usdt', '2', 'user', 1.00000000, 0.70000000, '2025-08-15 16:34:14', '2025-08-15 16:34:17'),
(35, 2, '12121212', NULL, 'phone', '0', NULL, 1.00000000, 0.50000000, '2025-08-15 17:30:13', '2025-08-15 17:30:13'),
(36, 2, '920000000', NULL, 'phone', '0', NULL, 1.00000000, 0.50000000, '2025-08-15 17:31:29', '2025-08-15 17:31:29'),
(37, 2, '123123', NULL, 'phone', '0', NULL, 12.00000000, 0.50000000, '2025-08-15 17:34:47', '2025-08-15 17:34:47'),
(38, 2, NULL, '2134324', 'usdt', '0', NULL, 1.00000000, 0.70000000, '2025-08-15 18:03:43', '2025-08-15 18:03:43');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `points` int(10) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `rate` decimal(10,4) NOT NULL,
  `status` enum('pending','approved','cancelled') NOT NULL DEFAULT 'pending',
  `approved_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`),
  ADD UNIQUE KEY `api_token` (`api_token`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ad_types`
--
ALTER TABLE `ad_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apify_actors`
--
ALTER TABLE `apify_actors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apify_actors_name_metric_unique` (`name`,`metric`),
  ADD UNIQUE KEY `unique_name_metric` (`name`,`metric`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_apify_actor_id_foreign` (`apify_actor_id`);

--
-- Indexes for table `commission_logs`
--
ALTER TABLE `commission_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_benefits`
--
ALTER TABLE `level_benefits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level_benefits_type_index` (`type`),
  ADD KEY `level_benefits_level_id_foreign` (`level_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proofs`
--
ALTER TABLE `proofs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refferals`
--
ALTER TABLE `refferals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_views`
--
ALTER TABLE `service_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_checks`
--
ALTER TABLE `social_checks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_levels`
--
ALTER TABLE `user_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_levels_user_id_unique` (`user_id`),
  ADD KEY `user_levels_level_id_foreign` (`level_id`);

--
-- Indexes for table `user_level_histories`
--
ALTER TABLE `user_level_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level_histories_user_id_foreign` (`user_id`),
  ADD KEY `user_level_histories_from_level_id_foreign` (`from_level_id`),
  ADD KEY `user_level_histories_to_level_id_foreign` (`to_level_id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawals_status_index` (`status`),
  ADD KEY `withdrawals_user_id_index` (`user_id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_requests_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `ad_types`
--
ALTER TABLE `ad_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `apify_actors`
--
ALTER TABLE `apify_actors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `commission_logs`
--
ALTER TABLE `commission_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `level_benefits`
--
ALTER TABLE `level_benefits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `proofs`
--
ALTER TABLE `proofs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `refferals`
--
ALTER TABLE `refferals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `service_views`
--
ALTER TABLE `service_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `social_checks`
--
ALTER TABLE `social_checks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_level_histories`
--
ALTER TABLE `user_level_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_apify_actor_id_foreign` FOREIGN KEY (`apify_actor_id`) REFERENCES `apify_actors` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `level_benefits`
--
ALTER TABLE `level_benefits`
  ADD CONSTRAINT `level_benefits_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_levels`
--
ALTER TABLE `user_levels`
  ADD CONSTRAINT `user_levels_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_levels_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_level_histories`
--
ALTER TABLE `user_level_histories`
  ADD CONSTRAINT `user_level_histories_from_level_id_foreign` FOREIGN KEY (`from_level_id`) REFERENCES `levels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_level_histories_to_level_id_foreign` FOREIGN KEY (`to_level_id`) REFERENCES `levels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_level_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `withdrawals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD CONSTRAINT `withdraw_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
