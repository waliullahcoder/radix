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


-- Dumping database structure for books
DROP DATABASE IF EXISTS `books`;
CREATE DATABASE IF NOT EXISTS `books` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `books`;

-- Dumping structure for table books.admin_menus
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.admin_menus: ~20 rows (approximately)
DELETE FROM `admin_menus`;
INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `is_deletable`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'Dashboard', 'admin.dashboard', '<span class="material-symbols-outlined fs-22"> home_app_logo </span>', 1, 1, 1, '2026-01-19 05:33:09', '2026-01-19 05:33:09'),
	(2, 2, NULL, 'System Settings', NULL, '<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>', 2, 1, 1, '2026-01-19 05:34:47', '2026-01-19 05:34:47'),
	(3, 3, 2, 'Roles', 'admin.role.index', NULL, 1, 1, 1, '2026-01-19 05:35:46', '2026-01-19 05:35:46'),
	(4, 4, 2, 'Users', 'admin.user.index', NULL, 2, 1, 1, '2026-01-19 05:36:43', '2026-01-19 05:36:43'),
	(5, 5, NULL, 'Admin Menu', 'admin.admin-menu.index', NULL, 3, 1, 1, '2026-01-19 05:37:27', '2026-01-20 02:51:54'),
	(6, 6, 2, 'Admin Settings', 'admin.admin-settings.index', NULL, 4, 1, 1, '2026-01-19 05:37:50', '2026-01-19 05:37:50'),
	(9, 21, NULL, 'Products', NULL, NULL, 4, 1, 1, '2026-01-20 03:47:59', '2026-01-20 03:55:33'),
	(10, 22, 9, 'Category', 'admin.category.index', NULL, 4, 1, 1, '2026-01-20 03:49:56', '2026-01-20 03:49:56'),
	(11, 26, 9, 'Product Manage', 'admin.product.index', NULL, 4, 1, 1, '2026-01-20 03:56:07', '2026-01-20 03:56:07'),
	(12, 27, 9, 'UOM', 'admin.uom.index', NULL, 4, 1, 1, '2026-01-20 04:04:00', '2026-01-20 04:04:00'),
	(13, 28, 9, 'Brand', 'admin.brand.index', NULL, 4, 1, 1, '2026-01-20 04:04:36', '2026-01-20 04:04:36'),
	(15, 32, 9, 'Vendor', 'admin.vendor.index', NULL, 4, 1, 1, '2026-01-20 04:12:04', '2026-01-20 04:12:04'),
	(16, 34, 9, 'Attribute', 'admin.attribute.index', NULL, 4, 1, 1, '2026-01-20 04:19:04', '2026-01-20 04:19:04'),
	(17, 36, 9, 'publication', 'admin.publication.index', NULL, 4, 1, 1, '2026-01-20 04:22:54', '2026-01-20 04:22:54'),
	(18, 39, NULL, 'User Menu', NULL, NULL, 5, 0, 1, '2026-01-20 05:21:16', '2026-01-28 23:16:55'),
	(19, 40, 18, 'Main Menu', 'admin.menu.index', NULL, 5, 1, 1, '2026-01-20 05:22:04', '2026-01-20 05:22:04'),
	(21, 45, NULL, 'settings', 'admin.settings.index', NULL, 2, 1, 1, '2026-01-20 06:07:06', '2026-01-20 06:07:06'),
	(22, 47, 9, 'Author', 'admin.author.index', NULL, 5, 1, 1, '2026-01-22 04:29:15', '2026-01-22 04:29:15'),
	(23, 55, NULL, 'Orders Management', NULL, NULL, 6, 1, 1, '2026-01-31 22:22:32', '2026-01-31 22:24:38'),
	(24, 56, 23, 'Order List', 'admin.orders.index', NULL, 6, 1, 1, '2026-01-31 22:25:06', '2026-01-31 22:28:50');

