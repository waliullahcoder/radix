-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for radix
USE `wwcoders_radix`;

-- Dumping structure for table radix.admin_menus
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE IF NOT EXISTS `admin_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_deletable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menus_permission_id_foreign` (`permission_id`),
  KEY `admin_menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `admin_menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_menus_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.admin_menus: ~49 rows (approximately)
DELETE FROM `admin_menus`;
INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `is_deletable`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'Dashboard', 'admin.dashboard', '<span class="material-symbols-outlined fs-22"> home_app_logo </span>', 1, 1, 1, '2025-06-17 05:07:50', '2025-06-17 05:31:46'),
	(2, 2, NULL, 'System Settings', NULL, '<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>', 2, 1, 1, '2025-06-17 05:10:14', '2025-06-17 05:10:14'),
	(3, 3, 2, 'Roles', 'admin.role.index', NULL, 1, 1, 1, '2025-06-17 05:10:36', '2025-06-17 05:10:36'),
	(4, 4, 2, 'Users', 'admin.user.index', NULL, 2, 1, 1, '2025-06-17 05:11:10', '2025-06-17 05:11:10'),
	(5, 5, 2, 'Admin Menu', 'admin.admin-menu.index', NULL, 3, 1, 1, '2025-06-17 05:11:51', '2026-02-13 09:13:16'),
	(6, 6, 2, 'Admin Settings', 'admin.admin-settings.index', NULL, 4, 1, 1, '2025-06-17 05:12:59', '2025-06-17 05:12:59'),
	(9, 32, NULL, 'Sattlement', 'admin.invest-sattlement.index', '<span class="material-symbols-outlined fs-24"> inventory </span>', 9, 1, 1, '2025-06-17 05:40:52', '2025-07-22 06:49:30'),
	(10, 37, NULL, 'General Accounting', NULL, '<span class="material-symbols-outlined fs-24"> calculate </span>', 11, 1, 1, '2025-06-17 05:42:20', '2025-07-03 03:56:00'),
	(11, 38, 10, 'Transaction', NULL, NULL, 1, 1, 1, '2025-06-17 05:42:51', '2025-06-17 05:42:51'),
	(12, 39, 10, 'Reports', NULL, NULL, 2, 1, 1, '2025-06-17 05:43:04', '2025-06-17 05:43:04'),
	(13, 40, 11, 'Chart of Accounts', 'admin.coa.index', NULL, 1, 1, 1, '2025-06-17 05:43:37', '2025-06-17 05:43:37'),
	(14, 44, 11, 'Debit Voucher', 'admin.debit-voucher.index', NULL, 2, 1, 1, '2025-06-17 05:45:02', '2025-06-17 05:45:02'),
	(15, 49, 11, 'Credit Voucher', 'admin.credit-voucher.index', NULL, 3, 1, 1, '2025-06-17 05:46:11', '2025-06-17 05:46:11'),
	(16, 54, 11, 'Journal Voucher', 'admin.journal-voucher.index', NULL, 4, 1, 1, '2025-06-17 05:46:57', '2025-06-17 05:46:57'),
	(17, 59, 11, 'Voucher Approve', 'admin.voucher-approve.index', NULL, 5, 1, 1, '2025-06-17 05:48:10', '2025-06-17 05:56:08'),
	(18, 62, 11, 'Voucher Refuse', 'admin.voucher-refuse.index', NULL, 6, 1, 1, '2025-06-17 05:50:19', '2025-06-17 05:56:21'),
	(19, 65, 11, 'Automation Approve', 'admin.automation-approve.index', NULL, 7, 1, 1, '2025-06-17 05:51:28', '2025-06-17 05:56:39'),
	(20, 68, 11, 'Automation Refuse', 'admin.automation-refuse.index', NULL, 8, 1, 1, '2025-06-17 05:52:56', '2025-06-17 05:56:47'),
	(21, 71, 12, 'Chart of Accounts', 'admin.coa-list.index', NULL, 1, 1, 1, '2025-06-17 06:02:09', '2025-06-17 06:02:09'),
	(22, 72, 12, 'Daily Voucher List', 'admin.voucher-list.index', NULL, 2, 1, 1, '2025-06-17 06:02:32', '2025-06-17 06:02:32'),
	(23, 73, 12, 'Daily Cash Book', 'admin.cash-book.index', NULL, 3, 1, 1, '2025-06-17 06:03:05', '2025-06-17 06:03:05'),
	(24, 74, 12, 'Bank Book', 'admin.bank-book.index', NULL, 4, 1, 1, '2025-06-17 06:03:16', '2025-06-17 06:03:16'),
	(25, 75, 12, 'Transaction Ledger', 'admin.transaction-ledger.index', NULL, 5, 1, 1, '2025-06-17 06:03:37', '2025-06-17 06:03:37'),
	(26, 76, 12, 'General Ledger', 'admin.general-ledger.index', NULL, 6, 1, 1, '2025-06-17 06:03:52', '2025-06-17 06:03:52'),
	(27, 77, 12, 'Cash Flow Statement', 'admin.cash-flow-statement.index', NULL, 7, 1, 1, '2025-06-17 06:04:23', '2025-06-17 06:04:23'),
	(28, 78, 12, 'Trial Balance', 'admin.trial-balance.index', NULL, 8, 1, 1, '2025-06-17 06:04:35', '2025-06-17 06:04:35'),
	(29, 79, 12, 'Income Statement', 'admin.income-statement.index', NULL, 9, 1, 1, '2025-06-17 06:04:58', '2025-06-17 06:04:58'),
	(30, 80, 12, 'Balance Sheet', 'admin.balance-sheet.index', NULL, 10, 1, 1, '2025-06-17 06:05:13', '2025-06-17 06:05:13'),
	(39, 138, NULL, 'Product Management', NULL, '<span class="material-symbols-outlined fs-24"> inventory </span>', 4, 1, 1, '2025-07-17 04:00:10', '2026-02-10 21:01:06'),
	(40, 139, 39, 'Product Manage', 'admin.product.index', NULL, 1, 1, 1, '2025-07-17 04:01:15', '2026-02-10 21:03:13'),
	(41, 155, NULL, 'Sales Management', NULL, '<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>', 4, 1, 1, '2025-07-19 04:47:23', '2025-07-19 04:47:23'),
	(42, 156, 41, 'Order Manage', 'admin.orders.index', NULL, 1, 1, 1, '2025-07-19 04:49:14', '2026-02-14 07:20:07'),
	(43, 157, 41, 'Sales', 'admin.sales.index', NULL, 2, 1, 1, '2025-07-19 04:49:37', '2025-07-19 04:49:37'),
	(44, 166, 39, 'Vendors', 'admin.vendor.index', NULL, 2, 1, 1, '2025-07-19 04:51:17', '2026-02-10 21:36:19'),
	(45, 167, NULL, 'CMS Setup', NULL, '<span class="material-symbols-outlined fs-24"> api </span>', 3, 1, 1, '2025-07-19 05:13:16', '2026-02-13 09:16:59'),
	(46, 168, 45, 'Settings UI', 'admin.settings.index', NULL, 1, 1, 1, '2025-07-19 05:14:11', '2026-02-13 09:15:39'),
	(50, 190, 41, 'Collections', 'admin.collection.index', NULL, 3, 1, 1, '2025-07-20 07:50:25', '2025-07-20 07:50:25'),
	(51, 196, 41, 'Sales Returns', 'admin.sales-return.index', NULL, 4, 1, 1, '2025-07-21 05:38:18', '2025-07-21 05:38:18'),
	(53, 208, NULL, 'Profit Distribution', 'admin.profit-distribution.index', '<span class="material-symbols-outlined fs-24"> event_repeat </span>', 7, 1, 1, '2025-07-22 02:47:36', '2025-07-22 02:47:49'),
	(57, 232, 39, 'Brand', 'admin.brand.index', NULL, 1, 1, 1, '2026-02-10 21:38:59', '2026-02-10 21:40:09'),
	(58, 235, 39, 'Unit', 'admin.uom.index', NULL, 3, 1, 1, '2026-02-10 21:43:27', '2026-02-10 21:43:27'),
	(59, 238, 39, 'Categories', 'admin.category.index', NULL, 4, 1, 1, '2026-02-10 21:55:36', '2026-02-10 21:55:36');

-- Dumping structure for table radix.admin_menu_actions
DROP TABLE IF EXISTS `admin_menu_actions`;
CREATE TABLE IF NOT EXISTS `admin_menu_actions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `admin_menu_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menu_actions_permission_id_foreign` (`permission_id`),
  KEY `admin_menu_actions_admin_menu_id_foreign` (`admin_menu_id`),
  CONSTRAINT `admin_menu_actions_admin_menu_id_foreign` FOREIGN KEY (`admin_menu_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_menu_actions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.admin_menu_actions: ~121 rows (approximately)
