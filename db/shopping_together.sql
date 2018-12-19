/*
Navicat MySQL Data Transfer

Source Server         : website
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-12-12 15:21:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for charges
-- ----------------------------
DROP TABLE IF EXISTS `charges`;
CREATE TABLE `charges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `charge_id` bigint(20) NOT NULL,
  `test` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `capped_amount` decimal(8,2) DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `billing_on` timestamp NULL DEFAULT NULL,
  `activated_on` timestamp NULL DEFAULT NULL,
  `trial_ends_on` timestamp NULL DEFAULT NULL,
  `cancelled_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `plan_id` int(10) unsigned DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_charge` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `charges_charge_id_unique` (`charge_id`),
  KEY `charges_shop_id_foreign` (`shop_id`),
  KEY `charges_plan_id_foreign` (`plan_id`),
  KEY `charges_reference_charge_foreign` (`reference_charge`),
  CONSTRAINT `charges_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `charges_reference_charge_foreign` FOREIGN KEY (`reference_charge`) REFERENCES `charges` (`charge_id`) ON DELETE CASCADE,
  CONSTRAINT `charges_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of charges
-- ----------------------------

-- ----------------------------
-- Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `capped_amount` decimal(8,2) DEFAULT NULL,
  `terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `test` tinyint(1) NOT NULL DEFAULT '0',
  `on_install` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plans
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `product_font_family` enum('timesNewRoman','verdana','arial') NOT NULL,
  `product_font_style` enum('bold','italic','normal') NOT NULL,
  `product_font_size` int(255) NOT NULL,
  `product_font_color` varchar(255) NOT NULL,
  `product_image_width` int(11) NOT NULL,
  `product_imgae_height` int(11) NOT NULL,
  `amount_font_family` enum('timesNewRoman','verdana','arial') NOT NULL,
  `amount_font_style` enum('bold','italic','normal') NOT NULL,
  `amount_font_size` varchar(255) NOT NULL,
  `amount_font_color` varchar(255) NOT NULL,
  `new_price_font_family` enum('timesNewRoman','verdana','arial') NOT NULL,
  `new_price_font_style` enum('bold','italic','normal') NOT NULL,
  `new_price_font_size` varchar(255) NOT NULL,
  `new_price_font_color` varchar(255) NOT NULL,
  `old_price_font_family` enum('timesNewRoman','verdana','arial') NOT NULL,
  `old_price_font_style` enum('bold','italic','normal') NOT NULL,
  `old_price_font_size` varchar(255) NOT NULL,
  `old_price_font_color` varchar(255) NOT NULL,
  `title_font_family` enum('timesNewRoman','verdana','arial') NOT NULL,
  `title_font_style` enum('bold','italic','normal') NOT NULL,
  `title_font_size` varchar(255) NOT NULL,
  `title_font_color` varchar(255) NOT NULL,
  `cart_font_family` enum('timesNewRoman','verdana','arial') NOT NULL,
  `cart_font_style` enum ('bold','italic','normal') NOT NULL,
  `cart_font_size` varchar(255) NOT NULL,
  `cart_font_color` varchar(255) NOT NULL,
  `back_ground_color` varchar(255) NOT NULL,
  `cart_text` varchar(255) NOT NULL,
  `product_text` varchar(255) NOT NULL,
  `active` int(11) NOT NULL,
  `show_product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of settings
-- ----------------------------

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `shopify_domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopify_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_shop_owner` int(11) DEFAULT NULL,
  `charge_id` bigint(20) DEFAULT NULL,
  `grandfatherd` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` int(10) DEFAULT NULL,
  `freemium` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', 'gmail.com', 'gmail', '1', null, null, '2018-12-11 17:12:34', '2018-12-11 17:12:34', null, null, null);
INSERT INTO `shops` VALUES ('2', 'test', 'com', '1', null, null, '2018-12-12 13:15:02', '2018-12-12 13:15:02', null, null, null);

-- ----------------------------
-- Table structure for shop_owner
-- ----------------------------
DROP TABLE IF EXISTS `shop_owner`;
CREATE TABLE `shop_owner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shop_owner
-- ----------------------------
INSERT INTO `shop_owner` VALUES ('1', 'pa', 'pa@gmail.com', '1234', '12hamsa', '2018-12-11 17:12:27', '2018-12-11 17:12:27');
