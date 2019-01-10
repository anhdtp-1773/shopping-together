/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-01-10 09:02:28
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart_rule
-- ----------------------------
INSERT INTO `cart_rule` VALUES ('45', '13', '2050359885888', 'a', '1', '2019-01-09 23:42:43', '2019-01-09 23:42:43');
INSERT INTO `cart_rule` VALUES ('46', '13', '2049573584960', 'a', '1', '2019-01-09 19:23:21', '2019-01-09 19:23:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart_rule_detail
-- ----------------------------
INSERT INTO `cart_rule_detail` VALUES ('31', '45', '13', '2050359885888', '0.00', '1.00', '1', '2019-01-09 23:42:49', '2019-01-09 23:42:49');
INSERT INTO `cart_rule_detail` VALUES ('32', '45', '13', '2049573421120', '0.00', '1.00', '0', '2019-01-09 23:42:50', '2019-01-09 23:42:50');
INSERT INTO `cart_rule_detail` VALUES ('33', '45', '13', '2049573584960', '0.00', '1.00', '0', '2019-01-09 23:42:53', '2019-01-09 23:42:53');
INSERT INTO `cart_rule_detail` VALUES ('34', '46', '13', '2049572831296', '0.00', '0.00', '1', '2019-01-09 19:23:21', '2019-01-09 19:23:21');
INSERT INTO `cart_rule_detail` VALUES ('35', '46', '13', '2049572929600', '0.00', '0.00', '0', '2019-01-09 19:23:21', '2019-01-09 19:23:21');
INSERT INTO `cart_rule_detail` VALUES ('36', '46', '13', '2049573584960', '0.00', '0.00', '0', '2019-01-09 19:23:21', '2019-01-09 19:23:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES ('4', '13', 'VND', '2019-01-09 16:39:26', '2019-01-09 16:39:26');
INSERT INTO `currency` VALUES ('5', '13', 'VND', '2019-01-09 16:54:17', '2019-01-09 16:54:17');
INSERT INTO `currency` VALUES ('6', '13', 'VND', '2019-01-09 16:54:30', '2019-01-09 16:54:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=1189 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1063', '6320286662720', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866574407.jpg?v=1545969439', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1064', '6320299737152', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190096.jpg?v=1545969460', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1065', '6320302325824', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190098.jpg?v=1545969465', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1066', '6320302522432', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190093.jpg?v=1545969465', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1067', '6320304029760', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190094.jpg?v=1545969466', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1068', '6320305602624', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190095.jpg?v=1545969468', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1069', '6320305635392', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190097.jpg?v=1545969468', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1070', '6320305963072', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190099.jpg?v=1545969469', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1071', '6320306126912', '13', '2050359885888', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-709190100.jpg?v=1545969469', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1072', '6317470351424', '13', '2049578270784', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/7-chakra-bracelet_925x_240c2ceb-11bf-43b6-8261-df7a33ba3b17.jpg?v=1545965290', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1073', '6317470384192', '13', '2049578270784', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/navy-blue-chakra-bracelet_925x_16f633a4-d758-4984-bf3e-73be1397897b.jpg?v=1545965290', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1074', '6317471825984', '13', '2049578664000', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/anchor-bracelet-mens_925x_7ae00987-86ca-416e-a589-8274a9a204e3.jpg?v=1545965292', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1075', '6317471891520', '13', '2049578664000', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/anchor-bracelet-for-men_925x_f20cc85c-deaa-4edf-b150-e8670265cb4f.jpg?v=1545965292', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1076', '6317471924288', '13', '2049578664000', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/leather-anchor-bracelet-for-men_925x_7d1f3d24-cc8a-4b92-b551-4ca6a30ce83d.jpg?v=1545965292', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1077', '6317472546880', '13', '2049578860608', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/bangle-bracelet-with-jewels_925x_e1c2d885-b589-436a-83e8-ec705f0271dd.jpg?v=1545965293', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1078', '6320282304576', '13', '2050359656512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-808262340.jpg?v=1545969434', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1079', '6320296624192', '13', '2050359656512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-808262347.jpg?v=1545969457', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1080', '6320300818496', '13', '2050359656512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-808262346.jpg?v=1545969462', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1081', '6320300916800', '13', '2050359656512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-808262348.jpg?v=1545969462', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1082', '6317452394560', '13', '2049573748800', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/black-bag-over-the-shoulder_925x_9e2f67db-762e-416e-8955-55e6fda64233.jpg?v=1545965254', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1083', '6317455147072', '13', '2049574731840', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/man-adjusts-blue-tuxedo-bowtie_925x_17c631fd-56ad-4934-818a-0a2d7d46946c.jpg?v=1545965261', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1084', '6317474021440', '13', '2049579122752', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/bangle-bracelet-with-feathers_925x_81ad2199-1603-4a17-a708-e29a8aa15f13.jpg?v=1545965295', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1085', '6317475201088', '13', '2049579417664', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/boho-earrings_925x_45439637-0c9c-4f8b-8193-f6a4a376bfe3.jpg?v=1545965298', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1086', '6317475233856', '13', '2049579417664', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/inspired-woman_925x_61e4b40f-e0cf-4a19-a600-7e041c779a30.jpg?v=1545965298', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1087', '6317475266624', '13', '2049579417664', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/necklace-earrings-set_925x_b3a8634c-7079-4aec-833b-65e186d12953.jpg?v=1545965298', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1088', '6317453705280', '13', '2049574207552', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/red-plaid-shirt_925x_a5654ad7-0148-4452-b866-b487d7781b27.jpg?v=1545965258', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1089', '6317478084672', '13', '2049580236864', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-with-gold-pendant_925x_fe79bb70-6c05-4dc8-8e45-7a03d8f3ae97.jpg?v=1545965304', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1090', '6317478117440', '13', '2049580236864', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-pendant-closeup_925x_e158c6b0-54a3-4582-b60e-9519dc9934c1.jpg?v=1545965304', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1091', '6317478412352', '13', '2049580433472', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-with-triangle_925x_c6dfd85c-bca8-4cd6-81f9-dac90faf19af.jpg?v=1545965305', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1092', '6320281223232', '13', '2050359689280', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-458921550.jpg?v=1545969433', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1093', '6320280698944', '13', '2050359263296', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-458921651.jpg?v=1545969432', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1094', '6320281190464', '13', '2050359853120', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-458921819.jpg?v=1545969433', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1095', '6317448626240', '13', '2049572995136', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/leather-jacket-and-tea_925x_269dd032-e933-4361-8098-edc5b4a7231a.jpg?v=1545965250', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1096', '6317444890688', '13', '2049572405312', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/casual-fashion-woman_925x_1ac60223-e02a-44f4-9e3f-c262930cda9e.jpg?v=1545965246', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1097', '6317449379904', '13', '2049573224512', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-female-models-denim_925x_e362e0ac-e514-499f-8bdc-25b729febbd2.jpg?v=1545965251', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1098', '6317481066560', '13', '2049581121600', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/dreamcatcher-pendant-necklace_925x_e98914ab-8e4b-432d-ae49-8de4413de325.jpg?v=1545965310', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1099', '6317481099328', '13', '2049581121600', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gold-dream-catcher-necklace_925x_71a5f402-c304-43ef-920e-a7251767d263.jpg?v=1545965310', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1100', '6320286990400', '13', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208523.jpg?v=1545969440', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1101', '6320295215168', '13', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208530.jpg?v=1545969454', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1102', '6320296132672', '13', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208532.jpg?v=1545969456', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1103', '6320299376704', '13', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208533.jpg?v=1545969460', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1104', '6320304390208', '13', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208529.jpg?v=1545969466', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1105', '6320305799232', '13', '2050360705088', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-822208531.jpg?v=1545969469', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1106', '6317447381056', '13', '2049572831296', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/city-woman-fashion_925x_2x_0b68d46a-709c-41f3-83b1-7cf73d973d92.jpg?v=1545965249', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1107', '6317481361472', '13', '2049581285440', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/galaxy-earrings_925x_4e492c2e-09b3-41dc-a6d9-2bb493d38a89.jpg?v=1545965311', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1108', '6317482967104', '13', '2049581580352', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/blue-gemstone-pendant_925x_f86c00a5-c789-4d9d-9310-b37e63fb1867.jpg?v=1545965313', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1109', '6317482999872', '13', '2049581580352', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gemstone-necklace_925x_1188293e-a279-446f-9cef-20c46daff5b0.jpg?v=1545965313', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1110', '6317483032640', '13', '2049581580352', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-necklace_925x_8ee8f1ab-9541-4505-8b19-21f4ab817f1b.jpg?v=1545965313', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1111', '6317483065408', '13', '2049581580352', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/purple-gemstone-necklace_925x_3c059fac-4ddb-450f-a0d9-e9add963744b.jpg?v=1545965313', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1112', '6317483753536', '13', '2049581744192', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gold-bird-necklace_925x_e391d5e6-7a38-4ef9-8b3e-12227d8def94.jpg?v=1545965315', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1113', '6317483884608', '13', '2049581842496', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/elephant-earrings_925x_479edb7c-c772-40ea-9c6a-1f7e6539d505.jpg?v=1545965315', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1114', '6317484441664', '13', '2049582071872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/guardian-angel-earrings_925x_c08b0015-fdb8-4ecf-b7b5-596c864da461.jpg?v=1545965317', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1115', '6317484474432', '13', '2049582071872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/guardian-angel-earring-closeup_925x_98aab569-9622-426b-b922-cc44038eae3e.jpg?v=1545965317', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1116', '6320288989248', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-393788798.jpg?v=1545969442', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1117', '6320291086400', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246604.jpg?v=1545969446', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1118', '6320296460352', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246598.jpg?v=1545969457', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1119', '6320298197056', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246606.jpg?v=1545969459', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1120', '6320299016256', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246605.jpg?v=1545969460', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1121', '6320301015104', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246599.jpg?v=1545969462', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1122', '6320301047872', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246603.jpg?v=1545969462', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1123', '6320302194752', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246602.jpg?v=1545969464', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1124', '6320306454592', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-381250648.jpg?v=1545969469', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1125', '6320306520128', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246600.jpg?v=1545969469', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1126', '6320308650048', '13', '2050359918656', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-422246601.jpg?v=1545969472', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1127', '6320283353152', '13', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-800341181.jpg?v=1545969435', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1128', '6320291119168', '13', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-732377583.jpg?v=1545969446', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1129', '6320291283008', '13', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-732377584.jpg?v=1545969446', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1130', '6320299802688', '13', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-732377585.jpg?v=1545969461', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1131', '6320304062528', '13', '2050360049728', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-732377586.jpg?v=1545969466', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1132', '6320288497728', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581679.jpg?v=1545969442', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1133', '6320293904448', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581686.jpg?v=1545969452', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1134', '6320297771072', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581689.jpg?v=1545969458', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1135', '6320299573312', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581688.jpg?v=1545969460', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1136', '6320300490816', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581694.jpg?v=1545969461', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1137', '6320301211712', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581692.jpg?v=1545969463', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1138', '6320303800384', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581690.jpg?v=1545969466', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1139', '6320305045568', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581693.jpg?v=1545969467', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1140', '6320308224064', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581685.jpg?v=1545969471', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1141', '6320308977728', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581687.jpg?v=1545969473', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1142', '6320309764160', '13', '2050360311872', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866581691.jpg?v=1545969473', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1143', '6317456425024', '13', '2049575125056', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/putting-on-your-shoes_925x_5810c0f7-a48b-496d-96f6-e9615d5811c0.jpg?v=1545965263', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1144', '6317453574208', '13', '2049574142016', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/woman-outside-brownstone_925x_73111363-9125-477d-bf42-c1c60d62bebb.jpg?v=1545965257', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1145', '6320282697792', '13', '2050359590976', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-871093034.jpg?v=1545969435', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1146', '6320292954176', '13', '2050359590976', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-871093049.jpg?v=1545969449', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1147', '6320303571008', '13', '2050359590976', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-871093041.jpg?v=1545969466', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1148', '6317485162560', '13', '2049582399552', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-hand-moon-bracelet-_925x_71194756-1437-46f9-aaf0-240a4c421c73.jpg?v=1545965319', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1149', '6317485195328', '13', '2049582399552', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/moon-friendship-bracelet_925x_36e519df-538f-4146-966f-e906183a1fa8.jpg?v=1545965319', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1150', '6317485260864', '13', '2049582399552', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-hand-charm-bracelet_925x_0158220a-6c14-4453-a6a1-d8a18ba1a2d6.jpg?v=1545965319', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1151', '6317450100800', '13', '2049573421120', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/mens-fall-fashion-jacket_925x_cc77df96-e52b-4bf2-8f5c-59916e921659.jpg?v=1545965252', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1152', '6320283287616', '13', '2050360475712', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-512609858.jpg?v=1545969435', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1153', '6320290922560', '13', '2050360475712', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-646409315.jpg?v=1545969446', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1154', '6320306323520', '13', '2050360475712', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-512609871.jpg?v=1545969469', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1155', '6317442072640', '13', '2049571749952', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-man-in-bright-fashion_925x_04f86403-19c2-481b-94d1-692bbe6df7d8.jpg?v=1545965241', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1156', '6317454688320', '13', '2049574633536', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/urban-fashion_925x_c2ee59e2-b3c4-40aa-b61e-157289e44462.jpg?v=1545965260', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1157', '6320283451456', '13', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-439946085.jpg?v=1545969435', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1158', '6320291020864', '13', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-439946090.jpg?v=1545969446', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1159', '6320300359744', '13', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-485842882.jpg?v=1545969461', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1160', '6320300720192', '13', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-439946088.jpg?v=1545969462', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1161', '6320301604928', '13', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-439946091.jpg?v=1545969463', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1162', '6320307830848', '13', '2050360213568', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-840252451.jpg?v=1545969471', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1163', '6317493747776', '13', '2049584037952', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/pretty-gold-necklace_925x_5ae3c9e3-6033-450c-bfdf-4ad5f0f4c221.jpg?v=1545965331', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1164', '6317493780544', '13', '2049584037952', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/necklace-earrings-set_925x_5a93b7e5-bbe4-4912-864d-85280b4a5323.jpg?v=1545965331', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1165', '6317493813312', '13', '2049584037952', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/inspired-woman_925x_96a1c423-4f8c-4b57-b6fd-828b402674f4.jpg?v=1545965331', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1166', '6317455507520', '13', '2049574895680', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-red-t-shirt_925x_d5f50500-7697-4a2a-9202-6fdf6ae8bfab.jpg?v=1545965261', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1167', '6320282730560', '13', '2050360442944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-477047228.jpg?v=1545969435', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1168', '6320290463808', '13', '2050360442944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-477047232.jpg?v=1545969445', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1169', '6320297672768', '13', '2050360442944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-477047235.jpg?v=1545969458', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1170', '6320301080640', '13', '2050360442944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-477047234.jpg?v=1545969462', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1171', '6320280862784', '13', '2050359296064', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-447851640.jpg?v=1545969432', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1172', '6320296591424', '13', '2050359296064', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-447851646.jpg?v=1545969457', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1173', '6320298229824', '13', '2050359296064', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-447851645.jpg?v=1545969459', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1174', '6320301146176', '13', '2050359296064', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-447851647.jpg?v=1545969463', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1175', '6320285089856', '13', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305372.jpg?v=1545969437', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1176', '6320296788032', '13', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305382.jpg?v=1545969457', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1177', '6320297902144', '13', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305381.jpg?v=1545969458', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1178', '6320299704384', '13', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305378.jpg?v=1545969460', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1179', '6320305078336', '13', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305379.jpg?v=1545969467', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1180', '6320305569856', '13', '2050360344640', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-870305380.jpg?v=1545969468', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1181', '6320280666176', '13', '2050359459904', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-432009886.jpg?v=1545969432', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1182', '6317453377600', '13', '2049574043712', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-hip-woman-at-carnival_925x_3c7de648-c85c-414d-96f0-15b42a1bf342.jpg?v=1545965256', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1183', '6317494829120', '13', '2049584267328', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/silver-threader-necklace_925x_947d350a-2875-4ab6-b2bf-e505a0edbc84.jpg?v=1545965333', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1184', '6317494894656', '13', '2049584267328', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/threader-necklace-closeup_925x_083849e0-2415-419b-bfc2-ee7041fa1cee.jpg?v=1545965333', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1185', '6317451739200', '13', '2049573584960', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/smiling-woman-on-snowy-afternoon_925x_24faa436-4a6c-4dc0-97c9-a067883694cd.jpg?v=1545965254', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1186', '6317448134720', '13', '2049572929600', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/striped-blouse-fashion_925x_73a8e6fd-84ab-4e8c-bde7-7288ee00b33f.jpg?v=1545965250', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1187', '6317456130112', '13', '2049575026752', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/woman-in-the-city_925x_0ecc69b2-ff35-46b7-88fa-9a3d27210dd0.jpg?v=1545965262', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `images` VALUES ('1188', '6317495255104', '13', '2049584595008', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/stylish-summer-necklace_925x_a9381b07-439c-4131-bea3-a6fa1e40df15.jpg?v=1545965334', '2019-01-09 16:41:05', '2019-01-09 16:41:05');

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
  `id_shop` int(11) DEFAULT NULL,
  `title` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `handle` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=631 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('581', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', '2018-new-arrival-womens-lace-panties-seamless-panty-briefs-high-quality-fashion-cotton-low-waist-underwear-intimates-drop-ship', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('582', '2049578270784', '13', '7 Shakra Bracelet', 'chain-bracelet', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('583', '2049578664000', '13', 'Anchor Bracelet Mens', 'leather-anchor', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('584', '2049578860608', '13', 'Bangle Bracelet', 'bangle-bracelet', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('585', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'best-sell-fashion-silk-underwear-men-lovely-cartoon-print-man-boxers-home-comfortable-underpants-soft-breathable-male-panties', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('586', '2049573748800', '13', 'Black Leather Bag', 'black-leather-bag', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('587', '2049574731840', '13', 'Blue Silk Tuxedo', 'blue-silk-tuxedo', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('588', '2049579122752', '13', 'Boho Bangle Bracelet', 'bangle-bracelet-with-feathers', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('589', '2049579417664', '13', 'Boho Earrings', 'boho-earrings', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('590', '2049574207552', '13', 'Chequered Red Shirt', 'chequered-red-shirt', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('591', '2049580236864', '13', 'Choker with Gold Pendant', 'choker-with-gold-pendant', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('592', '2049580433472', '13', 'Choker with Triangle', 'choker-with-triangle', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('593', '2050359689280', '13', 'Christmas Fashion Women Sexy  Racy  Underwear Spice Suit Temptation Underwear', 'christmas-fashion-women-sexy-racy-underwear-spice-suit-temptation-underwear', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('594', '2050359263296', '13', 'Christmas Fashion Women Sexy Muslin  Underwear Spice Suit Temptation Underwear', 'christmas-fashion-women-sexy-muslin-underwear-spice-suit-temptation-underwear', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('595', '2050359853120', '13', 'Christmas Fashion Women Sexy Muslin Underwear Spice Suit Temptation Underwear', 'christmas-fashion-women-sexy-muslin-underwear-spice-suit-temptation-underwear-1', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('596', '2049572995136', '13', 'Classic Leather Jacket', 'classic-leather-jacket', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('597', '2049572405312', '13', 'Classic Varsity Top', 'classic-varsity-top', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('598', '2049573224512', '13', 'Dark Denim Top', 'dark-denim-top', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('599', '2049581121600', '13', 'Dreamcatcher Pendant Necklace', 'dreamcatcher-pendant-necklace', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('600', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'fashion-sexy-panties-comfortable-briefs-exquisite-crotchless-shorts-solid-lingerie-sexy-hollow-out-underwear-women-dropshipping', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('601', '2049572831296', '13', 'Floral White Top', 'floral-white-top', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('602', '2049581285440', '13', 'Galaxy Earrings', 'galaxy-earrings', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('603', '2049581580352', '13', 'Gemstone Necklace', 'gemstone', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('604', '2049581744192', '13', 'Gold Bird Necklace', 'gold-bird-necklace', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('605', '2049581842496', '13', 'Gold Elephant Earrings', 'looped-earrings', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('606', '2049582071872', '13', 'Guardian Angel Earrings', 'guardian-angel-earrings', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('607', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'hot-sale-original-new-ultra-thin-women-seamless-traceless-2017-new-underwear-women-panties-briefs-mi', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('608', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', 'hot-sale-seamless-briefs-everyday-underwear-women-panties-traceless-raw-cut-hipster-pink-briefs-intimate-2017', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('609', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'ladies-underwear-woman-panties-sexy-lace-plus-size-panty-transparent-low-rise-cotton-briefs-intimates-new-hot-sale-dropshipping', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('610', '2049575125056', '13', 'LED High Tops', 'led-high-tops', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('611', '2049574142016', '13', 'Long Sleeve Cotton Top', 'longsleeve-cotton-top', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('612', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'mens-underwear-star-mesh-breathable-sexy-personality-high-fork-underwear', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('613', '2049582399552', '13', 'Moon Charm Bracelet', 'moon-charm-bracelet', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('614', '2049573421120', '13', 'Navy Sports Jacket', 'navy-sport-jacket', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('615', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'new-brand-men-underwear-cotton-boxer-shorts-underpants-sexy-male-panty-mens-seamless-panties-shorts-man-lingerie-4pcs-lot-2017', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('616', '2049571749952', '13', 'Ocean Blue Shirt', 'ocean-blue-shirt', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('617', '2049574633536', '13', 'Olive Green Jacket', 'olive-green-jacket', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('618', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'plus-size-women-underwear-panties-ladies-seamless-y-briefs-floral-print-calcinhas-intimates-underpants-ropa', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('619', '2049584037952', '13', 'Pretty Gold Necklace', 'pretty-gold-necklace', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('620', '2049574895680', '13', 'Red Sports Tee', 'red-sports-tee', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('621', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 's-xl-newest-women-g-string-sexy-underwear-lace-panties-g-strings-transparent-super-thin-hollow-thongs-tangas-plus-size-fashion', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('622', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'sexy-g-string-women-lace-transprent-low-waist-thongs-underwear-briefs-2017-new-fashion-and-hot-sale-s', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('623', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'sexy-lace-panties-bowtie-panties-female-floral-lace-women-panties-breathable-briefs-ladies-low-waist-transparent-underwear', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('624', '2050359459904', '13', 'Sexy Women Tube Top Briefs Underwear Set Club Underwear', 'sexy-women-tube-top-briefs-underwear-set-club-underwear', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('625', '2049574043712', '13', 'Silk Summer Top', 'silk-summer-top', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('626', '2049584267328', '13', 'Silver Threader Necklace', 'silver-threader-necklace', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('627', '2049573584960', '13', 'Soft Winter Jacket', 'dark-winter-jacket', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('628', '2049572929600', '13', 'Striped Silk Blouse', 'striped-silk-blouse', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('629', '2049575026752', '13', 'Striped Skirt and Top', 'striped-skirt-and-top', '2019-01-09 16:41:05', '2019-01-09 16:41:05');
INSERT INTO `products` VALUES ('630', '2049584595008', '13', 'Stylish Summer Necklace', 'stylish-summer-neclace', '2019-01-09 16:41:05', '2019-01-09 16:41:05');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_font` varchar(255) NOT NULL,
  `product_style` varchar(255) NOT NULL,
  `product_size` varchar(255) NOT NULL,
  `product_color` varchar(255) NOT NULL,
  `product_image_width` int(11) NOT NULL,
  `product_imgae_height` int(11) NOT NULL,
  `amount_font` varchar(255) NOT NULL,
  `amount_style` varchar(255) NOT NULL,
  `amount_size` varchar(255) NOT NULL,
  `amount_color` varchar(255) NOT NULL,
  `new_price_font` varchar(255) NOT NULL,
  `new_price_style` varchar(255) NOT NULL,
  `new_price_size` varchar(255) NOT NULL,
  `new_price_color` varchar(255) NOT NULL,
  `old_price_font` varchar(255) NOT NULL,
  `old_price_style` varchar(255) NOT NULL,
  `old_price_size` varchar(255) NOT NULL,
  `old_price_color` varchar(255) NOT NULL,
  `title_font` varchar(255) NOT NULL,
  `title_style` varchar(255) NOT NULL,
  `title_size` varchar(255) NOT NULL,
  `title_color` varchar(255) NOT NULL,
  `cart_font` varchar(255) NOT NULL,
  `cart_style` varchar(255) NOT NULL,
  `cart_size` varchar(255) NOT NULL,
  `cart_color` varchar(255) NOT NULL,
  `cart_text` varchar(255) NOT NULL,
  `active` int(11) NOT NULL,
  `show_product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of setting
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `product_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `product_font_style` enum('bold','italic','normal') NOT NULL,
  `product_font_size` int(255) NOT NULL,
  `product_font_color` varchar(255) NOT NULL,
  `product_image_width` int(11) NOT NULL,
  `product_imgae_height` int(11) NOT NULL,
  `amount_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `amount_font_style` enum('bold','italic','normal') NOT NULL,
  `amount_font_size` varchar(255) NOT NULL,
  `amount_font_color` varchar(255) NOT NULL,
  `new_price_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `new_price_font_style` enum('bold','italic','normal') NOT NULL,
  `new_price_font_size` varchar(255) NOT NULL,
  `new_price_font_color` varchar(255) NOT NULL,
  `old_price_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `old_price_font_style` enum('bold','italic','normal') NOT NULL,
  `old_price_font_size` varchar(255) NOT NULL,
  `old_price_font_color` varchar(255) NOT NULL,
  `title_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `title_font_style` enum('bold','italic','normal') NOT NULL,
  `title_font_size` varchar(255) NOT NULL,
  `title_font_color` varchar(255) NOT NULL,
  `cart_font_family` enum('timesNewRoman','verdana','segoeUI','arial') NOT NULL,
  `cart_font_style` enum('bold','italic','normal') NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('2', '13', '', 'italic', '16', '#f36e22', '0', '0', 'verdana', '', '18', '#ff0000', 'verdana', 'italic', '18', '#3a00ff', 'verdana', 'italic', '18', '#2296F3', 'verdana', 'bold', '25', '#3a0085', 'verdana', 'italic', '25', '#2296F3', '#2296F3', '', '', '0', '4', '2019-01-10 00:59:53', '2019-01-10 00:59:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('13', 'sptapp.myshopify.com', '768fa34b2b096ff156b12d001508ed67', '15', null, null, '2019-01-09 23:39:26', '2019-01-09 16:39:26', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2951 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of variants
-- ----------------------------
INSERT INTO `variants` VALUES ('2656', '19558430867520', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'black / S', '3', 'black', 'S', null, null, '99', '2019-01-09 16:41:05', '6320302522432', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2657', '19558430933056', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'black / M', '3', 'black', 'M', null, null, '96', '2019-01-09 16:41:05', '6320302522432', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2658', '19558430998592', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'black / L', '3', 'black', 'L', null, null, '98', '2019-01-09 16:41:05', '6320302522432', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2659', '19558431031360', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'black / XL', '3', 'black', 'XL', null, null, '96', '2019-01-09 16:41:05', '6320302522432', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2660', '19558431096896', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'blue / S', '3', 'blue', 'S', null, null, '99', '2019-01-09 16:41:05', '6320304029760', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2661', '19558431162432', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'blue / M', '3', 'blue', 'M', null, null, '97', '2019-01-09 16:41:05', '6320304029760', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2662', '19558431195200', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'blue / L', '3', 'blue', 'L', null, null, '97', '2019-01-09 16:41:05', '6320304029760', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2663', '19558431260736', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'blue / XL', '3', 'blue', 'XL', null, null, '98', '2019-01-09 16:41:05', '6320304029760', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2664', '19558431326272', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'khaki / S', '3', 'khaki', 'S', null, null, '99', '2019-01-09 16:41:05', '6320299737152', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2665', '19558431391808', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'khaki / M', '3', 'khaki', 'M', null, null, '99', '2019-01-09 16:41:05', '6320299737152', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2666', '19558431490112', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'khaki / L', '3', 'khaki', 'L', null, null, '99', '2019-01-09 16:41:05', '6320299737152', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2667', '19558431555648', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'khaki / XL', '3', 'khaki', 'XL', null, null, '98', '2019-01-09 16:41:05', '6320299737152', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2668', '19558431621184', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'winered / S', '3', 'winered', 'S', null, null, '99', '2019-01-09 16:41:05', '6320305635392', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2669', '19558431686720', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'winered / M', '3', 'winered', 'M', null, null, '99', '2019-01-09 16:41:05', '6320305635392', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2670', '19558431785024', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'winered / L', '3', 'winered', 'L', null, null, '98', '2019-01-09 16:41:05', '6320305635392', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2671', '19558431850560', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'winered / XL', '3', 'winered', 'XL', null, null, '98', '2019-01-09 16:41:05', '6320305635392', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2672', '19558431981632', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'purple / S', '3', 'purple', 'S', null, null, '99', '2019-01-09 16:41:05', '6320302325824', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2673', '19558432112704', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'purple / M', '3', 'purple', 'M', null, null, '99', '2019-01-09 16:41:05', '6320302325824', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2674', '19558432243776', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'purple / L', '3', 'purple', 'L', null, null, '99', '2019-01-09 16:41:05', '6320302325824', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2675', '19558432440384', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'purple / XL', '3', 'purple', 'XL', null, null, '99', '2019-01-09 16:41:05', '6320302325824', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2676', '19558432604224', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'white / S', '3', 'white', 'S', null, null, '99', '2019-01-09 16:41:05', '6320305963072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2677', '19558432768064', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'white / M', '3', 'white', 'M', null, null, '97', '2019-01-09 16:41:05', '6320305963072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2678', '19558432931904', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'white / L', '3', 'white', 'L', null, null, '98', '2019-01-09 16:41:05', '6320305963072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2679', '19558433095744', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'white / XL', '3', 'white', 'XL', null, null, '98', '2019-01-09 16:41:05', '6320305963072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2680', '19558433194048', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'Random Color / S', '2', 'Random Color', 'S', null, null, '99', '2019-01-09 16:41:05', '6320306126912', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2681', '19558433325120', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'Random Color / M', '3', 'Random Color', 'M', null, null, '99', '2019-01-09 16:41:05', '6320306126912', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2682', '19558433456192', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'Random Color / L', '3', 'Random Color', 'L', null, null, '99', '2019-01-09 16:41:05', '6320306126912', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2683', '19558433685568', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'Random Color / XL', '3', 'Random Color', 'XL', null, null, '99', '2019-01-09 16:41:05', '6320306126912', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2684', '19558433783872', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'red / S', '3', 'red', 'S', null, null, '99', '2019-01-09 16:41:05', '6320305602624', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2685', '19558433882176', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'red / M', '3', 'red', 'M', null, null, '99', '2019-01-09 16:41:05', '6320305602624', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2686', '19558433914944', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'red / L', '3', 'red', 'L', null, null, '99', '2019-01-09 16:41:05', '6320305602624', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2687', '19558433980480', '2050359885888', '13', '2018 New arrival women\'s lace panties seamless panty briefs High Quality Fashion Cotton Low Waist underwear intimates drop ship', 'red / XL', '3', 'red', 'XL', null, null, '98', '2019-01-09 16:41:05', '6320305602624', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2688', '19552327630912', '2049578270784', '13', '7 Shakra Bracelet', 'Blue', '43', 'Blue', null, null, null, '1', '2019-01-09 16:41:05', '6317470384192', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2689', '19552327794752', '2049578270784', '13', '7 Shakra Bracelet', 'Black', '43', 'Black', null, null, null, '0', '2019-01-09 16:41:05', '6317470351424', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2690', '19552331792448', '2049578664000', '13', 'Anchor Bracelet Mens', 'Gold', '70', 'Gold', null, null, null, '1', '2019-01-09 16:41:05', '6317471825984', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2691', '19552331890752', '2049578664000', '13', 'Anchor Bracelet Mens', 'Silver', '55', 'Silver', null, null, null, '0', '2019-01-09 16:41:05', '6317471891520', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2692', '19552332972096', '2049578860608', '13', 'Bangle Bracelet', 'Default Title', '40', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2693', '19558428737600', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B1 1 piece / XL', '5', 'B1 1 piece', 'XL', null, null, '822', '2019-01-09 16:41:05', '6320300818496', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2694', '19558428803136', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B1 1 piece / XXL', '5', 'B1 1 piece', 'XXL', null, null, '768', '2019-01-09 16:41:05', '6320300818496', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2695', '19558428901440', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B1 1 piece / XXXL', '5', 'B1 1 piece', 'XXXL', null, null, '649', '2019-01-09 16:41:05', '6320300818496', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2696', '19558428999744', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B3 1 piece / XL', '5', 'B3 1 piece', 'XL', null, null, '769', '2019-01-09 16:41:05', '6320296624192', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2697', '19558429130816', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B3 1 piece / XXL', '5', 'B3 1 piece', 'XXL', null, null, '916', '2019-01-09 16:41:05', '6320296624192', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2698', '19558429327424', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B3 1 piece / XXXL', '5', 'B3 1 piece', 'XXXL', null, null, '832', '2019-01-09 16:41:05', '6320296624192', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2699', '19558429524032', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B4 1 piece / XL', '5', 'B4 1 piece', 'XL', null, null, '643', '2019-01-09 16:41:05', '6320300916800', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2700', '19558429655104', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B4 1 piece / XXL', '5', 'B4 1 piece', 'XXL', null, null, '818', '2019-01-09 16:41:05', '6320300916800', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2701', '19558429720640', '2050359656512', '13', 'Best Sell Fashion Silk Underwear Men Lovely Cartoon Print Man Boxers Home Comfortable Underpants Soft Breathable Male Panties', 'B4 1 piece / XXXL', '5', 'B4 1 piece', 'XXXL', null, null, '727', '2019-01-09 16:41:05', '6320300916800', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2702', '19552279396416', '2049573748800', '13', 'Black Leather Bag', 'Default Title', '30', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2703', '19552285130816', '2049574731840', '13', 'Blue Silk Tuxedo', 'Default Title', '70', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2704', '19552333824064', '2049579122752', '13', 'Boho Bangle Bracelet', 'Default Title', '43', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2705', '19552335003712', '2049579417664', '13', 'Boho Earrings', 'Default Title', '28', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2706', '19552282673216', '2049574207552', '13', 'Chequered Red Shirt', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2707', '19552337887296', '2049580236864', '13', 'Choker with Gold Pendant', 'Default Title', '30', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2708', '19552339722304', '2049580433472', '13', 'Choker with Triangle', 'Default Title', '48', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2709', '19558427721792', '2050359689280', '13', 'Christmas Fashion Women Sexy  Racy  Underwear Spice Suit Temptation Underwear', 'Default Title', '9', 'Default Title', null, null, null, '50', '2019-01-09 16:41:05', '6320281223232', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2710', '19558426411072', '2050359263296', '13', 'Christmas Fashion Women Sexy Muslin  Underwear Spice Suit Temptation Underwear', 'Default Title', '8', 'Default Title', null, null, null, '285', '2019-01-09 16:41:05', '6320280698944', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2711', '19558428016704', '2050359853120', '13', 'Christmas Fashion Women Sexy Muslin Underwear Spice Suit Temptation Underwear', 'Default Title', '9', 'Default Title', null, null, null, '70', '2019-01-09 16:41:05', '6320281190464', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2712', '19552275464256', '2049572995136', '13', 'Classic Leather Jacket', 'Default Title', '80', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2713', '19552271138880', '2049572405312', '13', 'Classic Varsity Top', 'Small', '60', 'Small', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2714', '19552271171648', '2049572405312', '13', 'Classic Varsity Top', 'Medium', '60', 'Medium', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2715', '19552271204416', '2049572405312', '13', 'Classic Varsity Top', 'Large', '60', 'Large', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2716', '19552276938816', '2049573224512', '13', 'Dark Denim Top', 'Default Title', '60', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2717', '19552349749312', '2049581121600', '13', 'Dreamcatcher Pendant Necklace', 'Default Title', '24', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2718', '19558435127360', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'khaki / S', '3', 'khaki', 'S', null, null, '1958', '2019-01-09 16:41:05', '6320304390208', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2719', '19558435192896', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'khaki / M', '3', 'khaki', 'M', null, null, '1900', '2019-01-09 16:41:05', '6320304390208', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2720', '19558435258432', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'khaki / L', '3', 'khaki', 'L', null, null, '1851', '2019-01-09 16:41:05', '6320304390208', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2721', '19558435356736', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'khaki / XL', '3', 'khaki', 'XL', null, null, '1842', '2019-01-09 16:41:05', '6320304390208', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2722', '19558435422272', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'black / S', '3', 'black', 'S', null, null, '1902', '2019-01-09 16:41:05', '6320295215168', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2723', '19558435487808', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'black / M', '3', 'black', 'M', null, null, '1827', '2019-01-09 16:41:05', '6320295215168', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2724', '19558435553344', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'black / L', '3', 'black', 'L', null, null, '1767', '2019-01-09 16:41:05', '6320295215168', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2725', '19558435618880', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'black / XL', '3', 'black', 'XL', null, null, '1672', '2019-01-09 16:41:05', '6320295215168', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2726', '19558435651648', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'green / S', '3', 'green', 'S', null, null, '1937', '2019-01-09 16:41:05', '6320305799232', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2727', '19558435684416', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'green / M', '3', 'green', 'M', null, null, '1871', '2019-01-09 16:41:05', '6320305799232', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2728', '19558435717184', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'green / L', '3', 'green', 'L', null, null, '1816', '2019-01-09 16:41:05', '6320305799232', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2729', '19558435782720', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'green / XL', '3', 'green', 'XL', null, null, '1754', '2019-01-09 16:41:05', '6320305799232', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2730', '19558435848256', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'winred / S', '3', 'winred', 'S', null, null, '1958', '2019-01-09 16:41:05', '6320296132672', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2731', '19558435913792', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'winred / M', '3', 'winred', 'M', null, null, '1915', '2019-01-09 16:41:05', '6320296132672', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2732', '19558435946560', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'winred / L', '3', 'winred', 'L', null, null, '1888', '2019-01-09 16:41:05', '6320296132672', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2733', '19558436044864', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'winred / XL', '3', 'winred', 'XL', null, null, '1862', '2019-01-09 16:41:05', '6320296132672', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2734', '19558436077632', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'white / S', '3', 'white', 'S', null, null, '1952', '2019-01-09 16:41:05', '6320299376704', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2735', '19558436143168', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'white / M', '3', 'white', 'M', null, null, '1898', '2019-01-09 16:41:05', '6320299376704', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2736', '19558436175936', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'white / L', '3', 'white', 'L', null, null, '1875', '2019-01-09 16:41:05', '6320299376704', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2737', '19558436241472', '2050360705088', '13', 'Fashion Sexy Panties Comfortable Briefs Exquisite Crotchless Shorts Solid Lingerie Sexy Hollow Out Underwear Women Dropshipping', 'white / XL', '3', 'white', 'XL', null, null, '1827', '2019-01-09 16:41:05', '6320299376704', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2738', '19552273268800', '2049572831296', '13', 'Floral White Top', 'Default Title', '75', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2739', '19552351682624', '2049581285440', '13', 'Galaxy Earrings', 'Default Title', '38', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2740', '19552352370752', '2049581580352', '13', 'Gemstone Necklace', 'Blue', '28', 'Blue', null, null, null, '1', '2019-01-09 16:41:05', '6317482967104', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2741', '19552352403520', '2049581580352', '13', 'Gemstone Necklace', 'Purple', '28', 'Purple', null, null, null, '0', '2019-01-09 16:41:05', '6317483065408', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2742', '19552354730048', '2049581744192', '13', 'Gold Bird Necklace', 'Default Title', '80', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2743', '19552355713088', '2049581842496', '13', 'Gold Elephant Earrings', 'Default Title', '55', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2744', '19552356139072', '2049582071872', '13', 'Guardian Angel Earrings', 'Default Title', '20', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2745', '19558435815488', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / S', '3', 'black', 'S', null, null, '1530', '2019-01-09 16:41:05', '6320296460352', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2746', '19558435881024', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / M', '3', 'black', 'M', null, null, '1232', '2019-01-09 16:41:05', '6320296460352', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2747', '19558436012096', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / L', '3', 'black', 'L', null, null, '1284', '2019-01-09 16:41:05', '6320296460352', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2748', '19558436110400', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / XL', '3', 'black', 'XL', null, null, '1371', '2019-01-09 16:41:05', '6320296460352', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2749', '19558436208704', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / S', '3', 'blue', 'S', null, null, '1907', '2019-01-09 16:41:05', '6320301015104', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2750', '19558436274240', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / M', '3', 'blue', 'M', null, null, '1809', '2019-01-09 16:41:05', '6320301015104', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2751', '19558436339776', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / L', '3', 'blue', 'L', null, null, '1823', '2019-01-09 16:41:05', '6320301015104', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2752', '19558436405312', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / XL', '3', 'blue', 'XL', null, null, '1802', '2019-01-09 16:41:05', '6320301015104', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2753', '19558436503616', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / S', '3', 'gray', 'S', null, null, '1894', '2019-01-09 16:41:05', '6320306520128', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2754', '19558436601920', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / M', '3', 'gray', 'M', null, null, '1797', '2019-01-09 16:41:05', '6320306520128', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2755', '19558436667456', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / L', '3', 'gray', 'L', null, null, '1779', '2019-01-09 16:41:05', '6320306520128', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2756', '19558436765760', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / XL', '3', 'gray', 'XL', null, null, '1796', '2019-01-09 16:41:05', '6320306520128', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2757', '19558436864064', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / S', '3', 'beige', 'S', null, null, '1742', '2019-01-09 16:41:05', '6320308650048', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2758', '19558436962368', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / M', '3', 'beige', 'M', null, null, '1629', '2019-01-09 16:41:05', '6320308650048', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2759', '19558437060672', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / L', '3', 'beige', 'L', null, null, '1681', '2019-01-09 16:41:05', '6320308650048', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2760', '19558437126208', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / XL', '3', 'beige', 'XL', null, null, '1666', '2019-01-09 16:41:05', '6320308650048', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2761', '19558437224512', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / S', '3', 'pink', 'S', null, null, '1882', '2019-01-09 16:41:05', '6320302194752', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2762', '19558437322816', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / M', '3', 'pink', 'M', null, null, '1736', '2019-01-09 16:41:05', '6320302194752', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2763', '19558437388352', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / L', '3', 'pink', 'L', null, null, '1794', '2019-01-09 16:41:05', '6320302194752', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2764', '19558437486656', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / XL', '3', 'pink', 'XL', null, null, '1758', '2019-01-09 16:41:05', '6320302194752', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2765', '19558437584960', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / S', '3', 'rose red', 'S', null, null, '1915', '2019-01-09 16:41:05', '6320301047872', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2766', '19558437683264', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / M', '3', 'rose red', 'M', null, null, '1835', '2019-01-09 16:41:05', '6320301047872', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2767', '19558437748800', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / L', '3', 'rose red', 'L', null, null, '1848', '2019-01-09 16:41:05', '6320301047872', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2768', '19558437847104', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / XL', '3', 'rose red', 'XL', null, null, '1813', '2019-01-09 16:41:05', '6320301047872', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2769', '19558437945408', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / S', '3', 'red', 'S', null, null, '1905', '2019-01-09 16:41:05', '6320291086400', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2770', '19558438010944', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / M', '3', 'red', 'M', null, null, '1817', '2019-01-09 16:41:05', '6320291086400', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2771', '19558438109248', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / L', '3', 'red', 'L', null, null, '1824', '2019-01-09 16:41:05', '6320291086400', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2772', '19558438174784', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / XL', '3', 'red', 'XL', null, null, '1794', '2019-01-09 16:41:05', '6320291086400', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2773', '19558438305856', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / S', '3', 'white', 'S', null, null, '1811', '2019-01-09 16:41:05', '6320299016256', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2774', '19558438404160', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / M', '3', 'white', 'M', null, null, '1689', '2019-01-09 16:41:05', '6320299016256', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2775', '19558438568000', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / L', '3', 'white', 'L', null, null, '1738', '2019-01-09 16:41:05', '6320299016256', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2776', '19558438699072', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / XL', '3', 'white', 'XL', null, null, '1751', '2019-01-09 16:41:05', '6320299016256', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2777', '19558438830144', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / S', '3', 'yellow', 'S', null, null, '1959', '2019-01-09 16:41:05', '6320298197056', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2778', '19558438961216', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / M', '3', 'yellow', 'M', null, null, '1924', '2019-01-09 16:41:05', '6320298197056', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2779', '19558439092288', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / L', '3', 'yellow', 'L', null, null, '1914', '2019-01-09 16:41:05', '6320298197056', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2780', '19558439223360', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / XL', '3', 'yellow', 'XL', null, null, '1912', '2019-01-09 16:41:05', '6320298197056', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2781', '19558439387200', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / S', '2', 'random color', 'S', null, null, '1984', '2019-01-09 16:41:05', '6320306454592', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2782', '19558439518272', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / M', '3', 'random color', 'M', null, null, '1946', '2019-01-09 16:41:05', '6320306454592', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2783', '19558439649344', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / L', '3', 'random color', 'L', null, null, '1955', '2019-01-09 16:41:05', '6320306454592', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2784', '19558439747648', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / XL', '3', 'random color', 'XL', null, null, '1963', '2019-01-09 16:41:05', '6320306454592', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2785', '19558439845952', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'blue / XXL', '3', 'blue', 'XXL', null, null, '0', '2019-01-09 16:41:05', '6320301015104', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2786', '19558439944256', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'pink / XXL', '3', 'pink', 'XXL', null, null, '0', '2019-01-09 16:41:05', '6320302194752', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2787', '19558440009792', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'rose red / XXL', '3', 'rose red', 'XXL', null, null, '0', '2019-01-09 16:41:05', '6320301047872', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2788', '19558440140864', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'red / XXL', '3', 'red', 'XXL', null, null, '0', '2019-01-09 16:41:05', '6320291086400', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2789', '19558440239168', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'yellow / XXL', '3', 'yellow', 'XXL', null, null, '0', '2019-01-09 16:41:05', '6320298197056', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2790', '19558440271936', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'random color / XXL', '3', 'random color', 'XXL', null, null, '0', '2019-01-09 16:41:05', '6320306454592', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2791', '19558440304704', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'black / XXL', '3', 'black', 'XXL', null, null, '1594', '2019-01-09 16:41:05', '6320296460352', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2792', '19558440337472', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'white / XXL', '3', 'white', 'XXL', null, null, '1884', '2019-01-09 16:41:05', '6320299016256', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2793', '19558440370240', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'beige / XXL', '3', 'beige', 'XXL', null, null, '1828', '2019-01-09 16:41:05', '6320308650048', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2794', '19558440403008', '2050359918656', '13', 'Hot sale Original New Ultra-thin Women Seamless Traceless 2017 New Underwear Women Panties Briefs mi', 'gray / XXL', '3', 'gray', 'XXL', null, null, '1861', '2019-01-09 16:41:05', '6320306520128', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2795', '19558430539840', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 black / L', '3', '1 black', 'L', null, null, '3258', '2019-01-09 16:41:05', '6320291119168', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2796', '19558430572608', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 white / L', '3', '1 white', 'L', null, null, '4319', '2019-01-09 16:41:05', '6320304062528', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2797', '19558430638144', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 khaki / L', '3', '1 khaki', 'L', null, null, '4034', '2019-01-09 16:41:05', '6320299802688', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2798', '19558430703680', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 blue / L', '3', '1 blue', 'L', null, null, '3899', '2019-01-09 16:41:05', '6320291283008', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2799', '19558430736448', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 black / M', '3', '1 black', 'M', null, null, '2978', '2019-01-09 16:41:05', '6320291119168', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2800', '19558430769216', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 white / M', '3', '1 white', 'M', null, null, '4217', '2019-01-09 16:41:05', '6320304062528', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2801', '19558430801984', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 khaki / M', '3', '1 khaki', 'M', null, null, '3915', '2019-01-09 16:41:05', '6320299802688', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2802', '19558430834752', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 blue / M', '3', '1 blue', 'M', null, null, '3911', '2019-01-09 16:41:05', '6320291283008', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2803', '19558430900288', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 black / S', '3', '1 black', 'S', null, null, '3868', '2019-01-09 16:41:05', '6320291119168', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2804', '19558430965824', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 white / S', '3', '1 white', 'S', null, null, '4537', '2019-01-09 16:41:05', '6320304062528', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2805', '19558431064128', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 khaki / S', '3', '1 khaki', 'S', null, null, '4464', '2019-01-09 16:41:05', '6320299802688', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2806', '19558431129664', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 blue / S', '3', '1 blue', 'S', null, null, '4542', '2019-01-09 16:41:05', '6320291283008', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2807', '19558431227968', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 black / XL', '3', '1 black', 'XL', null, null, '3337', '2019-01-09 16:41:05', '6320291119168', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2808', '19558431293504', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 white / XL', '3', '1 white', 'XL', null, null, '4377', '2019-01-09 16:41:05', '6320304062528', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2809', '19558431424576', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 khaki / XL', '3', '1 khaki', 'XL', null, null, '4203', '2019-01-09 16:41:05', '6320299802688', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2810', '19558431522880', '2050360049728', '13', 'Hot Sale Seamless Briefs Everyday Underwear Women Panties Traceless Raw-cut  Hipster Pink Briefs intimate 2017', '1 blue / XL', '3', '1 blue', 'XL', null, null, '3917', '2019-01-09 16:41:05', '6320291283008', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2811', '19558436372544', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / S', '3', '981 black', 'S', null, null, '1911', '2019-01-09 16:41:05', '6320308224064', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2812', '19558436438080', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / M', '3', '981 black', 'M', null, null, '1690', '2019-01-09 16:41:05', '6320308224064', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2813', '19558436470848', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / L', '3', '981 black', 'L', null, null, '1651', '2019-01-09 16:41:05', '6320308224064', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2814', '19558436536384', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / XL', '3', '981 black', 'XL', null, null, '1641', '2019-01-09 16:41:05', '6320308224064', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2815', '19558436569152', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / S', '3', '981blue', 'S', null, null, '1957', '2019-01-09 16:41:05', '6320293904448', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2816', '19558436634688', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / M', '3', '981blue', 'M', null, null, '1879', '2019-01-09 16:41:05', '6320293904448', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2817', '19558436700224', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / L', '3', '981blue', 'L', null, null, '1847', '2019-01-09 16:41:05', '6320293904448', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2818', '19558436732992', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / XL', '3', '981blue', 'XL', null, null, '1805', '2019-01-09 16:41:05', '6320293904448', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2819', '19558436798528', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / S', '3', '981khaki', 'S', null, null, '1961', '2019-01-09 16:41:05', '6320308977728', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2820', '19558436831296', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / M', '3', '981khaki', 'M', null, null, '1908', '2019-01-09 16:41:05', '6320308977728', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2821', '19558436896832', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / L', '3', '981khaki', 'L', null, null, '1870', '2019-01-09 16:41:05', '6320308977728', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2822', '19558436929600', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / XL', '3', '981khaki', 'XL', null, null, '1882', '2019-01-09 16:41:05', '6320308977728', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2823', '19558436995136', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / S', '3', '981pink', 'S', null, null, '1986', '2019-01-09 16:41:05', '6320299573312', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2824', '19558437027904', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / M', '3', '981pink', 'M', null, null, '1956', '2019-01-09 16:41:05', '6320299573312', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2825', '19558437093440', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / L', '3', '981pink', 'L', null, null, '1961', '2019-01-09 16:41:05', '6320299573312', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2826', '19558437158976', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / XL', '3', '981pink', 'XL', null, null, '1939', '2019-01-09 16:41:05', '6320299573312', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2827', '19558437191744', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / S', '3', '981purple', 'S', null, null, '1982', '2019-01-09 16:41:05', '6320297771072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2828', '19558437257280', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / M', '3', '981purple', 'M', null, null, '1926', '2019-01-09 16:41:05', '6320297771072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2829', '19558437290048', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / L', '3', '981purple', 'L', null, null, '1924', '2019-01-09 16:41:05', '6320297771072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2830', '19558437355584', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / XL', '3', '981purple', 'XL', null, null, '1910', '2019-01-09 16:41:05', '6320297771072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2831', '19558437421120', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / S', '3', '981 rosered', 'S', null, null, '1986', '2019-01-09 16:41:05', '6320303800384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2832', '19558437453888', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / M', '3', '981 rosered', 'M', null, null, '1956', '2019-01-09 16:41:05', '6320303800384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2833', '19558437519424', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / L', '3', '981 rosered', 'L', null, null, '1936', '2019-01-09 16:41:05', '6320303800384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2834', '19558437552192', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / XL', '3', '981 rosered', 'XL', null, null, '1946', '2019-01-09 16:41:05', '6320303800384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2835', '19558437617728', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / S', '3', '981white', 'S', null, null, '1952', '2019-01-09 16:41:05', '6320301211712', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2836', '19558437650496', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / M', '3', '981white', 'M', null, null, '1870', '2019-01-09 16:41:05', '6320301211712', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2837', '19558437716032', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / L', '3', '981white', 'L', null, null, '1841', '2019-01-09 16:41:05', '6320301211712', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2838', '19558437781568', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / XL', '3', '981white', 'XL', null, null, '1814', '2019-01-09 16:41:05', '6320301211712', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2839', '19558437814336', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / S', '2', '981 random colors', 'S', null, null, '1995', '2019-01-09 16:41:05', '6320305045568', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2840', '19558437879872', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / M', '3', '981 random colors', 'M', null, null, '1983', '2019-01-09 16:41:05', '6320305045568', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2841', '19558437912640', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / L', '3', '981 random colors', 'L', null, null, '1988', '2019-01-09 16:41:05', '6320305045568', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2842', '19558437978176', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / XL', '3', '981 random colors', 'XL', null, null, '1996', '2019-01-09 16:41:05', '6320305045568', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2843', '19558438043712', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / S', '3', '981red', 'S', null, null, '1982', '2019-01-09 16:41:05', '6320309764160', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2844', '19558438076480', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / M', '3', '981red', 'M', null, null, '1922', '2019-01-09 16:41:05', '6320309764160', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2845', '19558438142016', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / L', '3', '981red', 'L', null, null, '1892', '2019-01-09 16:41:05', '6320309764160', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2846', '19558438207552', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / XL', '3', '981red', 'XL', null, null, '1885', '2019-01-09 16:41:05', '6320309764160', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2847', '19558438273088', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 black / XXL', '3', '981 black', 'XXL', null, null, '1541', '2019-01-09 16:41:05', '6320308224064', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2848', '19558438338624', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981blue / XXL', '3', '981blue', 'XXL', null, null, '1767', '2019-01-09 16:41:05', '6320293904448', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2849', '19558438436928', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981khaki / XXL', '3', '981khaki', 'XXL', null, null, '1852', '2019-01-09 16:41:05', '6320308977728', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2850', '19558438535232', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981pink / XXL', '3', '981pink', 'XXL', null, null, '1920', '2019-01-09 16:41:05', '6320299573312', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2851', '19558438633536', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981purple / XXL', '3', '981purple', 'XXL', null, null, '1845', '2019-01-09 16:41:05', '6320297771072', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2852', '19558438731840', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 rosered / XXL', '3', '981 rosered', 'XXL', null, null, '1924', '2019-01-09 16:41:05', '6320303800384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2853', '19558438797376', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981red / XXL', '3', '981red', 'XXL', null, null, '1825', '2019-01-09 16:41:05', '6320309764160', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2854', '19558438928448', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981white / XXL', '3', '981white', 'XXL', null, null, '1798', '2019-01-09 16:41:05', '6320301211712', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2855', '19558439026752', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', '981 random colors / XXL', '3', '981 random colors', 'XXL', null, null, '1988', '2019-01-09 16:41:05', '6320305045568', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2856', '19558439125056', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / S', '2', 'leopard', 'S', null, null, '0', '2019-01-09 16:41:05', '6320300490816', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2857', '19558439190592', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / XL', '2', 'leopard', 'XL', null, null, '0', '2019-01-09 16:41:05', '6320300490816', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2858', '19558439321664', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / L', '2', 'leopard', 'L', null, null, '0', '2019-01-09 16:41:05', '6320300490816', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2859', '19558439452736', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / M', '2', 'leopard', 'M', null, null, '0', '2019-01-09 16:41:05', '6320300490816', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2860', '19558439551040', '2050360311872', '13', 'Ladies Underwear Woman Panties Sexy Lace Plus Size Panty Transparent Low-Rise Cotton Briefs Intimates New Hot Sale Dropshipping', 'leopard / XXL', '2', 'leopard', 'XXL', null, null, '0', '2019-01-09 16:41:05', '6320300490816', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2861', '19552292962368', '2049575125056', '13', 'LED High Tops', 'Default Title', '80', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2862', '19552282050624', '2049574142016', '13', 'Long Sleeve Cotton Top', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2863', '19558427820096', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'Black / L', '12', 'Black', 'L', null, null, '100', '2019-01-09 16:41:05', '6320303571008', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2864', '19558427852864', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'Black / M', '12', 'Black', 'M', null, null, '100', '2019-01-09 16:41:05', '6320303571008', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2865', '19558427885632', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'Black / S', '12', 'Black', 'S', null, null, '100', '2019-01-09 16:41:05', '6320303571008', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2866', '19558427918400', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'Black / XL', '12', 'Black', 'XL', null, null, '100', '2019-01-09 16:41:05', '6320303571008', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2867', '19558427983936', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'White / L', '12', 'White', 'L', null, null, '100', '2019-01-09 16:41:05', '6320292954176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2868', '19558428049472', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'White / M', '12', 'White', 'M', null, null, '100', '2019-01-09 16:41:05', '6320292954176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2869', '19558428115008', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'White / S', '12', 'White', 'S', null, null, '100', '2019-01-09 16:41:05', '6320292954176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2870', '19558428180544', '2050359590976', '13', 'Men\'s Underwear Star Mesh Breathable Sexy Personality High Fork Underwear', 'White / XL', '12', 'White', 'XL', null, null, '100', '2019-01-09 16:41:05', '6320292954176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2871', '19552357646400', '2049582399552', '13', 'Moon Charm Bracelet', 'Default Title', '48', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2872', '19552278249536', '2049573421120', '13', 'Navy Sports Jacket', 'Default Title', '60', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2873', '19558432276544', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'mix color / L', '28', 'mix color', 'L', null, null, '779', '2019-01-09 16:41:05', '6320306323520', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2874', '19558432473152', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'mix color / XL', '28', 'mix color', 'XL', null, null, '752', '2019-01-09 16:41:05', '6320306323520', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2875', '19558432636992', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'mix color / XXL', '28', 'mix color', 'XXL', null, null, '779', '2019-01-09 16:41:05', '6320306323520', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2876', '19558432833600', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'style 1 / L', '28', 'style 1', 'L', null, null, '0', '2019-01-09 16:41:05', '6320290922560', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2877', '19558433030208', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'style 1 / XL', '28', 'style 1', 'XL', null, null, '2', '2019-01-09 16:41:05', '6320290922560', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2878', '19558433259584', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'style 1 / XXL', '28', 'style 1', 'XXL', null, null, '0', '2019-01-09 16:41:05', '6320290922560', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2879', '19558433423424', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'mix color / XXXL', '28', 'mix color', 'XXXL', null, null, '0', '2019-01-09 16:41:05', '6320306323520', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2880', '19558433620032', '2050360475712', '13', 'New Brand men underwear cotton boxer shorts underpants sexy male panty mens seamless panties shorts man lingerie 4pcs/lot 2017', 'style 1 / XXXL', '28', 'style 1', 'XXXL', null, null, '8', '2019-01-09 16:41:05', '6320290922560', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2881', '19552266190912', '2049571749952', '13', 'Ocean Blue Shirt', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2882', '19552283525184', '2049574633536', '13', 'Olive Green Jacket', 'Default Title', '65', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2883', '19558431359040', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Black / L', '3', 'Black', 'L', null, null, '1958', '2019-01-09 16:41:05', '6320300359744', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2884', '19558431457344', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Beige / L', '3', 'Beige', 'L', null, null, '1947', '2019-01-09 16:41:05', '6320300720192', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2885', '19558431588416', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Purple / L', '3', 'Purple', 'L', null, null, '1954', '2019-01-09 16:41:05', '6320291020864', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2886', '19558431653952', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Red / L', '3', 'Red', 'L', null, null, '1974', '2019-01-09 16:41:05', '6320301604928', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2887', '19558431752256', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Black / S', '3', 'Black', 'S', null, null, '0', '2019-01-09 16:41:05', '6320300359744', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2888', '19558431916096', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Beige / S', '3', 'Beige', 'S', null, null, '1990', '2019-01-09 16:41:05', '6320300720192', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2889', '19558432014400', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Purple / S', '3', 'Purple', 'S', null, null, '1988', '2019-01-09 16:41:05', '6320291020864', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2890', '19558432145472', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Red / S', '3', 'Red', 'S', null, null, '1993', '2019-01-09 16:41:05', '6320301604928', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2891', '19558432309312', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Black / XL', '3', 'Black', 'XL', null, null, '1905', '2019-01-09 16:41:05', '6320300359744', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2892', '19558432538688', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Beige / XL', '3', 'Beige', 'XL', null, null, '1928', '2019-01-09 16:41:05', '6320300720192', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2893', '19558432735296', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Purple / XL', '3', 'Purple', 'XL', null, null, '1945', '2019-01-09 16:41:05', '6320291020864', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2894', '19558432899136', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'Red / XL', '3', 'Red', 'XL', null, null, '1961', '2019-01-09 16:41:05', '6320301604928', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2895', '19558433062976', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'random / S', '2', 'random', 'S', null, null, '0', '2019-01-09 16:41:05', '6320307830848', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2896', '19558433226816', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'random / L', '2', 'random', 'L', null, null, '0', '2019-01-09 16:41:05', '6320307830848', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2897', '19558433390656', '2050360213568', '13', 'Plus Size Women Underwear Panties Ladies Seamless y Briefs Floral Print Calcinhas Intimates Underpants Ropa', 'random / XL', '2', 'random', 'XL', null, null, '0', '2019-01-09 16:41:05', '6320307830848', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2898', '19552372555840', '2049584037952', '13', 'Pretty Gold Necklace', 'Default Title', '45', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2899', '19552288440384', '2049574895680', '13', 'Red Sports Tee', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2900', '19558431719488', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Black / S', '2', 'Black', 'S', null, null, '1725', '2019-01-09 16:41:05', '6320290463808', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2901', '19558431817792', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Black / M', '2', 'Black', 'M', null, null, '1704', '2019-01-09 16:41:05', '6320290463808', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2902', '19558431883328', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Black / L', '2', 'Black', 'L', null, null, '1732', '2019-01-09 16:41:05', '6320290463808', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2903', '19558431948864', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Black / XL', '2', 'Black', 'XL', null, null, '1778', '2019-01-09 16:41:05', '6320290463808', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2904', '19558432079936', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Blue / S', '2', 'Blue', 'S', null, null, '1868', '2019-01-09 16:41:05', '6320301080640', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2905', '19558432211008', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Blue / M', '2', 'Blue', 'M', null, null, '1851', '2019-01-09 16:41:05', '6320301080640', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2906', '19558432407616', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Blue / L', '2', 'Blue', 'L', null, null, '1868', '2019-01-09 16:41:05', '6320301080640', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2907', '19558432571456', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'Blue / XL', '2', 'Blue', 'XL', null, null, '1881', '2019-01-09 16:41:05', '6320301080640', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2908', '19558432702528', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'White / S', '2', 'White', 'S', null, null, '1855', '2019-01-09 16:41:05', '6320297672768', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2909', '19558432800832', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'White / M', '2', 'White', 'M', null, null, '1846', '2019-01-09 16:41:05', '6320297672768', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2910', '19558432964672', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'White / L', '2', 'White', 'L', null, null, '1867', '2019-01-09 16:41:05', '6320297672768', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2911', '19558433128512', '2050360442944', '13', 'S-XL Newest Women G String Sexy Underwear Lace Panties G-Strings Transparent Super Thin Hollow Thongs Tangas Plus Size Fashion', 'White / XL', '2', 'White', 'XL', null, null, '1898', '2019-01-09 16:41:05', '6320297672768', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2912', '19558427164736', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'rose red / M', '3', 'rose red', 'M', null, null, '1651', '2019-01-09 16:41:05', '6320301146176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2913', '19558427197504', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'rose red / L', '3', 'rose red', 'L', null, null, '1686', '2019-01-09 16:41:05', '6320301146176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2914', '19558427230272', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'rose red / XL', '3', 'rose red', 'XL', null, null, '1787', '2019-01-09 16:41:05', '6320301146176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2915', '19558427263040', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'rose red / XXL', '3', 'rose red', 'XXL', null, null, '1764', '2019-01-09 16:41:05', '6320301146176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2916', '19558427295808', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'black / M', '3', 'black', 'M', null, null, '1423', '2019-01-09 16:41:05', '6320298229824', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2917', '19558427328576', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'black / L', '3', 'black', 'L', null, null, '1488', '2019-01-09 16:41:05', '6320298229824', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2918', '19558427361344', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'black / XL', '3', 'black', 'XL', null, null, '1581', '2019-01-09 16:41:05', '6320298229824', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2919', '19558427394112', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'black / XXL', '3', 'black', 'XXL', null, null, '1473', '2019-01-09 16:41:05', '6320298229824', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2920', '19558427426880', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'Sky blue / M', '3', 'Sky blue', 'M', null, null, '1399', '2019-01-09 16:41:05', '6320296591424', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2921', '19558427492416', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'Sky blue / L', '3', 'Sky blue', 'L', null, null, '1595', '2019-01-09 16:41:05', '6320296591424', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2922', '19558427525184', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'Sky blue / XL', '3', 'Sky blue', 'XL', null, null, '1649', '2019-01-09 16:41:05', '6320296591424', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2923', '19558427557952', '2050359296064', '13', 'Sexy G String Women Lace Transprent Low Waist Thongs Underwear Briefs 2017 New Fashion and Hot Sale #S', 'Sky blue / XXL', '3', 'Sky blue', 'XXL', null, null, '1676', '2019-01-09 16:41:05', '6320296591424', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2924', '19558433718336', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Red / S', '2', 'Red', 'S', null, null, '845', '2019-01-09 16:41:05', '6320297902144', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2925', '19558433816640', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Red / XL', '2', 'Red', 'XL', null, null, '855', '2019-01-09 16:41:05', '6320297902144', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2926', '19558433947712', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Red / L', '2', 'Red', 'L', null, null, '849', '2019-01-09 16:41:05', '6320297902144', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2927', '19558434013248', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Red / M', '2', 'Red', 'M', null, null, '846', '2019-01-09 16:41:05', '6320297902144', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2928', '19558434046016', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Green / S', '2', 'Green', 'S', null, null, '784', '2019-01-09 16:41:05', '6320305078336', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2929', '19558434111552', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Green / XL', '2', 'Green', 'XL', null, null, '815', '2019-01-09 16:41:05', '6320305078336', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2930', '19558434242624', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Green / L', '2', 'Green', 'L', null, null, '794', '2019-01-09 16:41:05', '6320305078336', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2931', '19558434340928', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Green / M', '2', 'Green', 'M', null, null, '736', '2019-01-09 16:41:05', '6320305078336', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2932', '19558434406464', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Black / S', '2', 'Black', 'S', null, null, '694', '2019-01-09 16:41:05', '6320299704384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2933', '19558434504768', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Black / XL', '2', 'Black', 'XL', null, null, '722', '2019-01-09 16:41:05', '6320299704384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2934', '19558434603072', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Black / L', '2', 'Black', 'L', null, null, '683', '2019-01-09 16:41:05', '6320299704384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2935', '19558434701376', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Black / M', '2', 'Black', 'M', null, null, '623', '2019-01-09 16:41:05', '6320299704384', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2936', '19558434734144', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Khaki / S', '2', 'Khaki', 'S', null, null, '832', '2019-01-09 16:41:05', '6320305569856', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2937', '19558434766912', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Khaki / XL', '2', 'Khaki', 'XL', null, null, '887', '2019-01-09 16:41:05', '6320305569856', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2938', '19558434832448', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Khaki / L', '2', 'Khaki', 'L', null, null, '855', '2019-01-09 16:41:05', '6320305569856', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2939', '19558434897984', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'Khaki / M', '2', 'Khaki', 'M', null, null, '827', '2019-01-09 16:41:05', '6320305569856', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2940', '19558434930752', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'White / S', '2', 'White', 'S', null, null, '764', '2019-01-09 16:41:05', '6320296788032', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2941', '19558434963520', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'White / XL', '2', 'White', 'XL', null, null, '847', '2019-01-09 16:41:05', '6320296788032', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2942', '19558434996288', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'White / L', '2', 'White', 'L', null, null, '768', '2019-01-09 16:41:05', '6320296788032', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2943', '19558435029056', '2050360344640', '13', 'Sexy Lace Panties Bowtie Panties Female Floral Lace Women Panties Breathable Briefs Ladies Low Waist Transparent Underwear', 'White / M', '2', 'White', 'M', null, null, '740', '2019-01-09 16:41:05', '6320296788032', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2944', '19558427131968', '2050359459904', '13', 'Sexy Women Tube Top Briefs Underwear Set Club Underwear', 'Default Title', '10', 'Default Title', null, null, null, '70', '2019-01-09 16:41:05', '6320280666176', '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2945', '19552281067584', '2049574043712', '13', 'Silk Summer Top', 'Default Title', '70', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2946', '19552374521920', '2049584267328', '13', 'Silver Threader Necklace', 'Default Title', '15', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2947', '19552278806592', '2049573584960', '13', 'Soft Winter Jacket', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2948', '19552274448448', '2049572929600', '13', 'Striped Silk Blouse', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2949', '19552291520576', '2049575026752', '13', 'Striped Skirt and Top', 'Default Title', '50', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
INSERT INTO `variants` VALUES ('2950', '19552376258624', '2049584595008', '13', 'Stylish Summer Necklace', 'Default Title', '45', 'Default Title', null, null, null, '1', '2019-01-09 16:41:05', null, '2019-01-09 16:41:05');
