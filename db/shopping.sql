/*
Navicat MySQL Data Transfer

Source Server         : website
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-01-23 13:13:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart_rule
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule`;
CREATE TABLE `cart_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `id_product` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart_rule
-- ----------------------------
INSERT INTO `cart_rule` VALUES ('31', '24', '2049572405312', 'rule 1', '1', '2019-01-23 08:44:54', '2019-01-23 08:44:54');
INSERT INTO `cart_rule` VALUES ('32', '24', '2049572831296', 'rule 2', '1', '2019-01-23 08:44:54', '2019-01-23 08:44:54');
INSERT INTO `cart_rule` VALUES ('33', '24', '2050359885888', 'rule 3', '1', '2019-01-23 08:44:54', '2019-01-23 08:44:54');

-- ----------------------------
-- Table structure for cart_rule_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_detail`;
CREATE TABLE `cart_rule_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart_rule` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `id_product` varchar(50) NOT NULL DEFAULT '0',
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `is_main_product` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart_rule_detail
-- ----------------------------
INSERT INTO `cart_rule_detail` VALUES ('82', '31', '24', '2049572405312', '0.00', '0.00', '1', '2019-01-21 09:11:26', '2019-01-21 09:11:26');
INSERT INTO `cart_rule_detail` VALUES ('83', '31', '24', '2049572831296', '0.00', '0.00', '0', '2019-01-21 09:11:26', '2019-01-21 09:11:26');
INSERT INTO `cart_rule_detail` VALUES ('84', '31', '24', '2049572929600', '0.00', '0.00', '0', '2019-01-21 09:11:26', '2019-01-21 09:11:26');
INSERT INTO `cart_rule_detail` VALUES ('85', '32', '24', '2049572831296', '0.00', '0.00', '1', '2019-01-21 09:11:43', '2019-01-21 09:11:43');
INSERT INTO `cart_rule_detail` VALUES ('86', '32', '24', '2049572995136', '0.00', '0.00', '0', '2019-01-21 09:11:43', '2019-01-21 09:11:43');
INSERT INTO `cart_rule_detail` VALUES ('87', '32', '24', '2049574142016', '0.00', '0.00', '0', '2019-01-21 09:11:43', '2019-01-21 09:11:43');
INSERT INTO `cart_rule_detail` VALUES ('88', '33', '24', '2050359885888', '0.00', '0.00', '1', '2019-01-21 11:14:08', '2019-01-21 11:14:08');
INSERT INTO `cart_rule_detail` VALUES ('89', '33', '24', '2049571749952', '0.00', '0.00', '0', '2019-01-21 11:14:08', '2019-01-21 11:14:08');
INSERT INTO `cart_rule_detail` VALUES ('90', '33', '24', '2049572405312', '0.00', '0.00', '0', '2019-01-21 11:14:08', '2019-01-21 11:14:08');

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
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `currency` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES ('21', '24', 'VND', '2019-01-21 03:48:57', '2019-01-21 03:48:57');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_image` varchar(50) DEFAULT NULL,
  `id_shop` int(11) DEFAULT NULL,
  `id_product` varchar(50) DEFAULT NULL,
  `src` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('253', '6320286662720', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866574407.jpg?v=1545969439', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('254', '6320299737152', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190096.jpg?v=1545969460', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('255', '6320302325824', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190098.jpg?v=1545969465', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('256', '6320302522432', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190093.jpg?v=1545969465', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('257', '6320304029760', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190094.jpg?v=1545969466', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('258', '6320305602624', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190095.jpg?v=1545969468', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('259', '6320305635392', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190097.jpg?v=1545969468', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('260', '6320305963072', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190099.jpg?v=1545969469', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('261', '6320306126912', '24', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190100.jpg?v=1545969469', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('262', '6317470351424', '24', '2049578270784', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/7-chakra-bracelet_925x_240c2ceb-11bf-43b6-8261-df7a33ba3b17.jpg?v=1545965290', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('263', '6317470384192', '24', '2049578270784', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/navy-blue-chakra-bracelet_925x_16f633a4-d758-4984-bf3e-73be1397897b.jpg?v=1545965290', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('264', '6317471825984', '24', '2049578664000', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/anchor-bracelet-mens_925x_7ae00987-86ca-416e-a589-8274a9a204e3.jpg?v=1545965292', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('265', '6317471891520', '24', '2049578664000', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/anchor-bracelet-for-men_925x_f20cc85c-deaa-4edf-b150-e8670265cb4f.jpg?v=1545965292', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('266', '6317471924288', '24', '2049578664000', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/leather-anchor-bracelet-for-men_925x_7d1f3d24-cc8a-4b92-b551-4ca6a30ce83d.jpg?v=1545965292', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('267', '6317472546880', '24', '2049578860608', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/bangle-bracelet-with-jewels_925x_e1c2d885-b589-436a-83e8-ec705f0271dd.jpg?v=1545965293', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('268', '6320282304576', '24', '2050359656512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-808262340.jpg?v=1545969434', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('269', '6320296624192', '24', '2050359656512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-808262347.jpg?v=1545969457', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('270', '6320300818496', '24', '2050359656512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-808262346.jpg?v=1545969462', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('271', '6320300916800', '24', '2050359656512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-808262348.jpg?v=1545969462', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('272', '6317452394560', '24', '2049573748800', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/black-bag-over-the-shoulder_925x_9e2f67db-762e-416e-8955-55e6fda64233.jpg?v=1545965254', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('273', '6317455147072', '24', '2049574731840', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/man-adjusts-blue-tuxedo-bowtie_925x_17c631fd-56ad-4934-818a-0a2d7d46946c.jpg?v=1545965261', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('274', '6317474021440', '24', '2049579122752', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/bangle-bracelet-with-feathers_925x_81ad2199-1603-4a17-a708-e29a8aa15f13.jpg?v=1545965295', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('275', '6317475201088', '24', '2049579417664', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/boho-earrings_925x_45439637-0c9c-4f8b-8193-f6a4a376bfe3.jpg?v=1545965298', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('276', '6317475233856', '24', '2049579417664', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/inspired-woman_925x_61e4b40f-e0cf-4a19-a600-7e041c779a30.jpg?v=1545965298', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('277', '6317475266624', '24', '2049579417664', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/necklace-earrings-set_925x_b3a8634c-7079-4aec-833b-65e186d12953.jpg?v=1545965298', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('278', '6317453705280', '24', '2049574207552', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/red-plaid-shirt_925x_a5654ad7-0148-4452-b866-b487d7781b27.jpg?v=1545965258', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('279', '6317478084672', '24', '2049580236864', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-with-gold-pendant_925x_fe79bb70-6c05-4dc8-8e45-7a03d8f3ae97.jpg?v=1545965304', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('280', '6317478117440', '24', '2049580236864', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-pendant-closeup_925x_e158c6b0-54a3-4582-b60e-9519dc9934c1.jpg?v=1545965304', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('281', '6317478412352', '24', '2049580433472', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-with-triangle_925x_c6dfd85c-bca8-4cd6-81f9-dac90faf19af.jpg?v=1545965305', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('282', '6320281223232', '24', '2050359689280', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-458921550.jpg?v=1545969433', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('283', '6320280698944', '24', '2050359263296', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-458921651.jpg?v=1545969432', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('284', '6320281190464', '24', '2050359853120', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-458921819.jpg?v=1545969433', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('285', '6317448626240', '24', '2049572995136', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/leather-jacket-and-tea_925x_269dd032-e933-4361-8098-edc5b4a7231a.jpg?v=1545965250', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('286', '6317444890688', '24', '2049572405312', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/casual-fashion-woman_925x_1ac60223-e02a-44f4-9e3f-c262930cda9e.jpg?v=1545965246', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('287', '6317449379904', '24', '2049573224512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-female-models-denim_925x_e362e0ac-e514-499f-8bdc-25b729febbd2.jpg?v=1545965251', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('288', '6317481066560', '24', '2049581121600', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/dreamcatcher-pendant-necklace_925x_e98914ab-8e4b-432d-ae49-8de4413de325.jpg?v=1545965310', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('289', '6317481099328', '24', '2049581121600', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gold-dream-catcher-necklace_925x_71a5f402-c304-43ef-920e-a7251767d263.jpg?v=1545965310', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('290', '6320286990400', '24', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208523.jpg?v=1545969440', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('291', '6320295215168', '24', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208530.jpg?v=1545969454', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('292', '6320296132672', '24', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208532.jpg?v=1545969456', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('293', '6320299376704', '24', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208533.jpg?v=1545969460', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('294', '6320304390208', '24', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208529.jpg?v=1545969466', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('295', '6320305799232', '24', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208531.jpg?v=1545969469', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('296', '6317447381056', '24', '2049572831296', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/city-woman-fashion_925x_2x_0b68d46a-709c-41f3-83b1-7cf73d973d92.jpg?v=1545965249', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('297', '6317481361472', '24', '2049581285440', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/galaxy-earrings_925x_4e492c2e-09b3-41dc-a6d9-2bb493d38a89.jpg?v=1545965311', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('298', '6317482967104', '24', '2049581580352', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/blue-gemstone-pendant_925x_f86c00a5-c789-4d9d-9310-b37e63fb1867.jpg?v=1545965313', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('299', '6317482999872', '24', '2049581580352', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gemstone-necklace_925x_1188293e-a279-446f-9cef-20c46daff5b0.jpg?v=1545965313', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('300', '6317483032640', '24', '2049581580352', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-necklace_925x_8ee8f1ab-9541-4505-8b19-21f4ab817f1b.jpg?v=1545965313', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('301', '6317483065408', '24', '2049581580352', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/purple-gemstone-necklace_925x_3c059fac-4ddb-450f-a0d9-e9add963744b.jpg?v=1545965313', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('302', '6317483753536', '24', '2049581744192', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gold-bird-necklace_925x_e391d5e6-7a38-4ef9-8b3e-12227d8def94.jpg?v=1545965315', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('303', '6317483884608', '24', '2049581842496', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/elephant-earrings_925x_479edb7c-c772-40ea-9c6a-1f7e6539d505.jpg?v=1545965315', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('304', '6317484441664', '24', '2049582071872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/guardian-angel-earrings_925x_c08b0015-fdb8-4ecf-b7b5-596c864da461.jpg?v=1545965317', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('305', '6317484474432', '24', '2049582071872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/guardian-angel-earring-closeup_925x_98aab569-9622-426b-b922-cc44038eae3e.jpg?v=1545965317', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('306', '6320288989248', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-393788798.jpg?v=1545969442', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('307', '6320291086400', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246604.jpg?v=1545969446', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('308', '6320296460352', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246598.jpg?v=1545969457', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('309', '6320298197056', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246606.jpg?v=1545969459', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('310', '6320299016256', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246605.jpg?v=1545969460', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('311', '6320301015104', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246599.jpg?v=1545969462', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('312', '6320301047872', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246603.jpg?v=1545969462', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('313', '6320302194752', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246602.jpg?v=1545969464', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('314', '6320306454592', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-381250648.jpg?v=1545969469', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('315', '6320306520128', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246600.jpg?v=1545969469', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('316', '6320308650048', '24', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246601.jpg?v=1545969472', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('317', '6320283353152', '24', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-800341181.jpg?v=1545969435', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('318', '6320291119168', '24', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-732377583.jpg?v=1545969446', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('319', '6320291283008', '24', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-732377584.jpg?v=1545969446', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('320', '6320299802688', '24', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-732377585.jpg?v=1545969461', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('321', '6320304062528', '24', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-732377586.jpg?v=1545969466', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('322', '6320288497728', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581679.jpg?v=1545969442', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('323', '6320293904448', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581686.jpg?v=1545969452', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('324', '6320297771072', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581689.jpg?v=1545969458', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('325', '6320299573312', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581688.jpg?v=1545969460', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('326', '6320300490816', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581694.jpg?v=1545969461', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('327', '6320301211712', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581692.jpg?v=1545969463', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('328', '6320303800384', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581690.jpg?v=1545969466', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('329', '6320305045568', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581693.jpg?v=1545969467', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('330', '6320308224064', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581685.jpg?v=1545969471', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('331', '6320308977728', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581687.jpg?v=1545969473', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('332', '6320309764160', '24', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581691.jpg?v=1545969473', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('333', '6317456425024', '24', '2049575125056', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/putting-on-your-shoes_925x_5810c0f7-a48b-496d-96f6-e9615d5811c0.jpg?v=1545965263', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('334', '6317453574208', '24', '2049574142016', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/woman-outside-brownstone_925x_73111363-9125-477d-bf42-c1c60d62bebb.jpg?v=1545965257', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('335', '6320282697792', '24', '2050359590976', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-871093034.jpg?v=1545969435', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('336', '6320292954176', '24', '2050359590976', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-871093049.jpg?v=1545969449', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('337', '6320303571008', '24', '2050359590976', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-871093041.jpg?v=1545969466', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('338', '6317485162560', '24', '2049582399552', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-hand-moon-bracelet-_925x_71194756-1437-46f9-aaf0-240a4c421c73.jpg?v=1545965319', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('339', '6317485195328', '24', '2049582399552', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/moon-friendship-bracelet_925x_36e519df-538f-4146-966f-e906183a1fa8.jpg?v=1545965319', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('340', '6317485260864', '24', '2049582399552', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-hand-charm-bracelet_925x_0158220a-6c14-4453-a6a1-d8a18ba1a2d6.jpg?v=1545965319', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('341', '6317450100800', '24', '2049573421120', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/mens-fall-fashion-jacket_925x_cc77df96-e52b-4bf2-8f5c-59916e921659.jpg?v=1545965252', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('342', '6320283287616', '24', '2050360475712', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-512609858.jpg?v=1545969435', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('343', '6320290922560', '24', '2050360475712', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-646409315.jpg?v=1545969446', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('344', '6320306323520', '24', '2050360475712', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-512609871.jpg?v=1545969469', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('345', '6317442072640', '24', '2049571749952', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-man-in-bright-fashion_925x_04f86403-19c2-481b-94d1-692bbe6df7d8.jpg?v=1545965241', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('346', '6317454688320', '24', '2049574633536', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/urban-fashion_925x_c2ee59e2-b3c4-40aa-b61e-157289e44462.jpg?v=1545965260', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('347', '6320283451456', '24', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-439946085.jpg?v=1545969435', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('348', '6320291020864', '24', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-439946090.jpg?v=1545969446', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('349', '6320300359744', '24', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-485842882.jpg?v=1545969461', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('350', '6320300720192', '24', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-439946088.jpg?v=1545969462', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('351', '6320301604928', '24', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-439946091.jpg?v=1545969463', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('352', '6320307830848', '24', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-840252451.jpg?v=1545969471', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('353', '6317493747776', '24', '2049584037952', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/pretty-gold-necklace_925x_5ae3c9e3-6033-450c-bfdf-4ad5f0f4c221.jpg?v=1545965331', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('354', '6317493780544', '24', '2049584037952', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/necklace-earrings-set_925x_5a93b7e5-bbe4-4912-864d-85280b4a5323.jpg?v=1545965331', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('355', '6317493813312', '24', '2049584037952', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/inspired-woman_925x_96a1c423-4f8c-4b57-b6fd-828b402674f4.jpg?v=1545965331', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('356', '6317455507520', '24', '2049574895680', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-red-t-shirt_925x_d5f50500-7697-4a2a-9202-6fdf6ae8bfab.jpg?v=1545965261', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('357', '6320282730560', '24', '2050360442944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-477047228.jpg?v=1545969435', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('358', '6320290463808', '24', '2050360442944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-477047232.jpg?v=1545969445', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('359', '6320297672768', '24', '2050360442944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-477047235.jpg?v=1545969458', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('360', '6320301080640', '24', '2050360442944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-477047234.jpg?v=1545969462', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('361', '6320280862784', '24', '2050359296064', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-447851640.jpg?v=1545969432', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('362', '6320296591424', '24', '2050359296064', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-447851646.jpg?v=1545969457', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('363', '6320298229824', '24', '2050359296064', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-447851645.jpg?v=1545969459', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('364', '6320301146176', '24', '2050359296064', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-447851647.jpg?v=1545969463', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('365', '6320285089856', '24', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305372.jpg?v=1545969437', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('366', '6320296788032', '24', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305382.jpg?v=1545969457', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('367', '6320297902144', '24', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305381.jpg?v=1545969458', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('368', '6320299704384', '24', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305378.jpg?v=1545969460', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('369', '6320305078336', '24', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305379.jpg?v=1545969467', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('370', '6320305569856', '24', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305380.jpg?v=1545969468', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('371', '6320280666176', '24', '2050359459904', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-432009886.jpg?v=1545969432', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('372', '6317453377600', '24', '2049574043712', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-hip-woman-at-carnival_925x_3c7de648-c85c-414d-96f0-15b42a1bf342.jpg?v=1545965256', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('373', '6317494829120', '24', '2049584267328', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/silver-threader-necklace_925x_947d350a-2875-4ab6-b2bf-e505a0edbc84.jpg?v=1545965333', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('374', '6317494894656', '24', '2049584267328', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/threader-necklace-closeup_925x_083849e0-2415-419b-bfc2-ee7041fa1cee.jpg?v=1545965333', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('375', '6317451739200', '24', '2049573584960', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/smiling-woman-on-snowy-afternoon_925x_24faa436-4a6c-4dc0-97c9-a067883694cd.jpg?v=1545965254', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('376', '6317448134720', '24', '2049572929600', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/striped-blouse-fashion_925x_73a8e6fd-84ab-4e8c-bde7-7288ee00b33f.jpg?v=1545965250', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('377', '6317456130112', '24', '2049575026752', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/woman-in-the-city_925x_0ecc69b2-ff35-46b7-88fa-9a3d27210dd0.jpg?v=1545965262', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `images` VALUES ('378', '6317495255104', '24', '2049584595008', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/stylish-summer-necklace_925x_a9381b07-439c-4131-bea3-a6fa1e40df15.jpg?v=1545965334', '2019-01-21 04:12:45', '2019-01-21 04:12:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plans
-- ----------------------------
INSERT INTO `plans` VALUES ('2', '1', 'Demo', '5.00', '10.00', 'Demo terms', '1', '1', '1', null, null);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shopify_product` varchar(50) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `title` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `handle` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('101', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', '2018-new-arrival-womens-lace-panties-seamless-panty-briefs-high-quality-fashion-cotton-low-waist-underwear-intimates-drop-ship', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('102', '2049578270784', '24', '7 Shakra Bracelet', 'chain-bracelet', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('103', '2049578664000', '24', 'Anchor Bracelet Mens', 'leather-anchor', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('104', '2049578860608', '24', 'Bangle Bracelet', 'bangle-bracelet', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('105', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'best-sell-fashion-silk-underwear-men-lovely-cartoon-print-man-boxers-home-comfortable-underpants-soft-breathable-male-panties', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('106', '2049573748800', '24', 'Black Leather Bag', 'black-leather-bag', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('107', '2049574731840', '24', 'Blue Silk Tuxedo', 'blue-silk-tuxedo', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('108', '2049579122752', '24', 'Boho Bangle Bracelet', 'bangle-bracelet-with-feathers', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('109', '2049579417664', '24', 'Boho Earrings', 'boho-earrings', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('110', '2049574207552', '24', 'Chequered Red Shirt', 'chequered-red-shirt', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('111', '2049580236864', '24', 'Choker with Gold Pendant', 'choker-with-gold-pendant', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('112', '2049580433472', '24', 'Choker with Triangle', 'choker-with-triangle', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('113', '2050359689280', '24', 'Christmas Fashion Women Sexy  Racy  Underwear Spice Suit Temptation Underwear', 'christmas-fashion-women-sexy-racy-underwear-spice-suit-temptation-underwear', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('114', '2050359263296', '24', 'Christmas Fashion Women Sexy Muslin  Underwear Spice Suit Temptation Underwear', 'christmas-fashion-women-sexy-muslin-underwear-spice-suit-temptation-underwear', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('115', '2050359853120', '24', 'Christmas Fashion Women Sexy Muslin Underwear Spice Suit Temptation Underwear', 'christmas-fashion-women-sexy-muslin-underwear-spice-suit-temptation-underwear-1', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('116', '2049572995136', '24', 'Classic Leather Jacket', 'classic-leather-jacket', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('117', '2049572405312', '24', 'Classic Varsity Top', 'classic-varsity-top', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('118', '2049573224512', '24', 'Dark Denim Top', 'dark-denim-top', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('119', '2049581121600', '24', 'Dreamcatcher Pendant Necklace', 'dreamcatcher-pendant-necklace', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('120', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'fashion-sexy-panties-comfortable-briefs-exquisite-crotchless-shorts-solid-lingerie-sexy-hollow-out-underwear-women-dropshipping', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('121', '2049572831296', '24', 'Floral White Top', 'floral-white-top', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('122', '2049581285440', '24', 'Galaxy Earrings', 'galaxy-earrings', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('123', '2049581580352', '24', 'Gemstone Necklace', 'gemstone', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('124', '2049581744192', '24', 'Gold Bird Necklace', 'gold-bird-necklace', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('125', '2049581842496', '24', 'Gold Elephant Earrings', 'looped-earrings', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('126', '2049582071872', '24', 'Guardian Angel Earrings', 'guardian-angel-earrings', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('127', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'hot-sale-original-new-ultra-thin-women-seamless-traceless-2017-new-underwear-women-panties-briefs-mi', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('128', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', 'hot-sale-seamless-briefs-everyday-underwear-women-panties-traceless-raw-cut-hipster-pink-briefs-intimate-2017', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('129', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'ladies-underwear-woman-panties-sexy-lace-plus-size-panty-transparent-low-rise-cotton-briefs-intimates-new-hot-sale-dropshipping', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('130', '2049575125056', '24', 'LED High Tops', 'led-high-tops', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('131', '2049574142016', '24', 'Long Sleeve Cotton Top', 'longsleeve-cotton-top', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('132', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'mens-underwear-star-mesh-breathable-sexy-personality-high-fork-underwear', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('133', '2049582399552', '24', 'Moon Charm Bracelet', 'moon-charm-bracelet', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('134', '2049573421120', '24', 'Navy Sports Jacket', 'navy-sport-jacket', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('135', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'new-brand-men-underwear-cotton-boxer-shorts-underpants-sexy-male-panty-mens-seamless-panties-shorts-man-lingerie-4pcs-lot-2017', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('136', '2049571749952', '24', 'Ocean Blue Shirt', 'ocean-blue-shirt', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('137', '2049574633536', '24', 'Olive Green Jacket', 'olive-green-jacket', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('138', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'plus-size-women-underwear-panties-ladies-seamless-y-briefs-floral-print-calcinhas-intimates-underpants-ropa', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('139', '2049584037952', '24', 'Pretty Gold Necklace', 'pretty-gold-necklace', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('140', '2049574895680', '24', 'Red Sports Tee', 'red-sports-tee', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('141', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 's-xl-newest-women-g-string-sexy-underwear-lace-panties-g-strings-transparent-super-thin-hollow-thongs-tangas-plus-size-fashion', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('142', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'sexy-g-string-women-lace-transprent-low-waist-thongs-underwear-briefs-2017-new-fashion-and-hot-sale-s', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('143', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'sexy-lace-panties-bowtie-panties-female-floral-lace-women-panties-breathable-briefs-ladies-low-waist-transparent-underwear', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('144', '2050359459904', '24', 'Sexy Women Tube Top Briefs Underwear Set Club Underwear', 'sexy-women-tube-top-briefs-underwear-set-club-underwear', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('145', '2049574043712', '24', 'Silk Summer Top', 'silk-summer-top', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('146', '2049584267328', '24', 'Silver Threader Necklace', 'silver-threader-necklace', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('147', '2049573584960', '24', 'Soft Winter Jacket', 'dark-winter-jacket', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('148', '2049572929600', '24', 'Striped Silk Blouse', 'striped-silk-blouse', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('149', '2049575026752', '24', 'Striped Skirt and Top', 'striped-skirt-and-top', '2019-01-21 04:12:45', '2019-01-21 04:12:45');
INSERT INTO `products` VALUES ('150', '2049584595008', '24', 'Stylish Summer Necklace', 'stylish-summer-neclace', '2019-01-21 04:12:45', '2019-01-21 04:12:45');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `product_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `product_font_style` enum('bold','italic','normal') NOT NULL,
  `product_font_color` varchar(255) NOT NULL,
  `amount_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `amount_font_style` enum('bold','italic','normal') NOT NULL,
  `amount_font_color` varchar(255) NOT NULL,
  `new_price_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `new_price_font_style` enum('bold','italic','normal') NOT NULL,
  `new_price_font_color` varchar(255) NOT NULL,
  `old_price_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `old_price_font_style` enum('bold','italic','normal') NOT NULL,
  `old_price_font_color` varchar(255) NOT NULL,
  `title_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `title_font_style` enum('bold','italic','normal') NOT NULL,
  `title_font_color` varchar(255) NOT NULL,
  `cart_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `cart_font_style` enum('bold','italic','normal') NOT NULL,
  `cart_font_color` varchar(255) NOT NULL,
  `back_ground_color` varchar(255) NOT NULL,
  `cart_text` varchar(255) NOT NULL,
  `product_text` varchar(255) NOT NULL,
  `active` int(11) NOT NULL,
  `show_product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', '24', '', 'italic', '#f36e22', 'verdana', 'italic', '#ff0000', 'verdana', 'italic', '#3a00ff', 'verdana', 'italic', '#2296F3', 'verdana', 'bold', '#8d33f9', 'verdana', 'italic', '#f9fafb', '#2296F3', 'Add bundle to cart', 'Frequently purchased products', '0', '9', '2019-01-23 10:39:46', '2019-01-23 03:39:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('24', 'sptapp.myshopify.com', '14067b363c63f4d5262233bf49aeaaf8', '15', null, null, '2019-01-21 10:48:57', '2019-01-21 03:48:57', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shop_owner
-- ----------------------------
INSERT INTO `shop_owner` VALUES ('15', 'sptapp', 'namdv@hamsa.vn', '', 'Ha Noi, Ha noi, Ha noi', '2018-12-28 02:14:04', '2018-12-28 02:14:04');

-- ----------------------------
-- Table structure for stats
-- ----------------------------
DROP TABLE IF EXISTS `stats`;
CREATE TABLE `stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `id_cart_rule` int(11) NOT NULL,
  `nb_view` int(11) NOT NULL DEFAULT '0',
  `nb_order` int(11) NOT NULL DEFAULT '0',
  `nb_sale` double(11,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stats
-- ----------------------------
INSERT INTO `stats` VALUES ('1', '23', '28', '1', '1', '24', '2019-01-18 10:51:28', '2019-01-18 10:51:32');
INSERT INTO `stats` VALUES ('2', '23', '29', '1', '3', '21', '2019-01-18 10:52:18', '2019-01-18 10:52:19');
INSERT INTO `stats` VALUES ('3', '23', '30', '200', '7', '888', '2019-01-18 10:52:21', '2019-01-18 10:52:22');
INSERT INTO `stats` VALUES ('4', '23', '28', '2', '2', '44', '2019-01-21 09:18:11', '2019-01-21 09:18:09');

-- ----------------------------
-- Table structure for variants
-- ----------------------------
DROP TABLE IF EXISTS `variants`;
CREATE TABLE `variants` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_variant` varchar(50) NOT NULL,
  `id_product` varchar(50) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `option1` varchar(250) DEFAULT NULL,
  `option2` varchar(250) DEFAULT NULL,
  `option3` varchar(250) DEFAULT NULL,
  `currency_code` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_image` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=896 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of variants
-- ----------------------------
INSERT INTO `variants` VALUES ('596', '19558430867520', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'black / S', '3', 'black', 'S', null, null, '99', '2019-01-21 04:12:45', '6320302522432', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('597', '19558430933056', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'black / M', '3', 'black', 'M', null, null, '96', '2019-01-21 04:12:45', '6320302522432', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('598', '19558430998592', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'black / L', '3', 'black', 'L', null, null, '98', '2019-01-21 04:12:45', '6320302522432', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('599', '19558431031360', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'black / XL', '3', 'black', 'XL', null, null, '96', '2019-01-21 04:12:45', '6320302522432', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('600', '19558431096896', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'blue / S', '3', 'blue', 'S', null, null, '99', '2019-01-21 04:12:45', '6320304029760', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('601', '19558431162432', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'blue / M', '3', 'blue', 'M', null, null, '97', '2019-01-21 04:12:45', '6320304029760', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('602', '19558431195200', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'blue / L', '3', 'blue', 'L', null, null, '97', '2019-01-21 04:12:45', '6320304029760', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('603', '19558431260736', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'blue / XL', '3', 'blue', 'XL', null, null, '98', '2019-01-21 04:12:45', '6320304029760', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('604', '19558431326272', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'khaki / S', '3', 'khaki', 'S', null, null, '99', '2019-01-21 04:12:45', '6320299737152', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('605', '19558431391808', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'khaki / M', '3', 'khaki', 'M', null, null, '99', '2019-01-21 04:12:45', '6320299737152', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('606', '19558431490112', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'khaki / L', '3', 'khaki', 'L', null, null, '99', '2019-01-21 04:12:45', '6320299737152', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('607', '19558431555648', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'khaki / XL', '3', 'khaki', 'XL', null, null, '98', '2019-01-21 04:12:45', '6320299737152', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('608', '19558431621184', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'winered / S', '3', 'winered', 'S', null, null, '99', '2019-01-21 04:12:45', '6320305635392', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('609', '19558431686720', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'winered / M', '3', 'winered', 'M', null, null, '99', '2019-01-21 04:12:45', '6320305635392', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('610', '19558431785024', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'winered / L', '3', 'winered', 'L', null, null, '98', '2019-01-21 04:12:45', '6320305635392', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('611', '19558431850560', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'winered / XL', '3', 'winered', 'XL', null, null, '98', '2019-01-21 04:12:45', '6320305635392', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('612', '19558431981632', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'purple / S', '3', 'purple', 'S', null, null, '99', '2019-01-21 04:12:45', '6320302325824', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('613', '19558432112704', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'purple / M', '3', 'purple', 'M', null, null, '99', '2019-01-21 04:12:45', '6320302325824', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('614', '19558432243776', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'purple / L', '3', 'purple', 'L', null, null, '99', '2019-01-21 04:12:45', '6320302325824', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('615', '19558432440384', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'purple / XL', '3', 'purple', 'XL', null, null, '99', '2019-01-21 04:12:45', '6320302325824', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('616', '19558432604224', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'white / S', '3', 'white', 'S', null, null, '99', '2019-01-21 04:12:45', '6320305963072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('617', '19558432768064', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'white / M', '3', 'white', 'M', null, null, '97', '2019-01-21 04:12:45', '6320305963072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('618', '19558432931904', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'white / L', '3', 'white', 'L', null, null, '98', '2019-01-21 04:12:45', '6320305963072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('619', '19558433095744', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'white / XL', '3', 'white', 'XL', null, null, '98', '2019-01-21 04:12:45', '6320305963072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('620', '19558433194048', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'Random Color / S', '2', 'Random Color', 'S', null, null, '99', '2019-01-21 04:12:45', '6320306126912', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('621', '19558433325120', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'Random Color / M', '3', 'Random Color', 'M', null, null, '99', '2019-01-21 04:12:45', '6320306126912', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('622', '19558433456192', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'Random Color / L', '3', 'Random Color', 'L', null, null, '99', '2019-01-21 04:12:45', '6320306126912', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('623', '19558433685568', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'Random Color / XL', '3', 'Random Color', 'XL', null, null, '99', '2019-01-21 04:12:45', '6320306126912', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('624', '19558433783872', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'red / S', '3', 'red', 'S', null, null, '99', '2019-01-21 04:12:45', '6320305602624', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('625', '19558433882176', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'red / M', '3', 'red', 'M', null, null, '99', '2019-01-21 04:12:45', '6320305602624', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('626', '19558433914944', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'red / L', '3', 'red', 'L', null, null, '99', '2019-01-21 04:12:45', '6320305602624', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('627', '19558433980480', '2050359885888', '24', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'red / XL', '3', 'red', 'XL', null, null, '98', '2019-01-21 04:12:45', '6320305602624', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('628', '19552327630912', '2049578270784', '24', '7 Shakra Bracelet', 'Blue', '43', 'Blue', null, null, null, '1', '2019-01-21 04:12:45', '6317470384192', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('629', '19552327794752', '2049578270784', '24', '7 Shakra Bracelet', 'Black', '43', 'Black', null, null, null, '0', '2019-01-21 04:12:45', '6317470351424', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('630', '19552331792448', '2049578664000', '24', 'Anchor Bracelet Mens', 'Gold', '70', 'Gold', null, null, null, '1', '2019-01-21 04:12:45', '6317471825984', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('631', '19552331890752', '2049578664000', '24', 'Anchor Bracelet Mens', 'Silver', '55', 'Silver', null, null, null, '0', '2019-01-21 04:12:45', '6317471891520', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('632', '19552332972096', '2049578860608', '24', 'Bangle Bracelet', 'Default Title', '40', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317472546880', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('633', '19558428737600', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B1 1 piece / XL', '5', 'B1 1 piece', 'XL', null, null, '822', '2019-01-21 04:12:45', '6320300818496', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('634', '19558428803136', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B1 1 piece / XXL', '5', 'B1 1 piece', 'XXL', null, null, '768', '2019-01-21 04:12:45', '6320300818496', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('635', '19558428901440', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B1 1 piece / XXXL', '5', 'B1 1 piece', 'XXXL', null, null, '649', '2019-01-21 04:12:45', '6320300818496', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('636', '19558428999744', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B3 1 piece / XL', '5', 'B3 1 piece', 'XL', null, null, '769', '2019-01-21 04:12:45', '6320296624192', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('637', '19558429130816', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B3 1 piece / XXL', '5', 'B3 1 piece', 'XXL', null, null, '916', '2019-01-21 04:12:45', '6320296624192', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('638', '19558429327424', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B3 1 piece / XXXL', '5', 'B3 1 piece', 'XXXL', null, null, '832', '2019-01-21 04:12:45', '6320296624192', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('639', '19558429524032', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B4 1 piece / XL', '5', 'B4 1 piece', 'XL', null, null, '643', '2019-01-21 04:12:45', '6320300916800', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('640', '19558429655104', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B4 1 piece / XXL', '5', 'B4 1 piece', 'XXL', null, null, '818', '2019-01-21 04:12:45', '6320300916800', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('641', '19558429720640', '2050359656512', '24', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B4 1 piece / XXXL', '5', 'B4 1 piece', 'XXXL', null, null, '727', '2019-01-21 04:12:45', '6320300916800', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('642', '19552279396416', '2049573748800', '24', 'Black Leather Bag', 'Default Title', '30', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317452394560', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('643', '19552285130816', '2049574731840', '24', 'Blue Silk Tuxedo', 'Default Title', '70', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317455147072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('644', '19552333824064', '2049579122752', '24', 'Boho Bangle Bracelet', 'Default Title', '43', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317474021440', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('645', '19552335003712', '2049579417664', '24', 'Boho Earrings', 'Default Title', '28', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317475201088', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('646', '19552282673216', '2049574207552', '24', 'Chequered Red Shirt', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317453705280', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('647', '19552337887296', '2049580236864', '24', 'Choker with Gold Pendant', 'Default Title', '30', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317478084672', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('648', '19552339722304', '2049580433472', '24', 'Choker with Triangle', 'Default Title', '48', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317478412352', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('649', '19558427721792', '2050359689280', '24', 'Christmas Fashion Women Sexy  Racy  Underwear Spice Suit Temptation Underwear', 'Default Title', '9', 'Default Title', null, null, null, '50', '2019-01-21 04:12:45', '6320281223232', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('650', '19558426411072', '2050359263296', '24', 'Christmas Fashion Women Sexy Muslin  Underwear Spice Suit Temptation Underwear', 'Default Title', '8', 'Default Title', null, null, null, '285', '2019-01-21 04:12:45', '6320280698944', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('651', '19558428016704', '2050359853120', '24', 'Christmas Fashion Women Sexy Muslin Underwear Spice Suit Temptation Underwear', 'Default Title', '9', 'Default Title', null, null, null, '70', '2019-01-21 04:12:45', '6320281190464', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('652', '19552275464256', '2049572995136', '24', 'Classic Leather Jacket', 'Default Title', '80', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317448626240', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('653', '19552271138880', '2049572405312', '24', 'Classic Varsity Top', 'Small / yellow', '60', 'Small', 'yellow', null, null, '1', '2019-01-21 04:12:45', '6317444890688', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('654', '19552271171648', '2049572405312', '24', 'Classic Varsity Top', 'Medium / yellow', '60', 'Medium', 'yellow', null, null, '1', '2019-01-21 04:12:45', '6317444890688', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('655', '19552271204416', '2049572405312', '24', 'Classic Varsity Top', 'Large / yellow', '60', 'Large', 'yellow', null, null, '1', '2019-01-21 04:12:45', '6317444890688', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('656', '19552276938816', '2049573224512', '24', 'Dark Denim Top', 'Default Title', '60', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317449379904', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('657', '19552349749312', '2049581121600', '24', 'Dreamcatcher Pendant Necklace', 'Default Title', '24', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317481066560', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('658', '19558435127360', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'khaki / S', '3', 'khaki', 'S', null, null, '1958', '2019-01-21 04:12:45', '6320304390208', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('659', '19558435192896', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'khaki / M', '3', 'khaki', 'M', null, null, '1900', '2019-01-21 04:12:45', '6320304390208', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('660', '19558435258432', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'khaki / L', '3', 'khaki', 'L', null, null, '1851', '2019-01-21 04:12:45', '6320304390208', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('661', '19558435356736', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'khaki / XL', '3', 'khaki', 'XL', null, null, '1842', '2019-01-21 04:12:45', '6320304390208', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('662', '19558435422272', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'black / S', '3', 'black', 'S', null, null, '1902', '2019-01-21 04:12:45', '6320295215168', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('663', '19558435487808', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'black / M', '3', 'black', 'M', null, null, '1827', '2019-01-21 04:12:45', '6320295215168', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('664', '19558435553344', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'black / L', '3', 'black', 'L', null, null, '1767', '2019-01-21 04:12:45', '6320295215168', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('665', '19558435618880', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'black / XL', '3', 'black', 'XL', null, null, '1672', '2019-01-21 04:12:45', '6320295215168', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('666', '19558435651648', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'green / S', '3', 'green', 'S', null, null, '1937', '2019-01-21 04:12:45', '6320305799232', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('667', '19558435684416', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'green / M', '3', 'green', 'M', null, null, '1871', '2019-01-21 04:12:45', '6320305799232', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('668', '19558435717184', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'green / L', '3', 'green', 'L', null, null, '1816', '2019-01-21 04:12:45', '6320305799232', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('669', '19558435782720', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'green / XL', '3', 'green', 'XL', null, null, '1754', '2019-01-21 04:12:45', '6320305799232', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('670', '19558435848256', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'winred / S', '3', 'winred', 'S', null, null, '1958', '2019-01-21 04:12:45', '6320296132672', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('671', '19558435913792', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'winred / M', '3', 'winred', 'M', null, null, '1915', '2019-01-21 04:12:45', '6320296132672', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('672', '19558435946560', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'winred / L', '3', 'winred', 'L', null, null, '1888', '2019-01-21 04:12:45', '6320296132672', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('673', '19558436044864', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'winred / XL', '3', 'winred', 'XL', null, null, '1862', '2019-01-21 04:12:45', '6320296132672', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('674', '19558436077632', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'white / S', '3', 'white', 'S', null, null, '1952', '2019-01-21 04:12:45', '6320299376704', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('675', '19558436143168', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'white / M', '3', 'white', 'M', null, null, '1898', '2019-01-21 04:12:45', '6320299376704', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('676', '19558436175936', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'white / L', '3', 'white', 'L', null, null, '1875', '2019-01-21 04:12:45', '6320299376704', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('677', '19558436241472', '2050360705088', '24', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'white / XL', '3', 'white', 'XL', null, null, '1827', '2019-01-21 04:12:45', '6320299376704', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('678', '19552273268800', '2049572831296', '24', 'Floral White Top', 's / yellow', '75', 's', 'yellow', null, null, '1', '2019-01-21 04:12:45', '6317447381056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('679', '22346590552128', '2049572831296', '24', 'Floral White Top', 's / white', '75', 's', 'white', null, null, '0', '2019-01-21 04:12:45', '6317447381056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('680', '22346590781504', '2049572831296', '24', 'Floral White Top', 'm / yellow', '75', 'm', 'yellow', null, null, '0', '2019-01-21 04:12:45', '6317447381056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('681', '22346590978112', '2049572831296', '24', 'Floral White Top', 'm / white', '75', 'm', 'white', null, null, '0', '2019-01-21 04:12:45', '6317447381056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('682', '22346591141952', '2049572831296', '24', 'Floral White Top', 'l / yellow', '75', 'l', 'yellow', null, null, '0', '2019-01-21 04:12:45', '6317447381056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('683', '22346591338560', '2049572831296', '24', 'Floral White Top', 'l / white', '75', 'l', 'white', null, null, '0', '2019-01-21 04:12:45', '6317447381056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('684', '19552351682624', '2049581285440', '24', 'Galaxy Earrings', 'Default Title', '38', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317481361472', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('685', '19552352370752', '2049581580352', '24', 'Gemstone Necklace', 'Blue', '28', 'Blue', null, null, null, '1', '2019-01-21 04:12:45', '6317482967104', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('686', '19552352403520', '2049581580352', '24', 'Gemstone Necklace', 'Purple', '28', 'Purple', null, null, null, '0', '2019-01-21 04:12:45', '6317483065408', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('687', '19552354730048', '2049581744192', '24', 'Gold Bird Necklace', 'Default Title', '80', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317483753536', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('688', '19552355713088', '2049581842496', '24', 'Gold Elephant Earrings', 'Default Title', '55', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317483884608', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('689', '19552356139072', '2049582071872', '24', 'Guardian Angel Earrings', 'Default Title', '20', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317484441664', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('690', '19558435815488', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / S', '3', 'black', 'S', null, null, '1530', '2019-01-21 04:12:45', '6320296460352', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('691', '19558435881024', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / M', '3', 'black', 'M', null, null, '1232', '2019-01-21 04:12:45', '6320296460352', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('692', '19558436012096', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / L', '3', 'black', 'L', null, null, '1284', '2019-01-21 04:12:45', '6320296460352', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('693', '19558436110400', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / XL', '3', 'black', 'XL', null, null, '1371', '2019-01-21 04:12:45', '6320296460352', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('694', '19558436208704', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / S', '3', 'blue', 'S', null, null, '1907', '2019-01-21 04:12:45', '6320301015104', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('695', '19558436274240', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / M', '3', 'blue', 'M', null, null, '1809', '2019-01-21 04:12:45', '6320301015104', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('696', '19558436339776', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / L', '3', 'blue', 'L', null, null, '1823', '2019-01-21 04:12:45', '6320301015104', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('697', '19558436405312', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / XL', '3', 'blue', 'XL', null, null, '1802', '2019-01-21 04:12:45', '6320301015104', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('698', '19558436503616', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / S', '3', 'gray', 'S', null, null, '1894', '2019-01-21 04:12:45', '6320306520128', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('699', '19558436601920', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / M', '3', 'gray', 'M', null, null, '1797', '2019-01-21 04:12:45', '6320306520128', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('700', '19558436667456', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / L', '3', 'gray', 'L', null, null, '1779', '2019-01-21 04:12:45', '6320306520128', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('701', '19558436765760', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / XL', '3', 'gray', 'XL', null, null, '1796', '2019-01-21 04:12:45', '6320306520128', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('702', '19558436864064', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / S', '3', 'beige', 'S', null, null, '1742', '2019-01-21 04:12:45', '6320308650048', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('703', '19558436962368', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / M', '3', 'beige', 'M', null, null, '1629', '2019-01-21 04:12:45', '6320308650048', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('704', '19558437060672', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / L', '3', 'beige', 'L', null, null, '1681', '2019-01-21 04:12:45', '6320308650048', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('705', '19558437126208', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / XL', '3', 'beige', 'XL', null, null, '1666', '2019-01-21 04:12:45', '6320308650048', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('706', '19558437224512', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / S', '3', 'pink', 'S', null, null, '1882', '2019-01-21 04:12:45', '6320302194752', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('707', '19558437322816', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / M', '3', 'pink', 'M', null, null, '1736', '2019-01-21 04:12:45', '6320302194752', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('708', '19558437388352', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / L', '3', 'pink', 'L', null, null, '1794', '2019-01-21 04:12:45', '6320302194752', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('709', '19558437486656', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / XL', '3', 'pink', 'XL', null, null, '1758', '2019-01-21 04:12:45', '6320302194752', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('710', '19558437584960', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / S', '3', 'rose red', 'S', null, null, '1915', '2019-01-21 04:12:45', '6320301047872', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('711', '19558437683264', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / M', '3', 'rose red', 'M', null, null, '1835', '2019-01-21 04:12:45', '6320301047872', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('712', '19558437748800', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / L', '3', 'rose red', 'L', null, null, '1848', '2019-01-21 04:12:45', '6320301047872', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('713', '19558437847104', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / XL', '3', 'rose red', 'XL', null, null, '1813', '2019-01-21 04:12:45', '6320301047872', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('714', '19558437945408', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / S', '3', 'red', 'S', null, null, '1905', '2019-01-21 04:12:45', '6320291086400', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('715', '19558438010944', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / M', '3', 'red', 'M', null, null, '1817', '2019-01-21 04:12:45', '6320291086400', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('716', '19558438109248', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / L', '3', 'red', 'L', null, null, '1824', '2019-01-21 04:12:45', '6320291086400', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('717', '19558438174784', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / XL', '3', 'red', 'XL', null, null, '1794', '2019-01-21 04:12:45', '6320291086400', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('718', '19558438305856', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / S', '3', 'white', 'S', null, null, '1811', '2019-01-21 04:12:45', '6320299016256', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('719', '19558438404160', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / M', '3', 'white', 'M', null, null, '1689', '2019-01-21 04:12:45', '6320299016256', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('720', '19558438568000', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / L', '3', 'white', 'L', null, null, '1738', '2019-01-21 04:12:45', '6320299016256', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('721', '19558438699072', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / XL', '3', 'white', 'XL', null, null, '1751', '2019-01-21 04:12:45', '6320299016256', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('722', '19558438830144', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / S', '3', 'yellow', 'S', null, null, '1959', '2019-01-21 04:12:45', '6320298197056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('723', '19558438961216', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / M', '3', 'yellow', 'M', null, null, '1924', '2019-01-21 04:12:45', '6320298197056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('724', '19558439092288', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / L', '3', 'yellow', 'L', null, null, '1914', '2019-01-21 04:12:45', '6320298197056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('725', '19558439223360', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / XL', '3', 'yellow', 'XL', null, null, '1912', '2019-01-21 04:12:45', '6320298197056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('726', '19558439387200', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / S', '2', 'random color', 'S', null, null, '1984', '2019-01-21 04:12:45', '6320306454592', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('727', '19558439518272', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / M', '3', 'random color', 'M', null, null, '1946', '2019-01-21 04:12:45', '6320306454592', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('728', '19558439649344', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / L', '3', 'random color', 'L', null, null, '1955', '2019-01-21 04:12:45', '6320306454592', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('729', '19558439747648', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / XL', '3', 'random color', 'XL', null, null, '1963', '2019-01-21 04:12:45', '6320306454592', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('730', '19558439845952', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / XXL', '3', 'blue', 'XXL', null, null, '0', '2019-01-21 04:12:45', '6320301015104', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('731', '19558439944256', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / XXL', '3', 'pink', 'XXL', null, null, '0', '2019-01-21 04:12:45', '6320302194752', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('732', '19558440009792', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / XXL', '3', 'rose red', 'XXL', null, null, '0', '2019-01-21 04:12:45', '6320301047872', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('733', '19558440140864', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / XXL', '3', 'red', 'XXL', null, null, '0', '2019-01-21 04:12:45', '6320291086400', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('734', '19558440239168', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / XXL', '3', 'yellow', 'XXL', null, null, '0', '2019-01-21 04:12:45', '6320298197056', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('735', '19558440271936', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / XXL', '3', 'random color', 'XXL', null, null, '0', '2019-01-21 04:12:45', '6320306454592', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('736', '19558440304704', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / XXL', '3', 'black', 'XXL', null, null, '1594', '2019-01-21 04:12:45', '6320296460352', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('737', '19558440337472', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / XXL', '3', 'white', 'XXL', null, null, '1884', '2019-01-21 04:12:45', '6320299016256', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('738', '19558440370240', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / XXL', '3', 'beige', 'XXL', null, null, '1828', '2019-01-21 04:12:45', '6320308650048', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('739', '19558440403008', '2050359918656', '24', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / XXL', '3', 'gray', 'XXL', null, null, '1861', '2019-01-21 04:12:45', '6320306520128', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('740', '19558430539840', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 black / L', '3', '1 black', 'L', null, null, '3258', '2019-01-21 04:12:45', '6320291119168', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('741', '19558430572608', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 white / L', '3', '1 white', 'L', null, null, '4319', '2019-01-21 04:12:45', '6320304062528', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('742', '19558430638144', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 khaki / L', '3', '1 khaki', 'L', null, null, '4034', '2019-01-21 04:12:45', '6320299802688', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('743', '19558430703680', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 blue / L', '3', '1 blue', 'L', null, null, '3899', '2019-01-21 04:12:45', '6320291283008', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('744', '19558430736448', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 black / M', '3', '1 black', 'M', null, null, '2978', '2019-01-21 04:12:45', '6320291119168', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('745', '19558430769216', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 white / M', '3', '1 white', 'M', null, null, '4217', '2019-01-21 04:12:45', '6320304062528', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('746', '19558430801984', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 khaki / M', '3', '1 khaki', 'M', null, null, '3915', '2019-01-21 04:12:45', '6320299802688', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('747', '19558430834752', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 blue / M', '3', '1 blue', 'M', null, null, '3911', '2019-01-21 04:12:45', '6320291283008', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('748', '19558430900288', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 black / S', '3', '1 black', 'S', null, null, '3868', '2019-01-21 04:12:45', '6320291119168', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('749', '19558430965824', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 white / S', '3', '1 white', 'S', null, null, '4537', '2019-01-21 04:12:45', '6320304062528', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('750', '19558431064128', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 khaki / S', '3', '1 khaki', 'S', null, null, '4464', '2019-01-21 04:12:45', '6320299802688', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('751', '19558431129664', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 blue / S', '3', '1 blue', 'S', null, null, '4542', '2019-01-21 04:12:45', '6320291283008', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('752', '19558431227968', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 black / XL', '3', '1 black', 'XL', null, null, '3337', '2019-01-21 04:12:45', '6320291119168', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('753', '19558431293504', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 white / XL', '3', '1 white', 'XL', null, null, '4377', '2019-01-21 04:12:45', '6320304062528', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('754', '19558431424576', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 khaki / XL', '3', '1 khaki', 'XL', null, null, '4203', '2019-01-21 04:12:45', '6320299802688', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('755', '19558431522880', '2050360049728', '24', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 blue / XL', '3', '1 blue', 'XL', null, null, '3917', '2019-01-21 04:12:45', '6320291283008', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('756', '19558436372544', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / S', '3', '981 black', 'S', null, null, '1911', '2019-01-21 04:12:45', '6320308224064', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('757', '19558436438080', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / M', '3', '981 black', 'M', null, null, '1690', '2019-01-21 04:12:45', '6320308224064', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('758', '19558436470848', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / L', '3', '981 black', 'L', null, null, '1651', '2019-01-21 04:12:45', '6320308224064', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('759', '19558436536384', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / XL', '3', '981 black', 'XL', null, null, '1641', '2019-01-21 04:12:45', '6320308224064', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('760', '19558436569152', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / S', '3', '981blue', 'S', null, null, '1957', '2019-01-21 04:12:45', '6320293904448', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('761', '19558436634688', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / M', '3', '981blue', 'M', null, null, '1879', '2019-01-21 04:12:45', '6320293904448', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('762', '19558436700224', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / L', '3', '981blue', 'L', null, null, '1847', '2019-01-21 04:12:45', '6320293904448', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('763', '19558436732992', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / XL', '3', '981blue', 'XL', null, null, '1805', '2019-01-21 04:12:45', '6320293904448', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('764', '19558436798528', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / S', '3', '981khaki', 'S', null, null, '1961', '2019-01-21 04:12:45', '6320308977728', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('765', '19558436831296', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / M', '3', '981khaki', 'M', null, null, '1908', '2019-01-21 04:12:45', '6320308977728', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('766', '19558436896832', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / L', '3', '981khaki', 'L', null, null, '1870', '2019-01-21 04:12:45', '6320308977728', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('767', '19558436929600', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / XL', '3', '981khaki', 'XL', null, null, '1882', '2019-01-21 04:12:45', '6320308977728', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('768', '19558436995136', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / S', '3', '981pink', 'S', null, null, '1986', '2019-01-21 04:12:45', '6320299573312', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('769', '19558437027904', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / M', '3', '981pink', 'M', null, null, '1956', '2019-01-21 04:12:45', '6320299573312', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('770', '19558437093440', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / L', '3', '981pink', 'L', null, null, '1961', '2019-01-21 04:12:45', '6320299573312', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('771', '19558437158976', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / XL', '3', '981pink', 'XL', null, null, '1939', '2019-01-21 04:12:45', '6320299573312', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('772', '19558437191744', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / S', '3', '981purple', 'S', null, null, '1982', '2019-01-21 04:12:45', '6320297771072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('773', '19558437257280', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / M', '3', '981purple', 'M', null, null, '1926', '2019-01-21 04:12:45', '6320297771072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('774', '19558437290048', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / L', '3', '981purple', 'L', null, null, '1924', '2019-01-21 04:12:45', '6320297771072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('775', '19558437355584', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / XL', '3', '981purple', 'XL', null, null, '1910', '2019-01-21 04:12:45', '6320297771072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('776', '19558437421120', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / S', '3', '981 rosered', 'S', null, null, '1986', '2019-01-21 04:12:45', '6320303800384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('777', '19558437453888', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / M', '3', '981 rosered', 'M', null, null, '1956', '2019-01-21 04:12:45', '6320303800384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('778', '19558437519424', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / L', '3', '981 rosered', 'L', null, null, '1936', '2019-01-21 04:12:45', '6320303800384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('779', '19558437552192', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / XL', '3', '981 rosered', 'XL', null, null, '1946', '2019-01-21 04:12:45', '6320303800384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('780', '19558437617728', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / S', '3', '981white', 'S', null, null, '1952', '2019-01-21 04:12:45', '6320301211712', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('781', '19558437650496', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / M', '3', '981white', 'M', null, null, '1870', '2019-01-21 04:12:45', '6320301211712', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('782', '19558437716032', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / L', '3', '981white', 'L', null, null, '1841', '2019-01-21 04:12:45', '6320301211712', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('783', '19558437781568', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / XL', '3', '981white', 'XL', null, null, '1814', '2019-01-21 04:12:45', '6320301211712', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('784', '19558437814336', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / S', '2', '981 random colors', 'S', null, null, '1995', '2019-01-21 04:12:45', '6320305045568', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('785', '19558437879872', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / M', '3', '981 random colors', 'M', null, null, '1983', '2019-01-21 04:12:45', '6320305045568', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('786', '19558437912640', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / L', '3', '981 random colors', 'L', null, null, '1988', '2019-01-21 04:12:45', '6320305045568', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('787', '19558437978176', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / XL', '3', '981 random colors', 'XL', null, null, '1996', '2019-01-21 04:12:45', '6320305045568', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('788', '19558438043712', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / S', '3', '981red', 'S', null, null, '1982', '2019-01-21 04:12:45', '6320309764160', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('789', '19558438076480', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / M', '3', '981red', 'M', null, null, '1922', '2019-01-21 04:12:45', '6320309764160', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('790', '19558438142016', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / L', '3', '981red', 'L', null, null, '1892', '2019-01-21 04:12:45', '6320309764160', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('791', '19558438207552', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / XL', '3', '981red', 'XL', null, null, '1885', '2019-01-21 04:12:45', '6320309764160', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('792', '19558438273088', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / XXL', '3', '981 black', 'XXL', null, null, '1541', '2019-01-21 04:12:45', '6320308224064', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('793', '19558438338624', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / XXL', '3', '981blue', 'XXL', null, null, '1767', '2019-01-21 04:12:45', '6320293904448', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('794', '19558438436928', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / XXL', '3', '981khaki', 'XXL', null, null, '1852', '2019-01-21 04:12:45', '6320308977728', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('795', '19558438535232', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / XXL', '3', '981pink', 'XXL', null, null, '1920', '2019-01-21 04:12:45', '6320299573312', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('796', '19558438633536', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / XXL', '3', '981purple', 'XXL', null, null, '1845', '2019-01-21 04:12:45', '6320297771072', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('797', '19558438731840', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / XXL', '3', '981 rosered', 'XXL', null, null, '1924', '2019-01-21 04:12:45', '6320303800384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('798', '19558438797376', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / XXL', '3', '981red', 'XXL', null, null, '1825', '2019-01-21 04:12:45', '6320309764160', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('799', '19558438928448', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / XXL', '3', '981white', 'XXL', null, null, '1798', '2019-01-21 04:12:45', '6320301211712', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('800', '19558439026752', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / XXL', '3', '981 random colors', 'XXL', null, null, '1988', '2019-01-21 04:12:45', '6320305045568', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('801', '19558439125056', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / S', '2', 'leopard', 'S', null, null, '0', '2019-01-21 04:12:45', '6320300490816', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('802', '19558439190592', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / XL', '2', 'leopard', 'XL', null, null, '0', '2019-01-21 04:12:45', '6320300490816', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('803', '19558439321664', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / L', '2', 'leopard', 'L', null, null, '0', '2019-01-21 04:12:45', '6320300490816', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('804', '19558439452736', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / M', '2', 'leopard', 'M', null, null, '0', '2019-01-21 04:12:45', '6320300490816', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('805', '19558439551040', '2050360311872', '24', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / XXL', '2', 'leopard', 'XXL', null, null, '0', '2019-01-21 04:12:45', '6320300490816', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('806', '19552292962368', '2049575125056', '24', 'LED High Tops', 'Default Title', '80', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317456425024', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('807', '19552282050624', '2049574142016', '24', 'Long Sleeve Cotton Top', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317453574208', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('808', '19558427820096', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'Black / L', '12', 'Black', 'L', null, null, '100', '2019-01-21 04:12:45', '6320303571008', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('809', '19558427852864', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'Black / M', '12', 'Black', 'M', null, null, '100', '2019-01-21 04:12:45', '6320303571008', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('810', '19558427885632', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'Black / S', '12', 'Black', 'S', null, null, '100', '2019-01-21 04:12:45', '6320303571008', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('811', '19558427918400', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'Black / XL', '12', 'Black', 'XL', null, null, '100', '2019-01-21 04:12:45', '6320303571008', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('812', '19558427983936', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'White / L', '12', 'White', 'L', null, null, '100', '2019-01-21 04:12:45', '6320292954176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('813', '19558428049472', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'White / M', '12', 'White', 'M', null, null, '100', '2019-01-21 04:12:45', '6320292954176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('814', '19558428115008', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'White / S', '12', 'White', 'S', null, null, '100', '2019-01-21 04:12:45', '6320292954176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('815', '19558428180544', '2050359590976', '24', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'White / XL', '12', 'White', 'XL', null, null, '100', '2019-01-21 04:12:45', '6320292954176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('816', '19552357646400', '2049582399552', '24', 'Moon Charm Bracelet', 'Default Title', '48', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317485162560', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('817', '19552278249536', '2049573421120', '24', 'Navy Sports Jacket', 'Default Title', '60', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317450100800', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('818', '19558432276544', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'mix color / L', '28', 'mix color', 'L', null, null, '779', '2019-01-21 04:12:45', '6320306323520', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('819', '19558432473152', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'mix color / XL', '28', 'mix color', 'XL', null, null, '752', '2019-01-21 04:12:45', '6320306323520', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('820', '19558432636992', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'mix color / XXL', '28', 'mix color', 'XXL', null, null, '779', '2019-01-21 04:12:45', '6320306323520', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('821', '19558432833600', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'style 1 / L', '28', 'style 1', 'L', null, null, '0', '2019-01-21 04:12:45', '6320290922560', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('822', '19558433030208', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'style 1 / XL', '28', 'style 1', 'XL', null, null, '2', '2019-01-21 04:12:45', '6320290922560', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('823', '19558433259584', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'style 1 / XXL', '28', 'style 1', 'XXL', null, null, '0', '2019-01-21 04:12:45', '6320290922560', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('824', '19558433423424', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'mix color / XXXL', '28', 'mix color', 'XXXL', null, null, '0', '2019-01-21 04:12:45', '6320306323520', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('825', '19558433620032', '2050360475712', '24', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'style 1 / XXXL', '28', 'style 1', 'XXXL', null, null, '8', '2019-01-21 04:12:45', '6320290922560', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('826', '19552266190912', '2049571749952', '24', 'Ocean Blue Shirt', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317442072640', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('827', '19552283525184', '2049574633536', '24', 'Olive Green Jacket', 'Default Title', '65', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317454688320', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('828', '19558431359040', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Black / L', '3', 'Black', 'L', null, null, '1958', '2019-01-21 04:12:45', '6320300359744', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('829', '19558431457344', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Beige / L', '3', 'Beige', 'L', null, null, '1947', '2019-01-21 04:12:45', '6320300720192', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('830', '19558431588416', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Purple / L', '3', 'Purple', 'L', null, null, '1954', '2019-01-21 04:12:45', '6320291020864', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('831', '19558431653952', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Red / L', '3', 'Red', 'L', null, null, '1974', '2019-01-21 04:12:45', '6320301604928', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('832', '19558431752256', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Black / S', '3', 'Black', 'S', null, null, '0', '2019-01-21 04:12:45', '6320300359744', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('833', '19558431916096', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Beige / S', '3', 'Beige', 'S', null, null, '1990', '2019-01-21 04:12:45', '6320300720192', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('834', '19558432014400', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Purple / S', '3', 'Purple', 'S', null, null, '1988', '2019-01-21 04:12:45', '6320291020864', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('835', '19558432145472', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Red / S', '3', 'Red', 'S', null, null, '1993', '2019-01-21 04:12:45', '6320301604928', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('836', '19558432309312', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Black / XL', '3', 'Black', 'XL', null, null, '1905', '2019-01-21 04:12:45', '6320300359744', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('837', '19558432538688', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Beige / XL', '3', 'Beige', 'XL', null, null, '1928', '2019-01-21 04:12:45', '6320300720192', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('838', '19558432735296', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Purple / XL', '3', 'Purple', 'XL', null, null, '1945', '2019-01-21 04:12:45', '6320291020864', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('839', '19558432899136', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Red / XL', '3', 'Red', 'XL', null, null, '1961', '2019-01-21 04:12:45', '6320301604928', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('840', '19558433062976', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'random / S', '2', 'random', 'S', null, null, '0', '2019-01-21 04:12:45', '6320307830848', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('841', '19558433226816', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'random / L', '2', 'random', 'L', null, null, '0', '2019-01-21 04:12:45', '6320307830848', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('842', '19558433390656', '2050360213568', '24', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'random / XL', '2', 'random', 'XL', null, null, '0', '2019-01-21 04:12:45', '6320307830848', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('843', '19552372555840', '2049584037952', '24', 'Pretty Gold Necklace', 'Default Title', '45', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317493747776', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('844', '19552288440384', '2049574895680', '24', 'Red Sports Tee', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317455507520', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('845', '19558431719488', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Black / S', '2', 'Black', 'S', null, null, '1725', '2019-01-21 04:12:45', '6320290463808', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('846', '19558431817792', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Black / M', '2', 'Black', 'M', null, null, '1704', '2019-01-21 04:12:45', '6320290463808', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('847', '19558431883328', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Black / L', '2', 'Black', 'L', null, null, '1732', '2019-01-21 04:12:45', '6320290463808', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('848', '19558431948864', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Black / XL', '2', 'Black', 'XL', null, null, '1778', '2019-01-21 04:12:45', '6320290463808', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('849', '19558432079936', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Blue / S', '2', 'Blue', 'S', null, null, '1868', '2019-01-21 04:12:45', '6320301080640', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('850', '19558432211008', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Blue / M', '2', 'Blue', 'M', null, null, '1851', '2019-01-21 04:12:45', '6320301080640', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('851', '19558432407616', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Blue / L', '2', 'Blue', 'L', null, null, '1868', '2019-01-21 04:12:45', '6320301080640', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('852', '19558432571456', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Blue / XL', '2', 'Blue', 'XL', null, null, '1881', '2019-01-21 04:12:45', '6320301080640', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('853', '19558432702528', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'White / S', '2', 'White', 'S', null, null, '1855', '2019-01-21 04:12:45', '6320297672768', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('854', '19558432800832', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'White / M', '2', 'White', 'M', null, null, '1846', '2019-01-21 04:12:45', '6320297672768', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('855', '19558432964672', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'White / L', '2', 'White', 'L', null, null, '1867', '2019-01-21 04:12:45', '6320297672768', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('856', '19558433128512', '2050360442944', '24', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'White / XL', '2', 'White', 'XL', null, null, '1898', '2019-01-21 04:12:45', '6320297672768', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('857', '19558427164736', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'rose red / M', '3', 'rose red', 'M', null, null, '1651', '2019-01-21 04:12:45', '6320301146176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('858', '19558427197504', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'rose red / L', '3', 'rose red', 'L', null, null, '1686', '2019-01-21 04:12:45', '6320301146176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('859', '19558427230272', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'rose red / XL', '3', 'rose red', 'XL', null, null, '1787', '2019-01-21 04:12:45', '6320301146176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('860', '19558427263040', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'rose red / XXL', '3', 'rose red', 'XXL', null, null, '1764', '2019-01-21 04:12:45', '6320301146176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('861', '19558427295808', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'black / M', '3', 'black', 'M', null, null, '1423', '2019-01-21 04:12:45', '6320298229824', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('862', '19558427328576', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'black / L', '3', 'black', 'L', null, null, '1488', '2019-01-21 04:12:45', '6320298229824', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('863', '19558427361344', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'black / XL', '3', 'black', 'XL', null, null, '1581', '2019-01-21 04:12:45', '6320298229824', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('864', '19558427394112', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'black / XXL', '3', 'black', 'XXL', null, null, '1473', '2019-01-21 04:12:45', '6320298229824', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('865', '19558427426880', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'Sky blue / M', '3', 'Sky blue', 'M', null, null, '1399', '2019-01-21 04:12:45', '6320296591424', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('866', '19558427492416', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'Sky blue / L', '3', 'Sky blue', 'L', null, null, '1595', '2019-01-21 04:12:45', '6320296591424', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('867', '19558427525184', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'Sky blue / XL', '3', 'Sky blue', 'XL', null, null, '1649', '2019-01-21 04:12:45', '6320296591424', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('868', '19558427557952', '2050359296064', '24', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'Sky blue / XXL', '3', 'Sky blue', 'XXL', null, null, '1676', '2019-01-21 04:12:45', '6320296591424', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('869', '19558433718336', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Red / S', '2', 'Red', 'S', null, null, '845', '2019-01-21 04:12:45', '6320297902144', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('870', '19558433816640', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Red / XL', '2', 'Red', 'XL', null, null, '855', '2019-01-21 04:12:45', '6320297902144', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('871', '19558433947712', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Red / L', '2', 'Red', 'L', null, null, '849', '2019-01-21 04:12:45', '6320297902144', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('872', '19558434013248', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Red / M', '2', 'Red', 'M', null, null, '846', '2019-01-21 04:12:45', '6320297902144', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('873', '19558434046016', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Green / S', '2', 'Green', 'S', null, null, '784', '2019-01-21 04:12:45', '6320305078336', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('874', '19558434111552', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Green / XL', '2', 'Green', 'XL', null, null, '815', '2019-01-21 04:12:45', '6320305078336', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('875', '19558434242624', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Green / L', '2', 'Green', 'L', null, null, '794', '2019-01-21 04:12:45', '6320305078336', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('876', '19558434340928', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Green / M', '2', 'Green', 'M', null, null, '736', '2019-01-21 04:12:45', '6320305078336', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('877', '19558434406464', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Black / S', '2', 'Black', 'S', null, null, '694', '2019-01-21 04:12:45', '6320299704384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('878', '19558434504768', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Black / XL', '2', 'Black', 'XL', null, null, '722', '2019-01-21 04:12:45', '6320299704384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('879', '19558434603072', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Black / L', '2', 'Black', 'L', null, null, '683', '2019-01-21 04:12:45', '6320299704384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('880', '19558434701376', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Black / M', '2', 'Black', 'M', null, null, '623', '2019-01-21 04:12:45', '6320299704384', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('881', '19558434734144', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Khaki / S', '2', 'Khaki', 'S', null, null, '832', '2019-01-21 04:12:45', '6320305569856', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('882', '19558434766912', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Khaki / XL', '2', 'Khaki', 'XL', null, null, '887', '2019-01-21 04:12:45', '6320305569856', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('883', '19558434832448', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Khaki / L', '2', 'Khaki', 'L', null, null, '855', '2019-01-21 04:12:45', '6320305569856', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('884', '19558434897984', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Khaki / M', '2', 'Khaki', 'M', null, null, '827', '2019-01-21 04:12:45', '6320305569856', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('885', '19558434930752', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'White / S', '2', 'White', 'S', null, null, '764', '2019-01-21 04:12:45', '6320296788032', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('886', '19558434963520', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'White / XL', '2', 'White', 'XL', null, null, '847', '2019-01-21 04:12:45', '6320296788032', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('887', '19558434996288', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'White / L', '2', 'White', 'L', null, null, '768', '2019-01-21 04:12:45', '6320296788032', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('888', '19558435029056', '2050360344640', '24', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'White / M', '2', 'White', 'M', null, null, '740', '2019-01-21 04:12:45', '6320296788032', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('889', '19558427131968', '2050359459904', '24', 'Sexy Women Tube Top Briefs Underwear Set Club Underwear', 'Default Title', '10', 'Default Title', null, null, null, '70', '2019-01-21 04:12:45', '6320280666176', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('890', '19552281067584', '2049574043712', '24', 'Silk Summer Top', 'Default Title', '70', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317453377600', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('891', '19552374521920', '2049584267328', '24', 'Silver Threader Necklace', 'Default Title', '15', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317494829120', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('892', '19552278806592', '2049573584960', '24', 'Soft Winter Jacket', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317451739200', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('893', '19552274448448', '2049572929600', '24', 'Striped Silk Blouse', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317448134720', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('894', '19552291520576', '2049575026752', '24', 'Striped Skirt and Top', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317456130112', '2019-01-21 04:12:45');
INSERT INTO `variants` VALUES ('895', '19552376258624', '2049584595008', '24', 'Stylish Summer Necklace', 'Default Title', '45', 'Default Title', null, null, null, '1', '2019-01-21 04:12:45', '6317495255104', '2019-01-21 04:12:45');
