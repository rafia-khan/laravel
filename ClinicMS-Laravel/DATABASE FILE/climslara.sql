-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 02:09 AM
-- Server version: 5.6.21
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `climslara`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE IF NOT EXISTS `appointments` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `patient_id` int(10) unsigned NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `name`, `description`, `time`, `appointment_date`, `status`, `patient_id`, `doctor_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'Test Name', 'test description', 'Monday 05:30 AM-04:00 PM', '2023-12-31 13:00:00', 1, 1, 2, '2023-12-30 03:59:03', '2024-01-03 03:54:32', NULL),
(7, 'ererer', 'sadasda', 'Saturday 05:30 AM-04:00 PM', '2023-12-29 13:00:00', 1, 2, 2, '2023-12-30 04:34:40', '2023-12-30 04:35:04', NULL),
(8, 'T D', 'asdasas', 'Monday 08:00 AM-02:30 PM', '2024-01-03 13:00:00', 1, 4, 3, '2024-01-03 04:50:52', '2024-01-11 20:32:36', NULL),
(9, 'TC', 'qweqwe', 'Friday 05:30 AM-04:00 PM', '2024-01-11 13:00:00', 1, 3, 2, '2024-01-11 20:36:52', '2024-01-11 21:06:03', NULL),
(10, 'TE', 'qwwwweeee', 'Friday 10:30 AM-03:30 PM', '2024-01-11 13:00:00', 1, 5, 5, '2024-01-11 21:01:22', '2024-01-15 19:54:01', NULL),
(11, 'qazz', 'qqqqqq', 'Friday 07:00 AM-12:00 PM', '2024-01-11 13:00:00', 1, 6, 4, '2024-01-11 21:02:07', '2024-01-15 19:54:18', NULL),
(12, 'DP', 'just a demo', 'Friday 10:00 AM-05:00 PM', '2024-01-11 13:00:00', 1, 10, 6, '2024-01-11 21:41:29', '2024-01-11 21:42:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hematology', '2017-06-02 03:30:33', '2017-06-02 03:30:33'),
(2, 'Bio-Chemistry', '2017-06-02 03:30:50', '2017-06-02 03:30:50'),
(3, 'Parasitology', '2017-06-02 03:31:43', '2017-06-02 03:31:43'),
(4, 'Microbiology', '2017-06-02 03:31:55', '2017-06-02 03:31:55'),
(5, 'Immunology/Serology', '2017-06-02 03:32:25', '2017-06-02 03:32:25'),
(6, 'Histopathology', '2017-06-02 03:32:36', '2017-06-02 03:55:39'),
(7, 'Cytology', '2017-06-02 03:32:49', '2017-06-02 03:32:49'),
(8, 'ENT', '2017-06-02 03:32:55', '2017-06-02 03:32:55'),
(9, 'Paediatrics', '2017-06-02 03:34:53', '2017-06-02 03:34:53'),
(10, 'USG', '2017-06-02 03:35:04', '2017-06-02 03:35:04'),
(11, 'Sermotology', '2017-06-02 03:35:14', '2017-06-02 03:35:14'),
(12, 'ECG', '2017-06-02 03:35:26', '2017-06-02 03:35:26'),
(13, 'Psychiatry', '2017-06-02 03:35:49', '2017-06-02 03:35:49'),
(14, 'General Health Checkup Plan', '2017-06-02 03:36:12', '2017-06-02 03:36:12'),
(15, 'Follow up', '2017-06-02 03:36:22', '2017-06-02 03:36:22'),
(16, 'Pediatrics', '2017-06-02 03:36:37', '2017-06-02 03:36:37'),
(17, 'Endocrinology', '2017-07-24 01:21:12', '2017-07-24 01:21:12'),
(18, 'Internal Medicine', '2017-07-24 01:33:35', '2017-07-24 01:33:35'),
(19, 'Neuro Psychiatry', '2017-07-24 01:33:53', '2017-07-24 01:33:53'),
(20, 'Gynaecologist', '2017-07-24 01:34:18', '2017-07-24 01:34:18'),
(22, 'new Department', '2017-07-27 16:04:43', '2017-07-27 16:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE IF NOT EXISTS `doctors` (
`id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `fee` double(8,2) NOT NULL,
  `opd_charge` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `employee_id`, `fee`, `opd_charge`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 6, 119.05, 128.57, '2023-12-16 20:29:41', '2024-01-11 21:30:50', NULL),