-- Dumping structure for table books.admin_menu_actions
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.admin_menu_actions: ~27 rows (approximately)
DELETE FROM `admin_menu_actions`;
INSERT INTO `admin_menu_actions` (`id`, `permission_id`, `admin_menu_id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
	(1, 7, 5, 'create', 'admin.admin-menu.create', 1, '2026-01-19 05:39:02', '2026-01-19 05:39:02'),
	(2, 8, 5, 'edit', 'admin.admin-menu.edit', 1, '2026-01-19 05:39:14', '2026-01-19 05:39:14'),
	(3, 9, 5, 'delete', 'admin.admin-menu.destroy', 1, '2026-01-19 05:39:24', '2026-01-19 05:39:24'),
	(4, 10, 5, 'view actions', 'admin.admin-menu-action.index', 1, '2026-01-19 05:39:36', '2026-01-19 05:39:36'),
	(5, 11, 5, 'create action', 'admin.admin-menu-action.create', 1, '2026-01-19 05:39:45', '2026-01-19 05:39:45'),
	(6, 12, 5, 'edit action', 'admin.admin-menu-action.edit', 1, '2026-01-19 05:40:14', '2026-01-19 05:40:14'),
	(7, 13, 5, 'delete action', 'admin.admin-menu-action.destroy', 1, '2026-01-19 05:40:27', '2026-01-19 05:40:27'),
	(8, 14, 3, 'create', 'admin.role.create', 1, '2026-01-19 23:59:12', '2026-01-19 23:59:12'),
	(10, 18, 3, 'edit', 'admin.role.edit', 1, '2026-01-20 03:24:24', '2026-01-20 03:24:24'),
	(11, 19, 3, 'delete', 'admin.role.destroy', 1, '2026-01-20 03:25:16', '2026-01-20 03:29:11'),
	(12, 20, 3, 'Edit Permission', 'admin.role-permission.edit', 1, '2026-01-20 03:31:59', '2026-01-20 03:31:59'),
	(13, 23, 9, 'create', 'admin.product.create', 1, '2026-01-20 03:51:53', '2026-01-20 03:51:53'),
	(14, 24, 9, 'edit', 'admin.product.edit', 1, '2026-01-20 03:52:09', '2026-01-20 03:52:09'),
	(15, 25, 9, 'delete', 'admin.product.destroy', 1, '2026-01-20 03:52:34', '2026-01-20 03:52:34'),
	(16, 29, 12, 'create', 'admin.uom.create', 1, '2026-01-20 04:06:48', '2026-01-20 04:06:48'),
	(17, 31, 13, 'create', 'admin.brand.create', 1, '2026-01-20 04:09:27', '2026-01-20 04:09:27'),
	(18, 33, 15, 'create', 'admin.vendor.create', 1, '2026-01-20 04:12:41', '2026-01-20 04:12:41'),
	(19, 35, 16, 'create', 'admin.attribute.create', 1, '2026-01-20 04:21:01', '2026-01-20 04:21:01'),
	(20, 37, 17, 'create', 'admin.publication.create', 1, '2026-01-20 04:23:43', '2026-01-20 04:23:43'),
	(21, 38, 11, 'show', 'admin.product.show', 1, '2026-01-20 04:59:33', '2026-01-20 04:59:33'),
	(22, 41, 19, 'create', 'admin.menu.create', 1, '2026-01-20 05:23:01', '2026-01-20 05:23:01'),
	(24, 44, 19, 'menu-item', 'admin.menu-item.index', 1, '2026-01-20 05:33:58', '2026-01-20 05:33:58'),
	(25, 46, 19, 'edit', 'admin.menu.edit', 1, '2026-01-21 00:48:49', '2026-01-21 00:48:49'),
	(26, 48, 22, 'create', 'admin.author.create', 1, '2026-01-22 04:30:36', '2026-01-22 04:30:36'),
	(27, 49, 22, 'edit', 'admin.author.edit', 1, '2026-01-22 04:30:52', '2026-01-22 04:30:52'),
	(28, 50, 22, 'delete', 'admin.author.destroy', 1, '2026-01-22 04:31:06', '2026-01-22 04:31:06'),
	(29, 51, 22, 'show', 'admin.author.show', 1, '2026-01-22 04:31:22', '2026-01-22 04:31:22'),
	(30, 52, 17, 'edit', 'admin.publication.edit', 1, '2026-01-22 04:33:21', '2026-01-22 04:33:21'),
	(31, 53, 17, 'show', 'admin.publication.show', 1, '2026-01-22 04:33:41', '2026-01-22 04:33:41'),
	(32, 54, 18, 'delete', 'admin.menu.destroy', 1, '2026-01-28 23:15:51', '2026-01-28 23:15:51');

-- Dumping structure for table books.admin_settings
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

-- Dumping data for table books.admin_settings: ~0 rows (approximately)
DELETE FROM `admin_settings`;
INSERT INTO `admin_settings` (`id`, `logo`, `small_logo`, `favicon`, `title`, `footer_text`, `primary_color`, `secondary_color`, `facebook`, `twitter`, `linkedin`, `whatsapp`, `google`, `created_at`, `updated_at`) VALUES
	(1, 'storage/admin-setting//2026-01-19-WOkDhHTNPYsXyYppCJmHwrY9oLAUS0GyfybMRVZ0.webp', 'storage/admin-setting//2026-01-19-OJFe5jFdx2IBzbbmhVTaY0E5lm2I5ER7OwoEGMPA.webp', 'storage/admin-setting//2026-01-19-DhG2fWtAwUI17NKIMiQKmQQZKanvyCBQnFoRYhUl.webp', 'Books', 'sdfsdfsdf', '#e80c9b', '#18ba64', 'sdfs', 'fsdf', 'sdfsd', 'dfsdf', NULL, '2026-01-19 05:04:11', '2026-01-19 05:04:11');

-- Dumping structure for table books.attributes
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.attributes: ~0 rows (approximately)
DELETE FROM `attributes`;
INSERT INTO `attributes` (`id`, `name`, `slug`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'attrbuts', 'attrbuts', 'zzzxczxcz', 1, 1, NULL, NULL, NULL, '2026-01-20 04:21:28', '2026-01-20 04:21:28');

-- Dumping structure for table books.attribute_values
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

-- Dumping data for table books.attribute_values: ~0 rows (approximately)
DELETE FROM `attribute_values`;

-- Dumping structure for table books.authors
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.authors: ~2 rows (approximately)
DELETE FROM `authors`;
INSERT INTO `authors` (`id`, `name`, `slug`, `image`, `cover_image`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'আল্লামা ইবনুল কায়্যিম জাওযিয়্যাহ রহ', 'author-name-test', 'storage/author/2026-01-22-zeIQ6hqzq0S5fMSdNwjKvP71YvOQVfeDJdi8CtFq.webp', NULL, 'sadas', 1, 1, NULL, NULL, NULL, '2026-01-22 04:32:15', '2026-01-22 04:32:15'),
	(2, 'আল্লামা ইবনুল কায়্যিম', 'author2-test', 'storage/author/2026-01-22-T02ZWzSpmM23u47w1cOI5T34THWIlNdQq4nuDjUA.webp', NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-01-22 04:32:35', '2026-01-22 04:32:35');

-- Dumping structure for table books.brands
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

-- Dumping data for table books.brands: ~0 rows (approximately)
DELETE FROM `brands`;
INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'BRAND NAME WASKER', 'brand-name-wasker', 'storage/brand/2026-01-20-mH033TDt5IhVVLvH7rpLvNfYNUawDwaI0kR4lDnL.webp', 'sdsdsadasd', 1, 1, NULL, NULL, NULL, '2026-01-20 04:10:04', '2026-01-20 04:10:04');

-- Dumping structure for table books.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.cache: ~4 rows (approximately)
DELETE FROM `cache`;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('books_books_cache_admin_menus', 'O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:6:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:33:09";s:10:"updated_at";s:19:"2026-01-19 11:33:09";}s:11:"\0*\0original";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:33:09";s:10:"updated_at";s:19:"2026-01-19 11:33:09";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:15:"System Settings";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:34:47";s:10:"updated_at";s:19:"2026-01-19 11:34:47";}s:11:"\0*\0original";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:15:"System Settings";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:34:47";s:10:"updated_at";s:19:"2026-01-19 11:34:47";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:3:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:35:46";s:10:"updated_at";s:19:"2026-01-19 11:35:46";}s:11:"\0*\0original";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:35:46";s:10:"updated_at";s:19:"2026-01-19 11:35:46";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:36:43";s:10:"updated_at";s:19:"2026-01-19 11:36:43";}s:11:"\0*\0original";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:36:43";s:10:"updated_at";s:19:"2026-01-19 11:36:43";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:37:50";s:10:"updated_at";s:19:"2026-01-19 11:37:50";}s:11:"\0*\0original";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:37:50";s:10:"updated_at";s:19:"2026-01-19 11:37:50";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:21;s:13:"permission_id";i:45;s:9:"parent_id";N;s:4:"name";s:8:"settings";s:5:"route";s:20:"admin.settings.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 12:07:06";s:10:"updated_at";s:19:"2026-01-20 12:07:06";}s:11:"\0*\0original";a:11:{s:2:"id";i:21;s:13:"permission_id";i:45;s:9:"parent_id";N;s:4:"name";s:8:"settings";s:5:"route";s:20:"admin.settings.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 12:07:06";s:10:"updated_at";s:19:"2026-01-20 12:07:06";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";N;s:4:"name";s:10:"Admin Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:37:27";s:10:"updated_at";s:19:"2026-01-20 08:51:54";}s:11:"\0*\0original";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";N;s:4:"name";s:10:"Admin Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-19 11:37:27";s:10:"updated_at";s:19:"2026-01-20 08:51:54";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:7:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:1;s:13:"permission_id";i:7;s:13:"admin_menu_id";i:5;s:4:"name";s:6:"create";s:5:"route";s:23:"admin.admin-menu.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:02";s:10:"updated_at";s:19:"2026-01-19 11:39:02";}s:11:"\0*\0original";a:8:{s:2:"id";i:1;s:13:"permission_id";i:7;s:13:"admin_menu_id";i:5;s:4:"name";s:6:"create";s:5:"route";s:23:"admin.admin-menu.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:02";s:10:"updated_at";s:19:"2026-01-19 11:39:02";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:2;s:13:"permission_id";i:8;s:13:"admin_menu_id";i:5;s:4:"name";s:4:"edit";s:5:"route";s:21:"admin.admin-menu.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:14";s:10:"updated_at";s:19:"2026-01-19 11:39:14";}s:11:"\0*\0original";a:8:{s:2:"id";i:2;s:13:"permission_id";i:8;s:13:"admin_menu_id";i:5;s:4:"name";s:4:"edit";s:5:"route";s:21:"admin.admin-menu.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:14";s:10:"updated_at";s:19:"2026-01-19 11:39:14";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:3;s:13:"permission_id";i:9;s:13:"admin_menu_id";i:5;s:4:"name";s:6:"delete";s:5:"route";s:24:"admin.admin-menu.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:24";s:10:"updated_at";s:19:"2026-01-19 11:39:24";}s:11:"\0*\0original";a:8:{s:2:"id";i:3;s:13:"permission_id";i:9;s:13:"admin_menu_id";i:5;s:4:"name";s:6:"delete";s:5:"route";s:24:"admin.admin-menu.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:24";s:10:"updated_at";s:19:"2026-01-19 11:39:24";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:4;s:13:"permission_id";i:10;s:13:"admin_menu_id";i:5;s:4:"name";s:12:"view actions";s:5:"route";s:29:"admin.admin-menu-action.index";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:36";s:10:"updated_at";s:19:"2026-01-19 11:39:36";}s:11:"\0*\0original";a:8:{s:2:"id";i:4;s:13:"permission_id";i:10;s:13:"admin_menu_id";i:5;s:4:"name";s:12:"view actions";s:5:"route";s:29:"admin.admin-menu-action.index";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:36";s:10:"updated_at";s:19:"2026-01-19 11:39:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:5;s:13:"permission_id";i:11;s:13:"admin_menu_id";i:5;s:4:"name";s:13:"create action";s:5:"route";s:30:"admin.admin-menu-action.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:45";s:10:"updated_at";s:19:"2026-01-19 11:39:45";}s:11:"\0*\0original";a:8:{s:2:"id";i:5;s:13:"permission_id";i:11;s:13:"admin_menu_id";i:5;s:4:"name";s:13:"create action";s:5:"route";s:30:"admin.admin-menu-action.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:39:45";s:10:"updated_at";s:19:"2026-01-19 11:39:45";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:6;s:13:"permission_id";i:12;s:13:"admin_menu_id";i:5;s:4:"name";s:11:"edit action";s:5:"route";s:28:"admin.admin-menu-action.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:40:14";s:10:"updated_at";s:19:"2026-01-19 11:40:14";}s:11:"\0*\0original";a:8:{s:2:"id";i:6;s:13:"permission_id";i:12;s:13:"admin_menu_id";i:5;s:4:"name";s:11:"edit action";s:5:"route";s:28:"admin.admin-menu-action.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:40:14";s:10:"updated_at";s:19:"2026-01-19 11:40:14";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:6;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:7;s:13:"permission_id";i:13;s:13:"admin_menu_id";i:5;s:4:"name";s:13:"delete action";s:5:"route";s:31:"admin.admin-menu-action.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:40:27";s:10:"updated_at";s:19:"2026-01-19 11:40:27";}s:11:"\0*\0original";a:8:{s:2:"id";i:7;s:13:"permission_id";i:13;s:13:"admin_menu_id";i:5;s:4:"name";s:13:"delete action";s:5:"route";s:31:"admin.admin-menu-action.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-19 11:40:27";s:10:"updated_at";s:19:"2026-01-19 11:40:27";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:9;s:13:"permission_id";i:21;s:9:"parent_id";N;s:4:"name";s:8:"Products";s:5:"route";N;s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:47:59";s:10:"updated_at";s:19:"2026-01-20 09:55:33";}s:11:"\0*\0original";a:11:{s:2:"id";i:9;s:13:"permission_id";i:21;s:9:"parent_id";N;s:4:"name";s:8:"Products";s:5:"route";N;s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:47:59";s:10:"updated_at";s:19:"2026-01-20 09:55:33";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:8:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:10;s:13:"permission_id";i:22;s:9:"parent_id";i:9;s:4:"name";s:8:"Category";s:5:"route";s:20:"admin.category.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:49:56";s:10:"updated_at";s:19:"2026-01-20 09:49:56";}s:11:"\0*\0original";a:11:{s:2:"id";i:10;s:13:"permission_id";i:22;s:9:"parent_id";i:9;s:4:"name";s:8:"Category";s:5:"route";s:20:"admin.category.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:49:56";s:10:"updated_at";s:19:"2026-01-20 09:49:56";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:11;s:13:"permission_id";i:26;s:9:"parent_id";i:9;s:4:"name";s:14:"Product Manage";s:5:"route";s:19:"admin.product.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:56:07";s:10:"updated_at";s:19:"2026-01-20 09:56:07";}s:11:"\0*\0original";a:11:{s:2:"id";i:11;s:13:"permission_id";i:26;s:9:"parent_id";i:9;s:4:"name";s:14:"Product Manage";s:5:"route";s:19:"admin.product.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 09:56:07";s:10:"updated_at";s:19:"2026-01-20 09:56:07";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:12;s:13:"permission_id";i:27;s:9:"parent_id";i:9;s:4:"name";s:3:"UOM";s:5:"route";s:15:"admin.uom.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:04:00";s:10:"updated_at";s:19:"2026-01-20 10:04:00";}s:11:"\0*\0original";a:11:{s:2:"id";i:12;s:13:"permission_id";i:27;s:9:"parent_id";i:9;s:4:"name";s:3:"UOM";s:5:"route";s:15:"admin.uom.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:04:00";s:10:"updated_at";s:19:"2026-01-20 10:04:00";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:13;s:13:"permission_id";i:28;s:9:"parent_id";i:9;s:4:"name";s:5:"Brand";s:5:"route";s:17:"admin.brand.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:04:36";s:10:"updated_at";s:19:"2026-01-20 10:04:36";}s:11:"\0*\0original";a:11:{s:2:"id";i:13;s:13:"permission_id";i:28;s:9:"parent_id";i:9;s:4:"name";s:5:"Brand";s:5:"route";s:17:"admin.brand.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:04:36";s:10:"updated_at";s:19:"2026-01-20 10:04:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:15;s:13:"permission_id";i:32;s:9:"parent_id";i:9;s:4:"name";s:6:"Vendor";s:5:"route";s:18:"admin.vendor.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:12:04";s:10:"updated_at";s:19:"2026-01-20 10:12:04";}s:11:"\0*\0original";a:11:{s:2:"id";i:15;s:13:"permission_id";i:32;s:9:"parent_id";i:9;s:4:"name";s:6:"Vendor";s:5:"route";s:18:"admin.vendor.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:12:04";s:10:"updated_at";s:19:"2026-01-20 10:12:04";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:16;s:13:"permission_id";i:34;s:9:"parent_id";i:9;s:4:"name";s:9:"Attribute";s:5:"route";s:21:"admin.attribute.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:19:04";s:10:"updated_at";s:19:"2026-01-20 10:19:04";}s:11:"\0*\0original";a:11:{s:2:"id";i:16;s:13:"permission_id";i:34;s:9:"parent_id";i:9;s:4:"name";s:9:"Attribute";s:5:"route";s:21:"admin.attribute.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:19:04";s:10:"updated_at";s:19:"2026-01-20 10:19:04";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:6;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:17;s:13:"permission_id";i:36;s:9:"parent_id";i:9;s:4:"name";s:11:"publication";s:5:"route";s:23:"admin.publication.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:22:54";s:10:"updated_at";s:19:"2026-01-20 10:22:54";}s:11:"\0*\0original";a:11:{s:2:"id";i:17;s:13:"permission_id";i:36;s:9:"parent_id";i:9;s:4:"name";s:11:"publication";s:5:"route";s:23:"admin.publication.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-20 10:22:54";s:10:"updated_at";s:19:"2026-01-20 10:22:54";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:7;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:22;s:13:"permission_id";i:47;s:9:"parent_id";i:9;s:4:"name";s:6:"Author";s:5:"route";s:18:"admin.author.index";s:4:"icon";N;s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-22 10:29:15";s:10:"updated_at";s:19:"2026-01-22 10:29:15";}s:11:"\0*\0original";a:11:{s:2:"id";i:22;s:13:"permission_id";i:47;s:9:"parent_id";i:9;s:4:"name";s:6:"Author";s:5:"route";s:18:"admin.author.index";s:4:"icon";N;s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-01-22 10:29:15";s:10:"updated_at";s:19:"2026-01-22 10:29:15";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:3:{i:0;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:13;s:13:"permission_id";i:23;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"create";s:5:"route";s:20:"admin.product.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:51:53";s:10:"updated_at";s:19:"2026-01-20 09:51:53";}s:11:"\0*\0original";a:8:{s:2:"id";i:13;s:13:"permission_id";i:23;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"create";s:5:"route";s:20:"admin.product.create";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:51:53";s:10:"updated_at";s:19:"2026-01-20 09:51:53";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:14;s:13:"permission_id";i:24;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"edit";s:5:"route";s:18:"admin.product.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:52:09";s:10:"updated_at";s:19:"2026-01-20 09:52:09";}s:11:"\0*\0original";a:8:{s:2:"id";i:14;s:13:"permission_id";i:24;s:13:"admin_menu_id";i:9;s:4:"name";s:4:"edit";s:5:"route";s:18:"admin.product.edit";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:52:09";s:10:"updated_at";s:19:"2026-01-20 09:52:09";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:26:"App\\Models\\AdminMenuAction":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:18:"admin_menu_actions";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:8:{s:2:"id";i:15;s:13:"permission_id";i:25;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"delete";s:5:"route";s:21:"admin.product.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:52:34";s:10:"updated_at";s:19:"2026-01-20 09:52:34";}s:11:"\0*\0original";a:8:{s:2:"id";i:15;s:13:"permission_id";i:25;s:13:"admin_menu_id";i:9;s:4:"name";s:6:"delete";s:5:"route";s:21:"admin.product.destroy";s:6:"status";i:1;s:10:"created_at";s:19:"2026-01-20 09:52:34";s:10:"updated_at";s:19:"2026-01-20 09:52:34";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:1:{s:6:"status";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:5:{i:0;s:13:"permission_id";i:1;s:13:"admin_menu_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:6:"status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:23;s:13:"permission_id";i:55;s:9:"parent_id";N;s:4:"name";s:17:"Orders Management";s:5:"route";N;s:4:"icon";N;s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-01 04:22:32";s:10:"updated_at";s:19:"2026-02-01 04:24:38";}s:11:"\0*\0original";a:11:{s:2:"id";i:23;s:13:"permission_id";i:55;s:9:"parent_id";N;s:4:"name";s:17:"Orders Management";s:5:"route";N;s:4:"icon";N;s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-01 04:22:32";s:10:"updated_at";s:19:"2026-02-01 04:24:38";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:1:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:24;s:13:"permission_id";i:56;s:9:"parent_id";i:23;s:4:"name";s:10:"Order List";s:5:"route";s:18:"admin.orders.index";s:4:"icon";N;s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-01 04:25:06";s:10:"updated_at";s:19:"2026-02-01 04:28:50";}s:11:"\0*\0original";a:11:{s:2:"id";i:24;s:13:"permission_id";i:56;s:9:"parent_id";i:23;s:4:"name";s:10:"Order List";s:5:"route";s:18:"admin.orders.index";s:4:"icon";N;s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-01 04:25:06";s:10:"updated_at";s:19:"2026-02-01 04:28:50";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}', 1770014968),
	('books_books_cache_admin_setting', 'O:23:"App\\Models\\AdminSetting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:14:"admin_settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:15:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-01-19-WOkDhHTNPYsXyYppCJmHwrY9oLAUS0GyfybMRVZ0.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-01-19-OJFe5jFdx2IBzbbmhVTaY0E5lm2I5ER7OwoEGMPA.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-01-19-DhG2fWtAwUI17NKIMiQKmQQZKanvyCBQnFoRYhUl.webp";s:5:"title";s:5:"Books";s:11:"footer_text";s:9:"sdfsdfsdf";s:13:"primary_color";s:7:"#e80c9b";s:15:"secondary_color";s:7:"#18ba64";s:8:"facebook";s:4:"sdfs";s:7:"twitter";s:4:"fsdf";s:8:"linkedin";s:5:"sdfsd";s:8:"whatsapp";s:5:"dfsdf";s:6:"google";N;s:10:"created_at";s:19:"2026-01-19 11:04:11";s:10:"updated_at";s:19:"2026-01-19 11:04:11";}s:11:"\0*\0original";a:15:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-01-19-WOkDhHTNPYsXyYppCJmHwrY9oLAUS0GyfybMRVZ0.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-01-19-OJFe5jFdx2IBzbbmhVTaY0E5lm2I5ER7OwoEGMPA.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-01-19-DhG2fWtAwUI17NKIMiQKmQQZKanvyCBQnFoRYhUl.webp";s:5:"title";s:5:"Books";s:11:"footer_text";s:9:"sdfsdfsdf";s:13:"primary_color";s:7:"#e80c9b";s:15:"secondary_color";s:7:"#18ba64";s:8:"facebook";s:4:"sdfs";s:7:"twitter";s:4:"fsdf";s:8:"linkedin";s:5:"sdfsd";s:8:"whatsapp";s:5:"dfsdf";s:6:"google";N;s:10:"created_at";s:19:"2026-01-19 11:04:11";s:10:"updated_at";s:19:"2026-01-19 11:04:11";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:12:{i:0;s:4:"logo";i:1;s:10:"small_logo";i:2;s:7:"favicon";i:3;s:5:"title";i:4;s:11:"footer_text";i:5;s:13:"primary_color";i:6;s:15:"secondary_color";i:7;s:8:"facebook";i:8;s:7:"twitter";i:9;s:8:"linkedin";i:10;s:8:"whatsapp";i:11;s:6:"google";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1770014968),
	('books_books_cache_setting', 'O:18:"App\\Models\\Setting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:8:"settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:42:{s:2:"id";i:1;s:8:"app_name";s:15:"Books and Books";s:5:"title";s:15:"Books and Books";s:13:"primary_phone";s:11:"01575020231";s:15:"secondary_phone";s:11:"01921588567";s:13:"primary_email";s:23:"booksandbooks@gmail.com";s:15:"secondary_email";s:23:"booksandbooks@gmail.com";s:11:"office_time";N;s:7:"address";s:22:"Aftabnager, Dhaka-1212";s:11:"description";N;s:10:"banner_one";s:73:"storage/settings/2026-01-21-wedrU0Ws5EcNJvOxvLyNEmLwlf3CAH7pquEHYVYM.webp";s:15:"banner_one_link";N;s:17:"banner_one_status";i:1;s:10:"banner_two";N;s:15:"banner_two_link";N;s:17:"banner_two_status";i:1;s:15:"page_heading_bg";s:73:"storage/settings/2026-01-21-KYnjWDTTbLtSrkVkdyGbCGcgLfBDaVMBvTG6bvjO.webp";s:10:"meta_title";N;s:12:"meta_keyword";N;s:16:"meta_description";N;s:10:"meta_image";s:73:"storage/settings/2026-01-21-JiVF5rBec3gB7i1eQhbM7vt8JKNJ2hOm8j5SVSSz.webp";s:10:"google_map";N;s:7:"favicon";s:73:"storage/settings/2026-01-21-V4Q3LAERhKBYrp5zL6fOf2BdZ83NJFuqn0lf317n.webp";s:4:"logo";s:73:"storage/settings/2026-01-21-3u5FB5fLxnC4FK4pIV24Pli0lW1d0I8gBIfHLqM3.webp";s:11:"footer_logo";N;s:11:"placeholder";s:73:"storage/settings/2026-01-21-oHsk98AzUkgIiG5pu7qISgvuyXTIoJGSQSTjjWW8.webp";s:13:"facebook_page";N;s:14:"facebook_group";N;s:7:"youtube";N;s:7:"twitter";N;s:8:"linkedin";N;s:6:"google";N;s:8:"whatsapp";N;s:9:"instagram";N;s:9:"pinterest";N;s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-01-19 11:10:51";s:10:"updated_at";s:19:"2026-01-28 11:48:38";}s:11:"\0*\0original";a:42:{s:2:"id";i:1;s:8:"app_name";s:15:"Books and Books";s:5:"title";s:15:"Books and Books";s:13:"primary_phone";s:11:"01575020231";s:15:"secondary_phone";s:11:"01921588567";s:13:"primary_email";s:23:"booksandbooks@gmail.com";s:15:"secondary_email";s:23:"booksandbooks@gmail.com";s:11:"office_time";N;s:7:"address";s:22:"Aftabnager, Dhaka-1212";s:11:"description";N;s:10:"banner_one";s:73:"storage/settings/2026-01-21-wedrU0Ws5EcNJvOxvLyNEmLwlf3CAH7pquEHYVYM.webp";s:15:"banner_one_link";N;s:17:"banner_one_status";i:1;s:10:"banner_two";N;s:15:"banner_two_link";N;s:17:"banner_two_status";i:1;s:15:"page_heading_bg";s:73:"storage/settings/2026-01-21-KYnjWDTTbLtSrkVkdyGbCGcgLfBDaVMBvTG6bvjO.webp";s:10:"meta_title";N;s:12:"meta_keyword";N;s:16:"meta_description";N;s:10:"meta_image";s:73:"storage/settings/2026-01-21-JiVF5rBec3gB7i1eQhbM7vt8JKNJ2hOm8j5SVSSz.webp";s:10:"google_map";N;s:7:"favicon";s:73:"storage/settings/2026-01-21-V4Q3LAERhKBYrp5zL6fOf2BdZ83NJFuqn0lf317n.webp";s:4:"logo";s:73:"storage/settings/2026-01-21-3u5FB5fLxnC4FK4pIV24Pli0lW1d0I8gBIfHLqM3.webp";s:11:"footer_logo";N;s:11:"placeholder";s:73:"storage/settings/2026-01-21-oHsk98AzUkgIiG5pu7qISgvuyXTIoJGSQSTjjWW8.webp";s:13:"facebook_page";N;s:14:"facebook_group";N;s:7:"youtube";N;s:7:"twitter";N;s:8:"linkedin";N;s:6:"google";N;s:8:"whatsapp";N;s:9:"instagram";N;s:9:"pinterest";N;s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-01-19 11:10:51";s:10:"updated_at";s:19:"2026-01-28 11:48:38";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:39:{i:0;s:8:"app_name";i:1;s:5:"title";i:2;s:13:"primary_phone";i:3;s:15:"secondary_phone";i:4;s:13:"primary_email";i:5;s:15:"secondary_email";i:6;s:11:"office_time";i:7;s:7:"address";i:8;s:11:"description";i:9;s:10:"banner_one";i:10;s:15:"banner_one_link";i:11;s:17:"banner_one_status";i:12;s:10:"banner_two";i:13;s:15:"banner_two_link";i:14;s:17:"banner_two_status";i:15;s:15:"page_heading_bg";i:16;s:10:"meta_title";i:17;s:12:"meta_keyword";i:18;s:16:"meta_description";i:19;s:10:"meta_image";i:20;s:10:"google_map";i:21;s:7:"favicon";i:22;s:4:"logo";i:23;s:11:"footer_logo";i:24;s:11:"placeholder";i:25;s:13:"facebook_page";i:26;s:14:"facebook_group";i:27;s:7:"youtube";i:28;s:7:"twitter";i:29;s:8:"linkedin";i:30;s:6:"google";i:31;s:8:"whatsapp";i:32;s:9:"instagram";i:33;s:9:"pinterest";i:34;s:11:"sms_api_url";i:35;s:11:"sms_api_key";i:36;s:10:"sms_api_id";i:37;s:12:"bkash_status";i:38;s:12:"nagad_status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1770014969),
	('books_books_cache_spatie.permission.cache', 'a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:50:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"Dashboard";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:15:"System Settings";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:5:"Roles";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:5:"Users";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:22:"admin.admin-menu.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:14:"Admin Settings";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:23:"admin.admin-menu.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:21:"admin.admin-menu.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:24:"admin.admin-menu.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:29:"admin.admin-menu-action.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:30:"admin.admin-menu-action.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:28:"admin.admin-menu-action.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:31:"admin.admin-menu-action.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:17:"admin.role.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:14;a:4:{s:1:"a";i:18;s:1:"b";s:15:"admin.role.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:15;a:4:{s:1:"a";i:19;s:1:"b";s:18:"admin.role.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:16;a:4:{s:1:"a";i:20;s:1:"b";s:26:"admin.role-permission.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:17;a:4:{s:1:"a";i:21;s:1:"b";s:8:"Products";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:18;a:4:{s:1:"a";i:22;s:1:"b";s:8:"Category";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:19;a:4:{s:1:"a";i:23;s:1:"b";s:20:"admin.product.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:20;a:4:{s:1:"a";i:24;s:1:"b";s:18:"admin.product.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:21;a:4:{s:1:"a";i:25;s:1:"b";s:21:"admin.product.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:22;a:4:{s:1:"a";i:26;s:1:"b";s:14:"Product Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:23;a:4:{s:1:"a";i:27;s:1:"b";s:3:"UOM";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:24;a:4:{s:1:"a";i:28;s:1:"b";s:5:"Brand";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:25;a:4:{s:1:"a";i:29;s:1:"b";s:16:"admin.uom.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:26;a:4:{s:1:"a";i:31;s:1:"b";s:18:"admin.brand.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:27;a:4:{s:1:"a";i:32;s:1:"b";s:6:"Vendor";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:28;a:4:{s:1:"a";i:33;s:1:"b";s:19:"admin.vendor.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:29;a:4:{s:1:"a";i:34;s:1:"b";s:9:"Attribute";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:30;a:4:{s:1:"a";i:35;s:1:"b";s:22:"admin.attribute.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:31;a:4:{s:1:"a";i:36;s:1:"b";s:11:"publication";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:32;a:4:{s:1:"a";i:37;s:1:"b";s:24:"admin.publication.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:33;a:4:{s:1:"a";i:38;s:1:"b";s:18:"admin.product.show";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:34;a:4:{s:1:"a";i:39;s:1:"b";s:9:"User Menu";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:35;a:4:{s:1:"a";i:40;s:1:"b";s:9:"Main Menu";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:36;a:4:{s:1:"a";i:41;s:1:"b";s:17:"admin.menu.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:37;a:4:{s:1:"a";i:44;s:1:"b";s:21:"admin.menu-item.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:38;a:4:{s:1:"a";i:45;s:1:"b";s:8:"settings";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:39;a:4:{s:1:"a";i:46;s:1:"b";s:15:"admin.menu.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:40;a:4:{s:1:"a";i:47;s:1:"b";s:6:"Author";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:41;a:4:{s:1:"a";i:48;s:1:"b";s:19:"admin.author.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:42;a:4:{s:1:"a";i:49;s:1:"b";s:17:"admin.author.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:43;a:4:{s:1:"a";i:50;s:1:"b";s:20:"admin.author.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:44;a:4:{s:1:"a";i:51;s:1:"b";s:17:"admin.author.show";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:45;a:4:{s:1:"a";i:52;s:1:"b";s:22:"admin.publication.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:46;a:4:{s:1:"a";i:53;s:1:"b";s:22:"admin.publication.show";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:47;a:4:{s:1:"a";i:54;s:1:"b";s:18:"admin.menu.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:48;a:4:{s:1:"a";i:55;s:1:"b";s:17:"Orders Management";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:49;a:4:{s:1:"a";i:56;s:1:"b";s:18:"admin.orders.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:1:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:14:"Software Admin";s:1:"c";s:3:"web";}}}', 1770093007);

-- Dumping structure for table books.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

-- Dumping structure for table books.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'header',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.categories: ~45 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `image`, `description`, `status`, `position`, `url`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'আমার ইতিহাস', 'amar-itihas', 'storage/category/2026-01-20-ML4RobJCoxQrhxcUTXiRgZC4TXdfkN8vNe14bkcA.webp', 'সকল আলোচনা', 1, 'header', '#', 1, 1, NULL, NULL, '2026-01-20 03:44:44', '2026-01-26 00:08:01'),
	(2, 1, 'ইতিহাস', 'itihas', 'storage/category/2026-01-25-A5GUscpZWSmrLr0xXmWYQSegvXP9ZN2fhgMSSjAd.webp', 'সকল', 1, 'header', NULL, 1, 1, NULL, NULL, '2026-01-20 03:46:02', '2026-01-25 21:58:31'),
	(3, 4, 'এস, এস, সি', 'es-es-si', 'storage/category/2026-01-25-X7ut7OeRn9ZovzDhNdGSxUNwZ8inNzNx51OBw2Zt.webp', 'assaaS', 1, 'header', NULL, 1, 1, NULL, NULL, '2026-01-21 04:33:12', '2026-01-25 21:58:48'),
	(4, NULL, 'একাডেমিক', 'ekademik', 'storage/category/2026-01-21-pLTcQNE1TC5RKHwntlvgDiX9wYN9vbisByj7KeVu.webp', 'sadaww', 1, 'header', NULL, 1, 1, NULL, NULL, '2026-01-21 05:50:48', '2026-01-25 21:57:34'),
	(5, NULL, 'কার্টুন এর গল্প', 'kartun-er-glp', 'storage/category/2026-01-20-HS8XmhC2g9rbCbXWO8fNyt5dKzaM370aar4KZM1M.webp', 'সকল', 1, 'header', NULL, 1, 1, NULL, NULL, '2026-01-21 22:39:35', '2026-01-25 21:57:45'),
	(6, 4, 'এইস,এস,সি', 'eisessi', 'storage/category/2026-01-25-WCUZ8WW5OfIAtRyi4yvV0lSWSokmTxYrWCkSQAbj.webp', 'সদসাআ', 1, NULL, NULL, 1, 1, NULL, NULL, '2026-01-21 23:44:00', '2026-01-25 05:23:21'),
	(7, 4, 'ইউনিভার্সিটি ভর্তি', 'iunivarsiti-vrti', 'storage/category/2026-01-25-cVOMfDXxut0kWOLWSITIcGVcN7JiqdKBiWkXw512.webp', 'দাসদাস', 1, NULL, NULL, 1, 1, NULL, NULL, '2026-01-21 23:44:48', '2026-01-25 05:23:31'),
	(8, 5, 'কার্টুন এর ভাল গল্প', 'kartun-er-val-glp', 'storage/category/2026-01-25-eXypOGkciWmMflByx1hhc6P9uarA7XRZklaxAR7B.webp', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, '2026-01-25 05:24:59', '2026-01-25 05:24:59'),
	(9, 5, 'আজব ঠাকুরের কথা', 'ajb-thakurer-ktha', 'storage/category/2026-01-25-o95VBf7carOoVlVnUd9J718AlcnCmldK2jKTuT1L.webp', 'সদফসদ', 1, NULL, NULL, 1, NULL, NULL, NULL, '2026-01-25 05:26:01', '2026-01-25 05:26:01'),
	(10, 1, 'গেরিলা যুদ্ধ', 'gerila-zuddh', 'storage/category/2026-01-25-lSfUto37Rogh00r0HFPSi5rP3cBwwWbLVZ9YaCtO.webp', 'সদফসদ', 1, 'header', NULL, 1, 1, NULL, NULL, '2026-01-25 05:26:39', '2026-01-25 21:58:41'),
	(11, NULL, 'ঘরে বসে আয় করুন', 'ghre-bse-ay-krun', 'storage/category/2026-01-26-RsPtfwny0ZVUNEiVFvOK4JhryKDUjqm17WMcIBeC.webp', 'csdsdsasd', 1, 'header_top', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:07:30', '2026-01-25 22:07:30'),
	(12, NULL, 'রকমারি কুইজ', 'rkmari-kuij', 'storage/category/2026-01-26-cgw8o9oGv4zJvYYgY5OFEC1WLfVgYmAhOYGaBn8o.webp', 'রকমারি কুইজ', 1, 'header_top', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:08:06', '2026-01-25 22:08:06'),
	(13, NULL, 'রকমারি কুইজ', 'rkmari-kuij-1', 'storage/category/2026-01-26-Q8K7EgW5ik9eGB1EP7NeXUDhjfZncAbfJ9mn7E7L.webp', 'রকমারি কুইজ', 1, 'header_top', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:08:07', '2026-01-25 22:08:07'),
	(14, NULL, 'রকমারি উদ্যোক্তা', 'rkmari-udzokta', 'storage/category/2026-01-26-8uiOFhGGQoMb5pPKdE3mmljXPX4T7OTlhPx5TUaQ.webp', 'রকমারি উদ্যোক্তা', 1, 'header_top', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:08:49', '2026-01-25 22:08:49'),
	(15, NULL, 'অর্ডার ট্র্যাক করুন', 'ordar-trzak-krun', 'storage/category/2026-01-26-oNZHh0hRfmJoBHZdOK6Kx9effoeTonOmdWV3T6dP.webp', 'অর্ডার ট্র্যাক করুন', 1, 'header_top', 'order/trucking/system', 1, 1, NULL, NULL, '2026-01-25 22:09:26', '2026-01-26 00:03:21'),
	(16, NULL, 'বই ডোনেশন', 'bi-donesn', 'storage/category/2026-01-26-j7LgSvY4BsKOJtIk5ZSN35XZVGIgsVOzatOfms7l.webp', 'বই ডোনেশন', 1, 'header_top', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:09:49', '2026-01-25 22:09:49'),
	(17, NULL, 'কার্টুন গল্পের বইয়ের সকল বই', 'kartun-glper-byer-skl-bi', 'storage/category/2026-01-26-DnYnRjci4O9zupNxTqAeCNux2YfuGoXNqXMOpNiV.webp', 'কার্টুন গল্পের বইয়ের সকল বই', 1, 'mega_menu_parent', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:11:01', '2026-01-25 22:11:01'),
	(18, NULL, 'ইসলামিক গল্পের বইয়ের সকল বই', 'islamik-glper-byer-skl-bi', 'storage/category/2026-01-26-mpfI28njiOcwM9MBKsoJqoTPuag0ZXM4tvDpratp.webp', 'ইসলামিক গল্পের বইয়ের সকল বই', 1, 'mega_menu_parent', NULL, 1, 1, NULL, NULL, '2026-01-25 22:11:32', '2026-01-25 23:14:10'),
	(19, NULL, 'গাড়িয়াল', 'gariyal', 'storage/category/2026-01-26-hfA942qSdI82Nz67CmPMuet3ZVzkUQojPlgbbYB9.webp', 'গাড়িয়াল', 1, 'mega_menu_parent', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:11:52', '2026-01-25 22:11:52'),
	(20, NULL, 'রবীন্দ্র সঙ্গিত', 'rbeendr-sngoit', 'storage/category/2026-01-26-28I4Gn1K6mggXKdSitynMnIv6TJoNLaBAac7vkf5.webp', 'রবীন্দ্র সঙ্গিত', 1, 'mega_menu_parent', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:12:11', '2026-01-25 22:12:11'),
	(21, NULL, 'নজ্রুল সঙ্গিত সকল বই', 'njrul-sngoit-skl-bi', 'storage/category/2026-01-26-fluCxJbsXDBqPGyx2F8hUBlP8TpM7sU4uAR2fQfv.webp', 'নজ্রুল সঙ্গিত সকল বই', 1, 'mega_menu_parent', NULL, 1, 1, NULL, NULL, '2026-01-25 22:12:27', '2026-01-25 23:14:39'),
	(22, NULL, 'সত্যের সন্ধানে', 'stzer-sndhane', 'storage/category/2026-01-26-Q7xC5PAbZ3Q169wYRMlfIL8HFPzDj4Krt3jW7I8U.webp', 'সত্যের সন্ধানে', 1, 'mega_menu_parent', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:12:42', '2026-01-25 22:12:42'),
	(23, 18, 'আরও অনেক মেনু এখানে হবে', 'aroo-onek-menu-ekhane-hbe', 'storage/category/2026-01-26-bxCWFMr7kAjZAzLF8GVivWVL5m49ilxHVsbLKevm.webp', 'আরও অনেক মেনু এখানে হবে', 1, 'mega_menu_child', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:13:48', '2026-01-25 22:13:48'),
	(24, 21, 'সাব মেনু যোগ করুন', 'sab-menu-zog-krun', 'storage/category/2026-01-26-baz8XrBGVg4B2xNoP3avsUTGU3YkTOc7FyuhlRGF.webp', 'সাব মেনু যোগ করুন', 1, 'mega_menu_child', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:15:48', '2026-01-25 22:15:48'),
	(25, 18, 'সাব মেনু যোগ করুন', 'sab-menu-zog-krun-1', 'storage/category/2026-01-26-t3ACypNQ5OCP9T3eETfjrV7JOqddhLED07XYMTFm.webp', 'সাব মেনু যোগ করুন', 1, 'mega_menu_child', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:16:26', '2026-01-25 22:16:26'),
	(27, 18, 'সাব মেনু যোগ করুন1', 'sab-menu-zog-krun1', 'storage/category/2026-01-26-nID85WsUZ8j0D0RsvJ1VeNfC9rrQIVRVeCmpRk90.webp', 'সাব মেনু যোগ করুন', 1, 'mega_menu_child', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:17:23', '2026-01-25 22:17:23'),
	(28, 18, 'সাব মেনু যোগ করুন2', 'sab-menu-zog-krun2', 'storage/category/2026-01-26-rE7qReiLCzlWeiOecp1AywpbMDP1IKWnpYNqlKK2.webp', 'সাব মেনু যোগ করুন', 1, 'mega_menu_child', NULL, 1, NULL, NULL, NULL, '2026-01-25 22:17:44', '2026-01-25 22:17:44'),
	(29, 19, 'গাড়িয়াল1', 'gariyal1', 'storage/category/2026-01-26-i2sFKNE9uR91zOBUd2dC83DFtA3MFQDtlpZ8JGQJ.webp', 'গাড়িয়াল', 1, 'mega_menu_child', NULL, 1, NULL, NULL, NULL, '2026-01-25 23:27:36', '2026-01-25 23:27:36'),
	(30, NULL, 'হোম', 'hom', NULL, 'Description', 1, 'homepage', '#', 1, NULL, NULL, NULL, '2026-02-01 05:18:55', '2026-02-01 05:18:55'),
	(31, 30, 'ট্রেন্ডিং বইসমূহ', 'trending-bismuuh', 'storage/category/2026-02-01-aheJVegdR8AhZmD9Oo1qO0muwEsznXMMrRuwdQDZ.webp', 'asasSA', 1, 'header_top', '#', 1, 1, NULL, NULL, '2026-02-01 05:23:37', '2026-02-01 22:00:13'),
	(32, 30, 'নতুন প্রকাশিত বই', 'ntun-prkasit-bi', 'storage/category/2026-02-01-vy0FdcojxOZdfbgygzsByNvsKa9DnFxsBgWANsld.webp', 'ASDAS', 1, 'homepage', '#', 1, NULL, NULL, NULL, '2026-02-01 05:24:19', '2026-02-01 05:24:19'),
	(33, 30, 'সিয়ান যুগপূর্তি অফার', 'sizan-zugpuurti-ofar', 'storage/category/2026-02-01-5EvBzyvKJZH9Z3mHN3XwXlO4oOlD8Lk0vykyTorf.webp', 'SADASDA', 1, 'header_top', '#', 1, NULL, NULL, NULL, '2026-02-01 05:24:55', '2026-02-01 05:24:55'),
	(34, 30, 'রবিউল আউয়াল সীরাত গ্রন্থমালা', 'rbiul-auzal-seerat-grnthmala', 'storage/category/2026-02-01-6CkOmBjaDLcCC1oxqKzZ36JVqibj8SwOaKb4tgp5.webp', 'ASDASD', 1, 'homepage', '#', 1, NULL, NULL, NULL, '2026-02-01 05:25:29', '2026-02-01 05:25:29'),
	(35, 30, 'জনপ্রিয় লেখক', 'jnpriy-lekhk', 'storage/category/2026-02-01-csqYv58OPrWm9l1VaPdy4qgLLYbEgvMNmaTxCmSt.webp', 'SFSF', 1, 'homepage', '#', 1, NULL, NULL, NULL, '2026-02-01 05:26:02', '2026-02-01 05:26:02'),
	(36, 30, 'আতর ও সুগন্ধি পণ্য', 'atr-oo-sugndhi-pnz', 'storage/category/2026-02-01-IMU256nNHJR4fMIbf9cIxbqvd2Y2LKnmbLZwJKrm.webp', 'ADASD', 1, 'homepage', '#', 1, NULL, NULL, NULL, '2026-02-01 05:26:54', '2026-02-01 05:26:54'),
	(37, 30, 'অন্যান্য পণ্য', 'onzanz-pnz', 'storage/category/2026-02-01-p5khs5MzZVil4UGDupQI31OXqW2AHZLDXFUZmm7A.webp', 'ASDASDA', 1, 'homepage', '#', 1, NULL, NULL, NULL, '2026-02-01 05:27:25', '2026-02-01 05:27:25'),
	(38, 30, 'ব্র্যান্ডসমূহ', 'brzandsmuuh', 'storage/category/2026-02-01-o0Xh564OBxMyKkZIaLsvsaSMyhTajQDYaIzVRoMi.webp', 'ASDAD', 1, 'homepage', '#', 1, NULL, NULL, NULL, '2026-02-01 05:27:58', '2026-02-01 05:27:58'),
	(39, 30, 'এক্টুখানি  সুন্নাহ', 'ektukhani-sunnah', 'storage/category/2026-02-02-cAtgmCdwJumqRQ1xZ6hotIpXWS8zUmiJApkbUlRl.webp', 'এক্টুখানি  সুন্নাহ', 1, 'homepage_banner_category', '#', 1, 1, NULL, NULL, '2026-02-01 22:30:06', '2026-02-01 22:53:10'),
	(40, 30, 'মানানসই পোশাক', 'manansi-posak', 'storage/category/2026-02-02-Bf5Np1eSTjDcQHKre3i7ckuku2nDI3I4LcPhR9qN.webp', 'মানানসই পোশাক', 1, 'homepage_banner_category', '#', 1, 1, NULL, NULL, '2026-02-01 22:34:07', '2026-02-01 22:53:22'),
	(41, 30, 'সুঘ্রাণময় থাকুক চারপাশ', 'sughranmy-thakuk-carpas', 'storage/category/2026-02-02-o4SMe3WZ5HDcbwOsfT67mXLyEQle0nbc5lGZeCyH.webp', 'সুঘ্রাণময় থাকুক চারপাশ', 1, 'homepage_banner_category', '#', 1, 1, NULL, NULL, '2026-02-01 22:35:38', '2026-02-01 22:53:36'),
	(42, 30, 'মিজানুর রহমান আজহারি', 'mijanur-rhman-ajhari', 'storage/category/2026-02-02-tmLPonwx4q3ZOVpd2KaCJgybUfOu982ascQleyBh.webp', 'মিজানুর রহমান আজহারি', 1, 'homepage_writter_category', '#', 1, NULL, NULL, NULL, '2026-02-01 23:28:09', '2026-02-01 23:28:09'),
	(43, 30, 'আরিফ আজাদ', 'arif-ajad', 'storage/category/2026-02-02-SELttpnM6YEmaxD4LyTK4ftA8OSZ3UsJe550prEO.webp', 'আরিফ আজাদ', 1, 'homepage_writter_category', '#', 1, NULL, NULL, NULL, '2026-02-01 23:29:14', '2026-02-01 23:29:14'),
	(44, 30, 'মিজানুর রহমান আজহারি', 'mijanur-rhman-ajhari-1', 'storage/category/2026-02-02-UReJoIMjJ3OSbiWjlJA36T9mAaZfilaNkqaVRudg.webp', 'মিজানুর রহমান আজহারি', 1, 'homepage_writter_category', '#', 1, NULL, NULL, NULL, '2026-02-01 23:30:26', '2026-02-01 23:30:26'),
	(45, 30, 'আতর', 'atr', 'storage/category/2026-02-02-AVpbSa9BUgCEoUwuhqceQIr0vU4PHfzZu7Wlw8Ul.webp', 'আতর', 1, 'homepage_others_category', '#', 1, NULL, NULL, NULL, '2026-02-02 00:16:58', '2026-02-02 00:16:58'),
	(46, 30, 'টি-শার্ট', 'ti-sart', 'storage/category/2026-02-02-tzjGn7lu31W6SBrjvg69GuRi5FoPGPqfh4cen2NG.webp', 'টি-শার্ট', 1, 'homepage_others_category', '#', 1, 1, NULL, NULL, '2026-02-02 00:17:57', '2026-02-02 00:18:14'),
	(47, 30, 'ব্র্যান্ডসমূহ', 'brzandsmuuh-1', 'storage/category/2026-02-02-QYNPg5a9Nd5eEJh9wWJVNJXY7f1MDueynCY1rlQv.webp', 'ব্র্যান্ডসমূহ', 1, 'homepage_brands_category', '#', 1, NULL, NULL, NULL, '2026-02-02 00:29:27', '2026-02-02 00:29:27');

-- Dumping structure for table books.failed_jobs
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

-- Dumping data for table books.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table books.home_sections
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

-- Dumping data for table books.home_sections: ~0 rows (approximately)
DELETE FROM `home_sections`;

-- Dumping structure for table books.home_section_categories
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

-- Dumping data for table books.home_section_categories: ~0 rows (approximately)
DELETE FROM `home_section_categories`;

-- Dumping structure for table books.jobs
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

-- Dumping data for table books.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;

-- Dumping structure for table books.job_batches
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

-- Dumping data for table books.job_batches: ~0 rows (approximately)
DELETE FROM `job_batches`;

-- Dumping structure for table books.menus
DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'footer',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `category_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `menus_created_by_foreign` (`created_by`),
  KEY `menus_updated_by_foreign` (`updated_by`),
  KEY `menus_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `menus_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `menus_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.menus: ~21 rows (approximately)
DELETE FROM `menus`;
INSERT INTO `menus` (`id`, `name`, `position`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `url`, `category_id`) VALUES
	(1, 'ঘরে বসে আয় করুন', 'header_top', 1, 1, 1, NULL, NULL, '2026-01-20 05:19:24', '2026-01-21 02:30:12', '#', 1),
	(2, 'রকমারি কুইজ', 'header_top', 1, 1, 1, NULL, NULL, '2026-01-21 00:52:21', '2026-01-21 02:28:49', '#', 1),
	(3, 'রকমারি উদ্যোক্তা', 'header_top', 1, 1, 1, NULL, NULL, '2026-01-21 00:53:29', '2026-01-21 02:29:44', '#', 1),
	(4, 'গল্পের বই', 'header', 1, 1, 1, NULL, NULL, '2026-01-21 00:54:37', '2026-01-25 04:35:18', '#', 2),
	(5, 'উপন্যাস', 'header', 1, 1, 1, NULL, NULL, '2026-01-21 00:59:44', '2026-01-21 01:00:00', NULL, 1),
	(6, 'কবিতা', 'header', 1, 1, 1, NULL, NULL, '2026-01-21 01:01:13', '2026-01-21 01:01:13', NULL, 1),
	(7, 'কার্টুন গল্পের বইয়ের সকল বই', 'mega_menu', 1, 1, 1, NULL, NULL, '2026-01-21 01:01:51', '2026-01-21 01:01:51', NULL, 1),
	(8, 'ইসলামিক গল্পের  বইয়ের সকল বই', 'mega_menu', 1, 1, 1, NULL, NULL, '2026-01-21 01:02:08', '2026-01-21 01:02:08', NULL, 1),
	(9, 'গাড়িয়াল', 'mega_menu', 1, 1, 1, NULL, NULL, '2026-01-21 01:02:22', '2026-01-25 06:17:55', '#', 7),
	(10, 'রবীন্দ্র সঙ্গিত   ', 'mega_menu', 1, 1, 1, NULL, NULL, '2026-01-21 01:02:36', '2026-01-21 01:02:36', NULL, 1),
	(11, 'নজ্রুল সঙ্গিত  সকল বই ', 'mega_menu', 1, 1, 1, NULL, NULL, '2026-01-21 01:02:51', '2026-01-21 01:02:51', NULL, 1),
	(12, 'সত্যের সন্ধানে', 'mega_menu', 1, 1, 1, NULL, NULL, '2026-01-21 01:03:10', '2026-01-21 01:03:10', NULL, 1),
	(13, 'একাডেমিক বই', 'header', 1, 1, 1, NULL, NULL, '2026-01-21 01:03:37', '2026-01-21 23:45:52', '#', 4),
	(14, 'আমার সময় ', 'footer', 1, 1, 1, NULL, NULL, '2026-01-21 01:07:17', '2026-01-21 01:07:17', NULL, 1),
	(15, 'চিরকুট ', 'footer', 1, 1, 1, NULL, NULL, '2026-01-21 01:07:29', '2026-01-21 01:07:29', NULL, 1),
	(16, 'হৃদয়য়ের  গহিনে', 'footer', 1, 1, 1, NULL, NULL, '2026-01-21 01:07:42', '2026-01-21 01:07:42', NULL, 1),
	(17, 'আমার সপথ', 'footer_col2', 1, 1, 1, NULL, NULL, '2026-01-21 01:08:07', '2026-01-21 01:08:07', NULL, 1),
	(18, 'আলোড়ন  ', 'footer_col2', 1, 1, 1, NULL, NULL, '2026-01-21 01:08:23', '2026-01-21 01:08:23', NULL, 1),
	(19, 'বিড়ম্বনা', 'footer_col2', 1, 1, 1, NULL, NULL, '2026-01-21 01:08:40', '2026-01-21 01:08:40', NULL, 1),
	(20, 'অর্ডার ট্র্যাক করুন', 'header_top', 1, 1, 1, NULL, NULL, '2026-01-21 02:27:20', '2026-01-21 02:27:20', '#', 1),
	(21, 'বই ডোনেশন', 'header_top', 1, 1, 1, NULL, NULL, '2026-01-21 02:30:46', '2026-01-21 02:30:46', '#', 1);

-- Dumping structure for table books.menu_items
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.menu_items: ~9 rows (approximately)
DELETE FROM `menu_items`;
INSERT INTO `menu_items` (`id`, `name`, `menu_id`, `parent_id`, `type`, `link`, `serial`, `created_at`, `updated_at`) VALUES
	(3, 'আরও অনেক মেনু এখানে হবে', 8, NULL, 'internal', 'adadd', 1, '2026-01-21 01:04:22', '2026-01-21 01:04:22'),
	(5, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'sada', 2, '2026-01-21 01:04:54', '2026-01-21 01:04:54'),
	(6, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'sds', 3, '2026-01-21 01:05:14', '2026-01-21 01:05:14'),
	(7, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'sda', 4, '2026-01-21 01:05:26', '2026-01-21 01:05:26'),
	(8, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'asda', 5, '2026-01-21 01:05:37', '2026-01-21 01:05:37'),
	(9, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'asda', 6, '2026-01-21 01:05:39', '2026-01-21 01:05:39'),
	(11, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'dasdsa', 8, '2026-01-21 01:05:52', '2026-01-21 01:05:52'),
	(12, 'সাব মেনু  যোগ করুন', 8, NULL, 'internal', 'sa', 9, '2026-01-21 01:06:17', '2026-01-21 01:06:17'),
	(13, 'সাব মেনু  যোগ করুন', 11, NULL, 'internal', '44', 1, '2026-01-21 01:53:45', '2026-01-21 01:53:45');

-- Dumping structure for table books.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.migrations: ~38 rows (approximately)
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
	(35, '2025_10_16_010234_create_menus_table', 2),
	(36, '2025_10_16_010239_create_menu_items_table', 2),
	(37, '2026_01_27_111709_create_wishlists_table', 3),
	(40, '2026_01_28_060922_create_orders_table', 4),
	(41, '2026_01_28_060938_create_order_items_table', 4),
	(42, '2026_02_01_061140_create_reviews_table', 5);

-- Dumping structure for table books.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table books.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.model_has_roles: ~0 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1);

-- Dumping structure for table books.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.orders: ~9 rows (approximately)
DELETE FROM `orders`;
INSERT INTO `orders` (`id`, `user_id`, `order_number`, `subtotal`, `discount`, `tax`, `total`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
	(2, 3, 'ORD-1769594476', 176.00, 0.00, 0.00, 176.00, '', 'pending', '2026-01-28 04:01:16', '2026-01-28 04:01:16'),
	(3, 3, 'ORD-1769594614', 260.00, 26.00, 11.70, 245.70, 'cod', 'cancelled', '2026-01-28 04:03:34', '2026-01-31 23:52:45'),
	(4, 3, 'ORD-1769595857', 348.00, 34.80, 15.66, 328.86, 'cod', 'confirmed', '2026-01-28 04:24:17', '2026-01-31 23:18:11'),
	(5, 3, 'ORD-1769601837', 263.00, 26.30, 11.84, 248.54, 'bkash', 'delivered', '2026-01-28 06:03:57', '2026-01-31 22:49:31'),
	(6, 4, 'ORD-1769602631', 351.00, 35.10, 17.55, 333.45, 'rocket', 'shipped', '2026-01-28 06:17:11', '2026-01-31 22:49:24'),
	(7, 4, 'ORD-1769658813', 55.00, 5.50, 2.75, 52.25, 'cod', 'processing', '2026-01-28 21:53:33', '2026-01-31 23:21:49'),
	(8, 4, 'ORD-1769663406', 55.00, 5.50, 2.75, 52.25, 'cod', 'cancelled', '2026-01-28 23:10:06', '2026-01-31 23:09:53'),
	(9, 3, 'ORD-1769925873', 351.00, 35.10, 17.55, 333.45, 'cod', 'confirmed', '2026-02-01 00:04:33', '2026-02-01 00:05:08'),
	(10, 3, 'ORD-1769933462', 521.00, 52.10, 26.05, 494.95, 'cod', 'pending', '2026-02-01 02:11:02', '2026-02-01 02:11:02'),
	(11, 3, 'ORD-1769933739', 528.00, 52.80, 26.40, 501.60, 'cod', 'pending', '2026-02-01 02:15:39', '2026-02-01 02:15:39');

-- Dumping structure for table books.order_items
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.order_items: ~24 rows (approximately)
DELETE FROM `order_items`;
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_variant_id`, `qty`, `price`, `total`, `created_at`, `updated_at`) VALUES
	(1, 2, 5, NULL, 1, 88.00, 88.00, '2026-01-28 04:01:17', '2026-01-28 04:01:17'),
	(2, 2, 10, NULL, 1, 88.00, 88.00, '2026-01-28 04:01:17', '2026-01-28 04:01:17'),
	(3, 3, 10, NULL, 1, 88.00, 88.00, '2026-01-28 04:03:34', '2026-01-28 04:03:34'),
	(4, 3, 11, NULL, 1, 87.00, 87.00, '2026-01-28 04:03:34', '2026-01-28 04:03:34'),
	(5, 3, 12, NULL, 1, 85.00, 85.00, '2026-01-28 04:03:34', '2026-01-28 04:03:34'),
	(6, 4, 5, NULL, 1, 88.00, 88.00, '2026-01-28 04:24:17', '2026-01-28 04:24:17'),
	(7, 4, 10, NULL, 1, 88.00, 88.00, '2026-01-28 04:24:17', '2026-01-28 04:24:17'),
	(8, 4, 11, NULL, 1, 87.00, 87.00, '2026-01-28 04:24:17', '2026-01-28 04:24:17'),
	(9, 4, 12, NULL, 1, 85.00, 85.00, '2026-01-28 04:24:17', '2026-01-28 04:24:17'),
	(10, 5, 5, NULL, 1, 88.00, 88.00, '2026-01-28 06:03:57', '2026-01-28 06:03:57'),
	(11, 5, 10, NULL, 1, 88.00, 88.00, '2026-01-28 06:03:57', '2026-01-28 06:03:57'),
	(12, 5, 11, NULL, 1, 87.00, 87.00, '2026-01-28 06:03:57', '2026-01-28 06:03:57'),
	(13, 6, 10, NULL, 2, 88.00, 176.00, '2026-01-28 06:17:11', '2026-01-28 06:17:11'),
	(14, 6, 5, NULL, 1, 88.00, 88.00, '2026-01-28 06:17:11', '2026-01-28 06:17:11'),
	(15, 6, 11, NULL, 1, 87.00, 87.00, '2026-01-28 06:17:11', '2026-01-28 06:17:11'),
	(16, 7, 7, NULL, 1, 55.00, 55.00, '2026-01-28 21:53:33', '2026-01-28 21:53:33'),
	(17, 8, 7, 6, 1, 55.00, 55.00, '2026-01-28 23:10:06', '2026-01-28 23:10:06'),
	(18, 9, 5, 5, 2, 88.00, 176.00, '2026-02-01 00:04:33', '2026-02-01 00:04:33'),
	(19, 9, 10, 7, 1, 88.00, 88.00, '2026-02-01 00:04:33', '2026-02-01 00:04:33'),
	(20, 9, 11, 8, 1, 87.00, 87.00, '2026-02-01 00:04:33', '2026-02-01 00:04:33'),
	(21, 10, 5, 5, 1, 88.00, 88.00, '2026-02-01 02:11:02', '2026-02-01 02:11:02'),
	(22, 10, 10, 7, 2, 88.00, 176.00, '2026-02-01 02:11:02', '2026-02-01 02:11:02'),
	(23, 10, 11, 8, 1, 87.00, 87.00, '2026-02-01 02:11:02', '2026-02-01 02:11:02'),
	(24, 10, 12, 9, 2, 85.00, 170.00, '2026-02-01 02:11:02', '2026-02-01 02:11:02'),
	(25, 11, 5, NULL, 6, 88.00, 528.00, '2026-02-01 02:15:39', '2026-02-01 02:15:39');

