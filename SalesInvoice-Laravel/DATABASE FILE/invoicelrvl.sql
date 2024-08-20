-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2023 at 02:37 AM
-- Server version: 5.6.21
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `invoicelrvl`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Test Category', 'test-category', 1, '2023-12-08 18:44:35', '2023-12-08 18:44:35'),
(2, 'UPDTD Category', 'updtd-category', 1, '2023-12-12 16:29:23', '2023-12-12 16:29:40'),
(3, 'Demo Category', 'demo-category', 1, '2023-12-13 00:10:07', '2023-12-13 00:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
`id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `previous_balance` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `mobile`, `address`, `email`, `details`, `previous_balance`, `created_at`, `updated_at`) VALUES
(1, 'Customer A', '87777777777', '77 Demo Address', 'customera@mail.com', 'qwertyu', '111', '2023-12-08 18:46:55', '2023-12-08 18:46:55'),
(2, 'Customer B', '11111111110', '778 Demo Test', 'customerb@mail.com', 'demo demo', '111', '2023-12-11 14:22:50', '2023-12-11 14:22:50'),
(3, 'Customer C', '11111110111', '77/7 Demo Address', 'customerc@mail.com', 'demooo', '112', '2023-12-11 14:42:59', '2023-12-11 14:42:59'),
(4, 'Demo Customer', '77777777777', '777 Demo', 'demo@customer.com', 'asdsadasdasd', '111', '2023-12-12 14:49:05', '2023-12-12 14:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
`id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, '1000', '2023-12-08 18:53:24', '2023-12-08 18:53:24'),
(2, 2, '1000', '2023-12-11 14:23:13', '2023-12-11 14:23:13'),
(3, 3, '1000', '2023-12-12 14:46:02', '2023-12-12 14:46:02'),
(4, 1, '1000', '2023-12-12 14:47:12', '2023-12-12 14:47:12'),
(5, 4, '1000', '2023-12-12 15:05:51', '2023-12-12 15:05:51'),
(6, 4, '1000', '2023-12-12 19:52:26', '2023-12-12 19:52:26'),
(7, 3, '1000', '2023-12-12 20:20:14', '2023-12-12 20:20:14'),
(8, 4, '1000', '2023-12-12 22:46:24', '2023-12-12 22:46:24'),
(9, 3, '1000', '2023-12-12 22:47:34', '2023-12-12 22:47:34'),
(10, 1, '1000', '2023-12-12 22:48:30', '2023-12-12 22:48:30'),
(12, 3, '1000', '2023-12-13 00:12:54', '2023-12-13 00:12:54'),
(13, 4, '1000', '2023-12-13 00:14:17', '2023-12-13 00:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
`id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_09_14_134301_create_categories_table', 1),
(4, '2019_09_15_053453_create_taxes_table', 1),
(5, '2019_09_15_055531_create_units_table', 1),
(6, '2019_09_15_061238_create_suppliers_table', 1),
(7, '2019_09_15_065207_create_customers_table', 1),
(8, '2019_09_15_101601_create_products_table', 1),
(9, '2019_09_17_043116_create_product_suppliers_table', 1),
(10, '2019_09_18_180122_create_invoices_table', 1),
(11, '2019_09_24_071816_create_sales_table', 1),
(12, '2019_09_25_123326_create_purchases_table', 1);

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
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` int(11) NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `sales_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `serial_number`, `model`, `category_id`, `sales_price`, `unit_id`, `image`, `tax_id`, `created_at`, `updated_at`) VALUES
(1, 'Product A', 111011, 'DDDT', 1, '44', 1, '1702439100_657928bc9d95d.png', '1', '2023-12-08 18:52:46', '2023-12-12 16:45:00'),
(2, 'Sample Product', 100145, 'XYZ', 1, '20', 1, '1702443371_6579396bdf0ae.png', '1', '2023-12-10 13:35:29', '2023-12-12 17:56:11'),
(3, 'Product C', 410101, 'ASTR0', 1, '26', 1, '1702450226_65795432ae641.png', '1', '2023-12-12 15:02:14', '2023-12-12 19:50:26'),
(5, 'Product B', 10011, 'ERTYU', 2, '29', 1, '1702449322_657950aaee416.png', '1', '2023-12-12 17:57:10', '2023-12-12 19:35:22'),
(6, 'Product D', 12345677, 'QWXXQ', 1, '32', 1, '1702450307_65795483a6843.png', '1', '2023-12-12 19:51:20', '2023-12-12 19:51:47'),
(7, 'Product E', 1010111, 'TYUIO', 2, '20', 1, '1702450464_65795520115ab.png', '1', '2023-12-12 19:54:24', '2023-12-12 19:54:24'),
(8, 'Product F', 1011117, 'ASTR0', 2, '28', 1, '1702460354_65797bc2eee29.png', '1', '2023-12-12 22:39:14', '2023-12-12 22:39:14'),
(9, 'Product Testt', 1204444, 'ASTR0', 3, '29', 1, '1702465892_6579916499fee.png', '3', '2023-12-13 00:11:32', '2023-12-13 00:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_suppliers`
--

CREATE TABLE IF NOT EXISTS `product_suppliers` (
`id` bigint(20) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_suppliers`
--

INSERT INTO `product_suppliers` (`id`, `product_id`, `supplier_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 33, '2023-12-08 18:52:46', '2023-12-08 18:52:46'),
(2, 2, 1, 16, '2023-12-10 13:35:29', '2023-12-10 13:35:29'),
(3, 3, 1, 21, '2023-12-12 15:02:14', '2023-12-12 15:02:14'),
(5, 5, 1, 24, '2023-12-12 17:57:10', '2023-12-12 17:57:10'),
(11, 6, 1, 22, '2023-12-12 19:51:20', '2023-12-12 19:51:47'),
(12, 7, 2, 16, '2023-12-12 19:54:24', '2023-12-12 19:54:24'),
(13, 8, 2, 21, '2023-12-12 22:39:15', '2023-12-12 22:39:15'),
(14, 9, 2, 20, '2023-12-13 00:11:33', '2023-12-13 00:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
`id` int(11) NOT NULL,
  `supplier_id` bigint(20) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
`id` bigint(20) unsigned NOT NULL,
  `invoice_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `dis` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoice_id`, `product_id`, `qty`, `price`, `dis`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 44, 0, 88, '2023-12-08 18:53:24', '2023-12-08 18:53:24'),
(2, 2, 2, 8, 20, 0, 160, '2023-11-05 14:23:13', '2023-12-11 14:23:13'),
(3, 3, 1, 8, 44, 0, 352, '2023-12-12 14:46:02', '2023-12-12 14:46:02'),
(4, 4, 2, 3, 20, 0, 60, '2023-10-22 16:49:12', '2023-12-12 14:47:12'),
(5, 5, 3, 2, 26, 0, 52, '2023-12-11 15:05:51', '2023-12-12 15:05:51'),
(6, 6, 6, 5, 32, 0, 160, '2023-09-12 20:52:26', '2023-12-12 19:52:26'),
(7, 7, 3, 2, 26, 2, 51, '2023-12-12 20:20:15', '2023-12-12 20:20:15'),
(8, 7, 7, 6, 20, 0, 120, '2023-12-12 20:20:15', '2023-12-12 20:20:15'),
(9, 8, 5, 4, 29, 0, 116, '2023-12-11 22:46:24', '2023-12-12 22:46:24'),
(10, 9, 3, 12, 26, 0, 312, '2023-12-11 22:47:34', '2023-12-12 22:47:34'),
(11, 10, 1, 3, 44, 0, 132, '2023-11-11 22:48:30', '2023-12-12 22:48:30'),
(13, 12, 9, 8, 29, 10, 209, '2023-12-13 00:12:54', '2023-12-13 00:12:54'),
(14, 13, 8, 2, 28, 0, 56, '2023-12-13 00:14:17', '2023-12-13 00:14:17'),
(15, 13, 9, 2, 29, 2, 57, '2023-12-13 00:14:17', '2023-12-13 00:14:17'),
(16, 13, 5, 2, 29, 2, 57, '2023-12-13 00:14:17', '2023-12-13 00:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
`id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `previous_balance` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `mobile`, `address`, `details`, `previous_balance`, `created_at`, `updated_at`) VALUES
(1, 'ABC Supplier', '77777777777', '77 Test Address', 'asdffb', '111', '2023-12-08 18:45:41', '2023-12-08 18:45:41'),
(2, 'XYZ Supplier', '77777777770', '787 Demo', 'asdsadasdsadd', '222', '2023-12-12 19:53:26', '2023-12-12 19:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE IF NOT EXISTS `taxes` (
`id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, '5', '5', 1, '2023-12-08 18:44:54', '2023-12-08 18:44:54'),
(2, '10', '10', 1, '2023-12-12 16:28:06', '2023-12-12 16:28:14'),
(3, '2', '2', 1, '2023-12-13 00:09:48', '2023-12-13 00:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
`id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TEST', 'test', 1, '2023-12-08 18:45:51', '2023-12-08 18:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` bigint(20) unsigned NOT NULL,
  `f_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `email`, `image`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Code', 'Astro', 'admin@mail.com', 'admin-icn.png', NULL, '$2y$10$z2E4fnu31lUOh12ZcDMdle4mqSkLHp1hM/txrZ.XJi5P1dmP9EUqO', NULL, NULL, '2023-12-12 22:35:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
 ADD PRIMARY KEY (`id`), ADD KEY `invoices_customer_id_foreign` (`customer_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_supplier_id` (`supplier_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`id`), ADD KEY `sales_invoice_id_foreign` (`invoice_id`), ADD KEY `sales_product_id_foreign` (`product_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
ADD CONSTRAINT `fk_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
ADD CONSTRAINT `sales_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `sales_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