DELETE FROM `admin_menu_actions`;
INSERT INTO `admin_menu_actions` (`id`, `permission_id`, `admin_menu_id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
	(1, 8, 5, 'create', 'admin.admin-menu.create', 1, '2025-06-17 05:30:00', '2025-06-17 05:30:00'),
	(2, 9, 5, 'edit', 'admin.admin-menu.edit', 1, '2025-06-17 05:30:15', '2025-06-17 05:30:15'),
	(3, 10, 5, 'delete', 'admin.admin-menu.destroy', 1, '2025-06-17 05:30:19', '2025-06-17 05:30:19'),
	(4, 11, 5, 'view actions', 'admin.admin-menu-action.index', 1, '2025-06-17 05:30:59', '2025-06-17 05:30:59'),
	(5, 12, 5, 'create action', 'admin.admin-menu-action.create', 1, '2025-06-17 05:31:06', '2025-06-17 05:31:06'),
	(6, 13, 5, 'edit action', 'admin.admin-menu-action.edit', 1, '2025-06-17 05:31:15', '2025-06-17 05:31:15'),
	(7, 14, 5, 'delete action', 'admin.admin-menu-action.destroy', 1, '2025-06-17 05:31:21', '2025-06-17 05:31:21'),
	(8, 15, 3, 'create', 'admin.role.create', 1, '2025-06-17 05:32:05', '2025-06-17 05:32:05'),
	(9, 16, 3, 'edit', 'admin.role.edit', 1, '2025-06-17 05:32:09', '2025-06-17 05:32:09'),
	(10, 17, 3, 'delete', 'admin.role.destroy', 1, '2025-06-17 05:32:15', '2025-06-17 05:32:15'),
	(11, 18, 3, 'edit permission', 'admin.role-permission.edit', 1, '2025-06-17 05:32:50', '2025-06-17 05:32:50'),
	(12, 19, 4, 'create', 'admin.user.create', 1, '2025-06-17 05:33:17', '2025-06-17 05:33:17'),
	(13, 20, 4, 'edit', 'admin.user.edit', 1, '2025-06-17 05:33:20', '2025-06-17 05:33:20'),
	(24, 33, 9, 'create', 'admin.invest-sattlement.create', 1, '2025-06-17 05:41:09', '2025-06-23 04:19:25'),
	(25, 34, 9, 'edit', 'admin.invest-sattlement.edit', 1, '2025-06-17 05:41:13', '2025-06-23 04:19:31'),
	(28, 41, 13, 'create', 'admin.coa.create', 1, '2025-06-17 05:44:10', '2025-06-17 05:44:10'),
	(29, 42, 13, 'edit', 'admin.coa.edit', 1, '2025-06-17 05:44:15', '2025-06-17 05:44:15'),
	(30, 43, 13, 'delete', 'admin.coa.destroy', 1, '2025-06-17 05:44:20', '2025-06-17 05:44:20'),
	(31, 45, 14, 'create', 'admin.debit-voucher.create', 1, '2025-06-17 05:45:12', '2025-06-17 05:45:12'),
	(32, 46, 14, 'edit', 'admin.debit-voucher.edit', 1, '2025-06-17 05:45:17', '2025-06-17 05:45:17'),
	(35, 50, 15, 'create', 'admin.credit-voucher.create', 1, '2025-06-17 05:46:23', '2025-06-17 05:46:23'),
	(36, 51, 15, 'edit', 'admin.credit-voucher.edit', 1, '2025-06-17 05:46:27', '2025-06-17 05:46:27'),
	(39, 55, 16, 'create', 'admin.journal-voucher.create', 1, '2025-06-17 05:47:08', '2025-06-17 05:47:08'),
	(40, 56, 16, 'edit', 'admin.journal-voucher.edit', 1, '2025-06-17 05:47:13', '2025-06-17 05:47:13'),
	(43, 60, 17, 'view', 'admin.voucher-approve.show', 1, '2025-06-17 05:48:51', '2025-06-17 05:48:51'),
	(44, 61, 17, 'approve', 'admin.voucher-approve.edit', 1, '2025-06-17 05:49:08', '2025-06-17 05:49:08'),
	(45, 63, 18, 'view', 'admin.voucher-refuse.show', 1, '2025-06-17 05:50:44', '2025-06-17 05:50:44'),
	(46, 64, 18, 'approve', 'admin.voucher-refuse.edit', 1, '2025-06-17 05:50:49', '2025-06-17 05:50:49'),
	(47, 66, 19, 'view', 'admin.automation-approve.show', 1, '2025-06-17 05:51:41', '2025-06-17 05:51:41'),
	(48, 67, 19, 'approve', 'admin.automation-approve.edit', 1, '2025-06-17 05:51:52', '2025-06-17 05:51:52'),
	(49, 69, 20, 'view', 'admin.automation-refuse.show', 1, '2025-06-17 05:53:09', '2025-06-17 05:53:09'),
	(50, 70, 20, 'refuse', 'admin.automation-refuse.edit', 1, '2025-06-17 05:53:17', '2025-06-17 05:53:17'),
	(51, 81, 14, 'view', 'admin.debit-voucher.show', 1, '2025-06-18 04:03:34', '2025-06-18 04:03:34'),
	(52, 82, 14, 'print', 'admin.debit-voucher.print', 1, '2025-06-18 04:03:38', '2025-06-18 04:03:38'),
	(53, 83, 14, 'delete', 'admin.debit-voucher.destroy', 1, '2025-06-18 04:03:43', '2025-06-18 04:03:43'),
	(54, 84, 14, 'trash', 'admin.debit-voucher.trash', 1, '2025-06-18 04:03:47', '2025-06-18 04:03:47'),
	(55, 85, 15, 'view', 'admin.credit-voucher.show', 1, '2025-06-18 22:26:47', '2025-06-18 22:26:47'),
	(56, 86, 15, 'print', 'admin.credit-voucher.print', 1, '2025-06-18 22:26:51', '2025-06-18 22:26:51'),
	(57, 87, 15, 'delete', 'admin.credit-voucher.destroy', 1, '2025-06-18 22:26:59', '2025-06-18 22:26:59'),
	(58, 88, 15, 'trash', 'admin.credit-voucher.trash', 1, '2025-06-18 22:27:03', '2025-06-18 22:27:03'),
	(91, 127, 9, 'view', 'admin.invest-sattlement.show', 1, '2025-06-23 04:19:48', '2025-06-23 04:19:48'),
	(92, 128, 9, 'delete', 'admin.invest-sattlement.destroy', 1, '2025-06-23 04:19:56', '2025-06-23 04:19:56'),
	(93, 129, 9, 'trash', 'admin.invest-sattlement.trash', 1, '2025-06-23 04:20:01', '2025-06-23 04:20:01'),
	(94, 130, 4, 'change password', 'admin.user.password', 1, '2025-06-23 22:35:11', '2025-06-23 22:35:11'),
	(95, 131, 4, 'delete', 'admin.user.destroy', 1, '2025-06-23 22:35:16', '2025-06-23 22:35:16'),
	(96, 132, 4, 'trash', 'admin.user.trash', 1, '2025-06-23 22:35:21', '2025-06-23 22:35:21'),
	(107, 147, 40, 'create', 'admin.production.create', 1, '2025-07-18 22:28:23', '2025-07-18 22:28:23'),
	(108, 148, 40, 'edit', 'admin.production.edit', 1, '2025-07-18 22:28:27', '2025-07-18 22:28:27'),
	(109, 149, 40, 'view', 'admin.production.show', 1, '2025-07-18 22:28:33', '2025-07-18 22:28:33'),
	(112, 152, 40, 'print', 'admin.production.print', 1, '2025-07-19 04:38:54', '2025-07-19 04:38:54'),
	(113, 153, 40, 'delete', 'admin.production.destroy', 1, '2025-07-19 04:38:59', '2025-07-19 04:38:59'),
	(114, 154, 40, 'trash', 'admin.production.trash', 1, '2025-07-19 04:39:06', '2025-07-19 04:39:06'),
	(115, 158, 42, 'create', 'admin.client.create', 1, '2025-07-19 04:49:55', '2025-07-19 04:49:55'),
	(116, 159, 42, 'edit', 'admin.client.edit', 1, '2025-07-19 04:50:00', '2025-07-19 04:50:00'),
	(117, 160, 42, 'delete', 'admin.client.destroy', 1, '2025-07-19 04:50:07', '2025-07-19 04:50:07'),
	(118, 161, 42, 'trash', 'admin.client.trash', 1, '2025-07-19 04:50:11', '2025-07-19 04:50:11'),
	(119, 162, 43, 'create', 'admin.sales.create', 1, '2025-07-19 04:50:26', '2025-07-19 04:50:26'),
	(120, 163, 43, 'edit', 'admin.sales.edit', 1, '2025-07-19 04:50:29', '2025-07-19 04:50:29'),
	(121, 164, 43, 'print', 'admin.sales.show', 1, '2025-07-19 04:50:33', '2025-07-20 07:51:18'),
	(123, 171, 46, 'create', 'admin.region.create', 1, '2025-07-19 06:11:34', '2025-07-19 06:11:34'),
	(124, 172, 46, 'edit', 'admin.region.edit', 1, '2025-07-19 06:11:40', '2025-07-19 06:11:40'),
	(125, 173, 46, 'delete', 'admin.region.destroy', 1, '2025-07-19 06:11:45', '2025-07-19 06:11:45'),
	(126, 174, 46, 'trash', 'admin.region.trash', 1, '2025-07-19 06:11:50', '2025-07-19 06:11:50'),
	(139, 188, 43, 'delete', 'admin.sales.destroy', 1, '2025-07-20 07:36:18', '2025-07-20 07:36:18'),
	(140, 189, 43, 'trash', 'admin.sales.trash', 1, '2025-07-20 07:36:23', '2025-07-20 07:36:23'),
	(141, 191, 50, 'create', 'admin.collection.create', 1, '2025-07-20 07:50:36', '2025-07-20 07:50:36'),
	(142, 192, 50, 'edit', 'admin.collection.edit', 1, '2025-07-20 07:50:41', '2025-07-20 07:50:41'),
	(143, 193, 50, 'print', 'admin.collection.show', 1, '2025-07-20 07:50:45', '2025-07-20 07:50:45'),
	(144, 194, 50, 'delete', 'admin.collection.destroy', 1, '2025-07-20 07:50:52', '2025-07-20 07:50:52'),
	(145, 195, 50, 'trash', 'admin.collection.trash', 1, '2025-07-20 07:50:56', '2025-07-20 07:50:56'),
	(146, 197, 51, 'create', 'admin.sales-return.create', 1, '2025-07-21 05:38:34', '2025-07-21 05:38:34'),
	(147, 198, 51, 'edit', 'admin.sales-return.edit', 1, '2025-07-21 05:38:45', '2025-07-21 05:38:45'),
	(148, 199, 51, 'print', 'admin.sales-return.show', 1, '2025-07-21 05:38:49', '2025-07-21 05:38:49'),
	(149, 200, 51, 'delete', 'admin.sales-return.destroy', 1, '2025-07-21 05:38:55', '2025-07-21 05:38:55'),
	(150, 201, 51, 'trash', 'admin.sales-return.trash', 1, '2025-07-21 05:39:07', '2025-07-21 05:39:07'),
	(156, 209, 53, 'create', 'admin.profit-distribution.create', 1, '2025-07-22 02:47:59', '2025-07-22 02:47:59'),
	(157, 210, 53, 'edit', 'admin.profit-distribution.edit', 1, '2025-07-22 02:48:05', '2025-07-22 02:48:05'),
	(158, 211, 53, 'view', 'admin.profit-distribution.show', 1, '2025-07-22 02:48:09', '2025-07-22 02:48:09'),
	(159, 212, 53, 'delete', 'admin.profit-distribution.destroy', 1, '2025-07-22 02:48:16', '2025-07-22 02:48:16'),
	(160, 213, 53, 'trash', 'admin.profit-distribution.trash', 1, '2025-07-22 02:48:22', '2025-07-22 02:48:22'),
	(166, 221, 16, 'show', 'admin.journal-voucher.show', 1, '2025-08-31 23:33:11', '2025-08-31 23:33:11'),
	(167, 222, 16, 'print', 'admin.journal-voucher.print', 1, '2025-08-31 23:33:17', '2025-08-31 23:33:17'),
	(168, 223, 16, 'delete', 'admin.journal-voucher.destroy', 1, '2025-08-31 23:33:21', '2025-08-31 23:33:21'),
	(169, 224, 16, 'trash', 'admin.journal-voucher.trash', 1, '2025-08-31 23:34:07', '2025-08-31 23:34:07'),
	(174, 230, 44, 'create', 'admin.vendor.create', 1, '2026-02-10 21:37:17', '2026-02-10 21:37:17'),
	(175, 231, 44, 'edit', 'admin.vendor.edit', 1, '2026-02-10 21:37:34', '2026-02-10 21:37:34'),
	(176, 233, 57, 'create', 'admin.brand.create', 1, '2026-02-10 21:40:40', '2026-02-10 21:40:40'),
	(177, 234, 57, 'edit', 'admin.brand.edit', 1, '2026-02-10 21:40:57', '2026-02-10 21:40:57'),
	(178, 236, 58, 'create', 'admin.uom.create', 1, '2026-02-10 21:44:37', '2026-02-10 21:44:37'),
	(179, 237, 58, 'edit', 'admin.uom.edit', 1, '2026-02-10 21:44:52', '2026-02-10 21:44:52');

-- Dumping structure for table radix.admin_settings
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE IF NOT EXISTS `admin_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.admin_settings: ~0 rows (approximately)
DELETE FROM `admin_settings`;
INSERT INTO `admin_settings` (`id`, `logo`, `small_logo`, `favicon`, `title`, `footer_text`, `primary_color`, `secondary_color`, `facebook`, `twitter`, `linkedin`, `whatsapp`, `google`, `created_at`, `updated_at`) VALUES
	(1, 'storage/admin-setting//2026-02-11-vneV3iDYlPitVbX7L7QSiDpjjpNnSqIwPT4kDllC.webp', 'storage/admin-setting//2026-02-11-7QqNQ0z1D8EANhubLb8DgEp0CGjE8AbYRJeWgMkE.webp', 'storage/admin-setting//2026-02-11-XFLP51mAjBzJbikiCXaARgSWTEEa89ZEhOBjd2VD.webp', 'Radix Collections', 'Developed By Radix', '#1964b0', '#000000', NULL, NULL, NULL, NULL, NULL, '2026-02-10 20:31:57', '2026-02-10 20:31:57');

-- Dumping structure for table radix.attributes
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_slug_unique` (`slug`),
  KEY `attributes_created_by_foreign` (`created_by`),
  KEY `attributes_updated_by_foreign` (`updated_by`),
  KEY `attributes_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `attributes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `attributes_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `attributes_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.attributes: ~0 rows (approximately)
DELETE FROM `attributes`;

-- Dumping structure for table radix.attribute_values
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE IF NOT EXISTS `attribute_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `attribute_values_created_by_foreign` (`created_by`),
  KEY `attribute_values_updated_by_foreign` (`updated_by`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_values_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `attribute_values_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.attribute_values: ~0 rows (approximately)
DELETE FROM `attribute_values`;

-- Dumping structure for table radix.authors
DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authors_slug_unique` (`slug`),
  KEY `authors_created_by_foreign` (`created_by`),
  KEY `authors_updated_by_foreign` (`updated_by`),
  KEY `authors_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `authors_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `authors_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `authors_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.authors: ~0 rows (approximately)
DELETE FROM `authors`;

-- Dumping structure for table radix.brands
DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`),
  KEY `brands_created_by_foreign` (`created_by`),
  KEY `brands_updated_by_foreign` (`updated_by`),
  KEY `brands_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `brands_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `brands_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.brands: ~1 rows (approximately)
DELETE FROM `brands`;
INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'RADIX', 'radix', 'storage/brand/2026-02-11-jVpW86AtLf2DUyXmq07GGh4GUI6ZqRMA3Mcj8vpP.webp', 'sada', 1, 1, 1, NULL, NULL, '2026-02-10 21:41:34', '2026-02-10 21:41:49');

-- Dumping structure for table radix.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.cache: ~4 rows (approximately)
DELETE FROM `cache`;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('radix_collections_ltd_cache_admin_menus', 'O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:8:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:07:50";s:10:"updated_at";s:19:"2025-06-17 11:31:46";}s:11:"\0*\0original";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:07:50";s:10:"updated_at";s:19:"2025-06-17 11:31:46";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:15:"System Settings";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:14";s:10:"updated_at";s:19:"2025-06-17 11:10:14";}s:11:"\0*\0original";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:15:"System Settings";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:14";s:10:"updated_at";s:19:"2025-06-17 11:10:14";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:4:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:36";s:10:"updated_at";s:19:"2025-06-17 11:10:36";}s:11:"\0*\0original";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:36";s:10:"updated_at";s:19:"2025-06-17 11:10:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:10";s:10:"updated_at";s:19:"2025-06-17 11:11:10";}s:11:"\0*\0original";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:10";s:10:"updated_at";s:19:"2025-06-17 11:11:10";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";i:2;s:4:"name";s:10:"Admin Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:51";s:10:"updated_at";s:19:"2026-02-13 15:13:16";}s:11:"\0*\0original";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";i:2;s:4:"name";s:10:"Admin Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:51";s:10:"updated_at";s:19:"2026-02-13 15:13:16";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:12:59";s:10:"updated_at";s:19:"2025-06-17 11:12:59";}s:11:"\0*\0original";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:12:59";s:10:"updated_at";s:19:"2025-06-17 11:12:59";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:45;s:13:"permission_id";i:167;s:9:"parent_id";N;s:4:"name";s:9:"CMS Setup";s:5:"route";N;s:4:"icon";s:58:"<span class="material-symbols-outlined fs-24"> api </span>";s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:13:16";s:10:"updated_at";s:19:"2026-02-13 15:16:59";}s:11:"\0*\0original";a:11:{s:2:"id";i:45;s:13:"permission_id";i:167;s:9:"parent_id";N;s:4:"name";s:9:"CMS Setup";s:5:"route";N;s:4:"icon";s:58:"<span class="material-symbols-outlined fs-24"> api </span>";s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:13:16";s:10:"updated_at";s:19:"2026-02-13 15:16:59";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:1:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:46;s:13:"permission_id";i:168;s:9:"parent_id";i:45;s:4:"name";s:11:"Settings UI";s:5:"route";s:20:"admin.settings.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:11";s:10:"updated_at";s:19:"2026-02-13 15:15:39";}s:11:"\0*\0original";a:11:{s:2:"id";i:46;s:13:"permission_id";i:168;s:9:"parent_id";i:45;s:4:"name";s:11:"Settings UI";s:5:"route";s:20:"admin.settings.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:11";s:10:"updated_at";s:19:"2026-02-13 15:15:39";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:39;s:13:"permission_id";i:138;s:9:"parent_id";N;s:4:"name";s:18:"Product Management";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-17 10:00:10";s:10:"updated_at";s:19:"2026-02-11 03:01:06";}s:11:"\0*\0original";a:11:{s:2:"id";i:39;s:13:"permission_id";i:138;s:9:"parent_id";N;s:4:"name";s:18:"Product Management";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-17 10:00:10";s:10:"updated_at";s:19:"2026-02-11 03:01:06";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:5:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:40;s:13:"permission_id";i:139;s:9:"parent_id";i:39;s:4:"name";s:14:"Product Manage";s:5:"route";s:19:"admin.product.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-17 10:01:15";s:10:"updated_at";s:19:"2026-02-11 03:03:13";}s:11:"\0*\0original";a:11:{s:2:"id";i:40;s:13:"permission_id";i:139;s:9:"parent_id";i:39;s:4:"name";s:14:"Product Manage";s:5:"route";s:19:"admin.product.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-17 10:01:15";s:10:"updated_at";s:19:"2026-02-11 03:03:13";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:57;s:13:"permission_id";i:232;s:9:"parent_id";i:39;s:4:"name";s:5:"Brand";s:5:"route";s:17:"admin.brand.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-11 03:38:59";s:10:"updated_at";s:19:"2026-02-11 03:40:09";}s:11:"\0*\0original";a:11:{s:2:"id";i:57;s:13:"permission_id";i:232;s:9:"parent_id";i:39;s:4:"name";s:5:"Brand";s:5:"route";s:17:"admin.brand.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-11 03:38:59";s:10:"updated_at";s:19:"2026-02-11 03:40:09";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:44;s:13:"permission_id";i:166;s:9:"parent_id";i:39;s:4:"name";s:7:"Vendors";s:5:"route";s:18:"admin.vendor.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:51:17";s:10:"updated_at";s:19:"2026-02-11 03:36:19";}s:11:"\0*\0original";a:11:{s:2:"id";i:44;s:13:"permission_id";i:166;s:9:"parent_id";i:39;s:4:"name";s:7:"Vendors";s:5:"route";s:18:"admin.vendor.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:51:17";s:10:"updated_at";s:19:"2026-02-11 03:36:19";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:58;s:13:"permission_id";i:235;s:9:"parent_id";i:39;s:4:"name";s:4:"Unit";s:5:"route";s:15:"admin.uom.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-11 03:43:27";s:10:"updated_at";s:19:"2026-02-11 03:43:27";}s:11:"\0*\0original";a:11:{s:2:"id";i:58;s:13:"permission_id";i:235;s:9:"parent_id";i:39;s:4:"name";s:4:"Unit";s:5:"route";s:15:"admin.uom.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-11 03:43:27";s:10:"updated_at";s:19:"2026-02-11 03:43:27";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:59;s:13:"permission_id";i:238;s:9:"parent_id";i:39;s:4:"name";s:10:"Categories";s:5:"route";s:20:"admin.category.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-11 03:55:36";s:10:"updated_at";s:19:"2026-02-11 03:55:36";}s:11:"\0*\0original";a:11:{s:2:"id";i:59;s:13:"permission_id";i:238;s:9:"parent_id";i:39;s:4:"name";s:10:"Categories";s:5:"route";s:20:"admin.category.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-11 03:55:36";s:10:"updated_at";s:19:"2026-02-11 03:55:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:41;s:13:"permission_id";i:155;s:9:"parent_id";N;s:4:"name";s:16:"Sales Management";s:5:"route";N;s:4:"icon";s:71:"<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:47:23";s:10:"updated_at";s:19:"2025-07-19 10:47:23";}s:11:"\0*\0original";a:11:{s:2:"id";i:41;s:13:"permission_id";i:155;s:9:"parent_id";N;s:4:"name";s:16:"Sales Management";s:5:"route";N;s:4:"icon";s:71:"<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:47:23";s:10:"updated_at";s:19:"2025-07-19 10:47:23";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:4:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:42;s:13:"permission_id";i:156;s:9:"parent_id";i:41;s:4:"name";s:12:"Order Manage";s:5:"route";s:18:"admin.orders.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:49:14";s:10:"updated_at";s:19:"2026-02-14 13:20:07";}s:11:"\0*\0original";a:11:{s:2:"id";i:42;s:13:"permission_id";i:156;s:9:"parent_id";i:41;s:4:"name";s:12:"Order Manage";s:5:"route";s:18:"admin.orders.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:49:14";s:10:"updated_at";s:19:"2026-02-14 13:20:07";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:43;s:13:"permission_id";i:157;s:9:"parent_id";i:41;s:4:"name";s:5:"Sales";s:5:"route";s:17:"admin.sales.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:49:37";s:10:"updated_at";s:19:"2025-07-19 10:49:37";}s:11:"\0*\0original";a:11:{s:2:"id";i:43;s:13:"permission_id";i:157;s:9:"parent_id";i:41;s:4:"name";s:5:"Sales";s:5:"route";s:17:"admin.sales.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 10:49:37";s:10:"updated_at";s:19:"2025-07-19 10:49:37";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:50;s:13:"permission_id";i:190;s:9:"parent_id";i:41;s:4:"name";s:11:"Collections";s:5:"route";s:22:"admin.collection.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-20 13:50:25";s:10:"updated_at";s:19:"2025-07-20 13:50:25";}s:11:"\0*\0original";a:11:{s:2:"id";i:50;s:13:"permission_id";i:190;s:9:"parent_id";i:41;s:4:"name";s:11:"Collections";s:5:"route";s:22:"admin.collection.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-20 13:50:25";s:10:"updated_at";s:19:"2025-07-20 13:50:25";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:51;s:13:"permission_id";i:196;s:9:"parent_id";i:41;s:4:"name";s:13:"Sales Returns";s:5:"route";s:24:"admin.sales-return.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-21 11:38:18";s:10:"updated_at";s:19:"2025-07-21 11:38:18";}s:11:"\0*\0original";a:11:{s:2:"id";i:51;s:13:"permission_id";i:196;s:9:"parent_id";i:41;s:4:"name";s:13:"Sales Returns";s:5:"route";s:24:"admin.sales-return.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-21 11:38:18";s:10:"updated_at";s:19:"2025-07-21 11:38:18";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:53;s:13:"permission_id";i:208;s:9:"parent_id";N;s:4:"name";s:19:"Profit Distribution";s:5:"route";s:31:"admin.profit-distribution.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> event_repeat </span>";s:5:"order";i:7;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:36";s:10:"updated_at";s:19:"2025-07-22 08:47:49";}s:11:"\0*\0original";a:11:{s:2:"id";i:53;s:13:"permission_id";i:208;s:9:"parent_id";N;s:4:"name";s:19:"Profit Distribution";s:5:"route";s:31:"admin.profit-distribution.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> event_repeat </span>";s:5:"order";i:7;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:36";s:10:"updated_at";s:19:"2025-07-22 08:47:49";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:5:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:156;s:13:"permission_id";i:209;s:13:"admin_menu_id";i:53;s:4:"name";s:6:"create";s:5:"route";s:32:"admin.profit-distribution.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:59";s:10:"updated_at";s:19:"2025-07-22 08:47:59";}s:11:"\0*\0original";a:8:{s:2:"id";i:156;s:13:"permission_id";i:209;s:13:"admin_menu_id";i:53;s:4:"name";s:6:"create";s:5:"route";s:32:"admin.profit-distribution.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:59";s:10:"updated_at";s:19:"2025-07-22 08:47:59";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:157;s:13:"permission_id";i:210;s:13:"admin_menu_id";i:53;s:4:"name";s:4:"edit";s:5:"route";s:30:"admin.profit-distribution.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:05";s:10:"updated_at";s:19:"2025-07-22 08:48:05";}s:11:"\0*\0original";a:8:{s:2:"id";i:157;s:13:"permission_id";i:210;s:13:"admin_menu_id";i:53;s:4:"name";s:4:"edit";s:5:"route";s:30:"admin.profit-distribution.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:05";s:10:"updated_at";s:19:"2025-07-22 08:48:05";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:158;s:13:"permission_id";i:211;s:13:"admin_menu_id";i:53;s:4:"name";s:4:"view";s:5:"route";s:30:"admin.profit-distribution.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:09";s:10:"updated_at";s:19:"2025-07-22 08:48:09";}s:11:"\0*\0original";a:8:{s:2:"id";i:158;s:13:"permission_id";i:211;s:13:"admin_menu_id";i:53;s:4:"name";s:4:"view";s:5:"route";s:30:"admin.profit-distribution.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:09";s:10:"updated_at";s:19:"2025-07-22 08:48:09";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:159;s:13:"permission_id";i:212;s:13:"admin_menu_id";i:53;s:4:"name";s:6:"delete";s:5:"route";s:33:"admin.profit-distribution.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:16";s:10:"updated_at";s:19:"2025-07-22 08:48:16";}s:11:"\0*\0original";a:8:{s:2:"id";i:159;s:13:"permission_id";i:212;s:13:"admin_menu_id";i:53;s:4:"name";s:6:"delete";s:5:"route";s:33:"admin.profit-distribution.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:16";s:10:"updated_at";s:19:"2025-07-22 08:48:16";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:160;s:13:"permission_id";i:213;s:13:"admin_menu_id";i:53;s:4:"name";s:5:"trash";s:5:"route";s:31:"admin.profit-distribution.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:22";s:10:"updated_at";s:19:"2025-07-22 08:48:22";}s:11:"\0*\0original";a:8:{s:2:"id";i:160;s:13:"permission_id";i:213;s:13:"admin_menu_id";i:53;s:4:"name";s:5:"trash";s:5:"route";s:31:"admin.profit-distribution.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-07-22 08:48:22";s:10:"updated_at";s:19:"2025-07-22 08:48:22";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:6;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:9;s:13:"permission_id";i:32;s:9:"parent_id";N;s:4:"name";s:10:"Sattlement";s:5:"route";s:29:"admin.invest-sattlement.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:9;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:40:52";s:10:"updated_at";s:19:"2025-07-22 12:49:30";}s:11:"\0*\0original";a:11:{s:2:"id";i:9;s:13:"permission_id";i:32;s:9:"parent_id";N;s:4:"name";s:10:"Sattlement";s:5:"route";s:29:"admin.invest-sattlement.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:9;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:40:52";s:10:"updated_at";s:19:"2025-07-22 12:49:30";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:5:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:24;s:13:"permission_id";i:33;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"create";s:5:"route";s:30:"admin.invest-sattlement.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:41:09";s:10:"updated_at";s:19:"2025-06-23 10:19:25";}s:11:"\0*\0original";a:8:{s:2:"id";i:24;s:13:"permission_id";i:33;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"create";s:5:"route";s:30:"admin.invest-sattlement.create";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:41:09";s:10:"updated_at";s:19:"2025-06-23 10:19:25";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:25;s:13:"permission_id";i:34;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"edit";s:5:"route";s:28:"admin.invest-sattlement.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:41:13";s:10:"updated_at";s:19:"2025-06-23 10:19:31";}s:11:"\0*\0original";a:8:{s:2:"id";i:25;s:13:"permission_id";i:34;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"edit";s:5:"route";s:28:"admin.invest-sattlement.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-17 11:41:13";s:10:"updated_at";s:19:"2025-06-23 10:19:31";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:91;s:13:"permission_id";i:127;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"view";s:5:"route";s:28:"admin.invest-sattlement.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:19:48";s:10:"updated_at";s:19:"2025-06-23 10:19:48";}s:11:"\0*\0original";a:8:{s:2:"id";i:91;s:13:"permission_id";i:127;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"view";s:5:"route";s:28:"admin.invest-sattlement.show";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:19:48";s:10:"updated_at";s:19:"2025-06-23 10:19:48";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:92;s:13:"permission_id";i:128;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"delete";s:5:"route";s:31:"admin.invest-sattlement.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:19:56";s:10:"updated_at";s:19:"2025-06-23 10:19:56";}s:11:"\0*\0original";a:8:{s:2:"id";i:92;s:13:"permission_id";i:128;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"delete";s:5:"route";s:31:"admin.invest-sattlement.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:19:56";s:10:"updated_at";s:19:"2025-06-23 10:19:56";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:93;s:13:"permission_id";i:129;s:13:"admin_menu_id";i:9;s:4:"name";s:5:"trash";s:5:"route";s:29:"admin.invest-sattlement.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:20:01";s:10:"updated_at";s:19:"2025-06-23 10:20:01";}s:11:"\0*\0original";a:8:{s:2:"id";i:93;s:13:"permission_id";i:129;s:13:"admin_menu_id";i:9;s:4:"name";s:5:"trash";s:5:"route";s:29:"admin.invest-sattlement.trash";s:6:"status";i:1;s:10:"created_at";s:19:"2025-06-23 10:20:01";s:10:"updated_at";s:19:"2025-06-23 10:20:01";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:7;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:10;s:13:"permission_id";i:37;s:9:"parent_id";N;s:4:"name";s:18:"General Accounting";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> calculate </span>";s:5:"order";i:11;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:20";s:10:"updated_at";s:19:"2025-07-03 09:56:00";}s:11:"\0*\0original";a:11:{s:2:"id";i:10;s:13:"permission_id";i:37;s:9:"parent_id";N;s:4:"name";s:18:"General Accounting";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> calculate </span>";s:5:"order";i:11;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:20";s:10:"updated_at";s:19:"2025-07-03 09:56:00";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:2:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:11;s:13:"permission_id";i:38;s:9:"parent_id";i:10;s:4:"name";s:11:"Transaction";s:5:"route";N;s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:51";s:10:"updated_at";s:19:"2025-06-17 11:42:51";}s:11:"\0*\0original";a:11:{s:2:"id";i:11;s:13:"permission_id";i:38;s:9:"parent_id";i:10;s:4:"name";s:11:"Transaction";s:5:"route";N;s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:51";s:10:"updated_at";s:19:"2025-06-17 11:42:51";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:12;s:13:"permission_id";i:39;s:9:"parent_id";i:10;s:4:"name";s:7:"Reports";s:5:"route";N;s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:43:04";s:10:"updated_at";s:19:"2025-06-17 11:43:04";}s:11:"\0*\0original";a:11:{s:2:"id";i:12;s:13:"permission_id";i:39;s:9:"parent_id";i:10;s:4:"name";s:7:"Reports";s:5:"route";N;s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:43:04";s:10:"updated_at";s:19:"2025-06-17 11:43:04";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}', 1771078813),
	('radix_collections_ltd_cache_admin_setting', 'O:23:"App\\Models\\AdminSetting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:14:"admin_settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:15:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-02-11-vneV3iDYlPitVbX7L7QSiDpjjpNnSqIwPT4kDllC.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-02-11-7QqNQ0z1D8EANhubLb8DgEp0CGjE8AbYRJeWgMkE.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-02-11-XFLP51mAjBzJbikiCXaARgSWTEEa89ZEhOBjd2VD.webp";s:5:"title";s:17:"Radix Collections";s:11:"footer_text";s:18:"Developed By Radix";s:13:"primary_color";s:7:"#1964b0";s:15:"secondary_color";s:7:"#000000";s:8:"facebook";N;s:7:"twitter";N;s:8:"linkedin";N;s:8:"whatsapp";N;s:6:"google";N;s:10:"created_at";s:19:"2026-02-11 02:31:57";s:10:"updated_at";s:19:"2026-02-11 02:31:57";}s:11:"\0*\0original";a:15:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-02-11-vneV3iDYlPitVbX7L7QSiDpjjpNnSqIwPT4kDllC.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-02-11-7QqNQ0z1D8EANhubLb8DgEp0CGjE8AbYRJeWgMkE.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-02-11-XFLP51mAjBzJbikiCXaARgSWTEEa89ZEhOBjd2VD.webp";s:5:"title";s:17:"Radix Collections";s:11:"footer_text";s:18:"Developed By Radix";s:13:"primary_color";s:7:"#1964b0";s:15:"secondary_color";s:7:"#000000";s:8:"facebook";N;s:7:"twitter";N;s:8:"linkedin";N;s:8:"whatsapp";N;s:6:"google";N;s:10:"created_at";s:19:"2026-02-11 02:31:57";s:10:"updated_at";s:19:"2026-02-11 02:31:57";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:12:{i:0;s:4:"logo";i:1;s:10:"small_logo";i:2;s:7:"favicon";i:3;s:5:"title";i:4;s:11:"footer_text";i:5;s:13:"primary_color";i:6;s:15:"secondary_color";i:7;s:8:"facebook";i:8;s:7:"twitter";i:9;s:8:"linkedin";i:10;s:8:"whatsapp";i:11;s:6:"google";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1771078813),
	('radix_collections_ltd_cache_setting', 'O:18:"App\\Models\\Setting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:8:"settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:42:{s:2:"id";i:1;s:8:"app_name";s:22:"Radix Collections Ltd.";s:5:"title";s:22:"Radix Collections Ltd.";s:13:"primary_phone";s:12:"01617-475475";s:15:"secondary_phone";s:12:"01617-475475";s:13:"primary_email";s:15:"radix@gmail.com";s:15:"secondary_email";s:18:"radix@radix.com.bd";s:11:"office_time";N;s:7:"address";s:29:"H#15, R#05, Block-D, Sector-1";s:11:"description";s:33:"Footer description is dfsdfsdfsdf";s:10:"banner_one";s:73:"storage/settings/2026-02-12-7l83ha8c0I892jXpY21gw3QU1lw3lejXnFCQBAQL.webp";s:15:"banner_one_link";s:1:"#";s:17:"banner_one_status";i:1;s:10:"banner_two";s:73:"storage/settings/2026-02-13-rNXhrSRiZLoNaxWbcVOSYi6zQWeuSsHqMi1ImWwp.webp";s:15:"banner_two_link";s:1:"#";s:17:"banner_two_status";i:1;s:15:"page_heading_bg";s:73:"storage/settings/2026-02-13-Z9sSYnt0jdlWtgkDaT42Qj1H04G1y9WvPsQNsUbx.webp";s:10:"meta_title";s:75:"Plot No.76, Road No.05, Vatulia, Tirag, Dhaka-1230, Dhaka, Bangladesh, 1230";s:12:"meta_keyword";s:3:"aSA";s:16:"meta_description";s:3:"asa";s:10:"meta_image";N;s:10:"google_map";s:89:"creates scrolling text or images, moving them horizontally or vertically across a webpage";s:7:"favicon";s:73:"storage/settings/2026-02-11-aXtLsiZN622dKYd073prjfepJVxZGeFeI0BDPxB4.webp";s:4:"logo";s:73:"storage/settings/2026-02-11-d6es6V5g6gOOP1nQSbfADl3PvNk5z0iXawgnYzRr.webp";s:11:"footer_logo";N;s:11:"placeholder";N;s:13:"facebook_page";s:20:"https://facebook.com";s:14:"facebook_group";N;s:7:"youtube";s:19:"https://youtube.com";s:7:"twitter";s:19:"https://twetter.com";s:8:"linkedin";s:20:"https://linkedin.com";s:6:"google";N;s:8:"whatsapp";s:20:"https://whatsapp.com";s:9:"instagram";s:21:"https://instagram.com";s:9:"pinterest";s:17:"https://pinta.com";s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-02-11 02:34:20";s:10:"updated_at";s:19:"2026-02-13 01:52:33";}s:11:"\0*\0original";a:42:{s:2:"id";i:1;s:8:"app_name";s:22:"Radix Collections Ltd.";s:5:"title";s:22:"Radix Collections Ltd.";s:13:"primary_phone";s:12:"01617-475475";s:15:"secondary_phone";s:12:"01617-475475";s:13:"primary_email";s:15:"radix@gmail.com";s:15:"secondary_email";s:18:"radix@radix.com.bd";s:11:"office_time";N;s:7:"address";s:29:"H#15, R#05, Block-D, Sector-1";s:11:"description";s:33:"Footer description is dfsdfsdfsdf";s:10:"banner_one";s:73:"storage/settings/2026-02-12-7l83ha8c0I892jXpY21gw3QU1lw3lejXnFCQBAQL.webp";s:15:"banner_one_link";s:1:"#";s:17:"banner_one_status";i:1;s:10:"banner_two";s:73:"storage/settings/2026-02-13-rNXhrSRiZLoNaxWbcVOSYi6zQWeuSsHqMi1ImWwp.webp";s:15:"banner_two_link";s:1:"#";s:17:"banner_two_status";i:1;s:15:"page_heading_bg";s:73:"storage/settings/2026-02-13-Z9sSYnt0jdlWtgkDaT42Qj1H04G1y9WvPsQNsUbx.webp";s:10:"meta_title";s:75:"Plot No.76, Road No.05, Vatulia, Tirag, Dhaka-1230, Dhaka, Bangladesh, 1230";s:12:"meta_keyword";s:3:"aSA";s:16:"meta_description";s:3:"asa";s:10:"meta_image";N;s:10:"google_map";s:89:"creates scrolling text or images, moving them horizontally or vertically across a webpage";s:7:"favicon";s:73:"storage/settings/2026-02-11-aXtLsiZN622dKYd073prjfepJVxZGeFeI0BDPxB4.webp";s:4:"logo";s:73:"storage/settings/2026-02-11-d6es6V5g6gOOP1nQSbfADl3PvNk5z0iXawgnYzRr.webp";s:11:"footer_logo";N;s:11:"placeholder";N;s:13:"facebook_page";s:20:"https://facebook.com";s:14:"facebook_group";N;s:7:"youtube";s:19:"https://youtube.com";s:7:"twitter";s:19:"https://twetter.com";s:8:"linkedin";s:20:"https://linkedin.com";s:6:"google";N;s:8:"whatsapp";s:20:"https://whatsapp.com";s:9:"instagram";s:21:"https://instagram.com";s:9:"pinterest";s:17:"https://pinta.com";s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-02-11 02:34:20";s:10:"updated_at";s:19:"2026-02-13 01:52:33";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:39:{i:0;s:8:"app_name";i:1;s:5:"title";i:2;s:13:"primary_phone";i:3;s:15:"secondary_phone";i:4;s:13:"primary_email";i:5;s:15:"secondary_email";i:6;s:11:"office_time";i:7;s:7:"address";i:8;s:11:"description";i:9;s:10:"banner_one";i:10;s:15:"banner_one_link";i:11;s:17:"banner_one_status";i:12;s:10:"banner_two";i:13;s:15:"banner_two_link";i:14;s:17:"banner_two_status";i:15;s:15:"page_heading_bg";i:16;s:10:"meta_title";i:17;s:12:"meta_keyword";i:18;s:16:"meta_description";i:19;s:10:"meta_image";i:20;s:10:"google_map";i:21;s:7:"favicon";i:22;s:4:"logo";i:23;s:11:"footer_logo";i:24;s:11:"placeholder";i:25;s:13:"facebook_page";i:26;s:14:"facebook_group";i:27;s:7:"youtube";i:28;s:7:"twitter";i:29;s:8:"linkedin";i:30;s:6:"google";i:31;s:8:"whatsapp";i:32;s:9:"instagram";i:33;s:9:"pinterest";i:34;s:11:"sms_api_url";i:35;s:11:"sms_api_key";i:36;s:10:"sms_api_id";i:37;s:12:"bkash_status";i:38;s:12:"nagad_status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1771078813),
	('radix_collections_ltd_cache_spatie.permission.cache', 'a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:132:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"Dashboard";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:15:"System Settings";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:5:"Roles";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:5:"Users";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:22:"admin.admin-menu.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:14:"Admin Settings";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:6;a:4:{s:1:"a";i:8;s:1:"b";s:23:"admin.admin-menu.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:7;a:4:{s:1:"a";i:9;s:1:"b";s:21:"admin.admin-menu.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:10;s:1:"b";s:24:"admin.admin-menu.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:11;s:1:"b";s:29:"admin.admin-menu-action.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:12;s:1:"b";s:30:"admin.admin-menu-action.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:13;s:1:"b";s:28:"admin.admin-menu-action.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:14;s:1:"b";s:31:"admin.admin-menu-action.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:13;a:4:{s:1:"a";i:15;s:1:"b";s:17:"admin.role.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:14;a:4:{s:1:"a";i:16;s:1:"b";s:15:"admin.role.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:15;a:4:{s:1:"a";i:17;s:1:"b";s:18:"admin.role.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:16;a:4:{s:1:"a";i:18;s:1:"b";s:26:"admin.role-permission.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:"a";i:19;s:1:"b";s:17:"admin.user.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:"a";i:20;s:1:"b";s:15:"admin.user.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:19;a:4:{s:1:"a";i:32;s:1:"b";s:10:"Sattlement";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:20;a:4:{s:1:"a";i:33;s:1:"b";s:30:"admin.invest-sattlement.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:21;a:4:{s:1:"a";i:34;s:1:"b";s:28:"admin.invest-sattlement.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:22;a:4:{s:1:"a";i:37;s:1:"b";s:18:"General Accounting";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:23;a:4:{s:1:"a";i:38;s:1:"b";s:11:"Transaction";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:24;a:4:{s:1:"a";i:39;s:1:"b";s:7:"Reports";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:25;a:4:{s:1:"a";i:40;s:1:"b";s:17:"Chart of Accounts";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:26;a:4:{s:1:"a";i:41;s:1:"b";s:16:"admin.coa.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:27;a:4:{s:1:"a";i:42;s:1:"b";s:14:"admin.coa.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:28;a:4:{s:1:"a";i:43;s:1:"b";s:17:"admin.coa.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:29;a:4:{s:1:"a";i:44;s:1:"b";s:13:"Debit Voucher";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:30;a:4:{s:1:"a";i:45;s:1:"b";s:26:"admin.debit-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:31;a:4:{s:1:"a";i:46;s:1:"b";s:24:"admin.debit-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:32;a:4:{s:1:"a";i:49;s:1:"b";s:14:"Credit Voucher";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:33;a:4:{s:1:"a";i:50;s:1:"b";s:27:"admin.credit-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:34;a:4:{s:1:"a";i:51;s:1:"b";s:25:"admin.credit-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:35;a:4:{s:1:"a";i:54;s:1:"b";s:15:"Journal Voucher";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:36;a:4:{s:1:"a";i:55;s:1:"b";s:28:"admin.journal-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:37;a:4:{s:1:"a";i:56;s:1:"b";s:26:"admin.journal-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:38;a:4:{s:1:"a";i:59;s:1:"b";s:27:"admin.voucher-approve.index";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:39;a:4:{s:1:"a";i:60;s:1:"b";s:26:"admin.voucher-approve.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:40;a:4:{s:1:"a";i:61;s:1:"b";s:26:"admin.voucher-approve.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:41;a:4:{s:1:"a";i:62;s:1:"b";s:26:"admin.voucher-refuse.index";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:42;a:4:{s:1:"a";i:63;s:1:"b";s:25:"admin.voucher-refuse.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:43;a:4:{s:1:"a";i:64;s:1:"b";s:25:"admin.voucher-refuse.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:44;a:4:{s:1:"a";i:65;s:1:"b";s:30:"admin.automation-approve.index";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:45;a:4:{s:1:"a";i:66;s:1:"b";s:29:"admin.automation-approve.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:46;a:4:{s:1:"a";i:67;s:1:"b";s:29:"admin.automation-approve.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:47;a:4:{s:1:"a";i:68;s:1:"b";s:29:"admin.automation-refuse.index";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:48;a:4:{s:1:"a";i:69;s:1:"b";s:28:"admin.automation-refuse.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:49;a:4:{s:1:"a";i:70;s:1:"b";s:28:"admin.automation-refuse.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:50;a:4:{s:1:"a";i:71;s:1:"b";s:19:"Chart of Accounts 1";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:51;a:4:{s:1:"a";i:72;s:1:"b";s:18:"Daily Voucher List";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:52;a:4:{s:1:"a";i:73;s:1:"b";s:15:"Daily Cash Book";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:53;a:4:{s:1:"a";i:74;s:1:"b";s:9:"Bank Book";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:54;a:4:{s:1:"a";i:75;s:1:"b";s:18:"Transaction Ledger";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:55;a:4:{s:1:"a";i:76;s:1:"b";s:14:"General Ledger";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:56;a:4:{s:1:"a";i:77;s:1:"b";s:19:"Cash Flow Statement";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:57;a:4:{s:1:"a";i:78;s:1:"b";s:13:"Trial Balance";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:58;a:4:{s:1:"a";i:79;s:1:"b";s:16:"Income Statement";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:59;a:4:{s:1:"a";i:80;s:1:"b";s:13:"Balance Sheet";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:60;a:4:{s:1:"a";i:81;s:1:"b";s:24:"admin.debit-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:61;a:4:{s:1:"a";i:82;s:1:"b";s:25:"admin.debit-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:62;a:4:{s:1:"a";i:83;s:1:"b";s:27:"admin.debit-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:63;a:4:{s:1:"a";i:84;s:1:"b";s:25:"admin.debit-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:64;a:4:{s:1:"a";i:85;s:1:"b";s:25:"admin.credit-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:65;a:4:{s:1:"a";i:86;s:1:"b";s:26:"admin.credit-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:66;a:4:{s:1:"a";i:87;s:1:"b";s:28:"admin.credit-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:67;a:4:{s:1:"a";i:88;s:1:"b";s:26:"admin.credit-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:68;a:4:{s:1:"a";i:127;s:1:"b";s:28:"admin.invest-sattlement.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:69;a:4:{s:1:"a";i:128;s:1:"b";s:31:"admin.invest-sattlement.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:70;a:4:{s:1:"a";i:129;s:1:"b";s:29:"admin.invest-sattlement.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:71;a:4:{s:1:"a";i:130;s:1:"b";s:19:"admin.user.password";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:72;a:4:{s:1:"a";i:131;s:1:"b";s:18:"admin.user.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:73;a:4:{s:1:"a";i:132;s:1:"b";s:16:"admin.user.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:74;a:4:{s:1:"a";i:138;s:1:"b";s:18:"Product Management";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:75;a:4:{s:1:"a";i:139;s:1:"b";s:20:"admin.products.index";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:76;a:4:{s:1:"a";i:147;s:1:"b";s:23:"admin.production.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:77;a:4:{s:1:"a";i:148;s:1:"b";s:21:"admin.production.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:78;a:4:{s:1:"a";i:149;s:1:"b";s:21:"admin.production.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:79;a:4:{s:1:"a";i:152;s:1:"b";s:22:"admin.production.print";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:80;a:4:{s:1:"a";i:153;s:1:"b";s:24:"admin.production.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:81;a:4:{s:1:"a";i:154;s:1:"b";s:22:"admin.production.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:82;a:4:{s:1:"a";i:155;s:1:"b";s:16:"Sales Management";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:83;a:4:{s:1:"a";i:156;s:1:"b";s:17:"admin.order.index";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:84;a:4:{s:1:"a";i:157;s:1:"b";s:7:"Sales 1";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:85;a:4:{s:1:"a";i:158;s:1:"b";s:19:"admin.client.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:86;a:4:{s:1:"a";i:159;s:1:"b";s:17:"admin.client.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:87;a:4:{s:1:"a";i:160;s:1:"b";s:20:"admin.client.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:88;a:4:{s:1:"a";i:161;s:1:"b";s:18:"admin.client.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:89;a:4:{s:1:"a";i:162;s:1:"b";s:18:"admin.sales.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:90;a:4:{s:1:"a";i:163;s:1:"b";s:16:"admin.sales.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:91;a:4:{s:1:"a";i:164;s:1:"b";s:16:"admin.sales.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:92;a:4:{s:1:"a";i:166;s:1:"b";s:18:"admin.vendor.index";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:93;a:4:{s:1:"a";i:167;s:1:"b";s:9:"CMS Setup";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:94;a:4:{s:1:"a";i:168;s:1:"b";s:20:"admin.settings.index";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:95;a:4:{s:1:"a";i:171;s:1:"b";s:19:"admin.region.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:96;a:4:{s:1:"a";i:172;s:1:"b";s:17:"admin.region.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:97;a:4:{s:1:"a";i:173;s:1:"b";s:20:"admin.region.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:98;a:4:{s:1:"a";i:174;s:1:"b";s:18:"admin.region.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:99;a:4:{s:1:"a";i:188;s:1:"b";s:19:"admin.sales.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:100;a:4:{s:1:"a";i:189;s:1:"b";s:17:"admin.sales.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:101;a:4:{s:1:"a";i:190;s:1:"b";s:11:"Collections";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:102;a:4:{s:1:"a";i:191;s:1:"b";s:23:"admin.collection.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:103;a:4:{s:1:"a";i:192;s:1:"b";s:21:"admin.collection.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:104;a:4:{s:1:"a";i:193;s:1:"b";s:21:"admin.collection.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:105;a:4:{s:1:"a";i:194;s:1:"b";s:24:"admin.collection.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:106;a:4:{s:1:"a";i:195;s:1:"b";s:22:"admin.collection.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:107;a:4:{s:1:"a";i:196;s:1:"b";s:13:"Sales Returns";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:108;a:4:{s:1:"a";i:197;s:1:"b";s:25:"admin.sales-return.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:109;a:4:{s:1:"a";i:198;s:1:"b";s:23:"admin.sales-return.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:110;a:4:{s:1:"a";i:199;s:1:"b";s:23:"admin.sales-return.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:111;a:4:{s:1:"a";i:200;s:1:"b";s:26:"admin.sales-return.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:112;a:4:{s:1:"a";i:201;s:1:"b";s:24:"admin.sales-return.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:113;a:4:{s:1:"a";i:208;s:1:"b";s:19:"Profit Distribution";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:114;a:4:{s:1:"a";i:209;s:1:"b";s:32:"admin.profit-distribution.create";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:115;a:4:{s:1:"a";i:210;s:1:"b";s:30:"admin.profit-distribution.edit";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:116;a:4:{s:1:"a";i:211;s:1:"b";s:30:"admin.profit-distribution.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:117;a:4:{s:1:"a";i:212;s:1:"b";s:33:"admin.profit-distribution.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:118;a:4:{s:1:"a";i:213;s:1:"b";s:31:"admin.profit-distribution.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:119;a:4:{s:1:"a";i:221;s:1:"b";s:26:"admin.journal-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:120;a:4:{s:1:"a";i:222;s:1:"b";s:27:"admin.journal-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:121;a:4:{s:1:"a";i:223;s:1:"b";s:29:"admin.journal-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:122;a:4:{s:1:"a";i:224;s:1:"b";s:27:"admin.journal-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:123;a:4:{s:1:"a";i:230;s:1:"b";s:19:"admin.vendor.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}i:124;a:4:{s:1:"a";i:231;s:1:"b";s:17:"admin.vendor.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}i:125;a:4:{s:1:"a";i:232;s:1:"b";s:5:"Brand";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}i:126;a:4:{s:1:"a";i:233;s:1:"b";s:18:"admin.brand.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}i:127;a:4:{s:1:"a";i:234;s:1:"b";s:16:"admin.brand.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}i:128;a:4:{s:1:"a";i:235;s:1:"b";s:4:"Unit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}i:129;a:4:{s:1:"a";i:236;s:1:"b";s:16:"admin.uom.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}i:130;a:4:{s:1:"a";i:237;s:1:"b";s:14:"admin.uom.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}i:131;a:4:{s:1:"a";i:238;s:1:"b";s:10:"Categories";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:4;}}}s:5:"roles";a:3:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:14:"Software Admin";s:1:"c";s:3:"web";}i:1;a:3:{s:1:"a";i:2;s:1:"b";s:12:"System Admin";s:1:"c";s:3:"web";}i:2;a:3:{s:1:"a";i:4;s:1:"b";s:7:"Manager";s:1:"c";s:3:"web";}}}', 1771161613);

-- Dumping structure for table radix.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

-- Dumping structure for table radix.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_created_by_foreign` (`created_by`),
  KEY `categories_updated_by_foreign` (`updated_by`),
  KEY `categories_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.categories: ~21 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `image`, `description`, `status`, `position`, `url`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Shop', 'shop', 'storage/category/2026-02-11-5UkJgX52kxu8dleVOD8vEXmO7oLgkZCp9AEI2Sow.webp', NULL, 1, 'header_parent', '#', 1, NULL, NULL, NULL, '2026-02-10 20:52:55', '2026-02-10 20:52:55'),
	(2, NULL, 'Categories', 'categories', NULL, NULL, 1, 'header_parent', '#', 1, NULL, NULL, NULL, '2026-02-10 20:54:40', '2026-02-10 20:54:40'),
	(3, 1, 'New Arival', 'new-arival', NULL, NULL, 1, 'header_child', '#', 1, NULL, NULL, NULL, '2026-02-10 20:58:59', '2026-02-10 20:58:59'),
	(4, 1, 'Others', 'others', NULL, NULL, 1, 'header_child', '#', 1, NULL, NULL, NULL, '2026-02-10 20:59:39', '2026-02-10 20:59:39'),
	(5, 2, 'Recent', 'recent', 'storage/category/2026-02-11-lg3r2XMDOoft53q1rqVR2bClnuKV5yoBtpXg2dUx.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'header_child', '#', 1, 1, NULL, NULL, '2026-02-10 21:56:17', '2026-02-13 09:10:00'),
	(6, NULL, 'Men’z socks', 'menz-socks', 'storage/category/2026-02-12-PsjFvJFU3GV6kEPZXuOAFpQeWkJ3ZMBh8oxluXGA.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, 1, NULL, NULL, '2026-02-12 02:55:04', '2026-02-12 04:26:28'),
	(7, NULL, 'Women socks', 'women-socks', 'storage/category/2026-02-12-mfiSpPaZPno35s3cU8cJoIdIh2I6aREZiCK6yarX.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, 1, NULL, NULL, '2026-02-12 02:59:15', '2026-02-12 03:00:24'),
	(8, NULL, 'Kids socks', 'kids-socks', 'storage/category/2026-02-12-AxsuKCmC2slKmOCHKXTYCZ1MxD9R2sKa9BpIclEP.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, 1, NULL, NULL, '2026-02-12 03:01:35', '2026-02-12 03:01:44'),
	(9, NULL, 'Baby socks', 'baby-socks', 'storage/category/2026-02-12-MmARW2EFH42gbRzBzSf2ayzlz9wPgnZ7HZyuaiup.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, NULL, NULL, NULL, '2026-02-12 03:04:10', '2026-02-12 03:04:10'),
	(10, NULL, 'Unusex(Male-Female)', 'unusex-socks-male-female', 'storage/category/2026-02-12-wPoMrqA9jwsqXFzZpjELy2YkwKK33nct75uxRLyy.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, 1, NULL, NULL, '2026-02-12 03:05:08', '2026-02-12 03:20:00'),
	(11, NULL, 'Whole sales', 'whole-sales', 'storage/category/2026-02-12-YfGMiR4Wua6p4RDEgyrWUXIlWHu6hCiXp63TDpaC.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, 1, NULL, NULL, '2026-02-12 03:08:40', '2026-02-12 03:21:12'),
	(12, NULL, 'Trendy Collection', 'trendy-collection', 'storage/category/2026-02-12-nxWp5G9OPXBLWaZKE9rCHbMNSQvMMm8a35PalPX5.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, NULL, NULL, NULL, '2026-02-12 03:09:13', '2026-02-12 03:09:13'),
	(13, NULL, 'Stylish Collection', 'stylish-collection', 'storage/category/2026-02-12-jRjbl1qafZDqHU6aOSt3FyGTD6h4omiTRJkZ8uDq.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, NULL, NULL, NULL, '2026-02-12 03:09:31', '2026-02-12 03:09:31'),
	(14, NULL, 'Mela Collection', 'mela-collection', 'storage/category/2026-02-12-2iSAG2tUc8jj3y4GdA3wbo2cOH8fh88X2jgAWYBA.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, 1, NULL, NULL, '2026-02-12 03:09:49', '2026-02-12 03:23:22'),
	(15, NULL, 'Others Collection', 'others-collection', 'storage/category/2026-02-12-q0ZZJssMTnodaVe5H4KHCfJosVkuFWlGOIOaOrLC.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, 1, NULL, NULL, '2026-02-12 03:10:10', '2026-02-12 03:21:24'),
	(16, NULL, '50% Discount', '50-discount', 'storage/category/2026-02-12-jAkLEzENw9qvRRqeGxQdtsrdMVFj1DEJ1COVNRox.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, 1, NULL, NULL, '2026-02-12 03:10:29', '2026-02-12 03:10:39'),
	(17, 6, 'Men\'s Socks', 'mens-socks', 'storage/category/2026-02-12-QmqhePaOuVNvNTEjpMXVOecfEBUCflewPMBCG3w2.webp', 'Socks holo everyday essential ekta fashion item ja comfort, style, ebong protection ekshathe provide kore. Amader socks gulo high-quality fabric diye toiri, jate apni puro din comfortable feel korte paren.', 1, 'left_side', '#', 1, NULL, NULL, NULL, '2026-02-12 03:11:43', '2026-02-12 03:11:43'),
	(18, NULL, 'About', 'about', 'storage/category/2026-02-13-V9qEBGDKVb70j2Suoms9yCgpxcmEUWu2qHE4gLOF.webp', 'Key Elements of an Effective "About Us" Page:\r\n\r\n    Brand Story/Origin: A narrative of how the business started and why.\r\n    Mission and Vision: The purpose of the business and what it aims to achieve.\r\n    Values and Culture: Ethical, sustainable, or core beliefs that drive the business.\r\n    Team Introduction: Photos and bios of the people behind the products or services.\r\n\r\nBest Practices for Writing:\r\n\r\n    Be Authentic: Keep the tone genuine, professional, and consistent with the brand voice.\r\n    Include Visuals: Use high-quality photos, videos, or graphics to make the page engaging.', 1, 'single_page', '#', 1, 1, NULL, NULL, '2026-02-12 20:02:35', '2026-02-12 21:01:56'),
	(19, NULL, 'Refund Policy', 'refund-policy', 'storage/category/2026-02-13-XiSXHrEEFwlH1vdQrtLATgj45TQ53Jq4RegnNrxr.webp', '<div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIABAY"><strong class="Yjhzub">Key Elements of an Effective "About Us" Page:</strong><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_1"><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_51,Z4RI9c_52"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_50/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_2"><ul class="KsbFXc U6u95"><li data-hveid="CAEIAhAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Brand Story/Origin:</strong> A narrative of how the business started and why.</span></li><li data-hveid="CAEIAhAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Mission and Vision:</strong> The purpose of the business and what it aims to achieve.</span></li><li data-hveid="CAEIAhAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Values and Culture:</strong> Ethical, sustainable, or core beliefs that drive the business.</span></li><li data-hveid="CAEIAhAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Team Introduction:</strong> Photos and bios of the people behind the products or services.</span></li><li data-hveid="CAEIAhAE"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Problem/Solution:</strong> An explanation of the problem the company solves and why it matters.</span></li><li data-hveid="CAEIAhAF"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Social Proof:</strong> Reviews, testimonials, or features that demonstrate credibility.</span><span class="uJ19be notranslate" data-wiz-uids="Z4RI9c_5n,Z4RI9c_5o"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_5m/TKHnVd"><span aria-hidden="true"> </span></span></span></li></ul></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_3"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_4"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_5"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_6"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_7"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_8"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_9"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_10"><div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIAxAA"><strong class="Yjhzub">Best Practices for Writing:</strong><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_5z,Z4RI9c_60"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_5y/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_11"><ul class="KsbFXc U6u95"><li data-hveid="CAEIBBAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Be Authentic:</strong> Keep the tone genuine, professional, and consistent with the brand voice.</span></li><li data-hveid="CAEIBBAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Include Visuals:</strong> Use high-quality photos, videos, or graphics to make the page engaging.</span></li><li data-hveid="CAEIBBAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Focus on the Customer:</strong> Highlight how the company\'s story or values benefit the customer, rather than just listing facts.</span></li><li data-hveid="CAEIBBAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Keep it Updated:</strong> Ensure the information is current and free of errors.</span><span class="uJ19be notranslate" data-wiz-uids="Z4RI9c_6f,Z4RI9c_6g"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_6e/TKHnVd"><span aria-hidden="true"> </span></span></span></li></ul></div><p><br></p>', 1, 'footer_col1', '#', 1, 1, NULL, NULL, '2026-02-12 21:07:06', '2026-02-12 21:07:41'),
	(20, NULL, 'Security & Policy', 'security-policy', 'storage/category/2026-02-13-1JjDTCXez7ELmTRtBk85mgasIbvxAG6gPqF9C2yy.webp', '<div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIABAY"><strong class="Yjhzub">Key Elements of an Effective "About Us" Page:</strong><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_1"><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_51,Z4RI9c_52"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_50/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_2"><ul class="KsbFXc U6u95"><li data-hveid="CAEIAhAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Brand Story/Origin:</strong> A narrative of how the business started and why.</span></li><li data-hveid="CAEIAhAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Mission and Vision:</strong> The purpose of the business and what it aims to achieve.</span></li><li data-hveid="CAEIAhAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Values and Culture:</strong> Ethical, sustainable, or core beliefs that drive the business.</span></li><li data-hveid="CAEIAhAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Team Introduction:</strong> Photos and bios of the people behind the products or services.</span></li><li data-hveid="CAEIAhAE"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Problem/Solution:</strong> An explanation of the problem the company solves and why it matters.</span></li><li data-hveid="CAEIAhAF"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Social Proof:</strong> Reviews, testimonials, or features that demonstrate credibility.</span><span class="uJ19be notranslate" data-wiz-uids="Z4RI9c_5n,Z4RI9c_5o"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_5m/TKHnVd"><span aria-hidden="true">&nbsp;</span></span></span></li></ul></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_3"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_4"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_5"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_6"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_7"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_8"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_9"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_10"><div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIAxAA"><strong class="Yjhzub">Best Practices for Writing:</strong><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_5z,Z4RI9c_60"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_5y/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_11"><ul class="KsbFXc U6u95"><li data-hveid="CAEIBBAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Be Authentic:</strong> Keep the tone genuine, professional, and consistent with the brand voice.</span></li><li data-hveid="CAEIBBAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Include Visuals:</strong> Use high-quality photos, videos, or graphics to make the page engaging.</span></li><li data-hveid="CAEIBBAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Focus on the Customer:</strong> Highlight how the company\'s story or values benefit the customer, rather than just listing facts.</span></li><li data-hveid="CAEIBBAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Keep it Updated:</strong> Ensure the information is current and free of errors.</span><span class="uJ19be notranslate" data-wiz-uids="Z4RI9c_6f,Z4RI9c_6g"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_6e/TKHnVd"><span aria-hidden="true">&nbsp;</span></span></span></li></ul></div><p><br></p>', 1, 'footer_col2', '#', 1, NULL, NULL, NULL, '2026-02-12 21:10:31', '2026-02-12 21:10:31'),
	(21, NULL, 'Exclusive product 001', 'exclusive-product-001', 'storage/category/2026-02-13-0E7sxPtSH9kAS71nMZT3o2o4z1zvSnmsTETDN1sp.webp', '<div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIABAY"><strong class="Yjhzub">Key Elements of an Effective "About Us" Page:</strong><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_1"><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_51,Z4RI9c_52"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_50/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_2"><ul class="KsbFXc U6u95"><li data-hveid="CAEIAhAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Brand Story/Origin:</strong> A narrative of how the business started and why.</span></li><li data-hveid="CAEIAhAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Mission and Vision:</strong> The purpose of the business and what it aims to achieve.</span></li><li data-hveid="CAEIAhAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Values and Culture:</strong> Ethical, sustainable, or core beliefs that drive the business.</span></li></ul></div>', 1, 'exclusive_collection', '#', 1, NULL, NULL, NULL, '2026-02-12 21:14:09', '2026-02-12 21:14:09'),
	(22, NULL, 'Exclusive product 002', 'exclusive-product-002', 'storage/category/2026-02-13-QAC9O9zr1P1j0mt05PRkdqJrnSnTqI19WevJ4ux2.webp', '<div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIABAY"><strong class="Yjhzub">Key Elements of an Effective "About Us" Page:</strong><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_1"><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_51,Z4RI9c_52"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_50/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_2"><ul class="KsbFXc U6u95"><li data-hveid="CAEIAhAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Brand Story/Origin:</strong> A narrative of how the business started and why.</span></li><li data-hveid="CAEIAhAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Mission and Vision:</strong> The purpose of the business and what it aims to achieve.</span></li><li data-hveid="CAEIAhAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Values and Culture:</strong> Ethical, sustainable, or core beliefs that drive the business.</span></li><li data-hveid="CAEIAhAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Team Introduction:</strong> Photos and bios of the people behind the products or services.</span></li></ul></div><p><br></p>', 1, 'exclusive_collection', '#', 1, NULL, NULL, NULL, '2026-02-12 21:15:49', '2026-02-12 21:15:49'),
	(23, NULL, 'Exclusive product 003', 'exclusive-product-003', 'storage/category/2026-02-13-Jhl6GUkJuhRaBZu7LMMeNdwe1AJH1flwT6kpdcR7.webp', '<div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIABAY"><strong class="Yjhzub">Key Elements of an Effective "About Us" Page:</strong><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_1"><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_51,Z4RI9c_52"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_50/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_2"><ul class="KsbFXc U6u95"><li data-hveid="CAEIAhAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Brand Story/Origin:</strong> A narrative of how the business started and why.</span></li><li data-hveid="CAEIAhAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Mission and Vision:</strong> The purpose of the business and what it aims to achieve.</span></li><li data-hveid="CAEIAhAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Values and Culture:</strong> Ethical, sustainable, or core beliefs that drive the business.</span></li><li data-hveid="CAEIAhAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Team Introduction:</strong> Photos and bios of the people behind the products or services.</span></li></ul></div><p><br></p>', 1, 'exclusive_collection', '#', 1, NULL, NULL, NULL, '2026-02-12 21:16:15', '2026-02-12 21:16:15');

-- Dumping structure for table radix.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table radix.home_sections
DROP TABLE IF EXISTS `home_sections`;
CREATE TABLE IF NOT EXISTS `home_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Category Product','Trending Product','New Product','Featured Category','Category Carousel','Popular Writter','Banner','Brand') COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `serial` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_sections_category_id_foreign` (`category_id`),
  CONSTRAINT `home_sections_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.home_sections: ~0 rows (approximately)
DELETE FROM `home_sections`;

-- Dumping structure for table radix.home_section_categories
DROP TABLE IF EXISTS `home_section_categories`;
CREATE TABLE IF NOT EXISTS `home_section_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `home_section_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_section_categories_home_section_id_foreign` (`home_section_id`),
  KEY `home_section_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `home_section_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `home_section_categories_home_section_id_foreign` FOREIGN KEY (`home_section_id`) REFERENCES `home_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.home_section_categories: ~0 rows (approximately)
DELETE FROM `home_section_categories`;

-- Dumping structure for table radix.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;

-- Dumping structure for table radix.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.job_batches: ~0 rows (approximately)
DELETE FROM `job_batches`;

-- Dumping structure for table radix.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'footer',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_category_id_foreign` (`category_id`),
  KEY `menus_created_by_foreign` (`created_by`),
  KEY `menus_updated_by_foreign` (`updated_by`),
  KEY `menus_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `menus_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.menus: ~0 rows (approximately)
DELETE FROM `menus`;

-- Dumping structure for table radix.menu_items
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `type` enum('external','internal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  KEY `menu_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.menu_items: ~0 rows (approximately)
DELETE FROM `menu_items`;

-- Dumping structure for table radix.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_05_07_083259_create_permission_tables', 1),
	(5, '2025_05_07_083431_create_admin_menus_table', 1),
	(6, '2025_05_07_083444_create_admin_menu_actions_table', 1),
	(7, '2025_05_07_084137_create_admin_settings_table', 1),
	(8, '2025_05_07_084409_create_settings_table', 1),
	(9, '2025_08_19_172447_create_categories_table', 1),
	(10, '2025_08_21_172430_create_uoms_table', 1),
	(11, '2025_08_22_152908_create_stores_table', 1),
	(12, '2025_08_22_160106_create_vendors_table', 1),
	(13, '2025_08_23_114403_create_attributes_table', 1),
	(14, '2025_08_23_114500_create_attribute_values_table', 1),
	(15, '2025_08_23_122158_create_brands_table', 1),
	(16, '2025_08_23_141243_create_authors_table', 1),
	(17, '2025_08_23_151243_create_publications_table', 1),
	(18, '2025_08_23_171640_create_products_table', 1),
	(19, '2025_08_23_171642_create_product_categories_table', 1),
	(20, '2025_08_23_171740_create_product_vendors_table', 1),
	(21, '2025_08_23_171750_create_product_authors_table', 1),
	(22, '2025_08_23_171840_create_product_tags_table', 1),
	(23, '2025_08_23_172142_create_product_images_table', 1),
	(24, '2025_08_23_172227_create_product_variants_table', 1),
	(25, '2025_08_23_172246_create_product_variant_values_table', 1),
	(26, '2025_09_02_162530_create_purchase_orders_table', 1),
	(27, '2025_09_02_172432_create_purchase_order_items_table', 1),
	(28, '2025_09_02_173851_create_purchase_receipts_table', 1),
	(29, '2025_09_02_173857_create_purchase_receipt_items_table', 1),
	(30, '2025_09_02_174309_create_stocks_table', 1),
	(31, '2025_09_02_174319_create_stock_movements_table', 1),
	(32, '2025_09_07_094949_create_sliders_table', 1),
	(33, '2025_09_07_115753_create_home_sections_table', 1),
	(34, '2025_09_10_045646_create_home_section_categories_table', 1),
	(35, '2025_10_16_010234_create_menus_table', 1),
	(36, '2025_10_16_010239_create_menu_items_table', 1),
	(37, '2026_01_27_111709_create_wishlists_table', 1),
	(38, '2026_01_28_060922_create_orders_table', 1),
	(39, '2026_01_28_060938_create_order_items_table', 1),
	(40, '2026_02_01_061140_create_reviews_table', 1);

-- Dumping structure for table radix.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table radix.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.model_has_roles: ~3 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(4, 'App\\Models\\User', 4),
	(1, 'App\\Models\\User', 8),
	(4, 'App\\Models\\User', 9),
	(1, 'App\\Models\\User', 10),
	(2, 'App\\Models\\User', 10),
	(1, 'App\\Models\\User', 11);

-- Dumping structure for table radix.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.orders: ~6 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`id`, `user_id`, `order_number`, `subtotal`, `comments`, `discount`, `tax`, `total`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 'ORD-1770805771', 209.00, NULL, 20.90, 10.45, 198.55, 'Cash', 'pending', '2026-02-11 04:29:31', '2026-02-11 04:29:31'),
	(2, 2, 'ORD-1770875373', 66.00, NULL, 6.60, 3.30, 62.70, 'Cash', 'pending', '2026-02-11 23:49:33', '2026-02-11 23:49:33'),
	(3, 2, 'ORD-1770875562', 99.00, 'I am asking new arival prod dao', 9.90, 4.95, 94.05, 'Cash', 'pending', '2026-02-11 23:52:42', '2026-02-11 23:52:42'),
	(4, 2, 'ORD-1770875905', 6.00, 'asada', 0.60, 0.30, 5.70, 'Cash', 'pending', '2026-02-11 23:58:25', '2026-02-11 23:58:25'),
	(5, 2, 'ORD-1770876024', 99.00, 'aS', 9.90, 4.95, 94.05, 'Cash', 'confirmed', '2026-02-12 00:00:24', '2026-02-12 00:07:43'),
	(6, 2, 'ORD-1770876065', 9.00, 'QASA', 0.90, 0.45, 8.55, 'Cash', 'delivered', '2026-02-12 00:01:05', '2026-02-12 00:02:40');

-- Dumping structure for table radix.order_items
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned DEFAULT NULL,
  `qty` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.order_items: ~7 rows (approximately)
DELETE FROM `order_items`;
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_variant_id`, `qty`, `price`, `total`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, NULL, 1, 77.00, 77.00, '2026-02-11 04:29:32', '2026-02-11 04:29:32'),
	(2, 1, 2, NULL, 1, 77.00, 77.00, '2026-02-11 04:29:32', '2026-02-11 04:29:32'),
	(3, 1, 1, NULL, 1, 55.00, 55.00, '2026-02-11 04:29:32', '2026-02-11 04:29:32'),
	(4, 2, 14, NULL, 1, 66.00, 66.00, '2026-02-11 23:49:33', '2026-02-11 23:49:33'),
	(5, 3, 16, 17, 1, 99.00, 99.00, '2026-02-11 23:52:42', '2026-02-11 23:52:42'),
	(6, 4, 21, NULL, 2, 3.00, 6.00, '2026-02-11 23:58:25', '2026-02-11 23:58:25'),
	(7, 5, 16, 17, 1, 99.00, 99.00, '2026-02-12 00:00:24', '2026-02-12 00:00:24'),
	(8, 6, 21, NULL, 3, 3.00, 9.00, '2026-02-12 00:01:05', '2026-02-12 00:01:05');

-- Dumping structure for table radix.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table radix.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.permissions: ~169 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Dashboard', 'web', '2025-06-17 05:07:50', '2025-06-17 05:07:50'),
	(2, 'System Settings', 'web', '2025-06-17 05:10:14', '2025-06-17 05:10:14'),
	(3, 'Roles', 'web', '2025-06-17 05:10:36', '2025-06-17 05:10:36'),
	(4, 'Users', 'web', '2025-06-17 05:11:10', '2025-06-17 05:11:10'),
	(5, 'admin.admin-menu.index', 'web', '2025-06-17 05:11:51', '2026-02-13 09:13:16'),
	(6, 'Admin Settings', 'web', '2025-06-17 05:12:59', '2025-06-17 05:12:59'),
	(8, 'admin.admin-menu.create', 'web', '2025-06-17 05:30:00', '2025-06-17 05:30:00'),
	(9, 'admin.admin-menu.edit', 'web', '2025-06-17 05:30:15', '2025-06-17 05:30:15'),
	(10, 'admin.admin-menu.destroy', 'web', '2025-06-17 05:30:19', '2025-06-17 05:30:19'),
	(11, 'admin.admin-menu-action.index', 'web', '2025-06-17 05:30:59', '2025-06-17 05:30:59'),
	(12, 'admin.admin-menu-action.create', 'web', '2025-06-17 05:31:06', '2025-06-17 05:31:06'),
	(13, 'admin.admin-menu-action.edit', 'web', '2025-06-17 05:31:15', '2025-06-17 05:31:15'),
	(14, 'admin.admin-menu-action.destroy', 'web', '2025-06-17 05:31:21', '2025-06-17 05:31:21'),
	(15, 'admin.role.create', 'web', '2025-06-17 05:32:05', '2025-06-17 05:32:05'),
	(16, 'admin.role.edit', 'web', '2025-06-17 05:32:09', '2025-06-17 05:32:09'),
	(17, 'admin.role.destroy', 'web', '2025-06-17 05:32:15', '2025-06-17 05:32:15'),
	(18, 'admin.role-permission.edit', 'web', '2025-06-17 05:32:50', '2025-06-17 05:32:50'),
	(19, 'admin.user.create', 'web', '2025-06-17 05:33:17', '2025-06-17 05:33:17'),
	(20, 'admin.user.edit', 'web', '2025-06-17 05:33:20', '2025-06-17 05:33:20'),
	(32, 'Sattlement', 'web', '2025-06-17 05:40:52', '2025-06-17 05:40:52'),
	(33, 'admin.invest-sattlement.create', 'web', '2025-06-17 05:41:09', '2025-06-23 04:19:25'),
	(34, 'admin.invest-sattlement.edit', 'web', '2025-06-17 05:41:13', '2025-06-23 04:19:31'),
	(37, 'General Accounting', 'web', '2025-06-17 05:42:20', '2025-06-17 05:42:20'),
	(38, 'Transaction', 'web', '2025-06-17 05:42:51', '2025-06-17 05:42:51'),
	(39, 'Reports', 'web', '2025-06-17 05:43:04', '2025-06-17 05:43:04'),
	(40, 'Chart of Accounts', 'web', '2025-06-17 05:43:37', '2025-06-17 05:43:37'),
	(41, 'admin.coa.create', 'web', '2025-06-17 05:44:10', '2025-06-17 05:44:10'),
	(42, 'admin.coa.edit', 'web', '2025-06-17 05:44:15', '2025-06-17 05:44:15'),
	(43, 'admin.coa.destroy', 'web', '2025-06-17 05:44:20', '2025-06-17 05:44:20'),
	(44, 'Debit Voucher', 'web', '2025-06-17 05:45:02', '2025-06-17 05:45:02'),
	(45, 'admin.debit-voucher.create', 'web', '2025-06-17 05:45:12', '2025-06-17 05:45:12'),
	(46, 'admin.debit-voucher.edit', 'web', '2025-06-17 05:45:17', '2025-06-17 05:45:17'),
	(49, 'Credit Voucher', 'web', '2025-06-17 05:46:11', '2025-06-17 05:46:11'),
	(50, 'admin.credit-voucher.create', 'web', '2025-06-17 05:46:23', '2025-06-17 05:46:23'),
	(51, 'admin.credit-voucher.edit', 'web', '2025-06-17 05:46:27', '2025-06-17 05:46:27'),
	(54, 'Journal Voucher', 'web', '2025-06-17 05:46:57', '2025-06-17 05:46:57'),
	(55, 'admin.journal-voucher.create', 'web', '2025-06-17 05:47:08', '2025-06-17 05:47:08'),
	(56, 'admin.journal-voucher.edit', 'web', '2025-06-17 05:47:13', '2025-06-17 05:47:13'),
	(59, 'admin.voucher-approve.index', 'web', '2025-06-17 05:48:10', '2025-06-17 05:56:08'),
	(60, 'admin.voucher-approve.show', 'web', '2025-06-17 05:48:51', '2025-06-17 05:48:51'),
	(61, 'admin.voucher-approve.edit', 'web', '2025-06-17 05:49:08', '2025-06-17 05:49:08'),
	(62, 'admin.voucher-refuse.index', 'web', '2025-06-17 05:50:19', '2025-06-17 05:56:21'),
	(63, 'admin.voucher-refuse.show', 'web', '2025-06-17 05:50:44', '2025-06-17 05:50:44'),
	(64, 'admin.voucher-refuse.edit', 'web', '2025-06-17 05:50:49', '2025-06-17 05:50:49'),
	(65, 'admin.automation-approve.index', 'web', '2025-06-17 05:51:28', '2025-06-17 05:56:39'),
	(66, 'admin.automation-approve.show', 'web', '2025-06-17 05:51:41', '2025-06-17 05:51:41'),
	(67, 'admin.automation-approve.edit', 'web', '2025-06-17 05:51:52', '2025-06-17 05:51:52'),
	(68, 'admin.automation-refuse.index', 'web', '2025-06-17 05:52:56', '2025-06-17 05:56:47'),
	(69, 'admin.automation-refuse.show', 'web', '2025-06-17 05:53:09', '2025-06-17 05:53:09'),
	(70, 'admin.automation-refuse.edit', 'web', '2025-06-17 05:53:17', '2025-06-17 05:53:17'),
	(71, 'Chart of Accounts 1', 'web', '2025-06-17 06:02:09', '2025-06-17 06:02:09'),
	(72, 'Daily Voucher List', 'web', '2025-06-17 06:02:32', '2025-06-17 06:02:32'),
	(73, 'Daily Cash Book', 'web', '2025-06-17 06:03:05', '2025-06-17 06:03:05'),
	(74, 'Bank Book', 'web', '2025-06-17 06:03:16', '2025-06-17 06:03:16'),
	(75, 'Transaction Ledger', 'web', '2025-06-17 06:03:36', '2025-06-17 06:03:36'),
	(76, 'General Ledger', 'web', '2025-06-17 06:03:52', '2025-06-17 06:03:52'),
	(77, 'Cash Flow Statement', 'web', '2025-06-17 06:04:23', '2025-06-17 06:04:23'),
	(78, 'Trial Balance', 'web', '2025-06-17 06:04:35', '2025-06-17 06:04:35'),
	(79, 'Income Statement', 'web', '2025-06-17 06:04:58', '2025-06-17 06:04:58'),
	(80, 'Balance Sheet', 'web', '2025-06-17 06:05:13', '2025-06-17 06:05:13'),
	(81, 'admin.debit-voucher.show', 'web', '2025-06-18 04:03:34', '2025-06-18 04:03:34'),
	(82, 'admin.debit-voucher.print', 'web', '2025-06-18 04:03:38', '2025-06-18 04:03:38'),
	(83, 'admin.debit-voucher.destroy', 'web', '2025-06-18 04:03:43', '2025-06-18 04:03:43'),
	(84, 'admin.debit-voucher.trash', 'web', '2025-06-18 04:03:47', '2025-06-18 04:03:47'),
	(85, 'admin.credit-voucher.show', 'web', '2025-06-18 22:26:47', '2025-06-18 22:26:47'),
	(86, 'admin.credit-voucher.print', 'web', '2025-06-18 22:26:51', '2025-06-18 22:26:51'),
	(87, 'admin.credit-voucher.destroy', 'web', '2025-06-18 22:26:59', '2025-06-18 22:26:59'),
	(88, 'admin.credit-voucher.trash', 'web', '2025-06-18 22:27:02', '2025-06-18 22:27:02'),
	(127, 'admin.invest-sattlement.show', 'web', '2025-06-23 04:19:47', '2025-06-23 04:19:47'),
	(128, 'admin.invest-sattlement.destroy', 'web', '2025-06-23 04:19:56', '2025-06-23 04:19:56'),
	(129, 'admin.invest-sattlement.trash', 'web', '2025-06-23 04:20:01', '2025-06-23 04:20:01'),
	(130, 'admin.user.password', 'web', '2025-06-23 22:35:11', '2025-06-23 22:35:11'),
	(131, 'admin.user.destroy', 'web', '2025-06-23 22:35:16', '2025-06-23 22:35:16'),
	(132, 'admin.user.trash', 'web', '2025-06-23 22:35:21', '2025-06-23 22:35:21'),
	(138, 'Product Management', 'web', '2025-07-17 04:00:10', '2026-02-10 21:01:06'),
	(139, 'admin.products.index', 'web', '2025-07-17 04:01:15', '2026-02-10 21:01:54'),
	(147, 'admin.production.create', 'web', '2025-07-18 22:28:23', '2025-07-18 22:28:23'),
	(148, 'admin.production.edit', 'web', '2025-07-18 22:28:27', '2025-07-18 22:28:27'),
	(149, 'admin.production.show', 'web', '2025-07-18 22:28:33', '2025-07-18 22:28:33'),
	(152, 'admin.production.print', 'web', '2025-07-19 04:38:54', '2025-07-19 04:38:54'),
	(153, 'admin.production.destroy', 'web', '2025-07-19 04:38:59', '2025-07-19 04:38:59'),
	(154, 'admin.production.trash', 'web', '2025-07-19 04:39:06', '2025-07-19 04:39:06'),
	(155, 'Sales Management', 'web', '2025-07-19 04:47:23', '2025-07-19 04:47:23'),
	(156, 'admin.order.index', 'web', '2025-07-19 04:49:14', '2026-02-14 07:19:32'),
	(157, 'Sales 1', 'web', '2025-07-19 04:49:37', '2025-07-19 04:49:37'),
	(158, 'admin.client.create', 'web', '2025-07-19 04:49:55', '2025-07-19 04:49:55'),
	(159, 'admin.client.edit', 'web', '2025-07-19 04:50:00', '2025-07-19 04:50:00'),
	(160, 'admin.client.destroy', 'web', '2025-07-19 04:50:07', '2025-07-19 04:50:07'),
	(161, 'admin.client.trash', 'web', '2025-07-19 04:50:11', '2025-07-19 04:50:11'),
	(162, 'admin.sales.create', 'web', '2025-07-19 04:50:26', '2025-07-19 04:50:26'),
	(163, 'admin.sales.edit', 'web', '2025-07-19 04:50:29', '2025-07-19 04:50:29'),
	(164, 'admin.sales.show', 'web', '2025-07-19 04:50:33', '2025-07-20 07:51:18'),
	(166, 'admin.vendor.index', 'web', '2025-07-19 04:51:17', '2026-02-10 21:36:19'),
	(167, 'CMS Setup', 'web', '2025-07-19 05:13:16', '2026-02-13 09:16:59'),
	(168, 'admin.settings.index', 'web', '2025-07-19 05:14:11', '2026-02-13 09:15:38'),
	(171, 'admin.region.create', 'web', '2025-07-19 06:11:34', '2025-07-19 06:11:34'),
	(172, 'admin.region.edit', 'web', '2025-07-19 06:11:40', '2025-07-19 06:11:40'),
	(173, 'admin.region.destroy', 'web', '2025-07-19 06:11:45', '2025-07-19 06:11:45'),
	(174, 'admin.region.trash', 'web', '2025-07-19 06:11:50', '2025-07-19 06:11:50'),
	(188, 'admin.sales.destroy', 'web', '2025-07-20 07:36:18', '2025-07-20 07:36:18'),
	(189, 'admin.sales.trash', 'web', '2025-07-20 07:36:23', '2025-07-20 07:36:23'),
	(190, 'Collections', 'web', '2025-07-20 07:50:25', '2025-07-20 07:50:25'),
	(191, 'admin.collection.create', 'web', '2025-07-20 07:50:36', '2025-07-20 07:50:36'),
	(192, 'admin.collection.edit', 'web', '2025-07-20 07:50:41', '2025-07-20 07:50:41'),
	(193, 'admin.collection.show', 'web', '2025-07-20 07:50:45', '2025-07-20 07:50:45'),
	(194, 'admin.collection.destroy', 'web', '2025-07-20 07:50:52', '2025-07-20 07:50:52'),
	(195, 'admin.collection.trash', 'web', '2025-07-20 07:50:56', '2025-07-20 07:50:56'),
	(196, 'Sales Returns', 'web', '2025-07-21 05:38:18', '2025-07-21 05:38:18'),
	(197, 'admin.sales-return.create', 'web', '2025-07-21 05:38:34', '2025-07-21 05:38:34'),
	(198, 'admin.sales-return.edit', 'web', '2025-07-21 05:38:45', '2025-07-21 05:38:45'),
	(199, 'admin.sales-return.show', 'web', '2025-07-21 05:38:49', '2025-07-21 05:38:49'),
	(200, 'admin.sales-return.destroy', 'web', '2025-07-21 05:38:55', '2025-07-21 05:38:55'),
	(201, 'admin.sales-return.trash', 'web', '2025-07-21 05:39:07', '2025-07-21 05:39:07'),
	(208, 'Profit Distribution', 'web', '2025-07-22 02:47:36', '2025-07-22 02:47:36'),
	(209, 'admin.profit-distribution.create', 'web', '2025-07-22 02:47:59', '2025-07-22 02:47:59'),
	(210, 'admin.profit-distribution.edit', 'web', '2025-07-22 02:48:05', '2025-07-22 02:48:05'),
	(211, 'admin.profit-distribution.show', 'web', '2025-07-22 02:48:09', '2025-07-22 02:48:09'),
	(212, 'admin.profit-distribution.destroy', 'web', '2025-07-22 02:48:16', '2025-07-22 02:48:16'),
	(213, 'admin.profit-distribution.trash', 'web', '2025-07-22 02:48:22', '2025-07-22 02:48:22'),
	(221, 'admin.journal-voucher.show', 'web', '2025-08-31 23:33:11', '2025-08-31 23:33:11'),
	(222, 'admin.journal-voucher.print', 'web', '2025-08-31 23:33:17', '2025-08-31 23:33:17'),
	(223, 'admin.journal-voucher.destroy', 'web', '2025-08-31 23:33:21', '2025-08-31 23:33:21'),
	(224, 'admin.journal-voucher.trash', 'web', '2025-08-31 23:34:07', '2025-08-31 23:34:07'),
	(230, 'admin.vendor.create', 'web', '2026-02-10 21:37:16', '2026-02-10 21:37:16'),
	(231, 'admin.vendor.edit', 'web', '2026-02-10 21:37:34', '2026-02-10 21:37:34'),
	(232, 'Brand', 'web', '2026-02-10 21:38:59', '2026-02-10 21:38:59'),
	(233, 'admin.brand.create', 'web', '2026-02-10 21:40:40', '2026-02-10 21:40:40'),
	(234, 'admin.brand.edit', 'web', '2026-02-10 21:40:57', '2026-02-10 21:40:57'),
	(235, 'Unit', 'web', '2026-02-10 21:43:27', '2026-02-10 21:43:27'),
	(236, 'admin.uom.create', 'web', '2026-02-10 21:44:37', '2026-02-10 21:44:37'),
	(237, 'admin.uom.edit', 'web', '2026-02-10 21:44:52', '2026-02-10 21:44:52'),
	(238, 'Categories', 'web', '2026-02-10 21:55:36', '2026-02-10 21:55:36');

-- Dumping structure for table radix.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `uom_id` bigint unsigned DEFAULT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `publication_id` bigint unsigned DEFAULT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'others',
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `purchase_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `regular_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `discount_start_date` date DEFAULT NULL,
  `discount_end_date` date DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `favorite` tinyint(1) NOT NULL DEFAULT '0',
  `trending` tinyint(1) NOT NULL DEFAULT '0',
  `new_arrival` tinyint(1) NOT NULL DEFAULT '0',
  `best_seller` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  UNIQUE KEY `products_barcode_unique` (`barcode`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_uom_id_foreign` (`uom_id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_publication_id_foreign` (`publication_id`),
  KEY `products_created_by_foreign` (`created_by`),
  KEY `products_updated_by_foreign` (`updated_by`),
  KEY `products_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_uom_id_foreign` FOREIGN KEY (`uom_id`) REFERENCES `uoms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.products: ~17 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `uom_id`, `brand_id`, `publication_id`, `product_type`, `barcode`, `file`, `thumbnail`, `short_description`, `description`, `purchase_price`, `regular_price`, `sale_price`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `sku`, `meta_title`, `meta_description`, `meta_image`, `custom_barcode`, `favorite`, `trending`, `new_arrival`, `best_seller`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'SOCKS A001', 'socks-a001', 3, 1, 1, NULL, 'book', 'sasasa', NULL, 'storage/media/product/2026-02-11-liqqZG8yOezxODIXxLxXxvfphNXT5YuXUKVQQSfY.webp', '<p>sdsad</p>', '<p>xzXzX</p>', 44.00, 55.00, 55.00, 0.00, 'amount', NULL, NULL, 'cscsd', 'SOCKS A001', 'xzXzX', 'storage/media/product/2026-02-11-liqqZG8yOezxODIXxLxXxvfphNXT5YuXUKVQQSfY.webp', 1, 1, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-10 21:46:30', '2026-02-10 21:46:30'),
	(2, 'SOCKS-002', 'socks-002', 3, 1, 1, NULL, 'book', '22', NULL, 'storage/media/product/2026-02-11-lqRBQdHfrbwRQ2COsjHpg7F31H0EeDt1CPtsIF7q.webp', '<p>xasa</p>', '<p>xasa</p>', 55.00, 77.00, 77.00, 0.00, 'amount', NULL, NULL, NULL, 'SOCKS-002', 'xasa', 'storage/media/product/2026-02-11-lqRBQdHfrbwRQ2COsjHpg7F31H0EeDt1CPtsIF7q.webp', 1, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-10 21:48:06', '2026-02-10 21:48:06'),
	(3, 'SOCKS-003', 'socks-003', 3, 1, 1, NULL, 'book', '988253765259', NULL, 'storage/media/product/2026-02-11-yBntiXTL6cl0QvvhAh8BmkPavKGtKMTfZRcFTNwr.webp', '<p>ASA</p>', '<p>SAa</p>', 66.00, 77.00, 77.00, 0.00, 'amount', NULL, NULL, NULL, 'SOCKS-003', 'SAa', 'storage/media/product/2026-02-11-yBntiXTL6cl0QvvhAh8BmkPavKGtKMTfZRcFTNwr.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-10 21:50:06', '2026-02-10 21:50:36'),
	(4, 'SOCKS-004', 'socks-004', 3, 1, 1, NULL, 'book', 'sdasd', NULL, 'storage/media/product/2026-02-11-R9Eonxcqz7g2nhQuc4tm0OLs4Z84yaoRXURj6YkH.webp', '<p>saS</p>', '<p>SAs</p>', 88.00, 99.00, 99.00, 0.00, 'amount', NULL, NULL, NULL, 'SOCKS-004', 'SAs', 'storage/media/product/2026-02-11-R9Eonxcqz7g2nhQuc4tm0OLs4Z84yaoRXURj6YkH.webp', 1, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-10 21:51:43', '2026-02-10 21:51:43'),
	(5, 'SOCKS-05', 'socks-05', 3, 1, 1, NULL, 'book', '436208522547', NULL, 'storage/media/product/2026-02-11-2oqINcPFcNCQAsOgItmApD9pJfxx9vJ2AH5Y0SUf.webp', '<p>asdad</p>', '<p>adasad</p>', 22.00, 44.00, 44.00, 0.00, 'amount', NULL, NULL, NULL, 'SOCKS-05', 'adasad', 'storage/media/product/2026-02-11-2oqINcPFcNCQAsOgItmApD9pJfxx9vJ2AH5Y0SUf.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-10 21:53:39', '2026-02-10 21:53:39'),
	(6, 'Sdsdsad', 'sdsdsad', 4, 1, 1, NULL, 'book', 'DADA', NULL, 'storage/media/product/2026-02-11-S16xZtFSqX3SCK8EogPum6EPGG2tlIgXjmZqCrxN.webp', '<p>adaD</p>', '<p>adada</p>', 88.00, 99.00, 99.00, 0.00, 'amount', NULL, NULL, NULL, 'Sdsdsad', 'adada', 'storage/media/product/2026-02-11-S16xZtFSqX3SCK8EogPum6EPGG2tlIgXjmZqCrxN.webp', 1, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-10 21:57:17', '2026-02-10 21:57:34'),
	(7, 'SADASDAS', 'sadasdas', 4, 1, 1, NULL, 'book', '921834935222', NULL, 'storage/media/product/2026-02-11-geCjvzz4kpu4dQU3HUtTGgTvrKjb0t1pD1s1Uh9u.webp', NULL, NULL, 33.00, 33.00, 33.00, 0.00, 'amount', NULL, NULL, NULL, 'SADASDAS', '', 'storage/media/product/2026-02-11-geCjvzz4kpu4dQU3HUtTGgTvrKjb0t1pD1s1Uh9u.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-10 21:58:24', '2026-02-10 21:58:24'),
	(8, 'SDSA', 'sdsa', 4, 1, 1, NULL, 'book', '443468968740', NULL, 'storage/media/product/2026-02-11-CGjfGq1WA1BPXw0oykKEjNVDGwNymR5fv3rlzwIp.webp', NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, NULL, NULL, 'SDSA', '', 'storage/media/product/2026-02-11-CGjfGq1WA1BPXw0oykKEjNVDGwNymR5fv3rlzwIp.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-10 21:58:50', '2026-02-10 21:58:50'),
	(9, 'DSAD', 'dsad', 4, 1, 1, NULL, 'book', '105490249508', NULL, 'storage/media/product/2026-02-11-9R6AHtZlaoLrDziM6nW0dhugeEf3ZddcGkcbMh5N.webp', NULL, NULL, 33.00, 55.00, 55.00, 0.00, 'amount', NULL, NULL, NULL, 'DSAD', '', 'storage/media/product/2026-02-11-9R6AHtZlaoLrDziM6nW0dhugeEf3ZddcGkcbMh5N.webp', 0, 0, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-10 21:59:16', '2026-02-10 21:59:16'),
	(10, 'AWDAD', 'awdad', 4, 1, 1, NULL, 'book', 'SADSA', NULL, 'storage/media/product/2026-02-11-CkQniq3nFIoLS1WYsJt8mW1WnfgUu3V6rZGymCGF.webp', NULL, NULL, 22.00, 33.00, 33.00, 0.00, 'amount', NULL, NULL, NULL, 'AWDAD', '', 'storage/media/product/2026-02-11-CkQniq3nFIoLS1WYsJt8mW1WnfgUu3V6rZGymCGF.webp', 1, 1, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-10 22:00:12', '2026-02-10 22:00:12'),
	(11, 'TEST', 'test', 5, 1, 1, NULL, 'book', '351408624650', NULL, 'storage/media/product/2026-02-11-UFICoc0Fq49GaDZLFS7VVaWDOYZ4ebfZEiyY1wz6.webp', NULL, NULL, 66.00, 88.00, 88.00, 0.00, 'amount', NULL, NULL, NULL, 'TEST', '', 'storage/media/product/2026-02-11-UFICoc0Fq49GaDZLFS7VVaWDOYZ4ebfZEiyY1wz6.webp', 0, 1, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-02-11 09:04:55', '2026-02-11 09:04:55'),
	(12, 'asdasd', 'asdasd', 5, 1, 1, NULL, 'socks', '526230367794', NULL, 'storage/media/product/2026-02-11-lbe18tELfwNMMnC3bgTAIjIh3TIH9Vx5Kg7I5Yy4.webp', NULL, NULL, 77.00, 88.00, 88.00, 0.00, 'amount', NULL, NULL, NULL, 'asdasd', '', 'storage/media/product/2026-02-11-lbe18tELfwNMMnC3bgTAIjIh3TIH9Vx5Kg7I5Yy4.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-11 09:06:39', '2026-02-12 21:55:10'),
	(14, 'sadsa', 'sadsa', 5, 1, 1, NULL, 'socks', '480277990050', NULL, 'storage/media/product/2026-02-11-7rFcgYLXK5jRYntFQmAbXPEJvzUAh2iiWRV19MfX.webp', NULL, NULL, 44.00, 66.00, 66.00, 0.00, 'amount', NULL, NULL, NULL, 'sadsa', '', 'storage/media/product/2026-02-11-7rFcgYLXK5jRYntFQmAbXPEJvzUAh2iiWRV19MfX.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-11 09:14:45', '2026-02-12 21:51:02'),
	(16, 'aSA', 'asa', 5, 1, 1, NULL, 'socks', '201880990067', NULL, 'storage/media/product/2026-02-11-NnLZNWs968MQG68NDxY7T3KmZ85Mv4m9pfIYasnv.webp', NULL, NULL, 88.00, 99.00, 99.00, 0.00, 'amount', NULL, NULL, 'rrr', 'aSA', '', 'storage/media/product/2026-02-11-NnLZNWs968MQG68NDxY7T3KmZ85Mv4m9pfIYasnv.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-11 09:21:11', '2026-02-11 22:57:15'),
	(18, 'asdas', 'asdas', 5, 1, 1, NULL, 'socks', '144580079147', NULL, 'storage/media/product/2026-02-11-gqsQ3Ki3xE9Qa5aaObCpwsLj9rBfWcTGwVu7hSYc.webp', NULL, NULL, 6.00, 9.00, 9.00, 0.00, 'amount', NULL, NULL, NULL, 'asdas', '', 'storage/media/product/2026-02-11-gqsQ3Ki3xE9Qa5aaObCpwsLj9rBfWcTGwVu7hSYc.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-11 09:28:53', '2026-02-11 21:39:52'),
	(20, 'SSSSSSSSS', 'sssssssss', 5, 1, 1, NULL, 'clothes', '608509259911', NULL, 'storage/media/product/2026-02-11-2Z7CFIaQrAHcgAwK3Zgpixj7r9gEZHM3TrbIIwV2.webp', NULL, NULL, 33.00, 55.00, 55.00, 0.00, 'amount', NULL, NULL, NULL, 'SSSSSSSSS', '', 'storage/media/product/2026-02-11-2Z7CFIaQrAHcgAwK3Zgpixj7r9gEZHM3TrbIIwV2.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-11 09:36:12', '2026-02-11 21:47:12'),
	(21, 'awsa', 'awsa', 5, 1, 1, NULL, 'socks', '213305690041', NULL, 'storage/media/product/2026-02-12-cmOYqKRU1lfMshFQK7NwL71Kco251U9FKXn55IoT.webp', '<div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIABAY"><strong class="Yjhzub">Key Elements of an Effective "About Us" Page:</strong><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_1"><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_51,Z4RI9c_52"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_50/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_2"><ul class="KsbFXc U6u95"><li data-hveid="CAEIAhAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Brand Story/Origin:</strong> A narrative of how the business started and why.</span></li><li data-hveid="CAEIAhAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Mission and Vision:</strong> The purpose of the business and what it aims to achieve.</span></li><li data-hveid="CAEIAhAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Values and Culture:</strong> Ethical, sustainable, or core beliefs that drive the business.</span></li><li data-hveid="CAEIAhAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Team Introduction:</strong> Photos and bios of the people behind the products or services.</span></li><li data-hveid="CAEIAhAE"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Problem/Solution:</strong> An explanation of the problem the company solves and why it matters.</span></li></ul></div>', '<div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIABAY"><strong class="Yjhzub">Key Elements of an Effective "About Us" Page:</strong><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_1"><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_51,Z4RI9c_52"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_50/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_2"><ul class="KsbFXc U6u95"><li data-hveid="CAEIAhAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Brand Story/Origin:</strong> A narrative of how the business started and why.</span></li><li data-hveid="CAEIAhAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Mission and Vision:</strong> The purpose of the business and what it aims to achieve.</span></li><li data-hveid="CAEIAhAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Values and Culture:</strong> Ethical, sustainable, or core beliefs that drive the business.</span></li><li data-hveid="CAEIAhAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Team Introduction:</strong> Photos and bios of the people behind the products or services.</span></li><li data-hveid="CAEIAhAE"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Problem/Solution:</strong> An explanation of the problem the company solves and why it matters.</span></li><li data-hveid="CAEIAhAF"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Social Proof:</strong> Reviews, testimonials, or features that demonstrate credibility.</span><span class="uJ19be notranslate" data-wiz-uids="Z4RI9c_5n,Z4RI9c_5o"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_5m/TKHnVd"><span aria-hidden="true">&nbsp;</span></span></span></li></ul></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_3"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_4"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_5"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_6"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_7"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_8"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_9"></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_10"><div class="Y3BBE" data-sfc-cp="" data-hveid="CAEIAxAA"><strong class="Yjhzub">Best Practices for Writing:</strong><span class="txxDge notranslate" data-wiz-uids="Z4RI9c_5z,Z4RI9c_60"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_5y/TKHnVd"><span aria-hidden="true"></span></span></span></div></div><div style="display: contents" id="sdh_gpKOafiQMPmbseMPpa2vgAQ_11"><ul class="KsbFXc U6u95"><li data-hveid="CAEIBBAA"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Be Authentic:</strong> Keep the tone genuine, professional, and consistent with the brand voice.</span></li><li data-hveid="CAEIBBAB"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Include Visuals:</strong> Use high-quality photos, videos, or graphics to make the page engaging.</span></li><li data-hveid="CAEIBBAC"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Focus on the Customer:</strong> Highlight how the company\'s story or values benefit the customer, rather than just listing facts.</span></li><li data-hveid="CAEIBBAD"><span class="T286Pc" data-sfc-cp=""><strong class="Yjhzub">Keep it Updated:</strong> Ensure the information is current and free of errors.</span><span class="uJ19be notranslate" data-wiz-uids="Z4RI9c_6f,Z4RI9c_6g"><span class="vKEkVd" data-animation-atomic="" data-wiz-attrbind="class=Z4RI9c_6e/TKHnVd"><span aria-hidden="true">&nbsp;</span></span></span></li></ul></div><p><br></p>', 3.00, 3.00, 3.00, 0.00, 'amount', NULL, NULL, NULL, 'awsa', 'Key Elements of an Effective "About Us" Page:Brand Story/Origin: A narrative of how the business started and why.Mission and Vision: The purpose of the business and what it aims to achieve.Values and Culture: Ethical, sustainable, or core beliefs that drive the business.Team Introduction: Photos and bios of the people behind the products or services.Problem/Solution: An explanation of the problem the company solves and why it matters.Social Proof: Reviews, testimonials, or features that demonstrate credibility.&nbsp;Best Practices for Writing:Be Authentic: Keep the tone genuine, professional, and consistent with the brand voice.Include Visuals: Use high-quality photos, videos, or graphics to make the page engaging.Focus on the Customer: Highlight how the company\'s story or values benefit the customer, rather than just listing facts.Keep it Updated: Ensure the information is current and free of errors.&nbsp;', 'storage/media/product/2026-02-12-cmOYqKRU1lfMshFQK7NwL71Kco251U9FKXn55IoT.webp', 0, 0, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-11 22:47:34', '2026-02-13 07:09:47');

-- Dumping structure for table radix.product_authors
DROP TABLE IF EXISTS `product_authors`;
CREATE TABLE IF NOT EXISTS `product_authors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_authors_product_id_foreign` (`product_id`),
  KEY `product_authors_author_id_foreign` (`author_id`),
  CONSTRAINT `product_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_authors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.product_authors: ~0 rows (approximately)
DELETE FROM `product_authors`;

-- Dumping structure for table radix.product_categories
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.product_categories: ~0 rows (approximately)
DELETE FROM `product_categories`;

-- Dumping structure for table radix.product_images
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.product_images: ~17 rows (approximately)
DELETE FROM `product_images`;
INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, 'storage/media/product/2026-02-11-PnrE8b4R48HV4Wn7uHsbJ2Kd2z1pGeepG3VH1DQO.webp', '2026-02-10 21:46:30', '2026-02-10 21:46:30'),
	(2, 3, 'storage/media/product/2026-02-11-RdRQZ7vHY0tp6qPeiBUjUj8OsGIFtenMi7vVePOw.webp', '2026-02-10 21:50:36', '2026-02-10 21:50:36'),
	(3, 4, 'storage/media/product/2026-02-11-ygMK4YvxML3kKoHnAX63NwOojK1SCnSfBWnqOikB.webp', '2026-02-10 21:51:43', '2026-02-10 21:51:43'),
	(4, 20, 'storage/media/product/2026-02-11-Zea3lLmLsVwaeZHAvU3MzZiMTSWhoiFHZ0rqwBHY.webp', '2026-02-11 09:41:12', '2026-02-11 09:41:12'),
	(5, 20, 'storage/media/product/2026-02-11-K6uMHJfQKmbukZYneehlSP61YIaADlv8lI0Qs2zQ.webp', '2026-02-11 09:41:13', '2026-02-11 09:41:13'),
	(6, 20, 'storage/media/product/2026-02-11-GapZntxQvqP52VuoL2F8m4pDx5z7V5bncW14EtUo.webp', '2026-02-11 09:41:13', '2026-02-11 09:41:13'),
	(7, 20, 'storage/media/product/2026-02-11-TdlxOFYDSQ2jT4LxUv6M6RSCcaxqX5KdUAC06dVG.webp', '2026-02-11 09:41:14', '2026-02-11 09:41:14'),
	(8, 20, 'storage/media/product/2026-02-11-TNLdMDftImJasJJWPxGWe1wOk0hOylBmNORVi42k.webp', '2026-02-11 09:41:14', '2026-02-11 09:41:14'),
	(9, 20, 'storage/media/product/2026-02-11-geXnVRZt6usA6yiOlCLQ7CUtgAEOaMdOIaXZZQ9g.webp', '2026-02-11 09:41:14', '2026-02-11 09:41:14'),
	(10, 20, 'storage/media/product/2026-02-11-67olfdGC4gaXQgWcuWLrLdksXC7jCUFR8v6xUsCA.webp', '2026-02-11 09:41:14', '2026-02-11 09:41:14'),
	(11, 20, 'storage/media/product/2026-02-11-7aSMaXDCdWa9C3PRn6UYRAuYCsMOL4c41LgcusRK.webp', '2026-02-11 09:41:14', '2026-02-11 09:41:14'),
	(12, 14, 'storage/media/product/2026-02-13-SZIpy14GwcnPMHxro93aMKekOFZX7RfuWA3Xl6oL.webp', '2026-02-12 21:51:03', '2026-02-12 21:51:03'),
	(13, 14, 'storage/media/product/2026-02-13-NgmPGZa5eRQmbqC7gKJR5qYKhZGJxpRwEXuYm5ko.webp', '2026-02-12 21:51:03', '2026-02-12 21:51:03'),
	(14, 14, 'storage/media/product/2026-02-13-W9ipmcZlFkYZfugqCqQU7gNDgkVp3vJg7Mvt81hg.webp', '2026-02-12 21:51:03', '2026-02-12 21:51:03'),
	(15, 12, 'storage/media/product/2026-02-13-8RzWPAsRQEsXJO7FDpAiJn4YzC29tdUnWorlkMtH.webp', '2026-02-12 21:55:11', '2026-02-12 21:55:11'),
	(16, 12, 'storage/media/product/2026-02-13-U3OaMnw1Cx2WxsUdbZ7BczC19ZIxUuxMzihkWa10.webp', '2026-02-12 21:55:11', '2026-02-12 21:55:11'),
	(17, 12, 'storage/media/product/2026-02-13-NDGuW6J86hqIW9sqLqrJB6LVst4mOpX7XKa8pCla.webp', '2026-02-12 21:55:11', '2026-02-12 21:55:11');

-- Dumping structure for table radix.product_tags
DROP TABLE IF EXISTS `product_tags`;
CREATE TABLE IF NOT EXISTS `product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_tags_product_id_foreign` (`product_id`),
  CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.product_tags: ~5 rows (approximately)
DELETE FROM `product_tags`;
INSERT INTO `product_tags` (`id`, `product_id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 1, 'ww', '2026-02-10 21:46:30', '2026-02-10 21:46:30'),
	(3, 3, 'ASA', '2026-02-10 21:50:36', '2026-02-10 21:50:36'),
	(4, 10, 'ASD', '2026-02-10 22:00:12', '2026-02-10 22:00:12'),
	(9, 20, 'ff', '2026-02-11 21:47:13', '2026-02-11 21:47:13'),
	(10, 20, 'hh', '2026-02-11 21:47:13', '2026-02-11 21:47:13');

-- Dumping structure for table radix.product_variants
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `regular_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variants_product_id_foreign` (`product_id`),
  CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.product_variants: ~6 rows (approximately)
DELETE FROM `product_variants`;
INSERT INTO `product_variants` (`id`, `product_id`, `variant`, `size`, `sku`, `purchase_price`, `regular_price`, `sale_price`, `discount`, `discount_type`, `image`, `stock`, `status`, `created_at`, `updated_at`) VALUES
	(17, 16, 'red', 'xl', NULL, 33.00, 33.00, 32.34, 2.00, 'percent', NULL, -2, 1, '2026-02-11 22:57:15', '2026-02-12 00:00:24'),
	(20, 14, '[{"value":"XL"},{"value":"L"},{"value":"M"}]', NULL, NULL, 4.00, 66.00, 66.00, 0.00, 'percent', NULL, 0, 1, '2026-02-12 21:51:02', '2026-02-12 21:51:02'),
	(21, 12, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'percent', NULL, 0, 1, '2026-02-12 21:55:10', '2026-02-12 21:55:10'),
	(22, 21, 'RED', 'XL', NULL, 12.00, 22.00, 19.00, 3.00, 'fixed', NULL, 0, 1, '2026-02-13 07:09:47', '2026-02-13 07:09:47'),
	(23, 21, 'rdw', 'M', NULL, 13.00, 23.00, 12.00, 11.00, 'fixed', NULL, 0, 1, '2026-02-13 07:09:47', '2026-02-13 07:09:47'),
	(24, 21, 'Blue', 'L', NULL, 22.00, 33.00, 31.68, 4.00, 'percent', NULL, 0, 1, '2026-02-13 07:09:47', '2026-02-13 07:09:47');

-- Dumping structure for table radix.product_variant_values
DROP TABLE IF EXISTS `product_variant_values`;
CREATE TABLE IF NOT EXISTS `product_variant_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `attribute_value_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_variant_values_product_variant_id_attribute_id_unique` (`product_variant_id`,`attribute_id`),
  KEY `product_variant_values_product_id_foreign` (`product_id`),
  KEY `product_variant_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_variant_values_attribute_value_id_foreign` (`attribute_value_id`),
  CONSTRAINT `product_variant_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variant_values_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.product_variant_values: ~0 rows (approximately)
DELETE FROM `product_variant_values`;

-- Dumping structure for table radix.product_vendors
DROP TABLE IF EXISTS `product_vendors`;
CREATE TABLE IF NOT EXISTS `product_vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `vendor_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_vendors_product_id_foreign` (`product_id`),
  KEY `product_vendors_vendor_id_foreign` (`vendor_id`),
  CONSTRAINT `product_vendors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_vendors_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.product_vendors: ~13 rows (approximately)
DELETE FROM `product_vendors`;
INSERT INTO `product_vendors` (`id`, `product_id`, `vendor_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2026-02-10 21:46:30', '2026-02-10 21:46:30'),
	(2, 2, 1, '2026-02-10 21:48:06', '2026-02-10 21:48:06'),
	(3, 3, 1, '2026-02-10 21:50:06', '2026-02-10 21:50:06'),
	(4, 4, 1, '2026-02-10 21:51:43', '2026-02-10 21:51:43'),
	(5, 5, 1, '2026-02-10 21:53:39', '2026-02-10 21:53:39'),
	(6, 6, 1, '2026-02-10 21:57:17', '2026-02-10 21:57:17'),
	(7, 7, 1, '2026-02-10 21:58:24', '2026-02-10 21:58:24'),
	(8, 8, 1, '2026-02-10 21:58:50', '2026-02-10 21:58:50'),
	(9, 9, 1, '2026-02-10 21:59:16', '2026-02-10 21:59:16'),
	(10, 10, 1, '2026-02-10 22:00:12', '2026-02-10 22:00:12'),
	(11, 11, 1, '2026-02-11 09:04:55', '2026-02-11 09:04:55'),
	(12, 16, 1, '2026-02-11 09:21:11', '2026-02-11 09:21:11'),
	(13, 20, 1, '2026-02-11 09:36:12', '2026-02-11 09:36:12'),
	(14, 18, 1, '2026-02-11 21:39:52', '2026-02-11 21:39:52'),
	(15, 21, 1, '2026-02-11 22:47:34', '2026-02-11 22:47:34');

-- Dumping structure for table radix.publications
DROP TABLE IF EXISTS `publications`;
CREATE TABLE IF NOT EXISTS `publications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publications_slug_unique` (`slug`),
  KEY `publications_created_by_foreign` (`created_by`),
  KEY `publications_updated_by_foreign` (`updated_by`),
  KEY `publications_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `publications_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `publications_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `publications_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.publications: ~0 rows (approximately)
DELETE FROM `publications`;

-- Dumping structure for table radix.purchase_orders
DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `po_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `vendor_id` bigint unsigned NOT NULL,
  `order_date` date NOT NULL,
  `expected_date` date DEFAULT NULL,
  `total_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `grand_total` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `status` enum('draft','pending','approved','partially_received','received','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_orders_po_number_unique` (`po_number`),
  KEY `purchase_orders_store_id_foreign` (`store_id`),
  KEY `purchase_orders_vendor_id_foreign` (`vendor_id`),
  KEY `purchase_orders_created_by_foreign` (`created_by`),
  KEY `purchase_orders_updated_by_foreign` (`updated_by`),
  KEY `purchase_orders_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `purchase_orders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_orders_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_orders_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_orders_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_orders_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.purchase_orders: ~0 rows (approximately)
DELETE FROM `purchase_orders`;

-- Dumping structure for table radix.purchase_order_items
DROP TABLE IF EXISTS `purchase_order_items`;
CREATE TABLE IF NOT EXISTS `purchase_order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned DEFAULT NULL,
  `quantity` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `received_quantity` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `unit_price` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `total_amount` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_items_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_items_product_id_foreign` (`product_id`),
  KEY `purchase_order_items_product_variant_id_foreign` (`product_variant_id`),
  KEY `purchase_order_items_created_by_foreign` (`created_by`),
  KEY `purchase_order_items_updated_by_foreign` (`updated_by`),
  KEY `purchase_order_items_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `purchase_order_items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_order_items_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_order_items_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_order_items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.purchase_order_items: ~0 rows (approximately)
DELETE FROM `purchase_order_items`;

-- Dumping structure for table radix.purchase_receipts
DROP TABLE IF EXISTS `purchase_receipts`;
CREATE TABLE IF NOT EXISTS `purchase_receipts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `receipt_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_order_id` bigint unsigned DEFAULT NULL,
  `store_id` bigint unsigned NOT NULL,
  `receipt_date` date NOT NULL,
  `received_by` bigint unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_receipts_receipt_number_unique` (`receipt_number`),
  KEY `purchase_receipts_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_receipts_store_id_foreign` (`store_id`),
  KEY `purchase_receipts_received_by_foreign` (`received_by`),
  CONSTRAINT `purchase_receipts_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_receipts_received_by_foreign` FOREIGN KEY (`received_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `purchase_receipts_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.purchase_receipts: ~0 rows (approximately)
DELETE FROM `purchase_receipts`;

-- Dumping structure for table radix.purchase_receipt_items
DROP TABLE IF EXISTS `purchase_receipt_items`;
CREATE TABLE IF NOT EXISTS `purchase_receipt_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_receipt_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_receipt_items_purchase_receipt_id_foreign` (`purchase_receipt_id`),
  KEY `purchase_receipt_items_product_id_foreign` (`product_id`),
  KEY `purchase_receipt_items_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `purchase_receipt_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_receipt_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_receipt_items_purchase_receipt_id_foreign` FOREIGN KEY (`purchase_receipt_id`) REFERENCES `purchase_receipts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.purchase_receipt_items: ~0 rows (approximately)
DELETE FROM `purchase_receipt_items`;

-- Dumping structure for table radix.reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `rating` tinyint NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.reviews: ~1 rows (approximately)
DELETE FROM `reviews`;
INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `review`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 21, 3, 'aSas', 1, '2026-02-13 06:51:21', '2026-02-13 07:39:48');

-- Dumping structure for table radix.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.roles: ~3 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Software Admin', 'web', '2025-06-17 05:01:01', '2025-06-17 05:01:01'),
	(2, 'System Admin', 'web', '2025-06-17 06:06:58', '2025-06-17 06:06:58'),
	(4, 'Manager', 'web', '2026-02-14 03:00:31', '2026-02-14 03:00:31');

-- Dumping structure for table radix.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.role_has_permissions: ~467 rows (approximately)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1),
	(77, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(127, 1),
	(128, 1),
	(129, 1),
	(130, 1),
	(131, 1),
	(132, 1),
	(138, 1),
	(139, 1),
	(147, 1),
	(148, 1),
	(149, 1),
	(152, 1),
	(153, 1),
	(154, 1),
	(155, 1),
	(156, 1),
	(157, 1),
	(158, 1),
	(159, 1),
	(160, 1),
	(161, 1),
	(162, 1),
	(163, 1),
	(164, 1),
	(166, 1),
	(167, 1),
	(168, 1),
	(171, 1),
	(172, 1),
	(173, 1),
	(174, 1),
	(188, 1),
	(189, 1),
	(190, 1),
	(191, 1),
	(192, 1),
	(193, 1),
	(194, 1),
	(195, 1),
	(196, 1),
	(197, 1),
	(198, 1),
	(199, 1),
	(200, 1),
	(201, 1),
	(208, 1),
	(209, 1),
	(210, 1),
	(211, 1),
	(212, 1),
	(213, 1),
	(221, 1),
	(222, 1),
	(223, 1),
	(224, 1),
	(230, 1),
	(231, 1),
	(232, 1),
	(233, 1),
	(234, 1),
	(235, 1),
	(236, 1),
	(237, 1),
	(238, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(6, 2),
	(15, 2),
	(16, 2),
	(17, 2),
	(18, 2),
	(19, 2),
	(20, 2),
	(32, 2),
	(33, 2),
	(34, 2),
	(37, 2),
	(38, 2),
	(39, 2),
	(40, 2),
	(41, 2),
	(42, 2),
	(43, 2),
	(44, 2),
	(45, 2),
	(46, 2),
	(49, 2),
	(50, 2),
	(51, 2),
	(54, 2),
	(55, 2),
	(56, 2),
	(59, 2),
	(60, 2),
	(61, 2),
	(62, 2),
	(63, 2),
	(64, 2),
	(65, 2),
	(66, 2),
	(67, 2),
	(68, 2),
	(69, 2),
	(70, 2),
	(71, 2),
	(72, 2),
	(73, 2),
	(74, 2),
	(75, 2),
	(76, 2),
	(77, 2),
	(78, 2),
	(79, 2),
	(80, 2),
	(81, 2),
	(82, 2),
	(83, 2),
	(84, 2),
	(85, 2),
	(86, 2),
	(87, 2),
	(88, 2),
	(127, 2),
	(128, 2),
	(129, 2),
	(130, 2),
	(131, 2),
	(132, 2),
	(138, 2),
	(139, 2),
	(147, 2),
	(148, 2),
	(149, 2),
	(152, 2),
	(153, 2),
	(154, 2),
	(155, 2),
	(156, 2),
	(157, 2),
	(158, 2),
	(159, 2),
	(160, 2),
	(161, 2),
	(162, 2),
	(163, 2),
	(164, 2),
	(166, 2),
	(167, 2),
	(168, 2),
	(171, 2),
	(172, 2),
	(173, 2),
	(174, 2),
	(188, 2),
	(189, 2),
	(190, 2),
	(191, 2),
	(192, 2),
	(193, 2),
	(194, 2),
	(195, 2),
	(196, 2),
	(197, 2),
	(198, 2),
	(199, 2),
	(200, 2),
	(201, 2),
	(208, 2),
	(209, 2),
	(210, 2),
	(211, 2),
	(212, 2),
	(213, 2),
	(221, 2),
	(222, 2),
	(223, 2),
	(224, 2),
	(1, 4),
	(6, 4),
	(32, 4),
	(33, 4),
	(34, 4),
	(37, 4),
	(38, 4),
	(39, 4),
	(40, 4),
	(41, 4),
	(42, 4),
	(43, 4),
	(44, 4),
	(45, 4),
	(46, 4),
	(49, 4),
	(50, 4),
	(51, 4),
	(54, 4),
	(55, 4),
	(56, 4),
	(59, 4),
	(60, 4),
	(61, 4),
	(62, 4),
	(63, 4),
	(64, 4),
	(65, 4),
	(66, 4),
	(67, 4),
	(68, 4),
	(69, 4),
	(70, 4),
	(71, 4),
	(72, 4),
	(73, 4),
	(74, 4),
	(75, 4),
	(76, 4),
	(77, 4),
	(78, 4),
	(79, 4),
	(80, 4),
	(81, 4),
	(82, 4),
	(83, 4),
	(84, 4),
	(85, 4),
	(86, 4),
	(87, 4),
	(88, 4),
	(127, 4),
	(128, 4),
	(129, 4),
	(138, 4),
	(139, 4),
	(147, 4),
	(148, 4),
	(149, 4),
	(152, 4),
	(153, 4),
	(154, 4),
	(155, 4),
	(156, 4),
	(157, 4),
	(158, 4),
	(159, 4),
	(160, 4),
	(161, 4),
	(162, 4),
	(163, 4),
	(164, 4),
	(166, 4),
	(167, 4),
	(168, 4),
	(171, 4),
	(172, 4),
	(173, 4),
	(174, 4),
	(188, 4),
	(189, 4),
	(190, 4),
	(191, 4),
	(192, 4),
	(193, 4),
	(194, 4),
	(195, 4),
	(196, 4),
	(197, 4),
	(198, 4),
	(199, 4),
	(200, 4),
	(201, 4),
	(208, 4),
	(209, 4),
	(210, 4),
	(211, 4),
	(212, 4),
	(213, 4),
	(221, 4),
	(222, 4),
	(223, 4),
	(224, 4),
	(230, 4),
	(231, 4),
	(232, 4),
	(233, 4),
	(234, 4),
	(235, 4),
	(236, 4),
	(237, 4),
	(238, 4);

-- Dumping structure for table radix.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.sessions: ~8 rows (approximately)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('3umtZ8O2a4jY9DhzqgXs1w8zdHS4HaDW68B7tgCL', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibVpYaWxBeUo3Wmkyd1ZLbUkyM1JHUHRsUHpidlp0TnR3aTBiRjZJeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHA6Ly9yYWRpeC50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTE7fQ==', 1771075319),
	('b2nq33bbzKtHAIlVPMf2Knd0yuSB7PPyiAmFpSVr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjRGUm9hd1lTdU94N2dwRHN3Tk1jbHcybHNxUmRCbmJUWXVGcjhuYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9yYWRpeC50ZXN0L2FkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770949807),
	('BcVg2ka9IfXwiFIafqEHdO45uyGgF8LlJkAZXN10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkRtYXJQek5kRmgxR3pNamt1OXpVV1hzQzlveHU2Rlk0RHJtTGhSQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHA6Ly9yYWRpeC50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770947317),
	('dj7hMjWe5p8jA2nUO01hAqdLDSFLzut83cNUBewm', 10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiak5oYmJLSFdnakozV3NLUkM5aWhlSGViM0ZwTG9SN3VJSjF5M0ZvZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc6Imh0dHA6Ly9yYWRpeC50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTA7czozOiJ1cmwiO2E6MDp7fX0=', 1771075316),
	('EaHEWj0xLer5EObuxvUpgXXEQLC62PFIyLjbNQYH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZUtFWUZmaDhhSEZURGpRVGtsTGJ6R0hGb2xSZ0Y2OWNZdExkRnR5NiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovL3JhZGl4LnRlc3QvYWRtaW4vY2F0ZWdvcnkiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovL3JhZGl4LnRlc3QvYWRtaW4vY2F0ZWdvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770949806),
	('pIntCeHAzB4sVbaJWAUYEQw6adqdzL7AHquQNXUR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiellSQ3RZRzljSUhRejdNdnRFUDFMRHdEWDZ2aGlEUGVMUm9uTjBwUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovL3JhZGl4LnRlc3QvYWRtaW4vcHJvZHVjdCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vcmFkaXgudGVzdC9hZG1pbi9wcm9kdWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770950332);

-- Dumping structure for table radix.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `banner_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_status` tinyint(1) NOT NULL DEFAULT '1',
  `banner_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_status` tinyint(1) NOT NULL DEFAULT '1',
  `page_heading_bg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_image` text COLLATE utf8mb4_unicode_ci,
  `google_map` text COLLATE utf8mb4_unicode_ci,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_url` json DEFAULT NULL,
  `sms_api_key` json DEFAULT NULL,
  `sms_api_id` json DEFAULT NULL,
  `bkash_status` tinyint(1) NOT NULL DEFAULT '1',
  `nagad_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.settings: ~1 rows (approximately)
DELETE FROM `settings`;
INSERT INTO `settings` (`id`, `app_name`, `title`, `primary_phone`, `secondary_phone`, `primary_email`, `secondary_email`, `office_time`, `address`, `description`, `banner_one`, `banner_one_link`, `banner_one_status`, `banner_two`, `banner_two_link`, `banner_two_status`, `page_heading_bg`, `meta_title`, `meta_keyword`, `meta_description`, `meta_image`, `google_map`, `favicon`, `logo`, `footer_logo`, `placeholder`, `facebook_page`, `facebook_group`, `youtube`, `twitter`, `linkedin`, `google`, `whatsapp`, `instagram`, `pinterest`, `sms_api_url`, `sms_api_key`, `sms_api_id`, `bkash_status`, `nagad_status`, `created_at`, `updated_at`) VALUES
	(1, 'Radix Collections Ltd.', 'Radix Collections Ltd.', '01617-475475', '01617-475475', 'radix@gmail.com', 'radix@radix.com.bd', NULL, 'H#15, R#05, Block-D, Sector-1', 'Footer description is dfsdfsdfsdf', 'storage/settings/2026-02-12-7l83ha8c0I892jXpY21gw3QU1lw3lejXnFCQBAQL.webp', '#', 1, 'storage/settings/2026-02-13-rNXhrSRiZLoNaxWbcVOSYi6zQWeuSsHqMi1ImWwp.webp', '#', 1, 'storage/settings/2026-02-13-Z9sSYnt0jdlWtgkDaT42Qj1H04G1y9WvPsQNsUbx.webp', 'Plot No.76, Road No.05, Vatulia, Tirag, Dhaka-1230, Dhaka, Bangladesh, 1230', 'aSA', 'asa', NULL, 'creates scrolling text or images, moving them horizontally or vertically across a webpage', 'storage/settings/2026-02-11-aXtLsiZN622dKYd073prjfepJVxZGeFeI0BDPxB4.webp', 'storage/settings/2026-02-11-d6es6V5g6gOOP1nQSbfADl3PvNk5z0iXawgnYzRr.webp', NULL, NULL, 'https://facebook.com', NULL, 'https://youtube.com', 'https://twetter.com', 'https://linkedin.com', NULL, 'https://whatsapp.com', 'https://instagram.com', 'https://pinta.com', NULL, NULL, NULL, 1, 1, '2026-02-10 20:34:20', '2026-02-12 19:52:33');

-- Dumping structure for table radix.sliders
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_created_by_foreign` (`created_by`),
  KEY `sliders_updated_by_foreign` (`updated_by`),
  KEY `sliders_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `sliders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sliders_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sliders_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.sliders: ~0 rows (approximately)
DELETE FROM `sliders`;

-- Dumping structure for table radix.stocks
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocks_store_id_product_variant_id_unique` (`store_id`,`product_variant_id`),
  KEY `stocks_product_id_foreign` (`product_id`),
  KEY `stocks_product_variant_id_foreign` (`product_variant_id`),
  CONSTRAINT `stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stocks_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stocks_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.stocks: ~0 rows (approximately)
DELETE FROM `stocks`;

-- Dumping structure for table radix.stock_movements
DROP TABLE IF EXISTS `stock_movements`;
CREATE TABLE IF NOT EXISTS `stock_movements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_variant_id` bigint unsigned NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `type` enum('purchase_receipt','sales','transfer_out','transfer_in','adjustment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_movements_store_id_foreign` (`store_id`),
  KEY `stock_movements_product_id_foreign` (`product_id`),
  KEY `stock_movements_product_variant_id_foreign` (`product_variant_id`),
  KEY `stock_movements_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  CONSTRAINT `stock_movements_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_movements_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_movements_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.stock_movements: ~0 rows (approximately)
DELETE FROM `stock_movements`;

-- Dumping structure for table radix.stores
DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stores_code_unique` (`code`),
  KEY `stores_created_by_foreign` (`created_by`),
  KEY `stores_updated_by_foreign` (`updated_by`),
  KEY `stores_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `stores_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stores_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `stores_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.stores: ~0 rows (approximately)
DELETE FROM `stores`;

-- Dumping structure for table radix.uoms
DROP TABLE IF EXISTS `uoms`;
CREATE TABLE IF NOT EXISTS `uoms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uoms_slug_unique` (`slug`),
  KEY `uoms_created_by_foreign` (`created_by`),
  KEY `uoms_updated_by_foreign` (`updated_by`),
  KEY `uoms_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `uoms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `uoms_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `uoms_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.uoms: ~0 rows (approximately)
DELETE FROM `uoms`;
INSERT INTO `uoms` (`id`, `name`, `slug`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'UNIT 1', 'unit-1', 'sdfsdsad', 1, 1, NULL, NULL, NULL, '2026-02-10 21:45:15', '2026-02-10 21:45:15');

-- Dumping structure for table radix.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_status` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expire` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_updated_by_foreign` (`updated_by`),
  KEY `users_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `phone`, `address`, `image`, `cover_image`, `role_status`, `status`, `email_verified_at`, `otp`, `otp_expire`, `password`, `remember_token`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin1', 'admin1', 'wali@gmail.com', '01711111111', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '$2y$12$FTBBjxu1e9tluRLERxSNe.tR2W9TKVNF0qVcK/E061IggvW7.67DW', NULL, NULL, NULL, NULL, NULL, '2026-02-10 20:29:29', '2026-02-10 20:29:29'),
	(2, 'Wasi', NULL, 'wasi@gmail.com', NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$6YNNnLBDj7eJbtyGPPEE8.J5zkdWCVG0HyI5qQtjIOun16enFeoJa', NULL, NULL, NULL, NULL, NULL, '2026-02-11 04:29:31', '2026-02-11 04:29:31'),
	(3, 'asdad', 'asdad', 'wa@fff.com', NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$30LMf0P.81yrZhpBAiE0D.ONlKOr9Ndhj7uEHwe2gINoRlZh.7bFe', NULL, NULL, NULL, NULL, NULL, '2026-02-12 01:17:52', '2026-02-12 01:17:52'),
	(10, 'Admin', 'admin', 'admin@gmail.com', '01711111111', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '$2y$12$PQZdpMGV9fnGuo1GkeIWZu/fph6EIXmVmbWDHBtqKLtViPIeKyX7q', NULL, NULL, NULL, NULL, NULL, '2026-02-14 04:27:58', '2026-02-14 04:27:58'),
	(11, 'Manager', 'manager', 'manager@gmail.com', '01822222222', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '$2y$12$6x7hgP.G0wo18dVWAqVOYOhZE4S/8H9RG4aOijA11smlrkSYiGwNq', NULL, NULL, NULL, NULL, NULL, '2026-02-14 04:27:59', '2026-02-14 04:27:59');

-- Dumping structure for table radix.vendors
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendors_slug_unique` (`slug`),
  UNIQUE KEY `vendors_code_unique` (`code`),
  KEY `vendors_created_by_foreign` (`created_by`),
  KEY `vendors_updated_by_foreign` (`updated_by`),
  KEY `vendors_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `vendors_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `vendors_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `vendors_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.vendors: ~0 rows (approximately)
DELETE FROM `vendors`;
INSERT INTO `vendors` (`id`, `name`, `slug`, `code`, `contact_person`, `email`, `phone`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Wasi Vendor', 'wasi-vendor', 'CODE333', 'Wasi', 'admin@example.com', '222', 'sdfsdfsdf', 1, 1, NULL, NULL, NULL, '2026-02-10 21:38:09', '2026-02-10 21:38:09');

-- Dumping structure for table radix.wishlists
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_user_id_product_id_unique` (`user_id`,`product_id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table radix.wishlists: ~1 rows (approximately)
DELETE FROM `wishlists`;
INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
	(3, 2, 21, '2026-02-13 07:44:17', '2026-02-13 07:44:17');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
