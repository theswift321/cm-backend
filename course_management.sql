-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2026 at 03:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `submission_type` enum('file','text','link','mixed') NOT NULL DEFAULT 'file',
  `file_path` varchar(256) DEFAULT NULL,
  `total_marks` int(11) NOT NULL DEFAULT 0,
  `due_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `subject_id`, `title`, `description`, `submission_type`, `file_path`, `total_marks`, `due_date`, `created_at`, `updated_at`) VALUES
(1, 2, 'Business Assignment 1', 'Business Assignment 1', 'file', 'assignments/hxBkpylwt4TAmyOnOa0302mzxFSENeYR6iET993r.pdf', 50, '2026-02-13 00:00:00', '2026-02-11 05:40:35', '2026-02-11 05:40:35'),
(2, 2, 'small Business', 'small Business case study', 'file', 'assignments/ej5Kjx7ZmNYgAk6s3P1hNpky9horPqClCFWdqJIi.docx', 50, '2026-02-15 00:00:00', '2026-02-13 06:02:19', '2026-02-13 06:02:19'),
(3, 19, 'practice question 10', 'practice question 10', 'file', 'assignments/rw9WYVfc6DWzehbzc9fGU3bVjjaIMQsG2XTRiHPC.pdf', 20, '2026-02-17 00:00:00', '2026-02-16 05:41:04', '2026-02-16 05:41:04'),
(4, 18, 'practice question 10', 'practice question 10', 'file', 'assignments/3zNlPR17V0yb7lj8D1f8hIBlfxgOvJ8kAT2eE2oQ.pdf', 20, '2026-02-17 00:00:00', '2026-02-16 05:41:48', '2026-02-16 05:41:48'),
(5, 20, 'practice question 10', 'practice question 10', 'file', 'assignments/1keX7he6fHGpz6OoPYj2xpsCJsWP9EQSwUvwN5tn.pdf', 20, '2026-02-17 00:00:00', '2026-02-16 05:43:08', '2026-02-16 05:43:08'),
(6, 21, 'practice question 10', 'practice question 10', 'file', 'assignments/PYjtGHaD1kxTIAMA17nMZGt8Z3AVTNFl2DreZBKz.pdf', 20, '2026-02-17 00:00:00', '2026-02-16 05:46:22', '2026-02-16 05:46:22');

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `answer_text` longtext DEFAULT NULL,
  `submission_url` varchar(255) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `status` enum('submitted','reviewed','rejected') NOT NULL DEFAULT 'submitted',
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assignment_submissions`
--