-- Dumping structure for table books.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table books.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.permissions: ~46 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Dashboard', 'web', '2026-01-19 05:33:09', '2026-01-19 05:33:09'),
	(2, 'System Settings', 'web', '2026-01-19 05:34:47', '2026-01-19 05:34:47'),
	(3, 'Roles', 'web', '2026-01-19 05:35:46', '2026-01-19 05:35:46'),
	(4, 'Users', 'web', '2026-01-19 05:36:43', '2026-01-19 05:36:43'),
	(5, 'admin.admin-menu.index', 'web', '2026-01-19 05:37:27', '2026-01-20 02:51:53'),
	(6, 'Admin Settings', 'web', '2026-01-19 05:37:50', '2026-01-19 05:37:50'),
	(7, 'admin.admin-menu.create', 'web', '2026-01-19 05:39:02', '2026-01-19 05:39:02'),
	(8, 'admin.admin-menu.edit', 'web', '2026-01-19 05:39:14', '2026-01-19 05:39:14'),
	(9, 'admin.admin-menu.destroy', 'web', '2026-01-19 05:39:24', '2026-01-19 05:39:24'),
	(10, 'admin.admin-menu-action.index', 'web', '2026-01-19 05:39:36', '2026-01-19 05:39:36'),
	(11, 'admin.admin-menu-action.create', 'web', '2026-01-19 05:39:45', '2026-01-19 05:39:45'),
	(12, 'admin.admin-menu-action.edit', 'web', '2026-01-19 05:40:14', '2026-01-19 05:40:14'),
	(13, 'admin.admin-menu-action.destroy', 'web', '2026-01-19 05:40:26', '2026-01-19 05:40:26'),
	(14, 'admin.role.create', 'web', '2026-01-19 23:59:11', '2026-01-19 23:59:11'),
	(18, 'admin.role.edit', 'web', '2026-01-20 03:24:24', '2026-01-20 03:24:24'),
	(19, 'admin.role.destroy', 'web', '2026-01-20 03:25:16', '2026-01-20 03:29:11'),
	(20, 'admin.role-permission.edit', 'web', '2026-01-20 03:31:59', '2026-01-20 03:31:59'),
	(21, 'Products', 'web', '2026-01-20 03:47:59', '2026-01-20 03:47:59'),
	(22, 'Category', 'web', '2026-01-20 03:49:56', '2026-01-20 03:49:56'),
	(23, 'admin.product.create', 'web', '2026-01-20 03:51:53', '2026-01-20 03:51:53'),
	(24, 'admin.product.edit', 'web', '2026-01-20 03:52:09', '2026-01-20 03:52:09'),
	(25, 'admin.product.destroy', 'web', '2026-01-20 03:52:34', '2026-01-20 03:52:34'),
	(26, 'Product Manage', 'web', '2026-01-20 03:56:07', '2026-01-20 03:56:07'),
	(27, 'UOM', 'web', '2026-01-20 04:04:00', '2026-01-20 04:04:00'),
	(28, 'Brand', 'web', '2026-01-20 04:04:36', '2026-01-20 04:04:36'),
	(29, 'admin.uom.create', 'web', '2026-01-20 04:06:48', '2026-01-20 04:06:48'),
	(31, 'admin.brand.create', 'web', '2026-01-20 04:09:27', '2026-01-20 04:09:27'),
	(32, 'Vendor', 'web', '2026-01-20 04:12:04', '2026-01-20 04:12:04'),
	(33, 'admin.vendor.create', 'web', '2026-01-20 04:12:41', '2026-01-20 04:12:41'),
	(34, 'Attribute', 'web', '2026-01-20 04:19:04', '2026-01-20 04:19:04'),
	(35, 'admin.attribute.create', 'web', '2026-01-20 04:21:01', '2026-01-20 04:21:01'),
	(36, 'publication', 'web', '2026-01-20 04:22:54', '2026-01-20 04:22:54'),
	(37, 'admin.publication.create', 'web', '2026-01-20 04:23:43', '2026-01-20 04:23:43'),
	(38, 'admin.product.show', 'web', '2026-01-20 04:59:33', '2026-01-20 04:59:33'),
	(39, 'User Menu', 'web', '2026-01-20 05:21:16', '2026-01-20 05:21:16'),
	(40, 'Main Menu', 'web', '2026-01-20 05:22:04', '2026-01-20 05:22:04'),
	(41, 'admin.menu.create', 'web', '2026-01-20 05:23:01', '2026-01-20 05:23:01'),
	(44, 'admin.menu-item.index', 'web', '2026-01-20 05:33:58', '2026-01-20 05:33:58'),
	(45, 'settings', 'web', '2026-01-20 06:07:05', '2026-01-20 06:07:05'),
	(46, 'admin.menu.edit', 'web', '2026-01-21 00:48:49', '2026-01-21 00:48:49'),
	(47, 'Author', 'web', '2026-01-22 04:29:15', '2026-01-22 04:29:15'),
	(48, 'admin.author.create', 'web', '2026-01-22 04:30:36', '2026-01-22 04:30:36'),
	(49, 'admin.author.edit', 'web', '2026-01-22 04:30:52', '2026-01-22 04:30:52'),
	(50, 'admin.author.destroy', 'web', '2026-01-22 04:31:06', '2026-01-22 04:31:06'),
	(51, 'admin.author.show', 'web', '2026-01-22 04:31:22', '2026-01-22 04:31:22'),
	(52, 'admin.publication.edit', 'web', '2026-01-22 04:33:21', '2026-01-22 04:33:21'),
	(53, 'admin.publication.show', 'web', '2026-01-22 04:33:41', '2026-01-22 04:33:41'),
	(54, 'admin.menu.destroy', 'web', '2026-01-28 23:15:50', '2026-01-28 23:15:50'),
	(55, 'Orders Management', 'web', '2026-01-31 22:22:32', '2026-01-31 22:22:32'),
	(56, 'admin.orders.index', 'web', '2026-01-31 22:25:06', '2026-01-31 22:28:50');