(3, 7, 195.00, 225.00, '2024-01-03 04:23:02', '2024-01-03 04:23:02', NULL),
(4, 8, 50.00, 60.00, '2024-01-11 20:24:14', '2024-01-11 20:24:14', NULL),
(5, 9, 199.00, 219.00, '2024-01-11 20:27:30', '2024-01-11 20:27:30', NULL),
(6, 10, 45.00, 60.00, '2024-01-11 21:39:43', '2024-01-11 21:39:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_referreds`
--

CREATE TABLE IF NOT EXISTS `doctor_referreds` (
`id` int(10) unsigned NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor_referreds`
--

INSERT INTO `doctor_referreds` (`id`, `doctor_id`, `invoice_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 6, '2023-12-30 04:36:49', '2023-12-30 04:36:49', NULL),
(2, 6, 2, '2024-01-11 21:43:09', '2024-01-11 21:43:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
`id` int(10) unsigned NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speciality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_day` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `address`, `phone`, `education`, `description`, `certificate`, `speciality`, `working_day`, `in_time`, `out_time`, `type`, `department_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'DR.Test', NULL, 'Doctor', 'test@doctor.com', '77 test address', '7400000000', 'asdas', 'sdsaa asdasd', 'asdasda', 'asdasad', 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday', '05:30 AM', '04:00 PM', 'Doctor', 19, '2023-12-16 20:26:08', '2023-12-16 20:27:15', NULL),
(7, 'DR.Doc', NULL, 'One', 'd1@doctor.com', '77 Demo Address', '7777774444', 'Demo Education', 'Demo demo demo', 'demooo', 'demoooooooooo', 'Monday,Tuesday,Wednesday,Thursday,Friday', '08:00 AM', '02:30 PM', 'Doctor', 1, '2024-01-03 04:21:12', '2024-01-03 04:21:12', NULL),
(8, 'DR.Doc', NULL, 'Two', 'two@doc.com', 'qwewqqw', '7774777777', 'qweqweqe', 'qeqwwq', 'qqqqq', 'wwwww', 'Monday,Tuesday,Wednesday,Thursday,Friday', '07:00 AM', '12:00 PM', 'Doctor', 15, '2024-01-11 20:22:36', '2024-01-11 20:22:36', NULL),
(9, 'DR.Doc', NULL, 'Three', 'three@doc.com', 'rrrrrrrrrrrrrr', '7770777777', 'rrrrrrrrrrrr', 'tttttt', 'ccccccccc', 'cccccccccccc', 'Monday,Wednesday,Friday', '10:30 AM', '03:30 PM', 'Doctor', 16, '2024-01-11 20:26:06', '2024-01-11 20:26:06', NULL),
(10, 'DR.Doc', NULL, 'Four', 'docff@doctor.com', 'qweqweqwe', '2222122222', 'qweqweqwe', 'qweqweqw', 'qweqwe', 'qweqwe', 'Monday,Tuesday,Thursday,Friday', '10:00 AM', '05:00 PM', 'Doctor', 15, '2024-01-11 21:39:08', '2024-01-11 21:39:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `examination_results`
--

CREATE TABLE IF NOT EXISTS `examination_results` (
`id` int(10) unsigned NOT NULL,
  `test_report_id` int(10) unsigned NOT NULL,
  `macroscopic_result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `microscopic_result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE IF NOT EXISTS `hospitals` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slogan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pan_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LWC-',
  `patient_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'LWC-',
  `tax_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percent` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `slogan`, `logo`, `address`, `contact`, `email`, `pan_no`, `registration_no`, `invoice_message`, `website`, `description`, `invoice_prefix`, `patient_prefix`, `tax_type`, `tax_percent`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Clinic Management System', 'Enhancing Life', 'uploads/logo.png', '789 Demo Address', '+777 7777777777', 'aclinic@mail.com', '123', '12345', 'Invoice', 'codeastro.com', 'Nothing about us', 'LWC-', 'LWC-', 'Health Tax', 5, NULL, NULL, '2023-12-30 03:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash',
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double(28,21) NOT NULL,
  `sub_total` double(28,21) NOT NULL,
  `tax_amount` double(28,21) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `cash` double(8,2) DEFAULT NULL,
  `patient_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `invoice_no`, `payment_type`, `comment`, `total_amount`, `sub_total`, `tax_amount`, `discount`, `cash`, `patient_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'LWC-1', 'Cash', NULL, 126.000000000000000000000, 120.000000000000000000000, 6.000000000000000000000, 0.00, 130.00, 3, 1, '2024-01-11 21:06:49', '2024-01-11 21:06:49', NULL),
(2, 3, 'LWC-2', 'Credit', NULL, 200.000000000000000000000, 190.476190476190480000000, 9.523809523809524000000, 0.00, 200.00, 10, 1, '2024-01-11 21:43:08', '2024-01-11 21:43:08', NULL),
(3, 3, 'LWC-3', 'Cash', NULL, 63.000000000000000000000, 60.000000000000000000000, 3.000000000000000000000, 0.00, 100.00, 10, 1, '2024-01-11 21:44:37', '2024-01-11 21:44:37', NULL),
(4, 3, 'LWC-4', 'Credit', NULL, 271.950000000000000000000, 259.000000000000000000000, 12.950000000000000000000, 0.00, 272.00, 10, 1, '2024-01-11 21:46:59', '2024-01-11 21:46:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_returns`
--

CREATE TABLE IF NOT EXISTS `invoice_returns` (
`id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `return_amount` double(8,2) NOT NULL,
  `return_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
`id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_05_03_144856_create_hospitals_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_09_04_000000_create_roles_table', 1),
(5, '2017_05_03_105229_create_departments_table', 1),
(6, '2017_05_03_108812_create_employees_table', 1),
(7, '2017_05_03_113257_create_doctors_table', 1),
(8, '2017_05_03_113812_create_services_table', 1),
(9, '2017_05_03_114713_create_patients_table', 1),
(10, '2017_05_03_144134_create_appointments_table', 1),
(11, '2017_05_07_103011_create_invoices_table', 1),
(12, '2017_05_07_103212_create_service_sales_table', 1),
(13, '2017_05_10_172506_create_temps_table', 1),
(14, '2017_05_12_115857_create_tests_table', 1),
(15, '2017_05_12_121150_create_test_references_table', 1),
(16, '2017_05_13_084837_create_test_test_reference_table', 1),
(17, '2017_05_13_160840_create_reports_table', 1),
(18, '2017_05_16_134531_create_opd_sales_table', 1),
(19, '2017_05_20_112840_create_test_reports_table', 1),
(20, '2017_05_21_065026_create_test_results_table', 1),
(21, '2017_05_26_141428_create_invoice_returns_table', 1),
(22, '2017_05_27_142501_create_doctor_referreds_table', 1),
(23, '2017_05_29_154917_create_packages_table', 1),
(24, '2017_05_29_155432_create_package_tests_table', 1),
(25, '2017_05_29_155748_create_package_sales_table', 1),
(26, '2017_06_13_061359_create_permission_role_table', 1),
(27, '2017_06_23_151525_create_reference_results_table', 1),
(28, '2017_06_23_153028_create_test_examinations_table', 1),
(29, '2017_06_23_155143_create_examination_results_table', 1),
(30, '2017_06_23_155601_create_test_antibiotics_table', 1),
(31, '2017_06_23_155702_create_test_test_antibiotic_table', 1),
(32, '2017_06_23_164519_create_permissions_table', 1),
(33, '2017_07_03_143253_create_test_stains_table', 1),
(34, '2017_07_04_164725_create_test_reference_results_table', 1),
(35, '2017_07_08_070551_create_test_antibiotic_results_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `opd_sales`
--

CREATE TABLE IF NOT EXISTS `opd_sales` (
`id` int(10) unsigned NOT NULL,
  `opd_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `doctor_fee` double(8,2) NOT NULL,
  `opd_charge` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `opd_sales`
--

INSERT INTO `opd_sales` (`id`, `opd_name`, `doctor_id`, `invoice_id`, `doctor_fee`, `opd_charge`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'OPD Charge(DR.Test Doctor)', 2, 1, 125.00, 120.00, 1, '2024-01-11 21:06:49', '2024-01-11 21:24:09', NULL),
(2, 'OPD Charge(DR.Doc Four)', 6, 3, 45.00, 60.00, 1, '2024-01-11 21:44:37', '2024-01-11 21:45:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE IF NOT EXISTS `packages` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Basic health Care plan', 'Basic Health care plan', 1000.00, '2017-07-15 12:35:07', '2017-07-15 12:35:07', NULL),
(2, 'Demo Package', 'this is demo test', 259.00, '2024-01-11 21:37:57', '2024-01-11 21:37:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_sales`
--

CREATE TABLE IF NOT EXISTS `package_sales` (
`id` int(10) unsigned NOT NULL,
  `package_id` int(10) unsigned NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `patient_id` int(10) unsigned NOT NULL,
  `package_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_sales`
--

INSERT INTO `package_sales` (`id`, `package_id`, `invoice_id`, `patient_id`, `package_price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 4, 10, 259.00, '2024-01-11 21:46:59', '2024-01-11 21:46:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_tests`
--

CREATE TABLE IF NOT EXISTS `package_tests` (
`id` int(10) unsigned NOT NULL,
  `package_id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_tests`
--

INSERT INTO `package_tests` (`id`, `package_id`, `test_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '2024-01-11 21:37:58', '2024-01-11 21:37:58', NULL),
(2, 2, 2, '2024-01-11 21:37:58', '2024-01-11 21:37:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
`id` int(10) unsigned NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female','Other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Nepal',
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bagmati',
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Kathmandu',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relative_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relative_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('single','married','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `blood_group` enum('A+','A-','B+','AB+','AB-','B-','O+','O-') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `age`, `phone`, `gender`, `birth_date`, `country`, `state`, `district`, `location`, `occupation`, `description`, `relative_name`, `relative_phone`, `marital_status`, `blood_group`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test', NULL, 'A', 'a@patient.com', 34, '7777777777', 'Male', '1989-06-06', 'TestCountry', 'Testate', 'Testd', 'Demo Location', 'Demo demo', 'demo demo demo', 'Rel A', '7747777777', 'married', 'B+', '2023-12-30 03:45:57', '2023-12-30 03:45:57', NULL),
(2, 'Test', NULL, 'B', 'test@patient.com', 26, '7774447777', 'Male', '1998-12-04', 'Demo', 'demo', 'demo', 'demo', 'demo', 'demo', 'none', '7777777777', 'single', 'B-', '2023-12-30 03:51:57', '2023-12-30 03:51:57', NULL),
(3, 'Test', NULL, 'C', 'testc@patient.com', 29, '1111111111', 'Male', '1994-12-05', 'demo', 'demo', 'demo', 'demo', 'demo', 'demodemo', 'none', '7777777777', 'married', 'AB+', '2024-01-03 04:24:44', '2024-01-03 04:24:44', NULL),
(4, 'Test', NULL, 'D', 'testd@patient.com', 26, '1111110000', 'Female', '1998-11-11', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'nnnn', '7777777777', 'single', 'O+', '2024-01-03 04:50:17', '2024-01-03 04:50:17', NULL),
(5, 'Test', NULL, 'E', 'test@pat.com', 26, '1111111117', 'Female', '1997-02-19', 'demo', 'demo', 'demo', 'demo', 'demo', 'demo', 'none', '7777777777', 'single', 'AB-', '2024-01-11 20:29:42', '2024-01-11 20:29:42', NULL),
(6, 'Test', NULL, 'F', 'teste@patt.com', 30, '2222222220', 'Male', '1994-11-11', 'demmmmo', 'demo', 'demo', 'demo', 'demo', 'demo', 'nnn', '8888888888', 'married', 'B-', '2024-01-11 20:30:44', '2024-01-11 20:30:44', NULL),
(7, 'Test', NULL, 'G', 'testg@pat.com', 31, '1011111111', 'Female', '1993-03-03', 'qwe', 'qwe', 'qwe', 'qwe', 'qwe', 'qweqweqweqweqweqwqeqwqe', 'asdasd', '7777777770', 'single', 'A+', '2024-01-11 20:32:22', '2024-01-11 20:32:22', NULL),
(8, 'Test', NULL, 'H', 'testh@mail.com', 34, '2222222200', 'Male', '1990-10-10', 'ad', 'asd', 'asd', 'asd', 'asd', 'asdas', 'asd', '4444444455', 'married', 'A-', '2024-01-11 20:38:40', '2024-01-11 20:38:40', NULL),
(9, 'Test', NULL, 'I', 'testi@mail.com', 34, '2000000002', 'Male', '1990-01-01', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', 'asd', '7777777779', 'married', 'AB+', '2024-01-11 20:39:56', '2024-01-11 20:39:56', NULL),
(10, 'Demo', NULL, 'Patient', 'demop@patient.com', 34, '2222212100', 'Male', '1990-11-11', 'qweqw', 'qwewq', 'qweqw', 'qweqw', 'qweqe', 'qweqw', 'qweqw', '7777777111', 'married', 'A+', '2024-01-11 21:40:42', '2024-01-11 21:40:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
`id` int(10) unsigned NOT NULL,
  `object` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `object`, `action`, `name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'index', 'dashboard.index', '2017-07-11 03:27:21', '2017-07-11 03:27:21'),
(2, 'hospital', 'setting', 'hospital.setting', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(3, 'change', 'password', 'change.password', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(4, 'hospital', 'update', 'hospital.update', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(5, 'tax', 'update', 'tax.update', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(6, 'config', 'update', 'config.update', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(7, 'user', 'index', 'user.index', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(8, 'user', 'store', 'user.store', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(9, 'user', 'edit', 'user.edit', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(10, 'user', 'delete', 'user.delete', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(11, 'department', 'index', 'department.index', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(12, 'department', 'add', 'department.add', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(13, 'department', 'edit', 'department.edit', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(14, 'department', 'delete', 'department.delete', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(15, 'service', 'index', 'service.index', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(16, 'service', 'add', 'service.add', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(17, 'service', 'edit', 'service.edit', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(18, 'service', 'delete', 'service.delete', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(19, 'employee', 'index', 'employee.index', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(20, 'employee', 'create', 'employee.create', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(21, 'employee', 'store', 'employee.store', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(22, 'employee', 'show', 'employee.show', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(23, 'employee', 'edit', 'employee.edit', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(24, 'employee', 'update', 'employee.update', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(25, 'employee', 'destroy', 'employee.destroy', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(26, 'doctor', 'index', 'doctor.index', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(27, 'doctor', 'create', 'doctor.create', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(28, 'doctor', 'store', 'doctor.store', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(29, 'doctor', 'show', 'doctor.show', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(30, 'doctor', 'edit', 'doctor.edit', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(31, 'doctor', 'update', 'doctor.update', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(32, 'doctor', 'destroy', 'doctor.destroy', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(33, 'patient', 'index', 'patient.index', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(34, 'patient', 'create', 'patient.create', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(35, 'patient', 'store', 'patient.store', '2017-07-11 03:27:22', '2017-07-11 03:27:22'),
(36, 'patient', 'show', 'patient.show', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(37, 'patient', 'edit', 'patient.edit', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(38, 'patient', 'update', 'patient.update', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(39, 'patient', 'destroy', 'patient.destroy', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(40, 'appointment', 'index', 'appointment.index', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(41, 'appointment', 'create', 'appointment.create', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(42, 'appointment', 'store', 'appointment.store', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(43, 'appointment', 'show', 'appointment.show', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(44, 'appointment', 'edit', 'appointment.edit', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(45, 'appointment', 'update', 'appointment.update', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(46, 'appointment', 'destroy', 'appointment.destroy', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(47, 'role', 'index', 'role.index', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(48, 'role', 'create', 'role.create', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(49, 'role', 'store', 'role.store', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(50, 'role', 'show', 'role.show', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(51, 'role', 'edit', 'role.edit', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(52, 'role', 'update', 'role.update', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(53, 'role', 'destroy', 'role.destroy', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(54, 'package', 'index', 'package.index', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(55, 'package', 'store', 'package.store', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(56, 'package', 'edit', 'package.edit', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(57, 'package', 'test', 'package.test.delete', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(58, 'package', 'delete', 'package.delete', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(59, 'appointment', 'updated', 'appointment.updated', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(60, 'invoice', 'index', 'invoice.index', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(61, 'invoice', 'store', 'invoice.store', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(62, 'invoice', 'patient', 'invoice.patient', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(63, 'invoice', 'remove', 'invoice.remove', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(64, 'invoice', 'sale', 'invoice.sale', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(65, 'invoice', 'opd', 'invoice.opd', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(66, 'invoice', 'report', 'invoice.report', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(67, 'search', 'invoice', 'search.invoice', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(68, 'invoice', 'return', 'invoice.return', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(69, 'opd', 'index', 'opd.index', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(70, 'opd', 'store', 'opd.store', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(71, 'package', 'sale', 'package.sale', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(72, 'package', 'sale', 'package.sale', '2017-07-11 03:27:23', '2017-07-11 03:27:23'),
(73, 'package', 'sales', 'package.sales', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(74, 'test', 'index', 'test.index', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(75, 'test', 'status', 'test.status', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(76, 'test', 'store', 'test.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(77, 'test', 'edit', 'test.edit', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(78, 'test', 'delete', 'test.delete', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(79, 'reference', 'index', 'reference.index', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(80, 'reference', 'store', 'reference.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(81, 'reference', 'update', 'reference.update', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(82, 'reference', 'delete', 'reference.delete', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(83, 'antibiotic', 'store', 'antibiotic.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(84, 'antibiotic', 'edit', 'antibiotic.edit', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(85, 'haematology', 'index', 'haematology.index', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(86, 'haematology', 'store', 'haematology.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(87, 'microbiology', 'index', 'microbiology.index', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(88, 'microbiology', 'store', 'microbiology.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(89, 'examination', 'index', 'examination.index', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(90, 'examination', 'store', 'examination.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(91, 'examination', 'update', 'examination.update', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(92, 'biochemistry', 'index', 'biochemistry.index', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(93, 'biochemistry', 'store', 'biochemistry.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(94, 'stain', 'index', 'stain.index', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(95, 'stain', 'store', 'stain.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(96, 'stain', 'edit', 'stain.edit', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(97, 'report', 'index', 'report.index', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(98, 'report', 'status', 'report.status', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(99, 'report', 'edit', 'report.edit', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(100, 'report', 'patient', 'report.patient', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(101, 'report', 'update', 'report.update', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(102, 'report', 'print', 'report.print', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(103, 'result', 'test', 'result.test', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(104, 'result', 'tests', 'result.tests', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(105, 'result', 'store', 'result.store', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(106, 'result', 'edit', 'result.edit', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(107, 'report', 'generate', 'report.generate', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(108, 'report', 'comment', 'report.comment', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(109, 'report', 'result', 'report.result', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(110, 'account', 'service', 'account.service', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(111, 'account', 'opd', 'account.opd', '2017-07-11 03:27:24', '2017-07-11 03:27:24'),
(112, 'account', 'package', 'account.package', '2017-07-11 03:27:25', '2017-07-11 03:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
`id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(2, 1, 2, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(3, 1, 3, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(4, 1, 4, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(5, 1, 5, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(6, 1, 6, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(7, 1, 7, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(8, 1, 8, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(9, 1, 9, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(10, 1, 10, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(11, 1, 11, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(12, 1, 12, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(13, 1, 13, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(14, 1, 14, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(15, 1, 15, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(16, 1, 16, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(17, 1, 17, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(18, 1, 18, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(19, 1, 19, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(20, 1, 20, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(21, 1, 21, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(22, 1, 22, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(23, 1, 23, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(24, 1, 24, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(25, 1, 25, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(26, 1, 26, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(27, 1, 27, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(28, 1, 28, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(29, 1, 29, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(30, 1, 30, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(31, 1, 31, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(32, 1, 32, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(33, 1, 33, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(34, 1, 34, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(35, 1, 35, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(36, 1, 36, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(37, 1, 37, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(38, 1, 38, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(39, 1, 39, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(40, 1, 40, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(41, 1, 41, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(42, 1, 42, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(43, 1, 43, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(44, 1, 44, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(45, 1, 45, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(46, 1, 46, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(47, 1, 47, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(48, 1, 48, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(49, 1, 49, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(50, 1, 50, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(51, 1, 51, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(52, 1, 52, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(53, 1, 53, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(54, 1, 54, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(55, 1, 55, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(56, 1, 56, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(57, 1, 57, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(58, 1, 58, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(59, 1, 59, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(60, 1, 60, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(61, 1, 61, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(62, 1, 62, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(63, 1, 63, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(64, 1, 64, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(65, 1, 65, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(66, 1, 66, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(67, 1, 67, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(68, 1, 68, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(69, 1, 69, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(70, 1, 70, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(71, 1, 71, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(72, 1, 72, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(73, 1, 73, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(74, 1, 74, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(75, 1, 75, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(76, 1, 76, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(77, 1, 77, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(78, 1, 78, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(79, 1, 79, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(80, 1, 80, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(81, 1, 81, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(82, 1, 82, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(83, 1, 83, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(84, 1, 84, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(85, 1, 85, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(86, 1, 86, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(87, 1, 87, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(88, 1, 88, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(89, 1, 89, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(90, 1, 90, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(91, 1, 91, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(92, 1, 92, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(93, 1, 93, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(94, 1, 94, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(95, 1, 95, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(96, 1, 96, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(97, 1, 97, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(98, 1, 98, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(99, 1, 99, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(100, 1, 100, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(101, 1, 101, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(102, 1, 102, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(103, 1, 103, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(104, 1, 104, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(105, 1, 105, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(106, 1, 106, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(107, 1, 107, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(108, 1, 108, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(109, 1, 109, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(110, 1, 110, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(111, 1, 111, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(112, 1, 112, '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(113, 2, 1, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(114, 2, 33, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(115, 2, 34, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(116, 2, 35, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(117, 2, 36, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(118, 2, 37, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(119, 2, 38, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(120, 2, 40, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(121, 2, 41, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(122, 2, 42, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(123, 2, 43, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(124, 2, 44, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(125, 2, 45, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(126, 2, 59, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(127, 2, 60, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(128, 2, 61, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(129, 2, 62, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(130, 2, 63, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(131, 2, 64, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(132, 2, 65, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(133, 2, 66, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(134, 2, 68, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(135, 2, 67, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(136, 2, 97, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(137, 2, 102, '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(138, 3, 1, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(139, 3, 3, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(140, 3, 33, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(141, 3, 34, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(142, 3, 35, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(143, 3, 36, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(144, 3, 37, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(145, 3, 38, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(146, 3, 40, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(147, 3, 41, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(148, 3, 42, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(149, 3, 43, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(150, 3, 44, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(151, 3, 45, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(152, 3, 59, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(153, 3, 67, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(154, 3, 74, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(155, 3, 75, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(156, 3, 76, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(157, 3, 77, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(158, 3, 79, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(159, 3, 80, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(160, 3, 81, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(161, 3, 83, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(162, 3, 84, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(163, 3, 85, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(164, 3, 86, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(165, 3, 87, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(166, 3, 88, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(167, 3, 89, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(168, 3, 90, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(169, 3, 91, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(170, 3, 92, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(171, 3, 93, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(172, 3, 97, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(173, 3, 98, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(174, 3, 99, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(175, 3, 100, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(176, 3, 101, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(177, 3, 102, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(178, 3, 107, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(179, 3, 108, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(180, 3, 109, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(181, 3, 103, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(182, 3, 104, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(183, 3, 105, '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(184, 4, 1, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(185, 4, 2, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(186, 4, 4, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(187, 4, 3, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(188, 4, 5, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(189, 4, 6, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(190, 4, 7, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(191, 4, 8, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(192, 4, 9, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(193, 4, 11, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(194, 4, 12, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(195, 4, 13, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(196, 4, 14, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(197, 4, 15, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(198, 4, 16, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(199, 4, 17, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(200, 4, 18, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(201, 4, 19, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(202, 4, 20, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(203, 4, 21, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(204, 4, 22, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(205, 4, 23, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(206, 4, 24, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(207, 4, 26, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(208, 4, 27, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(209, 4, 28, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(210, 4, 29, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(211, 4, 30, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(212, 4, 31, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(213, 4, 33, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(214, 4, 34, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(215, 4, 35, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(216, 4, 36, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(217, 4, 37, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(218, 4, 38, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(219, 4, 39, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(220, 4, 40, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(221, 4, 41, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(222, 4, 42, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(223, 4, 43, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(224, 4, 44, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(225, 4, 45, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(226, 4, 46, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(227, 4, 59, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(228, 4, 54, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(229, 4, 55, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(230, 4, 56, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(231, 4, 57, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(232, 4, 58, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(233, 4, 71, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(234, 4, 72, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(235, 4, 73, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(236, 4, 60, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(237, 4, 61, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(238, 4, 62, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(239, 4, 63, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(240, 4, 64, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(241, 4, 65, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(242, 4, 66, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(243, 4, 68, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(244, 4, 74, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(245, 4, 75, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(246, 4, 76, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(247, 4, 77, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(248, 4, 78, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(249, 4, 79, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(250, 4, 80, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(251, 4, 81, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(252, 4, 82, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(253, 4, 83, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(254, 4, 84, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(255, 4, 85, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(256, 4, 86, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(257, 4, 87, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(258, 4, 88, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(259, 4, 89, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(260, 4, 90, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(261, 4, 91, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(262, 4, 92, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(263, 4, 93, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(264, 4, 94, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(265, 4, 95, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(266, 4, 96, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(267, 4, 97, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(268, 4, 98, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(269, 4, 99, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(270, 4, 100, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(271, 4, 101, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(272, 4, 102, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(273, 4, 107, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(274, 4, 108, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(275, 4, 109, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(276, 4, 103, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(277, 4, 104, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(278, 4, 105, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(279, 4, 106, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(280, 4, 110, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(281, 4, 111, '2017-07-15 12:32:13', '2017-07-15 12:32:13'),
(282, 4, 112, '2017-07-15 12:32:13', '2017-07-15 12:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `reference_results`
--

CREATE TABLE IF NOT EXISTS `reference_results` (
`id` int(10) unsigned NOT NULL,
  `test_report_id` int(10) unsigned NOT NULL,
  `test_reference_id` int(10) unsigned NOT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
`id` int(10) unsigned NOT NULL,
  `patient_id` int(10) unsigned NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `report` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `patient_id`, `doctor_id`, `report`, `result`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, NULL, NULL, NULL, 0, '2024-01-11 21:47:00', '2024-01-11 21:47:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Superadmin', 'Role for Super administrator', '2017-07-11 03:27:25', '2017-07-11 03:27:25'),
(2, 'user', 'user', '2017-07-15 12:27:38', '2017-07-15 12:27:38'),
(3, 'lab', 'lab', '2017-07-15 12:29:37', '2017-07-15 12:29:37'),
(4, 'admin', 'admin', '2017-07-15 12:32:13', '2017-07-15 12:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(20,15) NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `amount`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 'Absolute Basophil Count', 142.857142857142860, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(2, 'Absolute Eosinophil Count', 142.857142857142860, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(3, 'Absolute Neutrophil Count', 142.857142857142860, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(4, 'Acid Phosphatase', 333.333333333333300, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(5, 'Albumin/Ceatinine ratio', 809.523809523809500, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(8, 'ADA (Adenosene Deaminase)', 619.047619047619000, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(9, 'AFB ( Acid fast) )Stain', 95.238095238095240, 4, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(10, 'AFB ( Ziehlneelsen )Stain', 95.238095238095240, 3, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(12, 'AFP ( Alpha Feto Protein )', 1047.619047619047700, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(13, 'Albumin', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(15, 'Alkaline Phosphatase', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(16, 'Amylase', 476.190476190476200, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(18, 'ANA', 1047.619047619047700, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(19, 'Anti CCP', 1619.047619047619000, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(20, 'Anti Phospolipid IgG', 1285.714285714285800, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:52'),
(21, 'Anti Phospolipid IgM', 1285.714285714285800, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(22, 'Anti TPO', 1428.571428571428700, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(23, 'Anticardiolipin IgG', 1000.000000000000000, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(24, 'Anticardiolipin IgM', 1000.000000000000000, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(25, 'APTT (Activated Partial Thromboplastin Time)', 380.952380952380960, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(26, 'ASO Test', 333.333333333333300, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(27, 'ASO Titre', 476.190476190476200, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(28, 'ASO Quantitaive', 380.952380952380960, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(29, 'Bence jones Protein', 238.095238095238100, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(30, 'Beta HCG-Free', 952.380952380952400, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(31, 'Serum Bicarbonate', 1523.809523809523900, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(32, 'Bilirubin (Total )', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(33, 'BT( Bleeding Time )', 47.619047619047620, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(34, 'Blood Culture & Sensitivity', 476.190476190476200, 4, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(35, 'Blood Grouping Rh typing', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(36, 'Brucella Ab Test', 380.952380952380960, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(37, 'BUN (Blood Urea Nitrogen)', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(38, 'CA-15.3', 1428.571428571428700, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(39, 'CA-19.9', 1428.571428571428700, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:53'),
(40, 'CA-125', 1619.047619047619000, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(41, 'Calcium', 190.476190476190480, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(42, 'C-ANCA', 1200.000000000000000, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(43, 'CEA', 1238.095238095238000, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(44, 'Chloride', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(45, 'Total Cholesterol', 190.476190476190480, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(46, 'Cholesterol -HDL', 190.476190476190480, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(47, 'Cholesterol-LDL', 190.476190476190480, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(48, 'Cholesterol-VLDL', 190.476190476190480, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(49, 'CT (Clotting Time)', 47.619047619047620, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(50, 'C3 (Complement-3)', 1095.238095238095200, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(51, 'C4 (Complement-4)', 1095.238095238095200, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(52, 'Complete Blood Count (CBC)', 333.333333333333300, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(53, 'C-Peptide', 1190.476190476190400, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(54, 'CPK', 333.333333333333300, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(55, 'CPK-MB', 428.571428571428560, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(56, 'Creatinine', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(57, 'Creatinine Clearance Test', 333.333333333333300, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(58, 'CRP Quantitative', 428.571428571428560, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(59, 'CRP Test', 333.333333333333300, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:54'),
(60, 'CRP Titre', 428.571428571428560, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(61, 'CSF Culture & Sensitivity', 333.333333333333300, 3, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(62, 'Cardiolipin Antibody-IgM', 857.142857142857100, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(63, 'Cardiolipin Antibody-Igg', 857.142857142857100, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(64, 'D-dimer', 1333.333333333333300, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(65, 'Dengue Ab- (IgG and IgM)', 1238.095238095238000, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(66, 'Differential Leucocyte Count (DLC)', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(67, 'ds-DNA', 1047.619047619047700, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(68, 'Erythrocyte sedimentation Rate (ESR)', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(69, 'E2 (Estradiol)', 1047.619047619047700, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(70, 'Ferritin', 1047.619047619047700, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(71, 'FSH', 1095.238095238095200, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(72, 'Fungal KOH Preparation', 95.238095238095240, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(73, 'Gamma GT', 380.952380952380960, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(74, 'Globulin', 142.857142857142860, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(75, 'Blood Glucose F', 47.619047619047620, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(76, 'Glucose GTT', 95.238095238095240, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(77, 'Blood Glucose PP', 47.619047619047620, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(78, 'Glucose Pre-dinner', 47.619047619047620, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(79, 'Blood Glucose Random', 47.619047619047620, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(80, 'Gram Stain', 142.857142857142860, 4, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(81, 'Growth Hormone', 1190.476190476190400, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(82, 'Haemoglobin (Hb)', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:55'),
(83, 'HAV(IGG& IGM)', 571.428571428571400, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(84, 'HbA1C-Glycosylated Hb', 761.904761904761900, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(85, 'Helicobacter Pylori Ab', 952.380952380952400, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(86, 'HepatitisBSurface antigen (HBsAg)-Rapid Test', 428.571428571428560, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(87, 'Hepatitis B Surface antigen Confirmatory', 1428.571428571428700, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(88, 'Hepatitis C antibody (Anti-HCV)', 476.190476190476200, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(89, 'HCV Elisa', 1428.571428571428700, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(90, 'Hepatitis E IgM antibody (HEV IgM)', 571.428571428571400, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(91, 'HIV-I & II antibody (Rapid)', 476.190476190476200, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(92, 'HIV-I & II Elisa', 857.142857142857100, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(93, 'Herpex simplex Virus 1 IgG', 666.666666666666600, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(94, 'Herpex simplex Virus 1 IgM', 666.666666666666600, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(95, 'Herpex simplex Virus 2 IgG', 666.666666666666600, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(96, 'Herpex simplex Virus 2 IgM', 666.666666666666600, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:56'),
(97, 'Iron', 571.428571428571400, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(98, 'Iron Profile', 857.142857142857100, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(99, 'Ketone bodies', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(100, 'Renal Function Test', 380.952380952380960, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(101, 'LDH', 476.190476190476200, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(102, 'Leishmania antibody ( K- 39 )IgG &IgM', 952.380952380952400, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(103, 'Leptospira Ab(IgG/IgM)', 952.380952380952400, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(104, 'Leucocyte count (TLC)', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(105, 'LH', 1047.619047619047700, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(106, 'Lipase', 476.190476190476200, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:57'),
(107, 'Lipid Profile Test', 476.190476190476200, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(108, 'LFT-Liver function Test', 476.190476190476200, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(109, 'Magnesium', 380.952380952380960, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(110, 'Mantoux Test ( Tuberculin test)', 95.238095238095240, 5, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(111, 'Mean Corpuscular Haemoglobin (MCH)', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(112, 'Mean Corpuscular Haemoglobin Concentration(MCHC)', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(113, 'Mean Corpuscular Volume ( MCV )', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(114, 'Microalbumin', 666.666666666666600, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(115, 'Occult Blood', 95.238095238095240, 3, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(116, 'Packed Cell Volume (PCV/HCT)', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:58'),
(117, 'Peripheral Blood Smear (PBS)', 333.333333333333300, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:59'),
(118, 'Phosphorus', 190.476190476190480, 2, '2017-06-02 05:46:51', '2017-07-27 15:47:59'),
(119, 'Platelets Count', 95.238095238095240, 1, '2017-06-02 05:46:51', '2017-07-27 15:47:59'),
(120, 'Potassium', 166.666666666666660, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:03'),
(121, 'Pregnancy Test (Detection of ? HCG)', 142.857142857142860, 4, '2017-06-02 05:46:51', '2017-07-27 15:48:03'),
(122, 'Prolactin', 1047.619047619047700, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:03'),
(123, 'Protein(Total)', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:03'),
(124, 'Protein-Creat ratio', 285.714285714285700, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:03'),
(125, 'Prothrombin Time ( PT/INR)', 333.333333333333300, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:03'),
(126, 'PSA (Total)', 1047.619047619047700, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(127, 'PTH', 2190.476190476190400, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(128, 'Pus Culture & sensitivity', 285.714285714285700, 4, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(129, 'Ra Factor Quantitative', 428.571428571428560, 5, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(130, 'Ra Factor Test', 285.714285714285700, 5, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(131, 'Red Blood cell count ( RBC )', 71.428571428571430, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(132, 'Reducing substance(Sugar)', 95.238095238095240, 3, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(133, 'Reducing substance(Sugar)', 95.238095238095240, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(134, 'Reticulocyte count', 95.238095238095240, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(135, 'RPR(VDRL) Test', 142.857142857142860, 5, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(136, 'Rubella IgG Ab', 666.666666666666600, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:04'),
(137, 'Rubella IgM Ab', 666.666666666666600, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(138, 'Salmonella aggutination test (WIDAL)', 190.476190476190480, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(139, 'Semen Analysis', 190.476190476190480, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(140, 'Semen Culture & Sensitivity', 333.333333333333300, 4, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(141, 'SGOT (AST)', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(142, 'SGPT (ALT)', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(143, 'Sodium', 166.666666666666660, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(144, 'Stool Culture & Sensitivity', 333.333333333333300, 4, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(145, 'Stool Routine Examination', 47.619047619047620, 3, '2017-06-02 05:46:51', '2017-07-27 15:48:05'),
(146, 'Swab Culture & Sensitivity(Aerobic)', 333.333333333333300, 4, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(147, 'Testosterone (Total)', 1047.619047619047700, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(148, 'T3 Free', 380.952380952380960, 5, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(149, 'T4 Free', 380.952380952380960, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(150, 'TSH', 380.952380952380960, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(151, 'Thyroid Function Test (TFT)-Free', 952.380952380952400, 5, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(152, 'TORCH IgG Ab', 1714.285714285714200, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(153, 'TORCH IgM Ab', 1714.285714285714200, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(154, 'TORCH Profile', 3333.333333333333500, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(155, 'Toxoplasma IgG Ab', 857.142857142857100, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(156, 'Toxoplasma IgM Ab', 857.142857142857100, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(157, 'TPHA Test', 333.333333333333300, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:06'),
(158, 'TPHA Titre', 666.666666666666600, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(159, 'TPO-Ab', 1428.571428571428700, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(160, 'Troponin - I', 714.285714285714300, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(161, 'Estridiol(E2)', 1047.619047619047700, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(162, 'Urea', 142.857142857142860, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(163, 'Uric Acid', 95.238095238095240, 2, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(164, 'Urine Routine(Examination)', 47.619047619047620, 3, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(165, 'Urine Culture & Sensitivity', 333.333333333333300, 4, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(166, 'Urobilinogen', 47.619047619047620, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(167, 'Vitamin B-12', 1238.095238095238000, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(168, 'Vitamin D-3 (OH)', 2380.952380952380700, 1, '2017-06-02 05:46:51', '2017-07-27 15:48:07'),
(172, 'Random blood sugar (RBS)', 47.619047619047620, 2, '2017-06-04 12:22:51', '2017-07-27 15:48:07'),
(173, 'Thyroid Function Test (50%)', 476.190476190476200, 2, '2017-06-05 11:50:36', '2017-07-27 15:48:07'),
(174, 'White Blood Cell Count (WBC)', 71.428571428571430, 1, '2017-07-12 09:06:56', '2017-07-27 15:48:07'),
(175, 'HCT', 71.428571428571430, 1, '2017-07-12 09:08:37', '2017-07-27 15:48:07'),
(176, 'Bilirubin (Direct)', 142.857142857142860, 2, '2017-07-12 09:35:52', '2017-07-27 15:48:08'),
(177, 'Triglyceride', 142.857142857142860, 2, '2017-07-12 10:08:02', '2017-07-27 15:48:08'),
(178, 'A/G Ratio', 809.523809523809500, 2, '2017-07-12 10:45:58', '2017-07-27 15:48:08'),
(179, 'HepatitisBSurface antigen (HBsAg)-ELISA', 428.571428571428560, 5, '2017-07-12 11:12:30', '2017-07-27 15:48:08'),
(180, 'Hepatitis A IgM antibody (HEV IgM)', 571.428571428571400, 5, '2017-07-12 11:16:32', '2017-07-27 15:48:08'),
(181, 'PSA (quantitative)', 1047.619047619047700, 2, '2017-07-12 11:58:20', '2017-07-27 15:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `service_sales`
--

CREATE TABLE IF NOT EXISTS `service_sales` (
`id` int(10) unsigned NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_sales`
--

INSERT INTO `service_sales` (`id`, `service_id`, `service_name`, `amount`, `invoice_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 45, 'Total Cholesterol', 190.48, 2, 1, '2024-01-11 21:43:09', '2024-01-11 21:43:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `temps`
--

CREATE TABLE IF NOT EXISTS `temps` (
`id` int(10) unsigned NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(28,20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
`id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `service_id`, `name`, `report_type`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 82, 'Haemoglobin (Hb)', 'haematology', 'TTTTEEESST', '2023-12-30 04:48:20', '2023-12-30 04:48:20', NULL),
(2, 77, 'Blood Glucose PP', 'examination', 'demo demo', '2024-01-11 20:41:05', '2024-01-11 20:41:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_antibiotics`
--

CREATE TABLE IF NOT EXISTS `test_antibiotics` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_antibiotics`
--

INSERT INTO `test_antibiotics` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ciprofloxacin', '2017-07-12 14:34:37', '2017-07-12 14:34:37'),
(2, 'Ofloxacin', '2017-07-12 14:34:43', '2017-07-12 14:34:43'),
(3, 'Chloramphenicol', '2017-07-12 14:34:50', '2017-07-12 14:34:50'),
(4, 'Cephalexin', '2017-07-12 14:34:56', '2017-07-12 14:34:56'),
(5, 'Ceftriaxone', '2017-07-12 14:35:04', '2017-07-12 14:35:04'),
(6, 'Cotrimoxazole', '2017-07-12 14:35:11', '2017-07-12 14:35:11'),
(7, 'Amoxicillin', '2017-07-12 14:35:17', '2017-07-12 14:35:17'),
(8, 'Cephadroxilo', '2017-07-12 14:35:22', '2017-07-12 14:35:22'),
(9, 'Norfloxacin', '2017-07-12 14:35:44', '2017-07-12 14:35:44'),
(10, 'Nitrofurantoin', '2017-07-12 14:36:02', '2017-07-12 14:36:02'),
(11, 'Co-trimoxazole', '2017-07-12 14:36:16', '2017-07-12 14:36:16'),
(12, 'Cefixime', '2017-07-12 14:36:51', '2017-07-12 14:36:51'),
(13, 'Erythromycin', '2017-07-12 14:37:17', '2017-07-12 14:37:17'),
(14, 'Gentamicin', '2017-07-12 14:37:49', '2017-07-12 14:37:49'),
(15, 'Amikacin', '2017-07-12 14:37:56', '2017-07-12 14:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `test_antibiotic_results`
--

CREATE TABLE IF NOT EXISTS `test_antibiotic_results` (
`id` int(10) unsigned NOT NULL,
  `test_report_id` int(11) NOT NULL,
  `test_antibiotic_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_examinations`
--

CREATE TABLE IF NOT EXISTS `test_examinations` (
`id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `macroscopics` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `microscopics` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_references`
--

CREATE TABLE IF NOT EXISTS `test_references` (
`id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `range` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_references`
--

INSERT INTO `test_references` (`id`, `test_id`, `name`, `unit`, `range`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(26, NULL, 'Bilirubin (Direct)', 'mg/dl', '0.1-0.4', NULL, '2017-07-12 14:31:12', '2017-07-12 14:31:12', NULL),
(27, NULL, 'SGPT (ALT)', 'IU/L', 'Upto 40', NULL, '2017-07-12 14:32:12', '2017-07-12 14:32:12', NULL),
(28, NULL, 'SGOT (AST)', 'IU/L', 'Upto 40', NULL, '2017-07-12 14:32:48', '2017-07-12 14:32:48', NULL),
(29, NULL, 'Alkaline Phosphatase', 'U/L', '80-240', NULL, '2017-07-12 14:33:15', '2017-07-12 14:33:15', NULL),
(30, NULL, 'Total Cholesterol', 'mg/dl', '0 - 200', NULL, '2017-07-12 14:33:59', '2017-07-12 14:33:59', NULL),
(31, NULL, 'Triglyceride', 'mg/dl', '0 -150', NULL, '2017-07-12 14:35:08', '2017-07-12 14:35:08', NULL),
(32, NULL, 'HDL', 'mg/dl', '35-60', NULL, '2017-07-12 14:35:59', '2017-07-12 14:35:59', NULL),
(33, NULL, 'LDL', 'mg/dl', '0 - 100', NULL, '2017-07-12 14:37:45', '2017-07-12 14:37:45', NULL),
(34, NULL, 'VLDL', 'mg/dl', '0 - 30', NULL, '2017-07-12 14:38:20', '2017-07-12 14:38:20', NULL),
(35, NULL, 'HBA1C', '%', 'Normal : 0-5.7% , Pre-diabetes :5.7-6.4%,  Diabetic : 0-6.4%', NULL, '2017-07-12 14:58:51', '2017-07-12 14:58:51', NULL),
(36, NULL, 'Blood Glucose PP', 'mg/dl', 'Non-diabetic : 70-140 American Diabetes   : 0 - 180', NULL, '2017-07-12 15:17:57', '2017-07-12 15:35:35', NULL),
(37, NULL, 'Blood Glucose Random', 'mg/dl', '80 - 140', NULL, '2017-07-12 15:19:20', '2017-07-12 15:19:20', NULL),
(38, NULL, 'Blood Urea', 'mg/dl', '15 - 45', NULL, '2017-07-12 15:20:37', '2017-07-12 15:20:37', NULL),
(40, NULL, 'HDL Cholesterol', 'mg/dl', '> 55    (No Risk) 35-45  (Moderate Risk) < 35     (High Risk)', NULL, '2017-07-12 15:28:52', '2017-07-12 15:28:52', NULL),
(41, NULL, 'LDL  Cholesterol', 'mg/dl', '0-130', NULL, '2017-07-12 15:29:54', '2017-07-12 15:29:54', NULL),
(42, NULL, 'Thyroid Function Test (TFT)', NULL, NULL, NULL, '2017-07-12 15:31:57', '2017-07-12 15:31:57', NULL),
(43, NULL, 'TSH', 'uIU/ml', '0.40-5.50', 42, '2017-07-12 15:32:28', '2017-07-12 15:32:28', NULL),
(44, NULL, 'GOT (AST)', 'IU/L', 'Upto 40', NULL, '2017-07-12 15:32:43', '2017-07-12 15:32:43', NULL),
(45, NULL, 'T3', 'ng/ml', '0.60-1.81', 42, '2017-07-12 15:34:00', '2017-07-12 15:34:00', NULL),
(46, NULL, 'T4', 'ug/dl', '5.0-12.5', 42, '2017-07-12 15:34:24', '2017-07-12 15:34:24', NULL),
(47, NULL, 'FT3', 'pg/ml', '3.5-6.5', 42, '2017-07-12 15:34:45', '2017-07-12 15:34:45', NULL),
(48, NULL, 'FT4', 'ng/dl', '9.0-23.0', 42, '2017-07-12 15:35:07', '2017-07-12 15:35:07', NULL),
(49, NULL, 'Albumin', 'gm/dl', '3.5 – 5.0', NULL, '2017-07-12 15:35:12', '2017-07-12 15:35:37', NULL),
(50, NULL, 'A/G Ratio', 'mg/l', '0.9 – 2.1', NULL, '2017-07-12 15:36:26', '2017-07-24 12:26:36', NULL),
(51, NULL, 'CPK', 'U/L', 'Male : 46 -171 Female : 34 - 145', NULL, '2017-07-12 15:37:24', '2017-07-12 15:37:24', NULL),
(52, NULL, 'CPK-MB', 'U/L', 'below 25', NULL, '2017-07-12 15:37:55', '2017-07-12 15:37:55', NULL),
(53, NULL, 'Amylase', 'U/L', '0-86', NULL, '2017-07-12 15:38:37', '2017-07-12 15:38:37', NULL),
(54, NULL, 'LDH', 'U/L', 'Adults : 125 – 220 Children : 180 - 360', NULL, '2017-07-12 15:39:12', '2017-07-12 15:39:12', NULL),
(55, NULL, 'Gamma GT', 'U/L', '0-32', NULL, '2017-07-12 15:40:20', '2017-07-12 15:40:20', NULL),
(56, NULL, 'free PSA', 'ng/ml', '0- 0.42', NULL, '2017-07-12 15:40:40', '2017-07-12 15:42:11', NULL),
(57, NULL, 'PSA (quantitative)', 'ng/ml', '<4  Normal 4-10  probably BPH >10 probably', NULL, '2017-07-12 15:43:48', '2017-07-12 15:43:48', NULL),
(58, NULL, 'testosterone', 'ng/ml', '0.10-0.96', NULL, '2017-07-12 15:44:29', '2017-07-12 15:44:29', NULL),
(59, NULL, 'Acid Phosphatase', 'U/L', '80-240', NULL, '2017-07-24 13:11:23', '2017-07-24 13:11:23', NULL),
(60, NULL, 'Beta-HCG Level', NULL, NULL, NULL, '2017-07-25 16:09:51', '2017-07-25 16:09:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_reference_results`
--

CREATE TABLE IF NOT EXISTS `test_reference_results` (
`id` int(10) unsigned NOT NULL,
  `test_report_id` int(11) NOT NULL,
  `test_reference_id` int(11) NOT NULL,
  `result` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_reference_results`
--

INSERT INTO `test_reference_results` (`id`, `test_report_id`, `test_reference_id`, `result`, `flag`, `created_at`, `updated_at`) VALUES
(1, 1, 36, '70', 'L', '2024-01-11 21:49:56', '2024-01-11 21:49:56'),
(2, 1, 37, '80', 'L', '2024-01-11 21:49:56', '2024-01-11 21:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `test_reports`
--

CREATE TABLE IF NOT EXISTS `test_reports` (
`id` int(10) unsigned NOT NULL,
  `report_id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `report_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sample` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_reports`
--

INSERT INTO `test_reports` (`id`, `report_id`, `test_id`, `report_type`, `sample`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'haematology', 1, 1, '2024-01-11 21:47:00', '2024-01-11 21:49:57', NULL),
(2, 1, 2, 'examination', 1, 0, '2024-01-11 21:47:00', '2024-01-11 21:49:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_results`
--

CREATE TABLE IF NOT EXISTS `test_results` (
`id` int(10) unsigned NOT NULL,
  `test_report_id` int(10) unsigned NOT NULL,
  `result` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_results`
--

INSERT INTO `test_results` (`id`, `test_report_id`, `result`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'no comments, just a demo', 1, '2024-01-11 21:49:56', '2024-01-11 21:49:56', NULL),
(2, 1, 'no comments, just a demo', 1, '2024-01-11 21:49:56', '2024-01-11 21:49:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_stains`
--

CREATE TABLE IF NOT EXISTS `test_stains` (
`id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `test_names` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_test_antibiotic`
--

CREATE TABLE IF NOT EXISTS `test_test_antibiotic` (
`id` int(10) unsigned NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_antibiotic_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_test_reference`
--

CREATE TABLE IF NOT EXISTS `test_test_reference` (
`id` int(10) unsigned NOT NULL,
  `test_id` int(11) NOT NULL,
  `test_reference_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_test_reference`
--

INSERT INTO `test_test_reference` (`id`, `test_id`, `test_reference_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(27, 108, 26, NULL, NULL, NULL),
(28, 108, 27, NULL, NULL, NULL),
(29, 108, 28, NULL, NULL, NULL),
(35, 75, 17, NULL, NULL, NULL),
(36, 100, 24, NULL, NULL, NULL),
(37, 108, 29, NULL, NULL, NULL),
(38, 178, 32, NULL, NULL, NULL),
(39, 178, 33, NULL, NULL, NULL),
(40, 178, 34, NULL, NULL, NULL),
(41, 178, 30, NULL, NULL, NULL),
(42, 178, 31, NULL, NULL, NULL),
(44, 2, 8, NULL, NULL, NULL),
(45, 151, 42, NULL, NULL, NULL),
(46, 16, 53, NULL, NULL, NULL),
(47, 3, 5, NULL, NULL, NULL),
(48, 13, 49, NULL, NULL, NULL),
(49, 4, 59, NULL, NULL, NULL),
(50, 175, 25, NULL, NULL, NULL),
(51, 45, 30, NULL, NULL, NULL),
(52, 56, 21, NULL, NULL, NULL),
(53, 120, 23, NULL, NULL, NULL),
(54, 143, 22, NULL, NULL, NULL),
(55, 101, 54, NULL, NULL, NULL),
(56, 181, 42, NULL, NULL, NULL),
(57, 183, 61, NULL, NULL, NULL),
(58, 1, 36, NULL, NULL, NULL),
(59, 1, 37, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Superadmin', 'admin@admin.com', '$2y$10$/1UZ2XHMAD8KznK7B80mTe/.UP.rba9Cta0bXWKuQebFjTGSddbhm', 1, '9Cv37wFJwP60y5j2Nl4c6kxV5ytfBOWCiJI4q4Own9UuzTGnZQRIwpk0nxWY', '2017-07-11 03:27:25', '2017-07-23 23:52:46', NULL),
(2, 'User', 'user@user.com', '$2y$10$XuwWv0DZmGDQ0Do14vffSu1iROgkAgAYnabfZLhNVUHfhSzYfEcwi', 2, 'xnjdI35WL2S5Ki63FWyg4sgloQItroGVkeLoIL5vqA4qkxh7tanpLTwPGb8J', '2017-07-15 12:26:11', '2017-07-24 01:00:09', NULL),
(3, 'admin', 'admin@mail.com', '$2y$10$YCYfFsiYpH.udai3JF1fUOyYlM4Wm/JzqZ2ka1OMCGZ23p7eiWPVK', 1, 'wnZSUHjs5CkWisAqvScPCEzH6MI8ZsAY8P21UbTdxmIVVNVCNifcNx8rNzZa', '2024-01-03 04:52:53', '2024-01-03 04:52:53', NULL),
(4, 'lab', 'lab@mail.com', '$2y$10$qAWXFLrHsj9zdADrsXic1.hXuCaUMYbI2qmimkTwrcUBo.25/NTPG', 3, 'b8STBVlxJQ9druRZD3Aufe8C63e2Hef2qLQf6hPsQ0Yj67mF91cqx11IolK6', '2024-01-11 20:43:29', '2024-01-11 20:43:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
 ADD PRIMARY KEY (`id`), ADD KEY `appointments_patient_id_foreign` (`patient_id`), ADD KEY `appointments_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
 ADD PRIMARY KEY (`id`), ADD KEY `doctors_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `doctor_referreds`
--
ALTER TABLE `doctor_referreds`
 ADD PRIMARY KEY (`id`), ADD KEY `doctor_referreds_doctor_id_foreign` (`doctor_id`), ADD KEY `doctor_referreds_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
 ADD PRIMARY KEY (`id`), ADD KEY `employees_department_id_foreign` (`department_id`);

--
-- Indexes for table `examination_results`
--
ALTER TABLE `examination_results`
 ADD PRIMARY KEY (`id`), ADD KEY `examination_results_test_report_id_foreign` (`test_report_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
 ADD PRIMARY KEY (`id`), ADD KEY `invoices_user_id_foreign` (`user_id`), ADD KEY `invoices_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `invoice_returns`
--
ALTER TABLE `invoice_returns`
 ADD PRIMARY KEY (`id`), ADD KEY `invoice_returns_invoice_id_foreign` (`invoice_id`), ADD KEY `invoice_returns_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_sales`
--
ALTER TABLE `opd_sales`
 ADD PRIMARY KEY (`id`), ADD KEY `opd_sales_doctor_id_foreign` (`doctor_id`), ADD KEY `opd_sales_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_sales`
--
ALTER TABLE `package_sales`
 ADD PRIMARY KEY (`id`), ADD KEY `package_sales_package_id_foreign` (`package_id`), ADD KEY `package_sales_invoice_id_foreign` (`invoice_id`), ADD KEY `package_sales_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `package_tests`
--
ALTER TABLE `package_tests`
 ADD PRIMARY KEY (`id`), ADD KEY `package_tests_test_id_foreign` (`test_id`), ADD KEY `package_tests_package_id_foreign` (`package_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference_results`
--
ALTER TABLE `reference_results`
 ADD PRIMARY KEY (`id`), ADD KEY `reference_results_test_report_id_foreign` (`test_report_id`), ADD KEY `reference_results_test_reference_id_foreign` (`test_reference_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
 ADD PRIMARY KEY (`id`), ADD KEY `reports_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_sales`
--
ALTER TABLE `service_sales`
 ADD PRIMARY KEY (`id`), ADD KEY `service_sales_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `temps`
--
ALTER TABLE `temps`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_antibiotics`
--
ALTER TABLE `test_antibiotics`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_antibiotic_results`
--
ALTER TABLE `test_antibiotic_results`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_examinations`
--
ALTER TABLE `test_examinations`
 ADD PRIMARY KEY (`id`), ADD KEY `test_examinations_test_id_foreign` (`test_id`);

--
-- Indexes for table `test_references`
--
ALTER TABLE `test_references`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_reference_results`
--
ALTER TABLE `test_reference_results`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_reports`
--
ALTER TABLE `test_reports`
 ADD PRIMARY KEY (`id`), ADD KEY `test_reports_test_id_foreign` (`test_id`), ADD KEY `test_reports_report_id_foreign` (`report_id`);

--
-- Indexes for table `test_results`
--
ALTER TABLE `test_results`
 ADD PRIMARY KEY (`id`), ADD KEY `test_results_test_report_id_foreign` (`test_report_id`);

--
-- Indexes for table `test_stains`
--
ALTER TABLE `test_stains`
 ADD PRIMARY KEY (`id`), ADD KEY `test_stains_test_id_foreign` (`test_id`);

--
-- Indexes for table `test_test_antibiotic`
--
ALTER TABLE `test_test_antibiotic`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_test_reference`
--
ALTER TABLE `test_test_reference`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `doctor_referreds`
--
ALTER TABLE `doctor_referreds`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `examination_results`
--
ALTER TABLE `examination_results`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `invoice_returns`
--
ALTER TABLE `invoice_returns`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `opd_sales`
--
ALTER TABLE `opd_sales`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `package_sales`
--
ALTER TABLE `package_sales`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `package_tests`
--
ALTER TABLE `package_tests`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=283;
--
-- AUTO_INCREMENT for table `reference_results`
--
ALTER TABLE `reference_results`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=182;
--
-- AUTO_INCREMENT for table `service_sales`
--
ALTER TABLE `service_sales`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `temps`
--
ALTER TABLE `temps`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `test_antibiotics`
--
ALTER TABLE `test_antibiotics`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `test_antibiotic_results`
--
ALTER TABLE `test_antibiotic_results`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_examinations`
--
ALTER TABLE `test_examinations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_references`
--
ALTER TABLE `test_references`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `test_reference_results`
--
ALTER TABLE `test_reference_results`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `test_reports`
--
ALTER TABLE `test_reports`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `test_results`
--
ALTER TABLE `test_results`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `test_stains`
--
ALTER TABLE `test_stains`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_test_antibiotic`
--
ALTER TABLE `test_test_antibiotic`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_test_reference`
--
ALTER TABLE `test_test_reference`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