INSERT INTO `assignment_submissions` (`id`, `assignment_id`, `student_id`, `file_path`, `answer_text`, `submission_url`, `marks`, `feedback`, `status`, `reviewed_at`, `submitted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 'assignment_submissions/5dpwaOv0h7mSkkZFBL0lhLypqVfFCYl5uGwMOIOn.pdf', NULL, NULL, 20, NULL, 'reviewed', '2026-02-11 07:47:08', '2026-02-12 08:51:41', '2026-02-11 05:49:33', '2026-02-12 08:51:41'),
(2, 1, 14, 'assignment_submissions/MkDr5AE7OW8IxkBU3F4TucgGfcqk2UvVopM9N3wS.pdf', NULL, NULL, 10, 'not good prepare well and re-submit', 'rejected', '2026-02-13 00:39:37', '2026-02-11 07:52:23', '2026-02-11 07:52:23', '2026-02-13 00:39:37'),
(3, 1, 18, 'assignment_submissions/eIRUZCyEnXZ3twYkg1WaVTCzGg4knOAoFl4kgkbH.docx', NULL, NULL, NULL, NULL, 'submitted', NULL, '2026-02-13 06:37:08', '2026-02-13 06:37:08', '2026-02-13 06:37:08'),
(4, 2, 14, 'assignment_submissions/RgVtNUcLAGHDZ8VFhUFjhwignxGyqrhe2NFSiJc7.docx', NULL, NULL, NULL, NULL, 'submitted', NULL, '2026-02-16 00:40:57', '2026-02-16 00:40:57', '2026-02-16 00:40:57'),
(5, 2, 17, 'assignment_submissions/TSJNXdtisPNNh9bgm9u4l7CcW72ZYdeCFEvTVozZ.pdf', NULL, NULL, NULL, NULL, 'submitted', NULL, '2026-02-21 04:19:09', '2026-02-21 04:19:09', '2026-02-21 04:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Web Development', NULL, NULL),
(2, 'Data Science', NULL, NULL),
(3, 'Mobile Development', NULL, NULL),
(8, '12th', '2026-01-05 03:07:12', '2026-01-05 03:07:12'),
(11, 'PE', '2026-02-07 07:42:35', '2026-02-07 07:42:35'),
(12, 'Arts', '2026-02-16 01:16:09', '2026-02-16 01:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `minimum_payment` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `image`, `category_id`, `price`, `minimum_payment`, `status`, `created_at`, `updated_at`) VALUES
(4, 'commerce(part1)', 'commerce full', 'courses/LtF3BG7YEQ5iXAfR0YRO2VFrzGq4MO5qq1ovJDq7.jpg', 2, 120.00, 0.00, 'active', '2025-12-23 18:09:17', '2026-01-06 00:31:19'),
(6, 'PCM', 'PCM', 'courses/rQbjRPoiQkdKVnOf8kckjlYOIKximYvVeln6KQMc.jpg', 3, 123.00, 0.00, 'active', '2025-12-23 18:50:25', '2026-01-06 00:25:36'),
(30, 'PCB', 'PCB', 'courses/NYJeyWPui0CxX49bX4FQLe5aSm845PJsbU0Qe46K.jpg', 3, 234.00, 50.00, 'active', '2025-12-23 21:48:12', '2026-01-06 00:26:34'),
(35, 'Arts', 'get all preps here', 'courses/SiIplXYFDmNAwxM7mIuLLi4aQ34xzv9XB5Wm1kne.png', 12, 1200.00, 500.00, 'active', '2026-02-16 01:55:44', '2026-02-16 01:55:44');

-- --------------------------------------------------------

--
-- Table structure for table `course_progress`
--

CREATE TABLE `course_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `completed_lessons` int(11) NOT NULL DEFAULT 0,
  `total_lessons` int(11) NOT NULL DEFAULT 0,
  `progress` decimal(5,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_progress`
--

INSERT INTO `course_progress` (`id`, `student_id`, `course_id`, `completed_lessons`, `total_lessons`, `progress`, `created_at`, `updated_at`) VALUES
(1, 17, 35, 6, 6, 100.00, '2026-02-18 08:05:24', '2026-02-21 07:34:07'),
(2, 17, 6, 1, 4, 25.00, '2026-02-18 08:14:21', '2026-02-18 08:14:21'),
(3, 17, 0, 2, 4, 50.00, '2026-02-18 08:50:05', '2026-03-07 00:00:23');

-- --------------------------------------------------------

--
-- Table structure for table `course_user`
--

CREATE TABLE `course_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('enrolled','cancelled') NOT NULL DEFAULT 'enrolled',
  `amount_paid` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_user`
--

INSERT INTO `course_user` (`id`, `user_id`, `course_id`, `status`, `amount_paid`, `created_at`, `updated_at`) VALUES
(1, 8, 4, 'enrolled', NULL, '2026-01-03 01:21:36', '2026-01-03 01:21:36'),
(2, 8, 6, 'enrolled', NULL, '2026-01-03 01:27:25', '2026-01-03 01:27:25'),
(7, 6, 6, 'enrolled', NULL, '2026-01-06 22:29:55', '2026-01-06 22:29:55'),
(8, 12, 6, 'enrolled', NULL, '2026-01-07 00:49:26', '2026-01-07 00:49:26'),
(9, 13, 4, 'enrolled', NULL, '2026-01-11 22:10:22', '2026-01-11 22:10:22'),
(10, 8, 30, 'enrolled', NULL, '2026-01-16 20:24:03', '2026-01-16 20:24:03'),
(11, 7, 4, 'enrolled', 120.00, '2026-01-25 20:18:06', '2026-01-25 20:18:06'),
(12, 7, 6, 'enrolled', 20.50, '2026-01-25 23:11:32', '2026-01-25 23:11:32'),
(13, 7, 30, 'enrolled', 39.00, '2026-01-25 23:24:57', '2026-01-25 23:24:57'),
(20, 14, 4, 'enrolled', 40.00, '2026-01-27 18:28:44', '2026-01-27 18:28:44'),
(22, 17, 4, 'enrolled', 10.00, '2026-02-07 08:11:42', '2026-02-07 08:11:42'),
(23, 14, 6, 'enrolled', 10.25, '2026-02-10 00:59:33', '2026-02-10 00:59:33'),
(24, 14, 30, 'enrolled', 39.00, '2026-02-10 04:06:14', '2026-02-10 04:06:14'),
(26, 17, 6, 'enrolled', 41.00, '2026-02-12 08:54:06', '2026-02-12 08:54:06'),
(27, 18, 4, 'enrolled', 10.00, '2026-02-13 06:24:49', '2026-02-13 06:24:49'),
(28, 17, 35, 'enrolled', 400.00, '2026-02-16 06:39:04', '2026-02-16 06:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `emi_payments`
--

CREATE TABLE `emi_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `installment_no` int(11) NOT NULL,
  `total_installments` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `status` enum('PAID','PENDING','OVERDUE') NOT NULL DEFAULT 'PENDING',
  `paid_at` timestamp NULL DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_order_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emi_payments`
--

INSERT INTO `emi_payments` (`id`, `user_id`, `course_id`, `installment_no`, `total_installments`, `amount`, `due_date`, `status`, `paid_at`, `razorpay_payment_id`, `razorpay_order_id`, `created_at`, `updated_at`) VALUES
(1, 17, 4, 1, 12, 10.00, '2026-02-19', 'PAID', '2026-02-23 23:58:00', 'pay_SJrotMT1dH2yx9', 'order_SJroEERSKb1aYs', '2026-02-07 08:11:11', '2026-02-23 23:58:00'),
(2, 17, 4, 2, 12, 10.00, '2026-02-18', 'PAID', NULL, NULL, 'order_SLC0wvvHK5K1Sw', '2026-02-07 08:11:11', '2026-02-27 08:21:18'),
(3, 17, 4, 3, 12, 10.00, '2026-05-07', 'PAID', NULL, NULL, 'order_SLBqCIftTxFJEO', '2026-02-07 08:11:11', '2026-02-27 08:11:08'),
(4, 17, 4, 4, 12, 10.00, '2026-06-07', 'PENDING', NULL, NULL, 'order_SLCHfMkgYGZPAI', '2026-02-07 08:11:11', '2026-02-27 08:37:08'),
(5, 17, 4, 5, 12, 10.00, '2026-07-07', 'PENDING', NULL, NULL, NULL, '2026-02-07 08:11:11', '2026-02-07 08:11:11'),
(6, 17, 4, 6, 12, 10.00, '2026-08-07', 'PENDING', NULL, NULL, NULL, '2026-02-07 08:11:11', '2026-02-07 08:11:11'),
(7, 17, 4, 7, 12, 10.00, '2026-09-07', 'PENDING', NULL, NULL, NULL, '2026-02-07 08:11:11', '2026-02-07 08:11:11'),
(8, 17, 4, 8, 12, 10.00, '2026-10-07', 'PENDING', NULL, NULL, NULL, '2026-02-07 08:11:11', '2026-02-07 08:11:11'),
(9, 17, 4, 9, 12, 10.00, '2026-11-07', 'PENDING', NULL, NULL, NULL, '2026-02-07 08:11:11', '2026-02-07 08:11:11'),
(10, 17, 4, 10, 12, 10.00, '2026-12-07', 'PENDING', NULL, NULL, NULL, '2026-02-07 08:11:11', '2026-02-07 08:11:11'),
(11, 17, 4, 11, 12, 10.00, '2027-01-07', 'PAID', NULL, NULL, 'order_SLBvhnrGuBRJtP', '2026-02-07 08:11:11', '2026-02-27 08:16:21'),
(12, 17, 4, 12, 12, 10.00, '2027-02-07', 'PENDING', NULL, NULL, NULL, '2026-02-07 08:11:11', '2026-02-07 08:11:11'),
(13, 14, 6, 1, 12, 10.25, '2026-03-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(14, 14, 6, 2, 12, 10.25, '2026-04-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(15, 14, 6, 3, 12, 10.25, '2026-05-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(16, 14, 6, 4, 12, 10.25, '2026-06-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(17, 14, 6, 5, 12, 10.25, '2026-07-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(18, 14, 6, 6, 12, 10.25, '2026-08-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(19, 14, 6, 7, 12, 10.25, '2026-09-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(20, 14, 6, 8, 12, 10.25, '2026-10-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(21, 14, 6, 9, 12, 10.25, '2026-11-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(22, 14, 6, 10, 12, 10.25, '2026-12-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(23, 14, 6, 11, 12, 10.25, '2027-01-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(24, 14, 6, 12, 12, 10.25, '2027-02-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 00:58:47', '2026-02-10 00:58:47'),
(25, 14, 30, 1, 12, 19.50, '2026-03-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:57', '2026-02-10 04:03:57'),
(26, 14, 30, 2, 12, 19.50, '2026-04-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:57', '2026-02-10 04:03:57'),
(27, 14, 30, 3, 12, 19.50, '2026-05-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:57', '2026-02-10 04:03:57'),
(28, 14, 30, 4, 12, 19.50, '2026-06-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:57', '2026-02-10 04:03:57'),
(29, 14, 30, 5, 12, 19.50, '2026-07-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:57', '2026-02-10 04:03:57'),
(30, 14, 30, 6, 12, 19.50, '2026-08-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:58', '2026-02-10 04:03:58'),
(31, 14, 30, 7, 12, 19.50, '2026-09-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:58', '2026-02-10 04:03:58'),
(32, 14, 30, 8, 12, 19.50, '2026-10-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:58', '2026-02-10 04:03:58'),
(33, 14, 30, 9, 12, 19.50, '2026-11-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:58', '2026-02-10 04:03:58'),
(34, 14, 30, 10, 12, 19.50, '2026-12-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:58', '2026-02-10 04:03:58'),
(35, 14, 30, 11, 12, 19.50, '2027-01-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:58', '2026-02-10 04:03:58'),
(36, 14, 30, 12, 12, 19.50, '2027-02-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:03:58', '2026-02-10 04:03:58'),
(37, 14, 30, 1, 6, 39.00, '2026-03-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:05:40', '2026-02-10 04:05:40'),
(38, 14, 30, 2, 6, 39.00, '2026-04-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:05:40', '2026-02-10 04:05:40'),
(39, 14, 30, 3, 6, 39.00, '2026-05-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:05:40', '2026-02-10 04:05:40'),
(40, 14, 30, 4, 6, 39.00, '2026-06-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:05:40', '2026-02-10 04:05:40'),
(41, 14, 30, 5, 6, 39.00, '2026-07-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:05:40', '2026-02-10 04:05:40'),
(42, 14, 30, 6, 6, 39.00, '2026-08-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:05:40', '2026-02-10 04:05:40'),
(43, 14, 34, 1, 6, 75.00, '2026-03-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:13:12', '2026-02-10 04:13:12'),
(44, 14, 34, 2, 6, 75.00, '2026-04-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:13:12', '2026-02-10 04:13:12'),
(45, 14, 34, 3, 6, 75.00, '2026-05-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:13:12', '2026-02-10 04:13:12'),
(46, 14, 34, 4, 6, 75.00, '2026-06-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:13:12', '2026-02-10 04:13:12'),
(47, 14, 34, 5, 6, 75.00, '2026-07-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:13:12', '2026-02-10 04:13:12'),
(48, 14, 34, 6, 6, 75.00, '2026-08-10', 'PENDING', NULL, NULL, NULL, '2026-02-10 04:13:12', '2026-02-10 04:13:12'),
(49, 17, 6, 1, 3, 41.00, '2026-03-12', 'PAID', NULL, NULL, 'order_SL7TXoFmSHamPJ', '2026-02-12 08:53:15', '2026-02-27 03:54:55'),
(50, 17, 6, 2, 3, 41.00, '2026-04-12', 'PENDING', NULL, NULL, NULL, '2026-02-12 08:53:15', '2026-02-12 08:53:15'),
(51, 17, 6, 3, 3, 41.00, '2026-05-12', 'PENDING', NULL, NULL, NULL, '2026-02-12 08:53:16', '2026-02-12 08:53:16'),
(52, 18, 4, 1, 12, 10.00, '2026-03-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(53, 18, 4, 2, 12, 10.00, '2026-04-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(54, 18, 4, 3, 12, 10.00, '2026-05-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(55, 18, 4, 4, 12, 10.00, '2026-06-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(56, 18, 4, 5, 12, 10.00, '2026-07-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(57, 18, 4, 6, 12, 10.00, '2026-08-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(58, 18, 4, 7, 12, 10.00, '2026-09-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(59, 18, 4, 8, 12, 10.00, '2026-10-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(60, 18, 4, 9, 12, 10.00, '2026-11-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(61, 18, 4, 10, 12, 10.00, '2026-12-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(62, 18, 4, 11, 12, 10.00, '2027-01-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(63, 18, 4, 12, 12, 10.00, '2027-02-13', 'PENDING', NULL, NULL, NULL, '2026-02-13 06:23:21', '2026-02-13 06:23:21'),
(64, 17, 35, 1, 3, 400.00, '2026-03-16', 'PAID', NULL, NULL, NULL, '2026-02-16 06:38:10', '2026-02-21 01:56:51'),
(65, 17, 35, 2, 3, 400.00, '2026-04-16', 'PAID', '2026-02-21 02:05:03', 'pay_SIiOPg9lIvf1Pz', 'order_SIiO4g1YpAoc00', '2026-02-16 06:38:10', '2026-02-21 02:05:03'),
(66, 17, 35, 3, 3, 400.00, '2026-05-16', 'PAID', '2026-02-21 07:33:46', 'pay_SInzbh98DVN8tk', 'order_SInzJcTUfc7r3c', '2026-02-16 06:38:10', '2026-02-21 07:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `course_id`, `title`, `description`, `start_time`, `end_time`, `duration`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 4, 'Practice 2', 'asdasd', '2026-03-19 13:04:00', '2026-03-26 13:04:00', 30, 1, '2026-03-11 02:04:16', '2026-03-11 07:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `exam_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `created_at`, `updated_at`) VALUES
(2, 3, 'bnmbnm', '1', '2', '3', '4', 'D', '2026-03-11 05:24:30', '2026-03-11 05:24:30'),
(3, 3, 'bnmbnm', '1', '2', '3', '4', 'C', '2026-03-11 08:21:16', '2026-03-11 08:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_completions`
--

CREATE TABLE `lesson_completions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lesson_completions`
--

INSERT INTO `lesson_completions` (`id`, `student_id`, `lesson_id`, `completed_at`) VALUES
(1, 17, 18, '2026-02-18 13:35:24'),
(2, 17, 19, '2026-02-18 13:43:03'),
(3, 17, 2, '2026-02-18 13:44:21'),
(4, 17, 20, '2026-02-18 14:03:34'),
(5, 17, 21, '2026-02-18 14:06:09'),
(6, 17, 23, '2026-02-18 14:06:40'),
(7, 17, 15, '2026-02-18 14:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
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
(5, '2025_12_20_064321_create_categories_table', 2),
(6, '2025_12_20_064413_create_courses_table', 2),
(7, '2025_12_20_064500_create_student_interests_table', 2),
(8, '2025_12_24_070801_create_subjects_table', 2),
(9, '2025_12_24_071304_create_subject_materials_table', 2),
(10, '2026_01_03_090836_create_course_user_table', 2),
(11, '2026_01_06_093654_add_image_to_courses_table', 2),
(12, '2026_01_21_135227_create_payments_table', 2),
(13, '2026_01_28_110832_create_emi_payments_table', 2),
(14, '2026_02_04_092351_add_google_id_to_users_table', 2),
(15, '2026_02_06_113138_create_assignments_table', 2),
(16, '2026_02_06_113215_create_assignment_submissions_table', 2),
(17, '2026_02_06_121139_create_course_progress_table', 2),
(18, '2026_02_06_121351_create_lesson_completions_table', 2),
(19, '2026_02_06_122438_create_lessons_table', 2),
(20, '2026_02_11_105841_add_review_fields_to_assignment_submissions_table', 3),
(21, '2026_02_17_071916_add_fields_to_lessons_table', 4),
(22, '2026_02_17_091419_add_course_id_to_subject_materials', 5),
(23, '2026_03_10_065643_create_exams_table', 6),
(24, '2026_03_11_093024_create_exam_questions_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('amanraut799@gmail.com', '$2y$12$nfnguLaodIkRB5zTRrCNsOJrErbqFeeQ/eErdByywMI5XsSzp104W', '2026-03-07 00:26:32'),
('theswift321@gmail.com', '$2y$12$Am3mKjxgVEFAjJSmQTmPV.6GqubQBBKgq21OEjtdb.8TNHUQRPiea', '2026-03-09 00:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `razorpay_order_id` varchar(255) NOT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_signature` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `installment_no` tinyint(4) DEFAULT NULL,
  `total_installments` tinyint(4) DEFAULT NULL,
  `payment_type` enum('full','emi') NOT NULL DEFAULT 'full',
  `emi_months` int(11) DEFAULT NULL,
  `status` enum('created','paid','failed') NOT NULL DEFAULT 'created',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `course_id`, `razorpay_order_id`, `razorpay_payment_id`, `razorpay_signature`, `amount`, `installment_no`, `total_installments`, `payment_type`, `emi_months`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 4, 'order_S7I4kS38PxygKj', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-22 23:41:03', '2026-01-22 23:41:03'),
(2, 7, 4, 'order_S7I53823dggPvn', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-22 23:41:20', '2026-01-22 23:41:20'),
(3, 7, 4, 'order_S7IJIlA5TvCqcl', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-22 23:54:50', '2026-01-22 23:54:50'),
(4, 7, 4, 'order_S7IMRwaYo5BVLR', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-22 23:57:49', '2026-01-22 23:57:49'),
(5, 7, 4, 'order_S7IW9BLBj8ppnZ', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-23 00:07:00', '2026-01-23 00:07:00'),
(6, 7, 4, 'order_S7IaZsLo9JKPgl', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-23 00:11:11', '2026-01-23 00:11:11'),
(7, 7, 4, 'order_S7IeShsJHURA79', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-23 00:14:52', '2026-01-23 00:14:52'),
(8, 7, 4, 'order_S7Ij5wcmvF46j9', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-23 00:19:15', '2026-01-23 00:19:15'),
(9, 7, 4, 'order_S7Im8moAxmgIEC', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-23 00:22:08', '2026-01-23 00:22:08'),
(10, 7, 4, 'order_S7ImcF0tJIu81d', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-23 00:22:35', '2026-01-23 00:22:35'),
(11, 7, 4, 'order_S8Nybeit0DOHNI', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 18:06:28', '2026-01-25 18:06:28'),
(12, 7, 4, 'order_S8NyjzSuTdqIKL', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 18:06:36', '2026-01-25 18:06:36'),
(13, 7, 4, 'order_S8NzKrCJhe7w4U', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 18:07:10', '2026-01-25 18:07:10'),
(14, 7, 4, 'order_S8O7Ov0Df8wHRR', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 18:14:48', '2026-01-25 18:14:48'),
(15, 7, 4, 'order_S8OAAKSv9yraCR', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 18:17:25', '2026-01-25 18:17:25'),
(16, 7, 4, 'order_S8PFIF3XK0hyTM', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 19:20:58', '2026-01-25 19:20:58'),
(17, 7, 4, 'order_S8PFdmoDcCsmYa', NULL, NULL, 120.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 19:21:17', '2026-01-25 19:21:17'),
(18, 7, 4, 'order_S8QCyuuOi5Ir7k', 'pay_S8QDLbvnhnemDb', '26ecc345776da85cd471825e66b202a6dfd4ab6df71313d03465cdc7117875df', 120.00, NULL, NULL, 'full', NULL, 'paid', '2026-01-25 20:17:28', '2026-01-25 20:18:06'),
(19, 7, 6, 'order_S8STOOBB3dhqQQ', NULL, NULL, 41.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 22:30:19', '2026-01-25 22:30:19'),
(20, 7, 6, 'order_S8SUTTEdGFsqQ4', NULL, NULL, 20.50, NULL, NULL, 'full', NULL, 'created', '2026-01-25 22:31:20', '2026-01-25 22:31:20'),
(21, 7, 6, 'order_S8SUgcH8S43gDL', NULL, NULL, 10.25, NULL, NULL, 'full', NULL, 'created', '2026-01-25 22:31:32', '2026-01-25 22:31:32'),
(22, 7, 6, 'order_S8T1xAPlcZ5UjY', NULL, NULL, 123.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 23:03:02', '2026-01-25 23:03:02'),
(23, 7, 6, 'order_S8T5snD3jMYqNs', NULL, NULL, 41.00, NULL, NULL, 'full', NULL, 'created', '2026-01-25 23:06:45', '2026-01-25 23:06:45'),
(24, 7, 6, 'order_S8T8qrxZAdR1hp', NULL, NULL, 10.25, NULL, NULL, 'full', NULL, 'created', '2026-01-25 23:09:33', '2026-01-25 23:09:33'),
(25, 7, 6, 'order_S8TAFws9ZnpT9e', 'pay_S8TAaMDZiiCrAk', 'f0af9fbb96313c251ab7c237a9cc0a3822a49f70caf2d18e1f586354c940efc0', 20.50, NULL, NULL, 'full', NULL, 'paid', '2026-01-25 23:10:53', '2026-01-25 23:11:32'),
(26, 7, 30, 'order_S8TOUqD7jijTaa', 'pay_S8TOm9qsiX5dsN', 'b6e893affd739f0bfb38e4b184b9fd23f6ef5bdda51dd53e0579e2d64f8ff910', 39.00, NULL, NULL, 'full', NULL, 'paid', '2026-01-25 23:24:22', '2026-01-25 23:24:57'),
(32, 14, 4, 'order_S9BPY57rBV4bHO', 'pay_S9BQ53jlBfqkpi', '3446ba98b55aa3c092006889c9c09a92ec8c937b7ea12745af6a3d522cf54586', 40.00, NULL, NULL, 'full', NULL, 'paid', '2026-01-27 18:27:53', '2026-01-27 18:28:44'),
(34, 17, 4, 'order_SDH9ptxkGlcmpI', 'pay_SDHA3Yip5HXY1c', 'b28fa2e690e9fb7eaf7a03fe73836ffa6a28222362ac98992efd558c09595328', 10.00, NULL, NULL, 'emi', 12, 'paid', '2026-02-07 08:11:11', '2026-02-07 08:11:42'),
(35, 14, 6, 'order_SELOTy9mpmy5Nx', 'pay_SELOtZT0mjvdDr', '5ccb70133f7a4acfee4febb796133f0ee2991c57f6fa18ebfcb3078ed2e0be9e', 10.25, NULL, NULL, 'emi', 12, 'paid', '2026-02-10 00:58:50', '2026-02-10 00:59:33'),
(36, 14, 30, 'order_SEOY3284qVMSQm', NULL, NULL, 19.50, NULL, NULL, 'emi', 12, 'created', '2026-02-10 04:03:58', '2026-02-10 04:03:58'),
(37, 14, 30, 'order_SEOZqkrIpxRl8M', 'pay_SEOa6GMLLGYC77', 'c6ef028bf5d9955aa2d08837f899f2b2f9edf56814a5f0affd0f7a69b8be58ba', 39.00, NULL, NULL, 'emi', 6, 'paid', '2026-02-10 04:05:41', '2026-02-10 04:06:14'),
(39, 17, 6, 'order_SFGXuE14KRE0wj', 'pay_SFGYRaMEPmbgqp', '20b99faed486474d1c483fded588b5caa0a720db639a909073b544c00dd60935', 41.00, NULL, NULL, 'emi', 3, 'paid', '2026-02-12 08:53:16', '2026-02-12 08:54:06'),
(40, 18, 4, 'order_SFcWgJ7cbzyFyD', 'pay_SFcXpc7x09QJLr', '6839b9a7d96a8bc24cd2d40f00645de293f5270cb85d57f0ed5fcf543aa222c1', 10.00, NULL, NULL, 'emi', 12, 'paid', '2026-02-13 06:23:22', '2026-02-13 06:24:49'),
(41, 17, 35, 'order_SGoNi4DTFwD1EN', 'pay_SGoOHM2IgqhQzL', 'b4c02a216555f7a36f5ad37a47c73a58a4f20793cdee6da7087dd68961c6063a', 400.00, NULL, NULL, 'emi', 3, 'paid', '2026-02-16 06:38:12', '2026-02-16 06:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'a19703a4375aa68f95ad183f1bb11f35dfbf755514271dad27e230ae468d3a10', '[\"*\"]', '2026-02-07 07:09:22', NULL, '2026-02-07 06:51:06', '2026-02-07 07:09:22'),
(2, 'App\\Models\\User', 9, 'auth_token', 'e30107a7ef5aea3407798b5a72b6cc10f0c376cc2c97f9a9ad0fdb73c946189a', '[\"*\"]', '2026-02-07 07:42:50', NULL, '2026-02-07 07:10:16', '2026-02-07 07:42:50'),
(3, 'App\\Models\\User', 9, 'auth_token', '71adbab2653b65212925780fcf94fdbb6262b179e11b2fd8453d0f233988aad6', '[\"*\"]', NULL, NULL, '2026-02-07 07:43:19', '2026-02-07 07:43:19'),
(4, 'App\\Models\\User', 17, 'auth_token', '72fffc92b3f23d2f1f568e70fa14fd7844a99a2bc28674a32842861d08c6138a', '[\"*\"]', NULL, NULL, '2026-02-07 07:46:06', '2026-02-07 07:46:06'),
(5, 'App\\Models\\User', 17, 'auth_token', '1edc08687885d196992e28caeb8ba4cf972a25b9ae83550ee2957f7b10928947', '[\"*\"]', NULL, NULL, '2026-02-07 07:46:50', '2026-02-07 07:46:50'),
(6, 'App\\Models\\User', 17, 'auth_token', 'a37687e81d4e190edc48720faa51f294eab1eb3a5a66982af62f442c45625a72', '[\"*\"]', '2026-02-07 08:13:11', NULL, '2026-02-07 07:49:17', '2026-02-07 08:13:11'),
(7, 'App\\Models\\User', 17, 'auth_token', '62745e6549d91c2713e28de6ea3c84a920d5c4be4eade6f4d5e9f18490313278', '[\"*\"]', '2026-02-07 08:46:43', NULL, '2026-02-07 08:13:32', '2026-02-07 08:46:43'),
(8, 'App\\Models\\User', 9, 'auth_token', 'bb1355f778d469dab02aef8fd74d778fa7ad10cb7359b3110de7a936036cf20e', '[\"*\"]', NULL, NULL, '2026-02-09 03:42:35', '2026-02-09 03:42:35'),
(9, 'App\\Models\\User', 9, 'auth_token', '6768b3e8611a3b7fbcf03aecc0629064c661d58b2a667b9bfdcfef87618f0e4f', '[\"*\"]', '2026-02-09 05:33:42', NULL, '2026-02-09 03:42:47', '2026-02-09 05:33:42'),
(10, 'App\\Models\\User', 9, 'auth_token', '8a78aa588d992ea1af1cd2f114cd4eb79fbec1f192de462bc78072aaf76a4c56', '[\"*\"]', NULL, NULL, '2026-02-09 05:45:00', '2026-02-09 05:45:00'),
(11, 'App\\Models\\User', 9, 'auth_token', '3ae192e04ba70ebf57a9a479f2221ba1f12e5b35030a7f4a6e0140a974cc62a9', '[\"*\"]', '2026-02-09 06:55:05', NULL, '2026-02-09 05:46:02', '2026-02-09 06:55:05'),
(12, 'App\\Models\\User', 17, 'auth_token', '63126f51a0405641ccc8d6d4533ab55f3c2c2f52199c5ad2acee291223f9cfe4', '[\"*\"]', '2026-02-10 00:53:30', NULL, '2026-02-09 06:58:42', '2026-02-10 00:53:30'),
(13, 'App\\Models\\User', 14, 'auth_token', 'c703bf8199702fca7b081d7162c7abe8ee85d16b39e346c387986968442d1338', '[\"*\"]', '2026-02-10 01:48:34', NULL, '2026-02-10 00:58:01', '2026-02-10 01:48:34'),
(14, 'App\\Models\\User', 9, 'auth_token', '10968e3834afb1db590a6ede75ca22bdaf21807475d3a87bb66b8fa07d8953b1', '[\"*\"]', '2026-02-10 01:57:19', NULL, '2026-02-10 01:55:35', '2026-02-10 01:57:19'),
(15, 'App\\Models\\User', 14, 'auth_token', '8fbc43af7e9d714fc2c53b7f778c19e76aa431f46d675c6b9269ff8f4566b063', '[\"*\"]', '2026-02-10 06:25:17', NULL, '2026-02-10 01:57:57', '2026-02-10 06:25:17'),
(16, 'App\\Models\\User', 9, 'auth_token', 'd8303096eeba4a00a6ac329e8151b4a71fe6862d98b5421ca533b56a71754c52', '[\"*\"]', '2026-02-10 08:52:02', NULL, '2026-02-10 06:26:37', '2026-02-10 08:52:02'),
(17, 'App\\Models\\User', 17, 'auth_token', 'cafb5711768aee5b997fd9b16c9274160ab6777f7d9ef3c7d3d0c5371a3effe4', '[\"*\"]', '2026-02-10 08:53:23', NULL, '2026-02-10 08:52:36', '2026-02-10 08:53:23'),
(18, 'App\\Models\\User', 9, 'auth_token', 'df2c4cdd4c4f4b714c4e6ae6668c1ba7265763c0a9fea39eb7cf973713912c4e', '[\"*\"]', NULL, NULL, '2026-02-11 03:18:20', '2026-02-11 03:18:20'),
(19, 'App\\Models\\User', 9, 'auth_token', 'a60539cc371b3b8ef9b4b9eda6b843d31bf1ee897bfc469ba7b054762dafa6a3', '[\"*\"]', '2026-02-11 05:15:06', NULL, '2026-02-11 03:18:25', '2026-02-11 05:15:06'),
(20, 'App\\Models\\User', 9, 'auth_token', '310e272ae82f37f4d6f558310dc7ec5490745368762519eaa338523cfe029bd6', '[\"*\"]', '2026-02-11 05:40:44', NULL, '2026-02-11 05:17:03', '2026-02-11 05:40:44'),
(21, 'App\\Models\\User', 17, 'auth_token', '4e44cb787019b0c81aee83581d227247950d501a2623979198118940c022660c', '[\"*\"]', '2026-02-11 05:50:04', NULL, '2026-02-11 05:41:00', '2026-02-11 05:50:04'),
(22, 'App\\Models\\User', 9, 'auth_token', '33d73e9a4c42b28ce9e2a900ad35044f49862b45ff6349bc2c513e986de62844', '[\"*\"]', '2026-02-11 07:47:11', NULL, '2026-02-11 05:50:31', '2026-02-11 07:47:11'),
(23, 'App\\Models\\User', 14, 'auth_token', '1d5ba097df2239235fb7aa4a09ca7b787b703ad198f21d968ddf2a722f43e102', '[\"*\"]', '2026-02-11 07:52:26', NULL, '2026-02-11 07:50:51', '2026-02-11 07:52:26'),
(24, 'App\\Models\\User', 9, 'auth_token', '3d63ca2e7ff36e2226a513cae8894c4743c78ba8c08eb7177f957f217c5f28a8', '[\"*\"]', '2026-02-11 07:55:12', NULL, '2026-02-11 07:53:09', '2026-02-11 07:55:12'),
(25, 'App\\Models\\User', 17, 'auth_token', '5f9b671b2d49bc4afb440b230bb992fc7c5e2e68a1588cf118b447d97223fb69', '[\"*\"]', '2026-02-12 03:49:38', NULL, '2026-02-11 07:58:25', '2026-02-12 03:49:38'),
(26, 'App\\Models\\User', 17, 'auth_token', 'e0c308345c3d284af4001f5c4492efe6d6172ae58e2df495e6fe4f6b44db3855', '[\"*\"]', '2026-02-12 04:22:51', NULL, '2026-02-12 04:20:41', '2026-02-12 04:22:51'),
(27, 'App\\Models\\User', 17, 'auth_token', 'fa76fde3ca0f8f608b5a84183c15343334d0055b0ef26262c9783b5a12c892d9', '[\"*\"]', NULL, NULL, '2026-02-12 06:32:16', '2026-02-12 06:32:16'),
(28, 'App\\Models\\User', 17, 'auth_token', '7b205d63c71ecc4f39e67e63cbdc061b9011fa5cc9d5e8741f5e45f621e872ac', '[\"*\"]', '2026-02-12 08:54:10', NULL, '2026-02-12 06:32:21', '2026-02-12 08:54:10'),
(29, 'App\\Models\\User', 17, 'auth_token', 'c1cbd5f538897d83f84b803c7e0276102c4ef23235e3fb3e28a781bcb68a7a61', '[\"*\"]', NULL, NULL, '2026-02-13 00:09:06', '2026-02-13 00:09:06'),
(30, 'App\\Models\\User', 17, 'auth_token', 'a889f6d1282e01b024513e9e35947bb2d02e05f17fcc0fb3c83efecd29a4b3d3', '[\"*\"]', '2026-02-13 00:10:44', NULL, '2026-02-13 00:10:01', '2026-02-13 00:10:44'),
(31, 'App\\Models\\User', 17, 'auth_token', '86063a9e637bc199d6906c23ac8e940caf364cf32fab009e0cecd5dc64d105c9', '[\"*\"]', '2026-02-13 00:12:26', NULL, '2026-02-13 00:10:51', '2026-02-13 00:12:26'),
(32, 'App\\Models\\User', 17, 'auth_token', '1a77f7428cae5fb3e314b549b7eb5242f370b53ca8a37d219e772f03cb747ad3', '[\"*\"]', '2026-02-13 00:22:39', NULL, '2026-02-13 00:22:31', '2026-02-13 00:22:39'),
(33, 'App\\Models\\User', 9, 'auth_token', '2f6b2ef34e2f461767574b6281931dbc2d6cd867a55cc2ad4739b751ba0cc0ec', '[\"*\"]', NULL, NULL, '2026-02-13 00:22:56', '2026-02-13 00:22:56'),
(34, 'App\\Models\\User', 11, 'auth_token', '7f6244bdb4392afb4242c8e76c590a2e4a3e232fc185e1748fd485c2e4f9de9e', '[\"*\"]', NULL, NULL, '2026-02-13 00:23:18', '2026-02-13 00:23:18'),
(35, 'App\\Models\\User', 14, 'auth_token', 'f59cf0294c4a0f93ba01f7e359f0ee5fa615b010253402c7f4bd66bfa7c5303a', '[\"*\"]', '2026-02-13 00:23:43', NULL, '2026-02-13 00:23:35', '2026-02-13 00:23:43'),
(36, 'App\\Models\\User', 9, 'auth_token', '898b7e6a610932702bd31a5e52d12e73163c915bc7292bb9767f2b4a2a80ec43', '[\"*\"]', '2026-02-13 00:39:40', NULL, '2026-02-13 00:24:09', '2026-02-13 00:39:40'),
(37, 'App\\Models\\User', 17, 'auth_token', '594dd99856e191fe234ebe3d36b0a6cce3260e29b9555a2a0a33aa91e5a45da1', '[\"*\"]', '2026-02-13 05:57:15', NULL, '2026-02-13 00:43:53', '2026-02-13 05:57:15'),
(38, 'App\\Models\\User', 9, 'auth_token', 'a0c398189bf40e415742ae257281fcec5dca93d4857bf7bf7f5096fbf47131e0', '[\"*\"]', '2026-02-13 06:02:25', NULL, '2026-02-13 06:00:44', '2026-02-13 06:02:25'),
(39, 'App\\Models\\User', 17, 'auth_token', '0b0f13deb4e8fecd32b6c998bf5d309b92ae3ba1686a655997cfec4c2e76b8e0', '[\"*\"]', '2026-02-13 06:02:42', NULL, '2026-02-13 06:02:40', '2026-02-13 06:02:42'),
(40, 'App\\Models\\User', 14, 'auth_token', '97e512e4f66f56f554831af0fb7a7c0867ef965e8af8985103b75dd3b77fcc33', '[\"*\"]', '2026-02-13 06:14:44', NULL, '2026-02-13 06:04:15', '2026-02-13 06:14:44'),
(41, 'App\\Models\\User', 18, 'auth_token', '582beac31f485cf8b9ca842b1b890ca5d28b620c70c15779dab5e8f95af62959', '[\"*\"]', '2026-02-13 06:37:19', NULL, '2026-02-13 06:20:26', '2026-02-13 06:37:19'),
(42, 'App\\Models\\User', 9, 'auth_token', '562f118fe817e6c3c339955e8cb0062620ab6b2c65454ccb75a4c63fc75e726b', '[\"*\"]', '2026-02-13 06:49:21', NULL, '2026-02-13 06:38:08', '2026-02-13 06:49:21'),
(43, 'App\\Models\\User', 17, 'auth_token', '1868db8e2bf3b6a6b385ddb7dd8ac9de8ad5d76d663141752281daec0af2809d', '[\"*\"]', '2026-02-16 00:22:32', NULL, '2026-02-13 06:58:49', '2026-02-16 00:22:32'),
(44, 'App\\Models\\User', 14, 'auth_token', 'fc1b78496c113ddc31a55f1769f9d49eeda47e11c1deedbb16eda8b69ba37532', '[\"*\"]', '2026-02-16 00:43:07', NULL, '2026-02-16 00:26:19', '2026-02-16 00:43:07'),
(45, 'App\\Models\\User', 9, 'auth_token', 'ff793b762e672954de1e2897ba78a86f04ed06155011cf811d7ff1a31c8fb442', '[\"*\"]', '2026-02-16 01:58:58', NULL, '2026-02-16 00:59:28', '2026-02-16 01:58:58'),
(46, 'App\\Models\\User', 9, 'auth_token', '0de997d29795d38165294dd0b7c833bd01d1c93b15585fa4aaba43b018403990', '[\"*\"]', '2026-02-16 06:36:16', NULL, '2026-02-16 01:59:23', '2026-02-16 06:36:16'),
(47, 'App\\Models\\User', 17, 'auth_token', '1bc251eecc0f5d86b8a2878e67348f2bb351ff2fa129092fc1fe1347db17e2c9', '[\"*\"]', '2026-02-16 06:43:14', NULL, '2026-02-16 06:37:30', '2026-02-16 06:43:14'),
(48, 'App\\Models\\User', 9, 'auth_token', '523e4c928154830aa99c1c0119d71a4aa77cef5d828cf5c0581dd0c290a195ba', '[\"*\"]', '2026-02-16 06:45:48', NULL, '2026-02-16 06:45:09', '2026-02-16 06:45:48'),
(49, 'App\\Models\\User', 17, 'auth_token', '70f7acf4d6d64a3b7ae513d5c747d5380e4f0fbc27ca4f9491f67cc8e77cfb0d', '[\"*\"]', '2026-02-16 06:47:00', NULL, '2026-02-16 06:46:29', '2026-02-16 06:47:00'),
(50, 'App\\Models\\User', 9, 'auth_token', 'ea9b1a0bb8ce1423a774a5cc0a85fef4bb86f5497565465d50253cf28c4557aa', '[\"*\"]', '2026-02-16 06:48:11', NULL, '2026-02-16 06:47:19', '2026-02-16 06:48:11'),
(51, 'App\\Models\\User', 9, 'auth_token', '46a15fe9d2193b3f74dcc99309f1678343a71f2bb9236993cbf64763ba8aa0f4', '[\"*\"]', NULL, NULL, '2026-02-16 06:48:24', '2026-02-16 06:48:24'),
(52, 'App\\Models\\User', 17, 'auth_token', '9539b4a03766498b5e918a0131e33756ee306284b8518cfdcaa8ab10a9f9a868', '[\"*\"]', '2026-02-16 08:24:13', NULL, '2026-02-16 06:48:35', '2026-02-16 08:24:13'),
(53, 'App\\Models\\User', 9, 'auth_token', 'e7dd85cdfcc3ad6d7da8a2c771bdca90f9b2c36d2f0834938224c7ae94ee3bcd', '[\"*\"]', '2026-02-16 08:29:36', NULL, '2026-02-16 08:24:23', '2026-02-16 08:29:36'),
(54, 'App\\Models\\User', 17, 'auth_token', '33fe3f077077a71661c60a598a6d6211fc185f8cd2a261437bd0a9b04608b964', '[\"*\"]', '2026-02-17 00:11:12', NULL, '2026-02-16 08:29:54', '2026-02-17 00:11:12'),
(55, 'App\\Models\\User', 9, 'auth_token', '7e5b8b6c694b34bd64959cfc53e214064424b3de596b654f70ee3926103331e4', '[\"*\"]', '2026-02-17 00:39:08', NULL, '2026-02-17 00:26:24', '2026-02-17 00:39:08'),
(56, 'App\\Models\\User', 17, 'auth_token', 'f870a7cecfe4c88a118f8eb054e9d2d0b280c709d2079e52eddf743676c9c070', '[\"*\"]', '2026-02-17 00:50:23', NULL, '2026-02-17 00:50:03', '2026-02-17 00:50:23'),
(57, 'App\\Models\\User', 17, 'auth_token', '00bc7baa9be6fa317a5ff59d24933ed6e7bbd6501971fe7f9bc3c9de9e703abc', '[\"*\"]', NULL, NULL, '2026-02-17 00:51:27', '2026-02-17 00:51:27'),
(58, 'App\\Models\\User', 17, 'auth_token', 'f43c2ba9ae2641a40527d5a91cf7b9b69e064d3e9c2265c9a50a69a89ed8ad0e', '[\"*\"]', '2026-02-17 02:04:47', NULL, '2026-02-17 00:52:31', '2026-02-17 02:04:47'),
(59, 'App\\Models\\User', 17, 'auth_token', '4ad5db920f6de89ae931b7392187d8642a54dd4b8c3319be21ca3f9a3f91cb25', '[\"*\"]', '2026-02-17 05:29:23', NULL, '2026-02-17 03:21:05', '2026-02-17 05:29:23'),
(60, 'App\\Models\\User', 14, 'auth_token', 'b28c18a3fb77b9ce30eb1ac34ebe03de1d80b55517d94746e41e88b093567c86', '[\"*\"]', '2026-02-17 06:00:43', NULL, '2026-02-17 05:30:54', '2026-02-17 06:00:43'),
(61, 'App\\Models\\User', 9, 'auth_token', 'd35ba7c74437f07c15cf382277f69bc6a3c6cbab7f15d2b228730a125ecdd8a8', '[\"*\"]', '2026-02-17 06:13:46', NULL, '2026-02-17 06:13:41', '2026-02-17 06:13:46'),
(62, 'App\\Models\\User', 17, 'auth_token', 'bdce330abc8856586ec5b8ce1e493e977cc6177e9b6255bfbf5c25a8ff742886', '[\"*\"]', '2026-02-17 06:16:09', NULL, '2026-02-17 06:15:33', '2026-02-17 06:16:09'),
(63, 'App\\Models\\User', 9, 'auth_token', '5b02ec847721c59301735525c71ae77aff3e65d03608fc3d6bbd762107c1590d', '[\"*\"]', '2026-02-17 07:01:54', NULL, '2026-02-17 06:34:03', '2026-02-17 07:01:54'),
(64, 'App\\Models\\User', 17, 'auth_token', '27458beb6a2d384380103789ffb3dd10c8e393682d4f9898feda21ab70d8ce51', '[\"*\"]', NULL, NULL, '2026-02-17 23:45:44', '2026-02-17 23:45:44'),
(65, 'App\\Models\\User', 17, 'auth_token', 'ef1fe86bccbf7b15d6d532b1d6b4ffc76e4dc2ab703b9ca1da994131fe761c09', '[\"*\"]', '2026-02-18 05:00:53', NULL, '2026-02-17 23:45:47', '2026-02-18 05:00:53'),
(66, 'App\\Models\\User', 17, 'auth_token', '8f376ed8a64db71d0139138c7bfa02c4b4c1ff8414eccd48c94fb7d6500fb4a3', '[\"*\"]', '2026-02-18 05:14:33', NULL, '2026-02-18 05:01:11', '2026-02-18 05:14:33'),
(67, 'App\\Models\\User', 9, 'auth_token', 'fdc642bfae80d36ad3a34c5cb930a0c280e9e25f3a2e2af3f9f8588cae1ab32e', '[\"*\"]', NULL, NULL, '2026-02-18 05:17:01', '2026-02-18 05:17:01'),
(68, 'App\\Models\\User', 17, 'auth_token', '09c72f58e750eac460029e9648972ac2ed62b332b9da9cbfb5f18976217b8cd1', '[\"*\"]', NULL, NULL, '2026-02-18 05:22:08', '2026-02-18 05:22:08'),
(69, 'App\\Models\\User', 17, 'auth_token', '02a81eec9d5fc0c001f73dcc6beffb89f631f200d5fcb752a0b12cf58cdfb997', '[\"*\"]', '2026-02-18 05:50:46', NULL, '2026-02-18 05:31:17', '2026-02-18 05:50:46'),
(70, 'App\\Models\\User', 17, 'auth_token', 'd273087d15cd29aba557d8918a5ba632615e2953246bf801617463ec00097fcb', '[\"*\"]', '2026-02-18 06:38:21', NULL, '2026-02-18 05:50:55', '2026-02-18 06:38:21'),
(71, 'App\\Models\\User', 17, 'auth_token', '8c4ac62da5ae4c4b092e88ca5dddff6e59dae3d51535a9b71d813bdcad26fb02', '[\"*\"]', '2026-02-18 06:55:44', NULL, '2026-02-18 06:38:32', '2026-02-18 06:55:44'),
(72, 'App\\Models\\User', 17, 'auth_token', 'c435e64501c5fe88dfa5ec3bcbdbbb55a9381caa3f8549d97bce41e8df4b9067', '[\"*\"]', '2026-02-18 07:45:22', NULL, '2026-02-18 07:35:41', '2026-02-18 07:45:22'),
(73, 'App\\Models\\User', 17, 'auth_token', '2af2ee083aa9ff981d6e6fb157fc618e946a487e58478945edf112cdcdf10558', '[\"*\"]', '2026-02-18 08:06:27', NULL, '2026-02-18 07:45:29', '2026-02-18 08:06:27'),
(74, 'App\\Models\\User', 17, 'auth_token', 'b0526d2709ab277c1a5011ba7db0b170c33cf98925095c80378ac70a27fc6227', '[\"*\"]', '2026-02-18 08:50:06', NULL, '2026-02-18 08:06:40', '2026-02-18 08:50:06'),
(75, 'App\\Models\\User', 17, 'auth_token', '978b0c0a1b809836d9c7657756e9ffeecbc94241e1f03e669afceaae6f2cd8c9', '[\"*\"]', NULL, NULL, '2026-02-18 23:37:55', '2026-02-18 23:37:55'),
(76, 'App\\Models\\User', 9, 'auth_token', '9de99214c1a699b73f5c2700382cb15ac2c505f82668976eeaad1a8a08f6b02b', '[\"*\"]', NULL, NULL, '2026-02-18 23:38:11', '2026-02-18 23:38:11'),
(77, 'App\\Models\\User', 17, 'auth_token', '07db57a35e2d644cbbc8da999cb0113fb52465ad9307a40c67876aa478788e79', '[\"*\"]', '2026-02-19 08:03:50', NULL, '2026-02-18 23:38:23', '2026-02-19 08:03:50'),
(78, 'App\\Models\\User', 17, 'auth_token', '43537697806dbe2b3dac781107db40897d455cd44ed88041769b70ab890cc40f', '[\"*\"]', '2026-02-19 08:21:06', NULL, '2026-02-19 08:04:04', '2026-02-19 08:21:06'),
(79, 'App\\Models\\User', 9, 'auth_token', '0b888f865d753d0b01da939ce0d43b5d310a980cec683e5902d2294728159ec5', '[\"*\"]', NULL, NULL, '2026-02-20 01:34:20', '2026-02-20 01:34:20'),
(80, 'App\\Models\\User', 17, 'auth_token', '60c50a4f4b18a2c9d761f93ed8c7eadb630dbd2cebbf0d8d9723aa0349836383', '[\"*\"]', '2026-02-20 05:26:31', NULL, '2026-02-20 01:34:37', '2026-02-20 05:26:31'),
(81, 'App\\Models\\User', 17, 'auth_token', 'fb8d4bfffe2cfb4db102f216b8fdf6be3f81fbf492a7c8cab1ae96f81a15e540', '[\"*\"]', '2026-02-20 05:38:16', NULL, '2026-02-20 05:34:50', '2026-02-20 05:38:16'),
(82, 'App\\Models\\User', 14, 'auth_token', '3d66de5296d942f49b776fb628656fcffd52b505ef4a77adf2d3e2330f65a71a', '[\"*\"]', '2026-02-20 08:56:09', NULL, '2026-02-20 05:38:45', '2026-02-20 08:56:09'),
(83, 'App\\Models\\User', 9, 'auth_token', '49cefd1bfc3bce94dc3f162687a61f58330641e8b809d6a1b743a7975bdc4756', '[\"*\"]', NULL, NULL, '2026-02-20 23:44:37', '2026-02-20 23:44:37'),
(84, 'App\\Models\\User', 9, 'auth_token', '9854af8124e2844186aa4988dd67b4c40fade43cc6b3339e6b476edbcb1d76df', '[\"*\"]', NULL, NULL, '2026-02-20 23:58:43', '2026-02-20 23:58:43'),
(85, 'App\\Models\\User', 17, 'auth_token', '630278caed3464d904f915b1a12cea75f77036e3fc2408f06dcb6772fe41fd43', '[\"*\"]', NULL, NULL, '2026-02-20 23:59:58', '2026-02-20 23:59:58'),
(86, 'App\\Models\\User', 9, 'auth_token', '7556932483c01e046c2e7eb06ff9fb605e8e447fcc977b13bcc6342835f37553', '[\"*\"]', NULL, NULL, '2026-02-21 00:00:25', '2026-02-21 00:00:25'),
(87, 'App\\Models\\User', 9, 'auth_token', '8593181c9090d70bffe049392d4620da4a32056806ea007e70ad9b3a395a1e3a', '[\"*\"]', NULL, NULL, '2026-02-21 00:01:30', '2026-02-21 00:01:30'),
(88, 'App\\Models\\User', 9, 'auth_token', 'd76c5ebb14e71be1a9f46d2f039dd49d95be30ae0b2286d427dfcd5a988329ee', '[\"*\"]', NULL, NULL, '2026-02-21 00:05:07', '2026-02-21 00:05:07'),
(89, 'App\\Models\\User', 9, 'auth_token', 'b83eeaa3dc77ee966600c109959e6089c9197f3fc173895b264b487d48f3fce0', '[\"*\"]', NULL, NULL, '2026-02-21 00:05:31', '2026-02-21 00:05:31'),
(90, 'App\\Models\\User', 9, 'auth_token', '623fb7ed3d7be6b207d07a644135826c857a818eb6b00f91549bcd33bdf775a0', '[\"*\"]', NULL, NULL, '2026-02-21 00:09:52', '2026-02-21 00:09:52'),
(91, 'App\\Models\\User', 9, 'auth_token', '77e827be052bb8655e13655c62cd1b5c1beca2bc1e05687d9aafec2b1f130b11', '[\"*\"]', NULL, NULL, '2026-02-21 00:11:19', '2026-02-21 00:11:19'),
(92, 'App\\Models\\User', 17, 'auth_token', '3cc8a29937193c4ab20f8a58f25a149fee62beb49f27ed76174d83ab4853270c', '[\"*\"]', '2026-02-21 01:55:13', NULL, '2026-02-21 00:11:36', '2026-02-21 01:55:13'),
(93, 'App\\Models\\User', 17, 'auth_token', 'd7539e70cf557aa51051f694455dadd925a9190b5edaff482b411973de0b5480', '[\"*\"]', '2026-02-21 01:57:25', NULL, '2026-02-21 01:55:24', '2026-02-21 01:57:25'),
(94, 'App\\Models\\User', 17, 'auth_token', '0bdc1fdfa60bfa4f21af88a11feb25e55f33586d61940259112c19ae3f39fff7', '[\"*\"]', '2026-02-21 07:47:12', NULL, '2026-02-21 02:03:42', '2026-02-21 07:47:12'),
(95, 'App\\Models\\User', 9, 'auth_token', '467da704410a16031afcd14c4a22c210d7d37b30090d5834a9f69bd641e1859a', '[\"*\"]', '2026-02-21 08:16:45', NULL, '2026-02-21 07:47:36', '2026-02-21 08:16:45'),
(96, 'App\\Models\\User', 17, 'auth_token', 'c2bd0382d09d9313443db13b14e533bef33e57e5cbdf65ce1ca116190195b050', '[\"*\"]', '2026-02-22 23:33:43', NULL, '2026-02-21 08:17:07', '2026-02-22 23:33:43'),
(97, 'App\\Models\\User', 17, 'auth_token', '0f573b22a6b8bb2e97ad2422c40f5de537e003d3e5cbdbbce34296ecd7f6b1e2', '[\"*\"]', NULL, NULL, '2026-02-22 23:34:41', '2026-02-22 23:34:41'),
(98, 'App\\Models\\User', 9, 'auth_token', '949cf4741a02bedf7ce9570ce58c2095deb82ebed922a1fef25d9356232f06e0', '[\"*\"]', '2026-02-23 01:00:47', NULL, '2026-02-22 23:34:52', '2026-02-23 01:00:47'),
(99, 'App\\Models\\User', 9, 'auth_token', '2d650ab7a64e26bf0f6b33396922508d5e9668457889f4ac7c5becca6665d1ba', '[\"*\"]', '2026-02-23 23:36:39', NULL, '2026-02-23 01:01:23', '2026-02-23 23:36:39'),
(100, 'App\\Models\\User', 9, 'auth_token', 'c4ac0f94f08818ec415049dd465f434514996b410b7d06b4384a81d0993cfc09', '[\"*\"]', NULL, NULL, '2026-02-23 23:37:04', '2026-02-23 23:37:04'),
(101, 'App\\Models\\User', 17, 'auth_token', '24b09e5365c0fc87e4cbc205bd40a54d18cd116651a6e5b77ee8fd59f43c4ccb', '[\"*\"]', '2026-02-24 00:01:20', NULL, '2026-02-23 23:37:06', '2026-02-24 00:01:20'),
(102, 'App\\Models\\User', 9, 'auth_token', 'aa0ecc387b2aca0c14f956cfb7a5ade1d09ce2c3f5806e4649928e38b4f9f492', '[\"*\"]', NULL, NULL, '2026-02-24 00:03:15', '2026-02-24 00:03:15'),
(103, 'App\\Models\\User', 17, 'auth_token', 'a41b988777c54c983e8da0adc05562f67d6ee31e3cc7240f3c1dd6eb41dc2445', '[\"*\"]', '2026-02-24 08:54:45', NULL, '2026-02-24 00:03:23', '2026-02-24 08:54:45'),
(104, 'App\\Models\\User', 9, 'auth_token', '78b0ee8b886675a45b804721d4205909ba18ce9dcc5266510a55e4fca57daffb', '[\"*\"]', NULL, NULL, '2026-02-24 08:56:11', '2026-02-24 08:56:11'),
(105, 'App\\Models\\User', 9, 'auth_token', '589b6883e059c8f861b15b7f603dccaca81add4c4af509d228aeca9b133ac026', '[\"*\"]', NULL, NULL, '2026-02-24 08:56:27', '2026-02-24 08:56:27'),
(106, 'App\\Models\\User', 17, 'auth_token', '020356d5a53df9ef60d83bcdc2c19007d25462736c6ec5000f61f40f8e3d947a', '[\"*\"]', NULL, NULL, '2026-02-24 08:57:44', '2026-02-24 08:57:44'),
(107, 'App\\Models\\User', 9, 'auth_token', '62b8c728fd933da9fedc48639dbb389569d49303c882578fea8e19fe024353b1', '[\"*\"]', NULL, NULL, '2026-02-24 23:40:38', '2026-02-24 23:40:38'),
(108, 'App\\Models\\User', 17, 'auth_token', '09ee05b661c9c4522374a92da87cb04df5b83edd5f2c9e0f2addded1c1cac93f', '[\"*\"]', '2026-02-24 23:42:28', NULL, '2026-02-24 23:40:44', '2026-02-24 23:42:28'),
(109, 'App\\Models\\User', 9, 'auth_token', '2a565b21d21e503d84d1a3d8a952efefc38d36dab4811537133b06b6742b6a9a', '[\"*\"]', NULL, NULL, '2026-02-24 23:51:31', '2026-02-24 23:51:31'),
(110, 'App\\Models\\User', 9, 'auth_token', '25842b3bf6b8559867818d95d0d4dcfb9ada33c8dc6b615dfe32f6fbd6049ee6', '[\"*\"]', NULL, NULL, '2026-02-24 23:55:59', '2026-02-24 23:55:59'),
(111, 'App\\Models\\User', 9, 'auth_token', '9d04fd0f49dbea35ff203609e1b519eee6c3fd7721b1260c401982718f270259', '[\"*\"]', NULL, NULL, '2026-02-25 00:10:12', '2026-02-25 00:10:12'),
(112, 'App\\Models\\User', 9, 'auth_token', '9841e9d19822206a75664a4811ade3ac0b125931474a3a5b54d86445a3de6bd6', '[\"*\"]', NULL, NULL, '2026-02-25 00:10:41', '2026-02-25 00:10:41'),
(113, 'App\\Models\\User', 9, 'auth_token', '35fda3ed83814149462743dba6b522fdaadbe57e653b78a843c857c1dd831d43', '[\"*\"]', NULL, NULL, '2026-02-25 00:17:13', '2026-02-25 00:17:13'),
(114, 'App\\Models\\User', 17, 'auth_token', 'b005396ad6be6dfc2701309756f034193281ee6ab122ad19b996490063bc33b2', '[\"*\"]', NULL, NULL, '2026-02-25 00:18:39', '2026-02-25 00:18:39'),
(115, 'App\\Models\\User', 9, 'auth_token', '006994e5c6d1f597fd0827926f8e2b0b0e616f5b1175e7a0ca6a76aefd51cb75', '[\"*\"]', NULL, NULL, '2026-02-25 00:29:41', '2026-02-25 00:29:41'),
(116, 'App\\Models\\User', 9, 'auth_token', '47a789813d449c5b2445fbe35b419f594a0463f7fe6365183c59c844881e31ef', '[\"*\"]', NULL, NULL, '2026-02-25 00:31:32', '2026-02-25 00:31:32'),
(117, 'App\\Models\\User', 9, 'auth_token', '7e7bb8d6d2a7ad314c1202fc7663b36e899ebcdc7bd8f0b16363908754374ed7', '[\"*\"]', NULL, NULL, '2026-02-25 00:32:53', '2026-02-25 00:32:53'),
(118, 'App\\Models\\User', 9, 'auth_token', '660bc9f0e7e8fe2ee7404578935bce8d927f835c5f4ac50d9824cfa9d4468230', '[\"*\"]', NULL, NULL, '2026-02-25 00:33:20', '2026-02-25 00:33:20'),
(119, 'App\\Models\\User', 9, 'auth_token', '13cd29f1aea29c08a431e94d16eb73e1c7e9e70b389edf530083ec7a859a805b', '[\"*\"]', NULL, NULL, '2026-02-25 00:36:22', '2026-02-25 00:36:22'),
(120, 'App\\Models\\User', 17, 'auth_token', '1d965cd44c492fc41f1268aeca4bc618e90622eb9f65804e16d69d91f2cbc80a', '[\"*\"]', '2026-02-25 00:41:21', NULL, '2026-02-25 00:39:51', '2026-02-25 00:41:21'),
(121, 'App\\Models\\User', 9, 'auth_token', 'c0768cf6a19d2cd6ed4cb1a651de68dfca9b59e3d119baed4b77936c9929eb4f', '[\"*\"]', '2026-02-25 03:16:12', NULL, '2026-02-25 00:51:17', '2026-02-25 03:16:12'),
(122, 'App\\Models\\User', 9, 'auth_token', 'e5e44bbca4e9dd565df8ff5b8aa9c410c416c69cce5deec051ba8a9cd9bdd7e5', '[\"*\"]', '2026-02-25 08:23:21', NULL, '2026-02-25 03:16:32', '2026-02-25 08:23:21'),
(123, 'App\\Models\\User', 17, 'auth_token', '8d7a5c51c8a31acf8aef38de7057d99863902c1d9f1ebe0c708ade19cb896b41', '[\"*\"]', NULL, NULL, '2026-02-25 08:23:42', '2026-02-25 08:23:42'),
(124, 'App\\Models\\User', 17, 'auth_token', 'efc5fed6d211ba3fe6a431536cda0fc86c6facc1065cf5bc8899eaeca200d8a7', '[\"*\"]', '2026-02-25 08:29:16', NULL, '2026-02-25 08:23:45', '2026-02-25 08:29:16'),
(125, 'App\\Models\\User', 9, 'auth_token', '541d42dd198ff2558763665bbbc321483dc7dbc12311b140ed9bb5b9f80d8e9e', '[\"*\"]', '2026-02-25 08:56:53', NULL, '2026-02-25 08:31:05', '2026-02-25 08:56:53'),
(126, 'App\\Models\\User', 17, 'auth_token', '2f885cdaa6a1e1b8825373b0023123ecb2e23184479f43176c87d8ddbf97a4a3', '[\"*\"]', '2026-02-26 00:37:55', NULL, '2026-02-25 08:57:16', '2026-02-26 00:37:55'),
(127, 'App\\Models\\User', 17, 'auth_token', '2950af9e8c755f0dab0427cc47b077cd51885da2b89b48c38c5220e22a10434c', '[\"*\"]', '2026-02-26 00:38:39', NULL, '2026-02-26 00:38:29', '2026-02-26 00:38:39'),
(128, 'App\\Models\\User', 9, 'auth_token', '797fbfdb6b887d22aeba3102f38014a0df2da0879bda2e2887e89bb2eeaf7e1a', '[\"*\"]', '2026-02-26 05:39:24', NULL, '2026-02-26 00:38:48', '2026-02-26 05:39:24'),
(129, 'App\\Models\\User', 17, 'auth_token', '83b9a9d22e3fbd9d154e058a3c77b8a7741e6cd7cabf7b636a00da2edd1e204b', '[\"*\"]', '2026-02-26 07:41:03', NULL, '2026-02-26 05:40:06', '2026-02-26 07:41:03'),
(130, 'App\\Models\\User', 17, 'auth_token', '0f9670c1f7377d5a318c4ca1f899ebbdd135f002b939124eae5b0d4668c7c7dd', '[\"*\"]', '2026-02-27 07:34:35', NULL, '2026-02-26 07:41:13', '2026-02-27 07:34:35'),
(131, 'App\\Models\\User', 17, 'auth_token', 'adb133cbd3fa5ef24d38aeffff0fe0985597181b8c6bdc5744d28088eebddaf6', '[\"*\"]', '2026-03-06 23:47:06', NULL, '2026-02-27 07:37:32', '2026-03-06 23:47:06'),
(132, 'App\\Models\\User', 17, 'auth_token', 'b47424bb9053447124d1a8f9fb48fbbda7df7fc827fcbecab8413ff3a1f41aea', '[\"*\"]', '2026-03-07 00:02:33', NULL, '2026-03-06 23:48:03', '2026-03-07 00:02:33'),
(133, 'App\\Models\\User', 9, 'auth_token', '9dd38ccbe89976540a42d67b102b82f5053fa291e11020f93957de9356230d85', '[\"*\"]', NULL, NULL, '2026-03-07 00:02:46', '2026-03-07 00:02:46'),
(134, 'App\\Models\\User', 17, 'auth_token', '045eb5bf3c2779247dbeba73c4eb5fa865c61ef118379d1f5928a90fc8bb7304', '[\"*\"]', NULL, NULL, '2026-03-07 00:04:41', '2026-03-07 00:04:41'),
(135, 'App\\Models\\User', 9, 'auth_token', 'ca27c6514c7ed9b5fce641472499a23bc5902ee82b405d53dcfcc2d26871be66', '[\"*\"]', '2026-03-07 00:11:40', NULL, '2026-03-07 00:04:53', '2026-03-07 00:11:40'),
(136, 'App\\Models\\User', 9, 'auth_token', 'd247fcb0eb278bf69ca7070868e41ad1ee4763c399402a50d615e69e7d09118d', '[\"*\"]', '2026-03-07 00:21:03', NULL, '2026-03-07 00:12:32', '2026-03-07 00:21:03'),
(137, 'App\\Models\\User', 17, 'auth_token', '88b056496911eaf29a0c8a4dd15e99c70e4397283140841bb452b89f5b520fd8', '[\"*\"]', '2026-03-07 03:14:39', NULL, '2026-03-07 00:39:39', '2026-03-07 03:14:39'),
(138, 'App\\Models\\User', 9, 'auth_token', '3e3c29c849de41c1f3a12b26895945e829a4ac1668267eeb2d5d645ff776d637', '[\"*\"]', '2026-03-08 23:36:04', NULL, '2026-03-08 23:32:47', '2026-03-08 23:36:04'),
(139, 'App\\Models\\User', 9, 'auth_token', 'b844b9a100e762972033001b8d4134b5d6d46f18593126647a0fef816821a25b', '[\"*\"]', '2026-03-09 03:16:25', NULL, '2026-03-09 03:13:58', '2026-03-09 03:16:25'),
(140, 'App\\Models\\User', 17, 'auth_token', '6e7deae4553a134543a10e0c9bb2967fe52cb8701ae4170ea9abc2692958e1f9', '[\"*\"]', '2026-03-09 03:57:12', NULL, '2026-03-09 03:17:33', '2026-03-09 03:57:12'),
(141, 'App\\Models\\User', 9, 'auth_token', 'f8e1b04f976b38fededf3732bbc6a52cd50776600fd96fd86bbaaefad37a8560', '[\"*\"]', '2026-03-09 03:57:44', NULL, '2026-03-09 03:57:27', '2026-03-09 03:57:44'),
(142, 'App\\Models\\User', 17, 'auth_token', 'e33394ebb6ffd5b1c4e615c910ac1d1d781d379922bb9c95ed24d3c61230bf1e', '[\"*\"]', '2026-03-09 04:01:59', NULL, '2026-03-09 04:01:46', '2026-03-09 04:01:59'),
(143, 'App\\Models\\User', 9, 'auth_token', '5439aee7916e0568b768092568235eaa2a6b98f0d22d5f79fdf530e7bc0be68c', '[\"*\"]', '2026-03-09 04:02:31', NULL, '2026-03-09 04:02:24', '2026-03-09 04:02:31'),
(144, 'App\\Models\\User', 17, 'auth_token', '2ed72221d896d30eb4a0375586be4f2284aa4d4ce4bb42c892c629bdcc2d9dc8', '[\"*\"]', '2026-03-09 04:03:47', NULL, '2026-03-09 04:03:08', '2026-03-09 04:03:47'),
(145, 'App\\Models\\User', 9, 'auth_token', '3977b9b05c22ae73d1b71fe682773758fcd7083d43e1446d8216b6995b4bd302', '[\"*\"]', '2026-03-09 04:13:02', NULL, '2026-03-09 04:12:50', '2026-03-09 04:13:02'),
(146, 'App\\Models\\User', 17, 'auth_token', 'bc25b70047aff7e840389b3265b56426b4394c8726ee6a41014fae74fbf0a931', '[\"*\"]', '2026-03-09 04:13:56', NULL, '2026-03-09 04:13:45', '2026-03-09 04:13:56'),
(147, 'App\\Models\\User', 17, 'auth_token', '6471c3d831f1b4d0104eb5ff774780ff4ccd3b7d1745d5713ddfe646df2b24f7', '[\"*\"]', NULL, NULL, '2026-03-09 04:18:55', '2026-03-09 04:18:55'),
(148, 'App\\Models\\User', 9, 'auth_token', 'e8e36c95a18d49dd2fb8325de145ac2c9db499cfbacca050445d82c03d338c53', '[\"*\"]', '2026-03-09 04:19:12', NULL, '2026-03-09 04:19:07', '2026-03-09 04:19:12'),
(149, 'App\\Models\\User', 17, 'auth_token', '393368cfc2caae39e204be10bc53c65633c62e744771a868cc7b10033277b47f', '[\"*\"]', '2026-03-09 05:05:51', NULL, '2026-03-09 04:20:14', '2026-03-09 05:05:51'),
(150, 'App\\Models\\User', 9, 'auth_token', '09e3759f665d52e608cb97a06785888f022ce837d26c8ecbbbb6a7ced63d42a5', '[\"*\"]', '2026-03-09 05:12:15', NULL, '2026-03-09 05:06:12', '2026-03-09 05:12:15'),
(151, 'App\\Models\\User', 17, 'auth_token', '0dbc969a1614b836b760f383d41a46693395f2347e3d16628e343d0c2d2db563', '[\"*\"]', '2026-03-09 05:14:13', NULL, '2026-03-09 05:13:01', '2026-03-09 05:14:13'),
(152, 'App\\Models\\User', 9, 'auth_token', '28f0b20cc8441cb059aafe7670ed4ea88ddc938ba989340531b7840dfd0af6b8', '[\"*\"]', '2026-03-09 23:40:39', NULL, '2026-03-09 05:14:23', '2026-03-09 23:40:39'),
(153, 'App\\Models\\User', 17, 'auth_token', '88f1c5d5122683073a9502d60594edb9b8b95a93d494a8be69e50da34aa5f31a', '[\"*\"]', '2026-03-09 05:25:35', NULL, '2026-03-09 05:18:17', '2026-03-09 05:25:35'),
(154, 'App\\Models\\User', 9, 'auth_token', 'e23e96cf8ac609e8a5a623f0dfd0403e3a6987f7a9c0e278472217d81ec26fd9', '[\"*\"]', NULL, NULL, '2026-03-09 23:45:37', '2026-03-09 23:45:37'),
(155, 'App\\Models\\User', 9, 'auth_token', '3508a54a22a31dbfd1d2074d272e457e8259d8c8b2a4080a329f2a86210da2b0', '[\"*\"]', '2026-03-10 00:50:30', NULL, '2026-03-10 00:09:30', '2026-03-10 00:50:30'),
(156, 'App\\Models\\User', 17, 'auth_token', '26648bac65340a2bdfeb7a593f65de6bd7461f38caf304239e6d4a112a2b45f0', '[\"*\"]', '2026-03-10 00:55:57', NULL, '2026-03-10 00:55:42', '2026-03-10 00:55:57'),
(157, 'App\\Models\\User', 9, 'auth_token', '4fa3df50d7deda0530abd7cf718f0043cf7eb2b9e66b6df83e2ed267c35d87ba', '[\"*\"]', '2026-03-10 00:56:37', NULL, '2026-03-10 00:56:30', '2026-03-10 00:56:37'),
(158, 'App\\Models\\User', 17, 'auth_token', '8460ca8bb097677405fc9ae5ed5689fb9b2b84c1dcd73997ebb419f4c7e6493e', '[\"*\"]', '2026-03-10 01:01:54', NULL, '2026-03-10 00:57:28', '2026-03-10 01:01:54'),
(159, 'App\\Models\\User', 9, 'auth_token', 'ba09dc3cf5f6b799d2f253ff934e0bc2d8c04c63e8854c6f6a9d8bc429600030', '[\"*\"]', '2026-03-10 03:33:50', NULL, '2026-03-10 01:08:54', '2026-03-10 03:33:50'),
(160, 'App\\Models\\User', 9, 'auth_token', 'd49a9adb3ec11c2b0350c124f5f4bf2c2e55ecdc43d8fa21b44abac3027eab59', '[\"*\"]', '2026-03-11 08:29:59', NULL, '2026-03-10 03:38:42', '2026-03-11 08:29:59');

-- --------------------------------------------------------

--
-- Table structure for table `student_interests`
--

CREATE TABLE `student_interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_interests`
--

INSERT INTO `student_interests` (`id`, `user_id`, `category_id`) VALUES
(3, 3, 1),
(4, 3, 2),
(5, 4, 1),
(6, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','in_active') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `course_id`, `title`, `order`, `status`, `created_at`, `updated_at`) VALUES
(2, 4, 'Businesss', 1, 'active', '2026-01-01 20:10:11', '2026-02-25 01:47:24'),
(3, 4, 'accounts', 2, '', '2026-01-01 20:10:22', '2026-01-01 20:10:22'),
(4, 4, 'Economics', 3, '', '2026-01-01 20:10:59', '2026-01-01 20:10:59'),
(5, 6, 'physics', 1, '', '2026-01-01 20:11:24', '2026-01-01 20:11:24'),
(6, 6, 'Chemistry', 2, '', '2026-01-01 20:11:33', '2026-01-01 20:11:36'),
(7, 6, 'Mathematics', 3, '', '2026-01-01 20:11:51', '2026-01-01 20:11:51'),
(8, 30, 'physics', 1, '', '2026-01-01 20:13:15', '2026-01-01 20:13:15'),
(9, 30, 'chemistry', 2, '', '2026-01-01 20:13:24', '2026-01-01 20:13:24'),
(10, 30, 'Biology', 3, '', '2026-01-01 20:13:43', '2026-01-01 20:13:50'),
(11, 30, 'Zoology', 4, '', '2026-01-01 20:14:37', '2026-01-01 20:14:37'),
(18, 35, 'History', 2, 'active', '2026-02-16 03:50:55', '2026-02-16 03:53:26'),
(19, 35, 'Geography', 1, 'active', '2026-02-16 03:51:24', '2026-02-16 03:53:11'),
(20, 35, 'Political Science', 3, 'active', '2026-02-16 03:52:03', '2026-02-16 03:53:39'),
(21, 35, 'Economics', 4, 'active', '2026-02-16 03:52:35', '2026-02-16 03:52:35');

-- --------------------------------------------------------

--
-- Table structure for table `subject_materials`
--

CREATE TABLE `subject_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('video','pdf','quiz','assignment','text') NOT NULL,
  `content` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `duration` int(11) DEFAULT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_materials`
--

INSERT INTO `subject_materials` (`id`, `subject_id`, `course_id`, `title`, `type`, `content`, `file_path`, `order`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 5, 6, 'Equilibrium', 'pdf', 'asd', 'subject-materials/p6UhYQoyDr5GiMdQs6B3a5EW01As5O0upYSwuI81.pdf', 1, 130, 'published', '2026-01-07 00:52:04', '2026-01-16 18:15:07'),
(3, 5, 6, 'thermodynamics', 'video', 'asd', 'subject-materials/idqWnu2mU44vI0aD9awg55vauWh9ucBdjq1lOxbc.mp4', 2, 120, 'published', '2026-01-07 00:52:37', '2026-01-07 00:52:37'),
(5, 5, 6, 'Gravity', 'video', 'sasd', 'subject-materials/idqWnu2mU44vI0aD9awg55vauWh9ucBdjq1lOxbc.mp4', 4, 45, 'published', '2026-01-07 00:54:03', '2026-01-07 00:54:03'),
(6, 5, 6, 'accelration', 'video', 'dfg', 'subject-materials/idqWnu2mU44vI0aD9awg55vauWh9ucBdjq1lOxbc.mp4', 3, 56, 'published', '2026-01-07 00:54:43', '2026-01-07 00:54:43'),
(15, 2, 0, 'final', 'pdf', 'dfgdfg', 'subject-materials/p6UhYQoyDr5GiMdQs6B3a5EW01As5O0upYSwuI81.pdf', 2, 2, 'published', '2026-01-07 23:20:55', '2026-02-21 07:50:34'),
(16, 2, 0, 'Business intro video1', 'video', 'asd', 'subject-materials/idqWnu2mU44vI0aD9awg55vauWh9ucBdjq1lOxbc.mp4', 1, 1, 'published', '2026-01-08 00:34:11', '2026-02-21 07:50:44'),
(17, 2, 0, 'Business  strategies', 'text', 'asdasd', NULL, 3, 20, 'published', '2026-02-07 07:41:55', '2026-02-21 07:50:18'),
(18, 19, 35, 'Geography Basics', 'pdf', 'Starting to study geography is best approached by combining visual tools (maps) with foundational concepts to understand where things are and why they are there. A highly effective, engaging, and accessible method for beginners is to start with a mix of mapping practice, visual aids, and connecting geography to current events. \nHere is a step-by-step guide to starting your study of geography:\n1. Start with the \"Where\" (Map Familiarity)\nGet a Map/Atlas: Buy or download a political and physical world map and place it somewhere you will see it daily.\nLearn Continents and Oceans: Start by identifying the 7 continents and 5 oceans.\nFocus on Regions: Instead of trying to learn every country at once, start with a specific region (e.g., European countries, Southeast Asian nations) and expand outward.\nPractice with Blank Maps: Print blank outline maps and try to label them. This is one of the most effective ways to build spatial memory.', 'subject-materials/rTeyEKhA3j3jyZ75uC9hNBEBpIbergmhrldcJjch.pdf', 1, 60, 'published', '2026-02-16 05:55:59', '2026-02-16 05:56:09'),
(19, 18, 35, 'History content', 'pdf', 'To start studying history effectively, shift your focus from memorising dry dates to understanding the story of humanity. Think of history as a series of cause-and-effect relationships rather than a list of isolated facts. \r\n1. Build a Chronological Framework\r\nStart by getting a \"bird\'s-eye view\" of time to anchor specific events later. \r\nThe Master Timeline: Create or study a high-level timeline of major eras (e.g., Ancient, Medieval, Early Modern, and Contemporary).\r\nBig Picture First: Focus on major global turning points—like the Neolithic Revolution, the Silk Roads, or the World Wars—before diving into local details.\r\nThe 5 Ws + 1 H: For any event, always ask: Who was involved? What happened? Where? When? Why did it happen? and How did it change the world?. \r\n2. Beginner-Friendly Resources\r\nAvoid dense academic journals initially; start with narrative-driven \"gateway\" content.\r\nMust-Read Books:\r\nThe \"Sweeping\" Intro: A Little History of the World by E.H. Gombrich—perfect for a fast, engaging overview of human experience.\r\nThe Visual Approach: A History of the World in 100 Objects by Neil MacGregor uses artifacts to tell the story of civilizations.\r\nGeneral Primer: World History 101 by Tom Head covers essential moments from Mesopotamia to the Cold War.', 'subject-materials/DgoiHSwV8YQhEIYIGm8lTGbwO0nFlUfNhjBAFK9P.pdf', 1, 60, 'published', '2026-02-16 05:58:25', '2026-02-16 05:58:25'),
(20, 20, 35, 'Political Science content', 'pdf', 'To start studying political science, focus on the mechanisms of power and how societies organise themselves through rules, institutions, and ideologies. \r\n1. Master Core Pillars\r\nPolitical science is typically divided into four major subfields. Start by gaining a high-level understanding of each: \r\nPolitical Theory: Explores fundamental questions like \"What is justice?\" and \"What is the role of the state?\".\r\nComparative Politics: Compares different political systems (e.g., democracies vs. autocracies) and how they function in various countries.\r\nInternational Relations (IR): Studies how countries interact through diplomacy, war, trade, and international organisations like the UN.\r\nPublic Policy/Administration: Focuses on how governments create and implement laws to solve societal problems. \r\n2. Beginner-Friendly Resources\r\nAvoid dense legal texts initially. Instead, use these accessible \"gateways\": \r\nEssential Books:\r\nPolitical Science: An Introduction by Michael Roskin: A comprehensive and widely used beginner’s textbook.\r\nPolitics by Andrew Heywood: Highly praised for its clear definitions of complex political concepts and ideologies.\r\nThe Politics Book (DK): Uses infographics and simple language to explain 100 ground-breaking political ideas.\r\nFoundational Texts (Indian Context): If you are in India, begin with NCERT Class 11 & 12 textbooks like Indian Constitution at Work and Political Theory for a solid conceptual base.\r\nFree Online Courses:\r\nYale’s Moral Foundations of Politics: Available for free, this course explores the moral arguments behind different types of government.\r\nSaylor.org Political Science 101: Provides a structured 7-unit introduction to the entire field. \r\n3. Practical Study Tips\r\nRead the News Critically: Follow outlets like The Hindu or The Indian Express and try to identify which political theories are at play in current events.\r\nStart with Ideologies: Learn the basics of Liberalism, Socialism, Fascism, and Nationalism early on, as these provide the \"labels\" used to describe almost all political activity.\r\nUnderstand Your Own System: Start by studying your local and national government structure—how laws are passed and how leaders are chosen—before moving to global systems.', 'subject-materials/45wrfjuJfYrSa3Xtdbbv7oAwpkEGlWZ23ZUQdjoR.pdf', 1, 60, 'published', '2026-02-16 06:00:06', '2026-02-16 06:00:06'),
(21, 21, 35, 'Economics Basic constent', 'pdf', 'To start studying economics, treat it as a tool to understand how people make choices under the constraint of limited resources. 1. Master the Core \"Big Three\" Concepts Before diving into complex models, internalise these three foundational principles that drive all economic activity: Scarcity: Resources (time, money, materials) are limited, but human wants are unlimited. Opportunity Cost: Choosing one thing always means giving up the \"next best\" thing. For instance, the opportunity cost of reading this is the other activity you could have done with your time. Incentives: People respond to rewards and penalties. Prices, taxes, and sales all act as incentives that change how we behave. 2. Micro vs. Macro: Which First? Experts generally recommend starting with Microeconomics. Microeconomics: Focuses on individual actors—how one person or one business makes decisions. Start with the Law of Supply and Demand to understand how prices are set. Macroeconomics: Looks at the \"big picture\" of a whole country or the world, including inflation, unemployment, and GDP. 3. Recommended Beginner Resources Avoid dry academic papers initially. Start with these accessible entries: Beginner-Friendly Books: The Simplest Intro: Simply Economics by DK (approx. ₹577) uses graphics to explain 90+ theories. The Narrative Guide: Freakonomics by Levitt and Dubner explores the \"hidden side of everything,\" making the subject feel like a detective story. The Comprehensive Primer: Economics 101 by Alfred Mill (approx. ₹374) provides jargon-free explanations of monopolies, game theory, and more. decorate this in html', 'subject-materials/VLyV5teFzORI2qZlAfmNBTlD0W1a3KaQkdinkZlq.pdf', 1, 60, 'published', '2026-02-16 06:01:49', '2026-02-16 06:48:10'),
(22, 19, 35, 'Geography', 'video', NULL, 'subject-materials/0qxYoPRfSzqL7eKkUKzAKh4fxx5EMGdNgOClVfVi.mp4', 2, 20, 'published', '2026-02-16 06:11:11', '2026-02-16 06:11:11'),
(23, 21, 35, 'Economics content', 'video', NULL, 'subject-materials/FeccY12vH3zclbOpepemQ6EoQa6Nlkpvr0yLe9Ka.mp4', 2, 60, 'published', '2026-02-16 06:35:53', '2026-02-16 06:35:53'),
(25, 2, 0, 'Aman', 'video', 'asdasd', 'subject-materials/nlSpXysVe1CH35vr6oLX3WQ3rUbJ6EyjHvroZsc6.pdf', 5, 23, 'draft', '2026-02-17 06:56:57', '2026-02-17 06:56:57'),
(26, 2, 4, 'Aman', 'video', 'asdasd', 'subject-materials/RllNMOlj5LVY2pyPnL1YqZZ3OANKItHFnR1W3svD.mp4', 5, 23, 'draft', '2026-02-17 07:01:53', '2026-02-17 07:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` enum('student','admin') NOT NULL DEFAULT 'student',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `google_id`, `phone`, `photo`, `email_verified_at`, `password`, `status`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Test Student', 'student@test.com', NULL, NULL, '', NULL, '$2y$12$3Y2PT811p35qaYf/23WOtOX/SKTKLwrA.PRkqrvOnfRc1gwA6u9pq', 1, NULL, 'student', '2025-12-19 22:03:24', '2026-01-02 21:36:28'),
(2, 'Student One', 'student1@test.com', NULL, NULL, '', NULL, '$2y$12$8qRDjFsmk33ZMHNC1.a2gupauPMQ9kzVJ83bF4iKg9/w6oaX2yOcS', 1, NULL, 'student', '2025-12-19 22:03:51', '2025-12-19 22:03:51'),
(3, 'Student Three', 'student3@test.com', NULL, NULL, '', NULL, '$2y$12$qHWAx7quBA9MJHP7i95He.L8u.ZP0Ss3wSGvxOVEEIS4d7R4QLkkK', 1, NULL, 'student', '2025-12-19 22:08:52', '2025-12-19 22:08:52'),
(4, 'Student Four', 'student4@test.com', NULL, NULL, '', NULL, '$2y$12$01Qc/zc06B8CMOlaMHk8QOFOXU2ZGNhzhNj0P9RgiW1z1U4DXtbzC', 1, NULL, 'student', '2025-12-19 22:13:56', '2026-01-02 21:36:22'),
(5, 'Student five', 'student5@test.com', NULL, NULL, '', NULL, '$2y$12$fKgxJzk7vWdCFgJivksghul1tjn94lEtIZ8JMf.DVogYsJ/lNXXs6', 1, NULL, 'student', '2025-12-19 22:15:14', '2026-03-11 05:51:42'),
(6, 'ramesh', 'ramesh@gmail.com', NULL, NULL, '', NULL, '$2y$12$JoLbT5aUlUmIHf9Fbk1wsuVBXIUHYn02.VfLdkSAGqLY1Tr9wfCBq', 1, NULL, 'student', '2025-12-20 00:48:40', '2025-12-20 00:48:40'),
(7, 'sujal', 'sujal@gmail.com', NULL, NULL, '', NULL, '$2y$12$k.aS0eJMTuVrnp8ygUMjxOKX0pnNdCoCmy8V3asaGL0LzYEyF1AmG', 1, NULL, 'student', '2025-12-20 00:50:46', '2026-01-06 03:26:01'),
(8, 'devansh', 'devansh@gmail.com', NULL, '7890789076', 'profiles/kkswNk4dY9EXd8lFeDBaQdDI8cVkIC0EfjDsQIuW.jpg', NULL, '$2y$12$sEzNOSBCVYrIQ6G9/zSVP.nJui0G2ChCaHerrELmCvrXd94n0midG', 1, NULL, 'student', '2025-12-20 00:57:03', '2026-01-16 19:58:18'),
(9, 'Aman', 'theswift321@gmail.com', '106447444418918519357', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocK8wZkJBRqboZKH8iLnDEhtnZm_OwmR-QmEFqwM5w6X24N2Sd0=s96-c', NULL, '$2y$12$ofgel8soM5v9/w5mwgTXiOhWW/FjMzisGQkZWI859KIFVlbfPakMq', 1, NULL, 'admin', '2025-12-20 01:41:24', '2026-02-07 07:10:16'),
(10, 'farhan', 'farhan@gmail.com', NULL, NULL, '', NULL, '$2y$12$5oVRJ11NckNvTG6TURP7Pu2LqPm6lIbgpmx0jjNBa/6KNvn3PSdiC', 1, NULL, 'student', '2025-12-20 02:21:45', '2026-02-26 03:17:58'),
(11, 'prashant', 'prashant@gmail.com', NULL, '3456457687', 'profiles/tuNqDwQiWC06e3BjhwbGzfny4lY0J8gounaGTHCu.png', NULL, '$2y$12$L.e9hzYutYF6nfw5XL7QNOGiBhLX75hpuJLVg/N/NuNCAlkodbWrC', 1, NULL, 'student', '2025-12-24 18:17:10', '2026-01-09 00:36:07'),
(12, 'tamanna', 'tamanna@gmail.com', NULL, 'as', '', NULL, '$2y$12$0cGT46maJTfrwE.m8oHb1OowoodJVnLf/GDUD1uPwCZFwmP3f8Myu', 1, NULL, 'student', '2026-01-04 23:28:11', '2026-01-20 21:46:54'),
(13, 'divya', 'divyadangi7607@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$8BySHFmYL6PQw4eIWymAZe94znIFvGAqQlGUQaQehyTQqrOAOeCau', 1, NULL, 'student', '2026-01-11 21:51:56', '2026-01-11 21:51:56'),
(14, 'Ajit', 'Ajit@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$.zlgbulxnOHaRkk3RNzWK.uqy.2Cc7yVX6MF6AS3BBTuSw5Rwpq8q', 1, NULL, 'student', '2026-01-20 22:22:38', '2026-01-20 22:22:38'),
(15, 'bhumika', 'bhumika@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$JZoQhULPJMcTUOztk5txoeDxiqUoNYjVkC44CZcSFNBb28TL73WRC', 1, NULL, 'student', '2026-01-20 22:26:53', '2026-01-20 22:26:53'),
(16, 'aditi', 'aditi@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$ZhMlqDPrTT1q22iEOxA47O.OZu0OU6XWBXJL3WnRJvb8UlLAI0Sey', 1, NULL, 'student', '2026-01-20 22:32:48', '2026-02-07 07:42:46'),
(17, 'Aman Raut', 'amanraut799@gmail.com', '106865510712404280184', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJJ5zeVFy4FhqR4M9UqW9Mw7hErm8i_VlSAiXMdPHNhLtk6UtNc3w=s96-c', NULL, '$2y$12$3Y2PT811p35qaYf/23WOtOX/SKTKLwrA.PRkqrvOnfRc1gwA6u9pq', 1, NULL, 'student', '2026-02-07 07:46:06', '2026-02-13 06:47:12'),
(18, 'Hariom Dangi', 'hariomdangi2666@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$Aa8J4EAi9BJlWMDitqx3YuyCj/VdNDbLQPb4TBlWx4F5NfP2JQ5YO', 1, NULL, 'student', '2026-02-13 06:20:26', '2026-02-26 04:14:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assignment_submissions_assignment_id_student_id_unique` (`assignment_id`,`student_id`),
  ADD KEY `assignment_submissions_student_id_foreign` (`student_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_category_id_foreign` (`category_id`);

--
-- Indexes for table `course_progress`
--
ALTER TABLE `course_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_progress_student_id_course_id_unique` (`student_id`,`course_id`);

--
-- Indexes for table `course_user`
--
ALTER TABLE `course_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_user_user_id_course_id_unique` (`user_id`,`course_id`),
  ADD KEY `course_user_course_id_foreign` (`course_id`);

--
-- Indexes for table `emi_payments`
--
ALTER TABLE `emi_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emi_payments_student_id_course_id_index` (`user_id`,`course_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exams_course_id_foreign` (`course_id`);

--
-- Indexes for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_questions_exam_id_foreign` (`exam_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_course_id_foreign` (`course_id`);

--
-- Indexes for table `lesson_completions`
--
ALTER TABLE `lesson_completions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lesson_completions_student_id_lesson_id_unique` (`student_id`,`lesson_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `payments_razorpay_order_id_unique` (`razorpay_order_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_course_id_foreign` (`course_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `student_interests`
--
ALTER TABLE `student_interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_interests_user_id_foreign` (`user_id`),
  ADD KEY `student_interests_category_id_foreign` (`category_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_course_id_foreign` (`course_id`);

--
-- Indexes for table `subject_materials`
--
ALTER TABLE `subject_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_materials_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_google_id_unique` (`google_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `course_progress`
--
ALTER TABLE `course_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `course_user`
--
ALTER TABLE `course_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `emi_payments`
--
ALTER TABLE `emi_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_completions`
--
ALTER TABLE `lesson_completions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `student_interests`
--
ALTER TABLE `student_interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subject_materials`
--
ALTER TABLE `subject_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD CONSTRAINT `assignment_submissions_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `course_user_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `exam_questions_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_interests`
--
ALTER TABLE `student_interests`
  ADD CONSTRAINT `student_interests_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_materials`
--
ALTER TABLE `subject_materials`
  ADD CONSTRAINT `subject_materials_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