-- Dumping structure for table books.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `uom_id` bigint unsigned DEFAULT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `publication_id` bigint unsigned DEFAULT NULL,
  `product_type` enum('book','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'book',
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.products: ~10 rows (approximately)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `uom_id`, `brand_id`, `publication_id`, `product_type`, `barcode`, `file`, `thumbnail`, `short_description`, `description`, `purchase_price`, `regular_price`, `sale_price`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `sku`, `meta_title`, `meta_description`, `meta_image`, `custom_barcode`, `favorite`, `trending`, `new_arrival`, `best_seller`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Book1', 'book1', 1, 1, 1, NULL, 'book', 'asdsas', NULL, 'storage/media/product/2026-01-25-ohsvTRcZVvt6d3SOWJRqqL5gxdGsAfsTpogwuJoG.webp', '<p>dadadasda</p>', '<p>sdsdasd</p>', 234.00, 300.00, 320.00, 1.00, 'amount', '2026-01-20', '2026-02-21', 'SKUS', 'meta', 'cssdsfsf', 'storage/media/product/2026-01-20-FLxMajI5xjcg9zj2q2IBLQh6RqZUGujs5DiDmI6I.webp', 1, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-01-20 04:15:44', '2026-01-24 23:17:55'),
	(2, 'Book2', 'book2', 1, 1, 1, NULL, 'book', 'sdasd', NULL, 'storage/media/product/2026-01-25-fQxUtYHO76XI21NVyXZ7weRAsPQpdbmXQwaJHczN.webp', '<p>dsdasda</p>', '<p>dasdas</p>', 11.00, 33.00, 31.00, 2.00, 'amount', '2026-01-20', '2026-02-26', 'ssds', 'sdsadad', 'sadasdasd', 'storage/media/product/2026-01-20-NPtdHB2jK5Qnb7ZQHRfq1tlCqh3GLhOoYfA8dHbZ.webp', 1, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-01-20 04:26:34', '2026-01-24 23:17:37'),
	(3, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড', 'eknjre-ummahr-itihas-3-khnd-1', 4, 1, 1, 2, 'book', 'sdfsd', NULL, 'storage/media/product/2026-01-25-OeGX8HlaQ779JWdmB6KHD84OpPmkARBeql8VyfvA.webp', '<p>আল্লামা ইবনুল কায়্যিম জাওযিয়্যাহ রহ</p>', '<p>sdfsd</p>', 22.00, 33.00, 44.00, 1.00, 'amount', NULL, NULL, NULL, 'sdfsddf', 'sdfsd', 'storage/media/product/2026-01-25-OeGX8HlaQ779JWdmB6KHD84OpPmkARBeql8VyfvA.webp', 1, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-01-22 04:46:01', '2026-01-24 23:17:14'),
	(5, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড', 'eknjre-ummahr-itihas-3-khnd', 3, 1, 1, 2, 'book', 'sds', NULL, 'storage/media/product/2026-01-25-TS4mYWZUxZJSqUmdnU54yQm69jrU7hAIS7jM40IC.webp', '<p>আল্লামা ইবনুল কায়্যিম জাওযিয়্যাহ রহ</p>', '<p>dsfsdf</p>', 66.00, 77.00, 88.00, 1.00, 'amount', NULL, NULL, NULL, 'sdfsdf', 'dsfsdf', 'storage/media/product/2026-01-25-TS4mYWZUxZJSqUmdnU54yQm69jrU7hAIS7jM40IC.webp', 1, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-01-22 06:36:18', '2026-01-24 23:16:53'),
	(7, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড2', 'eknjre-ummahr-itihas-3-khnd2', 6, 1, 1, 1, 'book', 'sasa', NULL, 'storage/media/product/2026-01-25-7LvZzwqEMolCEhLWfS6LaQPzMk5UKuSLB3NEwbxd.webp', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', 34.00, 45.00, 55.00, 33.00, 'amount', NULL, NULL, NULL, 'fsd', 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড', 'storage/media/product/2026-01-25-7LvZzwqEMolCEhLWfS6LaQPzMk5UKuSLB3NEwbxd.webp', 1, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-01-25 02:06:22', '2026-01-25 02:08:34'),
	(10, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড3', 'eknjre-ummahr-itihas-3-khnd3', 3, 1, 1, 2, 'book', 'wqsa', NULL, 'storage/media/product/2026-01-25-UUMlnj6stQCDE6BdvmwcDe5m1CDCP37mNr1XzetU.webp', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', 77.00, 88.00, 88.00, 33.00, 'amount', '2026-02-26', '2026-02-27', 'dsfs', 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড3', 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড', 'storage/media/product/2026-01-25-UUMlnj6stQCDE6BdvmwcDe5m1CDCP37mNr1XzetU.webp', 1, 1, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-01-25 02:11:41', '2026-01-25 02:11:41'),
	(11, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড4', 'eknjre-ummahr-itihas-3-khnd4', 3, 1, 1, 2, 'book', 'sdsd', NULL, 'storage/media/product/2026-01-25-c8xbnR3BBE9olSvNsOBPPLozw8F8awxWiOrVCuPY.webp', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', 66.00, 76.00, 87.00, 33.00, 'amount', '2026-01-16', '2026-02-20', 'dfsdf', 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড4', 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড', 'storage/media/product/2026-01-25-c8xbnR3BBE9olSvNsOBPPLozw8F8awxWiOrVCuPY.webp', 1, 1, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-01-25 02:13:34', '2026-01-25 02:13:34'),
	(12, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড55', 'eknjre-ummahr-itihas-3-khnd55', 3, 1, 1, 2, 'book', 'ww', NULL, 'storage/media/product/2026-01-25-JWXDXAaaorR0BnKfzCSVCeMQk8DuFnmCiLYnQ4Gk.webp', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', 77.00, 86.00, 85.00, 1.00, 'amount', NULL, NULL, NULL, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড5', 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড', 'storage/media/product/2026-01-25-JWXDXAaaorR0BnKfzCSVCeMQk8DuFnmCiLYnQ4Gk.webp', 1, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-01-25 02:14:33', '2026-01-27 00:16:16'),
	(13, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড7', 'eknjre-ummahr-itihas-3-khnd7', 3, 1, 1, 2, 'book', '33', NULL, 'storage/media/product/2026-01-25-jcI5Y9JdtsXOoXoJ4vM6wuQwPqYI6wTGq5KSPP6u.webp', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', '<p><span style="color: rgb(108, 117, 125); font-family: Inter, sans-serif; background-color: rgb(248, 249, 250);">একনজরে উম্মাহর ইতিহাস ৩ খন্ড</span></p>', 55.00, 80.00, 120.00, 2.00, 'amount', NULL, NULL, 'dsf', 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড7', 'একনজরে উম্মাহর ইতিহাস ৩ খন্ড', 'storage/media/product/2026-01-25-jcI5Y9JdtsXOoXoJ4vM6wuQwPqYI6wTGq5KSPP6u.webp', 1, 1, 0, 0, 0, 1, 1, NULL, NULL, NULL, '2026-01-25 02:18:09', '2026-01-25 02:18:09'),
	(27, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ডWA', 'eknjre-ummahr-itihas-3-khndwa', 32, 1, 1, 2, 'book', 'ASS', NULL, 'storage/media/product/2026-02-01-qX7kPWaRTZdtiIjoLuJepU9eaBbY2Qxl9lCM59lx.webp', '<p>ASA</p>', '<p>sAS</p>', 66.00, 99.00, 99.00, 0.00, 'amount', '2026-02-06', '2026-03-03', NULL, 'একনজরে উম্মাহর ইতিহাস ৩ খন্ডWA', 'sAS', 'storage/media/product/2026-02-01-qX7kPWaRTZdtiIjoLuJepU9eaBbY2Qxl9lCM59lx.webp', 1, 1, 0, 0, 0, 1, 1, 1, NULL, NULL, '2026-02-01 06:30:48', '2026-02-01 21:50:12');

-- Dumping structure for table books.product_authors
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.product_authors: ~6 rows (approximately)
DELETE FROM `product_authors`;
INSERT INTO `product_authors` (`id`, `product_id`, `author_id`, `created_at`, `updated_at`) VALUES
	(1, 3, 1, '2026-01-22 04:46:02', '2026-01-22 04:46:02'),
	(2, 5, 1, '2026-01-22 06:36:21', '2026-01-22 06:36:21'),
	(3, 7, 1, '2026-01-25 02:06:23', '2026-01-25 02:06:23'),
	(4, 10, 1, '2026-01-25 02:11:41', '2026-01-25 02:11:41'),
	(5, 11, 1, '2026-01-25 02:13:34', '2026-01-25 02:13:34'),
	(6, 12, 1, '2026-01-25 02:14:33', '2026-01-25 02:14:33'),
	(7, 13, 1, '2026-01-25 02:18:09', '2026-01-25 02:18:09'),
	(8, 27, 2, '2026-02-01 06:30:48', '2026-02-01 06:30:48');

-- Dumping structure for table books.product_categories
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

-- Dumping data for table books.product_categories: ~0 rows (approximately)
DELETE FROM `product_categories`;

-- Dumping structure for table books.product_images
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.product_images: ~9 rows (approximately)
DELETE FROM `product_images`;
INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
	(5, 5, 'storage/media/product/2026-01-25-MK3xsdTubktCwAaOtdOlUNb9iCsq7DdLldfLJNB1.webp', '2026-01-24 23:16:53', '2026-01-24 23:16:53'),
	(6, 3, 'storage/media/product/2026-01-25-dij5X01DPJKVUUsCeU25ctagymEvIDqfQmoqtOxS.webp', '2026-01-24 23:17:14', '2026-01-24 23:17:14'),
	(7, 2, 'storage/media/product/2026-01-25-q6VNZvcQxcMGzpLPdVNKBNhheXbvT4UqbX1rIzgV.webp', '2026-01-24 23:17:37', '2026-01-24 23:17:37'),
	(8, 1, 'storage/media/product/2026-01-25-SS3rfwzKYDXqC0L6JtHqRN7dZhhB1iMtlIUqNGd3.webp', '2026-01-24 23:17:55', '2026-01-24 23:17:55'),
	(9, 7, 'storage/media/product/2026-01-25-ee6T45GSukbuRjjYGa05FprsvhNVNIvGJE0Yx3Xa.webp', '2026-01-25 02:06:22', '2026-01-25 02:06:22'),
	(10, 10, 'storage/media/product/2026-01-25-t6jx4lcX0VSSMl1ba4DWcnSEs6Wl69J19kXabiKk.webp', '2026-01-25 02:11:41', '2026-01-25 02:11:41'),
	(11, 11, 'storage/media/product/2026-01-25-iYYv6Vx9rbjd0atV61VnPK6clwFpPjrVQLQcX7fH.webp', '2026-01-25 02:13:34', '2026-01-25 02:13:34'),
	(12, 12, 'storage/media/product/2026-01-25-7sHNm2Plc71wIzl805Wk2gM6WJhKCxnwa11p7VaY.webp', '2026-01-25 02:14:33', '2026-01-25 02:14:33'),
	(15, 27, 'storage/media/product/2026-02-01-b5fxDB9zSagqZeU63YzDm3DHcVO4AYjz7xgZXwRS.webp', '2026-02-01 06:33:54', '2026-02-01 06:33:54');

-- Dumping structure for table books.product_tags
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.product_tags: ~10 rows (approximately)
DELETE FROM `product_tags`;
INSERT INTO `product_tags` (`id`, `product_id`, `name`, `created_at`, `updated_at`) VALUES
	(7, 5, 'dfsdf', '2026-01-24 23:16:53', '2026-01-24 23:16:53'),
	(8, 3, 'dsfsd', '2026-01-24 23:17:14', '2026-01-24 23:17:14'),
	(9, 2, 'facebook', '2026-01-24 23:17:37', '2026-01-24 23:17:37'),
	(10, 1, 'asaa', '2026-01-24 23:17:55', '2026-01-24 23:17:55'),
	(13, 7, 'sasa', '2026-01-25 02:08:34', '2026-01-25 02:08:34'),
	(14, 10, 'sads', '2026-01-25 02:11:41', '2026-01-25 02:11:41'),
	(15, 11, 'sdfdsf', '2026-01-25 02:13:34', '2026-01-25 02:13:34'),
	(17, 13, 'Zxazx', '2026-01-25 02:18:09', '2026-01-25 02:18:09'),
	(18, 12, 'sd', '2026-01-27 00:16:17', '2026-01-27 00:16:17'),
	(20, 27, 'aS', '2026-02-01 21:50:12', '2026-02-01 21:50:12');

-- Dumping structure for table books.product_variants
DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.product_variants: ~9 rows (approximately)
DELETE FROM `product_variants`;
INSERT INTO `product_variants` (`id`, `product_id`, `variant`, `sku`, `purchase_price`, `regular_price`, `sale_price`, `discount`, `discount_type`, `image`, `stock`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'SKUS', 11.00, 12.00, 11.00, 1.00, 'amount', NULL, 0, 1, '2026-01-20 04:15:44', '2026-01-24 23:17:55'),
	(2, 2, NULL, 'ssds', 11.00, 33.00, 31.00, 2.00, 'amount', NULL, 0, 1, '2026-01-20 04:26:34', '2026-01-24 23:17:37'),
	(3, 3, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, 0, 1, '2026-01-22 04:46:01', '2026-01-24 23:17:14'),
	(5, 5, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 'amount', NULL, -3, 1, '2026-01-22 06:36:18', '2026-02-01 02:11:02'),
	(6, 7, NULL, NULL, 33.00, 33.00, 0.00, 33.00, 'amount', NULL, 2, 1, '2026-01-25 02:06:22', '2026-01-28 23:10:06'),
	(7, 10, NULL, 'dsfs', 33.00, 33.00, 0.00, 33.00, 'amount', NULL, -3, 1, '2026-01-25 02:11:41', '2026-02-01 02:11:02'),
	(8, 11, NULL, 'dfsdf', 33.00, 33.00, 0.00, 33.00, 'amount', NULL, -2, 1, '2026-01-25 02:13:34', '2026-02-01 02:11:02'),
	(9, 12, NULL, NULL, 77.00, 86.00, 85.00, 1.00, 'amount', NULL, -2, 1, '2026-01-25 02:14:33', '2026-02-01 02:11:02'),
	(10, 13, NULL, 'dsf', 55.00, 55.00, 53.00, 2.00, 'amount', NULL, 0, 1, '2026-01-25 02:18:09', '2026-01-25 02:18:09');

-- Dumping structure for table books.product_variant_values
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

-- Dumping data for table books.product_variant_values: ~0 rows (approximately)
DELETE FROM `product_variant_values`;

-- Dumping structure for table books.product_vendors
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.product_vendors: ~10 rows (approximately)
DELETE FROM `product_vendors`;
INSERT INTO `product_vendors` (`id`, `product_id`, `vendor_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2026-01-20 04:15:44', '2026-01-20 04:15:44'),
	(2, 2, 1, '2026-01-20 04:26:34', '2026-01-20 04:26:34'),
	(3, 3, 1, '2026-01-22 04:46:01', '2026-01-22 04:46:01'),
	(5, 5, 1, '2026-01-22 06:36:21', '2026-01-22 06:36:21'),
	(6, 7, 1, '2026-01-25 02:06:22', '2026-01-25 02:06:22'),
	(7, 10, 1, '2026-01-25 02:11:41', '2026-01-25 02:11:41'),
	(8, 11, 1, '2026-01-25 02:13:34', '2026-01-25 02:13:34'),
	(9, 12, 1, '2026-01-25 02:14:33', '2026-01-25 02:14:33'),
	(10, 13, 1, '2026-01-25 02:18:09', '2026-01-25 02:18:09'),
	(13, 27, 1, '2026-02-01 06:33:54', '2026-02-01 06:33:54');

-- Dumping structure for table books.publications
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.publications: ~0 rows (approximately)
DELETE FROM `publications`;
INSERT INTO `publications` (`id`, `name`, `slug`, `image`, `cover_image`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'PublicationName1233', 'publicationname1233', 'storage/publication/2026-01-20-YJsw5YKEToACrcjI64eyleHJWWOJZSSLJBeUZnQ2.webp', 'storage/publication/2026-01-20-OraaoflH2i5HqarTG3PsAVbb74Zym9w7RnmeCdlE.webp', 'asdsad', 1, 1, NULL, NULL, NULL, '2026-01-20 04:24:34', '2026-01-20 04:24:34'),
	(2, 'Publication12', 'publication12', 'storage/publication/2026-01-22-pLcGvcdwiBan700LNHOTiRx7VBAPn2zbYC4wZ3Rr.webp', 'storage/publication/2026-01-22-YkCGXyosBESKkHyUso3foqsYxmxFKj3WIpmWhQR2.webp', 'asdasd', 1, 1, NULL, NULL, NULL, '2026-01-22 04:34:10', '2026-01-22 04:34:10');

-- Dumping structure for table books.purchase_orders
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

-- Dumping data for table books.purchase_orders: ~0 rows (approximately)
DELETE FROM `purchase_orders`;

-- Dumping structure for table books.purchase_order_items
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

-- Dumping data for table books.purchase_order_items: ~0 rows (approximately)
DELETE FROM `purchase_order_items`;

-- Dumping structure for table books.purchase_receipts
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

-- Dumping data for table books.purchase_receipts: ~0 rows (approximately)
DELETE FROM `purchase_receipts`;

-- Dumping structure for table books.purchase_receipt_items
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

-- Dumping data for table books.purchase_receipt_items: ~0 rows (approximately)
DELETE FROM `purchase_receipt_items`;

-- Dumping structure for table books.reviews
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.reviews: ~1 rows (approximately)
DELETE FROM `reviews`;
INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `review`, `status`, `created_at`, `updated_at`) VALUES
	(1, 3, 11, 5, 'NICE', 1, '2026-02-01 00:25:27', '2026-02-01 00:26:37'),
	(2, 2, 11, 2, 'Motamuti', 1, '2026-02-01 00:31:58', '2026-02-01 00:31:58'),
	(3, 3, 10, 4, 'hhhh', 1, '2026-02-01 00:39:43', '2026-02-01 00:39:43');

-- Dumping structure for table books.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.roles: ~2 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Software Admin', 'web', '2026-01-19 04:51:11', '2026-01-19 04:51:11'),
	(2, 'Test Role', 'web', '2026-01-19 06:27:50', '2026-01-19 06:27:50');

-- Dumping structure for table books.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.role_has_permissions: ~46 rows (approximately)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(36, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1);

-- Dumping structure for table books.sessions
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

-- Dumping data for table books.sessions: ~5 rows (approximately)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('4DSl4H71B5ls5Ow3vSDftqvtEI8RAav5s2j9UVn2', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUmRjVDAzckNYMGV2V3pWcFVHSWwyQzBDSVpRU2tTZjF4QXlESzY2SSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1769949280),
	('4ExfIgPN8J2JewvpKLNaO3PgziJDV9jtBWE9lccc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmpXRXIwMkV5OTEwMmtSNkRjdEY2Z0NlTHc1b2xpelBPVW85QmIzZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTc4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvY2F0ZWdvcnkvMjAvcmJlZW5kci1zbmdvaXQvJUUwJUE2JUIwJUUwJUE2JUFDJUUwJUE3JTgwJUUwJUE2JUE4JUUwJUE3JThEJUUwJUE2JUE2JUUwJUE3JThEJUUwJUE2JUIwJTIwJUUwJUE2JUI4JUUwJUE2JTk5JUUwJUE3JThEJUUwJUE2JTk3JUUwJUE2JUJGJUUwJUE2JUE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1769929062),
	('8jrDkRNVSb6MoDKZmzog1TKyyOsc68HLTj4uDDmY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUkt4WHZmUGd3VXNISHdvbUNJMHY0V2hqVFhzR0JUSmZObmNYcUF3SCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL29yZGVycy81L3RyYWNrIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlcnMvNS90cmFjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769922153),
	('mz5LDAGPDMFXJbIxXwT8X343tDitdshLpPMKUz3N', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQkVWc05oblV0SVdjSml0RFl1UFBaak5LSXBOVlF1V2owaDVzUXVIMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL29yZGVycy80L3RyYWNrIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlcnMvNC90cmFjayI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1769922086),
	('URRtZ06o4jNy0LzUm4Bmine18FM5MDPZSlgtRQou', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVVY5OXAwaHlzQlpUSGdISXFrMXBLaUNrU1A5ZnlpaUJCVUNpcnplMiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1770014076);

-- Dumping structure for table books.settings
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

-- Dumping data for table books.settings: ~1 rows (approximately)
DELETE FROM `settings`;
INSERT INTO `settings` (`id`, `app_name`, `title`, `primary_phone`, `secondary_phone`, `primary_email`, `secondary_email`, `office_time`, `address`, `description`, `banner_one`, `banner_one_link`, `banner_one_status`, `banner_two`, `banner_two_link`, `banner_two_status`, `page_heading_bg`, `meta_title`, `meta_keyword`, `meta_description`, `meta_image`, `google_map`, `favicon`, `logo`, `footer_logo`, `placeholder`, `facebook_page`, `facebook_group`, `youtube`, `twitter`, `linkedin`, `google`, `whatsapp`, `instagram`, `pinterest`, `sms_api_url`, `sms_api_key`, `sms_api_id`, `bkash_status`, `nagad_status`, `created_at`, `updated_at`) VALUES
	(1, 'Books and Books', 'Books and Books', '01575020231', '01921588567', 'booksandbooks@gmail.com', 'booksandbooks@gmail.com', NULL, 'Aftabnager, Dhaka-1212', NULL, 'storage/settings/2026-01-21-wedrU0Ws5EcNJvOxvLyNEmLwlf3CAH7pquEHYVYM.webp', NULL, 1, NULL, NULL, 1, 'storage/settings/2026-01-21-KYnjWDTTbLtSrkVkdyGbCGcgLfBDaVMBvTG6bvjO.webp', NULL, NULL, NULL, 'storage/settings/2026-01-21-JiVF5rBec3gB7i1eQhbM7vt8JKNJ2hOm8j5SVSSz.webp', NULL, 'storage/settings/2026-01-21-V4Q3LAERhKBYrp5zL6fOf2BdZ83NJFuqn0lf317n.webp', 'storage/settings/2026-01-21-3u5FB5fLxnC4FK4pIV24Pli0lW1d0I8gBIfHLqM3.webp', NULL, 'storage/settings/2026-01-21-oHsk98AzUkgIiG5pu7qISgvuyXTIoJGSQSTjjWW8.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2026-01-19 05:10:51', '2026-01-28 05:48:38');

-- Dumping structure for table books.sliders
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.sliders: ~1 rows (approximately)
DELETE FROM `sliders`;
INSERT INTO `sliders` (`id`, `image`, `mobile_image`, `link`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'storage/slider/2026-01-20-jp3BvUm6RdWktfdYndawzHNGyh2dgfZnDtxJtO8k.webp', 'storage/slider/2026-01-20-9E0eiW4hUlIeo3IgMpoBj718JDauk9bsfegjs0AG.webp', '#', 1, 1, 1, NULL, NULL, '2026-01-20 00:28:37', '2026-01-20 00:36:37'),
	(2, 'storage/slider/2026-01-20-IMTJKl040S1u4Kv7CIagH2B3uIL92oBPk0KtxEDV.webp', 'storage/slider/2026-01-20-1WUtoZ3vC3sU9tXx2cXlV1u99wG0MH8AZM4VoejF.webp', '#', 1, 1, NULL, NULL, NULL, '2026-01-20 00:39:06', '2026-01-20 00:39:06');

-- Dumping structure for table books.stocks
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

-- Dumping data for table books.stocks: ~0 rows (approximately)
DELETE FROM `stocks`;

-- Dumping structure for table books.stock_movements
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

-- Dumping data for table books.stock_movements: ~0 rows (approximately)
DELETE FROM `stock_movements`;

-- Dumping structure for table books.stores
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

-- Dumping data for table books.stores: ~0 rows (approximately)
DELETE FROM `stores`;

-- Dumping structure for table books.uoms
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

-- Dumping data for table books.uoms: ~0 rows (approximately)
DELETE FROM `uoms`;
INSERT INTO `uoms` (`id`, `name`, `slug`, `description`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'UNIT', 'unit', 'UNit des', 1, 1, NULL, NULL, NULL, '2026-01-20 04:07:27', '2026-01-20 04:07:27');

-- Dumping structure for table books.users
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
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role_status` int DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `phone`, `address`, `image`, `cover_image`, `status`, `email_verified_at`, `role_status`, `otp`, `otp_expire`, `password`, `remember_token`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', 'wali@gmail.com', '01575020231', 'Dhaka', NULL, NULL, 1, NULL, 1, NULL, NULL, '$2y$12$gKjdlJg51/QNpFugdCaHsOx05nZNn28nktM7kUBhWToaVwk0wcHfO', NULL, NULL, NULL, NULL, NULL, '2026-01-19 04:51:10', '2026-01-26 22:26:43'),
	(2, 'Abdullah Al-Wasi', 'wasi', 'wasi@gmail.com', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, '$2y$12$WAyduN/2SccBUdkF1.gILeTWcVRi/GTVU0qaC7ZUAeD8GCYDtFIvq', NULL, NULL, NULL, NULL, NULL, '2026-01-26 23:05:57', '2026-01-26 23:05:57'),
	(3, 'warid', 'warid', 'warid@gmail.com', '55559999', 'H#5, R#4, Aftabanagar', 'storage/users/profile/2026-01-27-pQ8JiklKJo66CtAWiwxF4mONukP1Y5oEFBHT5TN1.webp', NULL, 1, NULL, 0, NULL, NULL, '$2y$12$m21rnvULrJK3aIZvXPlvl.EjP5lRJe7zRfxajqIQyQItvzq7fQMdu', NULL, NULL, NULL, NULL, NULL, '2026-01-27 00:03:34', '2026-01-27 05:14:38'),
	(4, 'Sumon', NULL, 'sumon@gmail.com', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, '$2y$12$2x5YHnPByWB/0rt/bF5NJ.kSB6/eTn1F9dHlUfZoSbCL55M5z8Gba', NULL, NULL, NULL, NULL, NULL, '2026-01-28 06:17:11', '2026-01-28 06:17:11');

-- Dumping structure for table books.vendors
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

-- Dumping data for table books.vendors: ~0 rows (approximately)
DELETE FROM `vendors`;
INSERT INTO `vendors` (`id`, `name`, `slug`, `code`, `contact_person`, `email`, `phone`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Vendor123', 'vendor123', 'CODE123', 'Wali', 'wali@gmail.com', '33333333', 'dsds sdsdasddasda', 1, 1, NULL, NULL, NULL, '2026-01-20 04:13:33', '2026-01-20 04:13:33');

-- Dumping structure for table books.wishlists
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table books.wishlists: ~4 rows (approximately)
DELETE FROM `wishlists`;
INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
	(6, 3, 3, '2026-01-27 06:13:15', '2026-01-27 06:13:15'),
	(8, 3, 12, '2026-01-27 06:15:50', '2026-01-27 06:15:50'),
	(9, 3, 5, '2026-01-27 06:16:30', '2026-01-27 06:16:30'),
	(10, 1, 10, '2026-01-27 23:04:48', '2026-01-27 23:04:48'),
	(11, 3, 13, '2026-02-01 00:42:44', '2026-02-01 00:42:44');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
