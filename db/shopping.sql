/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-01-04 09:46:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart_rule
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule`;
CREATE TABLE `cart_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart_rule
-- ----------------------------
INSERT INTO `cart_rule` VALUES ('1', '8', 'asdf', '1', '2019-01-03 17:49:57', '2019-01-03 17:49:57');
INSERT INTO `cart_rule` VALUES ('2', '8', 'asdf', '1', '2019-01-03 17:52:54', '2019-01-03 17:52:54');
INSERT INTO `cart_rule` VALUES ('3', '8', 'asdf', '1', '2019-01-03 17:55:21', '2019-01-03 17:55:21');
INSERT INTO `cart_rule` VALUES ('4', '8', 'asfd', '1', '2019-01-03 17:55:57', '2019-01-03 17:55:57');
INSERT INTO `cart_rule` VALUES ('5', '8', 'asdf', '1', '2019-01-03 17:56:54', '2019-01-03 17:56:54');
INSERT INTO `cart_rule` VALUES ('6', '8', 'adsf', '1', '2019-01-03 17:57:43', '2019-01-03 17:57:43');
INSERT INTO `cart_rule` VALUES ('7', '8', 'adsf', '1', '2019-01-03 17:58:46', '2019-01-03 17:58:46');
INSERT INTO `cart_rule` VALUES ('8', '8', 'asdf', '1', '2019-01-03 18:00:39', '2019-01-03 18:00:39');
INSERT INTO `cart_rule` VALUES ('9', '8', 'asdf', '1', '2019-01-03 18:01:47', '2019-01-03 18:01:47');
INSERT INTO `cart_rule` VALUES ('10', '8', 'adf', '1', '2019-01-03 18:02:56', '2019-01-03 18:02:56');
INSERT INTO `cart_rule` VALUES ('11', '8', 'asdfads', '1', '2019-01-03 18:04:34', '2019-01-03 18:04:34');
INSERT INTO `cart_rule` VALUES ('12', '8', 'adf', '1', '2019-01-03 18:04:47', '2019-01-03 18:04:47');
INSERT INTO `cart_rule` VALUES ('13', '8', 'asdf', '1', '2019-01-03 18:07:37', '2019-01-03 18:07:37');
INSERT INTO `cart_rule` VALUES ('14', '8', 'asdfasfd', '1', '2019-01-03 18:09:30', '2019-01-03 18:09:30');
INSERT INTO `cart_rule` VALUES ('15', '8', '123', '1', '2019-01-03 18:10:34', '2019-01-03 18:10:34');
INSERT INTO `cart_rule` VALUES ('16', '8', 'asdf', '1', '2019-01-03 18:11:18', '2019-01-03 18:11:18');
INSERT INTO `cart_rule` VALUES ('17', '8', 'asdf', '1', '2019-01-03 18:12:03', '2019-01-03 18:12:03');
INSERT INTO `cart_rule` VALUES ('18', '8', 'asdf', '1', '2019-01-03 18:12:53', '2019-01-03 18:12:53');
INSERT INTO `cart_rule` VALUES ('19', '8', 'asdf', '1', '2019-01-03 18:13:48', '2019-01-03 18:13:48');
INSERT INTO `cart_rule` VALUES ('20', '8', 'asdf', '1', '2019-01-03 18:14:17', '2019-01-03 18:14:17');
INSERT INTO `cart_rule` VALUES ('21', '8', 'asdf', '1', '2019-01-03 18:15:44', '2019-01-03 18:15:44');
INSERT INTO `cart_rule` VALUES ('22', '8', 'asdf', '1', '2019-01-03 18:16:24', '2019-01-03 18:16:24');
INSERT INTO `cart_rule` VALUES ('23', '8', 'nam', '1', '2019-01-03 18:18:24', '2019-01-03 18:18:24');
INSERT INTO `cart_rule` VALUES ('24', '8', 'asfd', '1', '2019-01-03 18:19:20', '2019-01-03 18:19:20');
INSERT INTO `cart_rule` VALUES ('25', '8', 'asdfas', '1', '2019-01-03 18:19:49', '2019-01-03 18:19:49');

-- ----------------------------
-- Table structure for cart_rule_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_detail`;
CREATE TABLE `cart_rule_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart_rule` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `id_main_product` varchar(50) NOT NULL DEFAULT '0',
  `id_related_product` varchar(50) NOT NULL DEFAULT '0',
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart_rule_detail
-- ----------------------------
INSERT INTO `cart_rule_detail` VALUES ('41', '24', '8', '0', '874184768', '0.00', '0.00', null, null);
INSERT INTO `cart_rule_detail` VALUES ('42', '24', '8', '0', '874348608', '0.00', '0.00', null, null);
INSERT INTO `cart_rule_detail` VALUES ('43', '24', '8', '873005120', '0', '0.00', '0.00', null, null);
INSERT INTO `cart_rule_detail` VALUES ('44', '25', '8', '0', '874184768', '0.00', '0.00', null, null);
INSERT INTO `cart_rule_detail` VALUES ('45', '25', '8', '0', '874348608', '0.00', '0.00', null, null);
INSERT INTO `cart_rule_detail` VALUES ('46', '25', '8', '873005120', '0', '0.00', '0.00', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of charges
-- ----------------------------
INSERT INTO `charges` VALUES ('1', '3490283584', '1', 'active', 'Demo', 'Demo terms', '1', '5.00', '10.00', '1', '2018-12-28 23:00:00', '2018-12-27 23:00:00', '2018-12-28 23:00:00', null, '2018-12-28 02:14:17', '2018-12-28 02:14:17', null, '8', '2', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1', '-426540992', '8', '878870592', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/7-chakra-bracelet_925x_240c2ceb-11bf-43b6-8261-df7a33ba3b17.jpg?v=1545965290', null, null);
INSERT INTO `images` VALUES ('2', '-426508224', '8', '878870592', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/navy-blue-chakra-bracelet_925x_16f633a4-d758-4984-bf3e-73be1397897b.jpg?v=1545965290', null, null);
INSERT INTO `images` VALUES ('3', '-425066432', '8', '879263808', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/anchor-bracelet-mens_925x_7ae00987-86ca-416e-a589-8274a9a204e3.jpg?v=1545965292', null, null);
INSERT INTO `images` VALUES ('4', '-425000896', '8', '879263808', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/anchor-bracelet-for-men_925x_f20cc85c-deaa-4edf-b150-e8670265cb4f.jpg?v=1545965292', null, null);
INSERT INTO `images` VALUES ('5', '-424968128', '8', '879263808', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/leather-anchor-bracelet-for-men_925x_7d1f3d24-cc8a-4b92-b551-4ca6a30ce83d.jpg?v=1545965292', null, null);
INSERT INTO `images` VALUES ('6', '-424345536', '8', '879460416', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/bangle-bracelet-with-jewels_925x_e1c2d885-b589-436a-83e8-ec705f0271dd.jpg?v=1545965293', null, null);
INSERT INTO `images` VALUES ('7', '-444497856', '8', '874348608', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/black-bag-over-the-shoulder_925x_9e2f67db-762e-416e-8955-55e6fda64233.jpg?v=1545965254', null, null);
INSERT INTO `images` VALUES ('8', '-441745344', '8', '875331648', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/man-adjusts-blue-tuxedo-bowtie_925x_17c631fd-56ad-4934-818a-0a2d7d46946c.jpg?v=1545965261', null, null);
INSERT INTO `images` VALUES ('9', '-422870976', '8', '879722560', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/bangle-bracelet-with-feathers_925x_81ad2199-1603-4a17-a708-e29a8aa15f13.jpg?v=1545965295', null, null);
INSERT INTO `images` VALUES ('10', '-421691328', '8', '880017472', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/boho-earrings_925x_45439637-0c9c-4f8b-8193-f6a4a376bfe3.jpg?v=1545965298', null, null);
INSERT INTO `images` VALUES ('11', '-421658560', '8', '880017472', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/inspired-woman_925x_61e4b40f-e0cf-4a19-a600-7e041c779a30.jpg?v=1545965298', null, null);
INSERT INTO `images` VALUES ('12', '-421625792', '8', '880017472', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/necklace-earrings-set_925x_b3a8634c-7079-4aec-833b-65e186d12953.jpg?v=1545965298', null, null);
INSERT INTO `images` VALUES ('13', '-443187136', '8', '874807360', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/red-plaid-shirt_925x_a5654ad7-0148-4452-b866-b487d7781b27.jpg?v=1545965258', null, null);
INSERT INTO `images` VALUES ('14', '-418807744', '8', '880836672', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-with-gold-pendant_925x_fe79bb70-6c05-4dc8-8e45-7a03d8f3ae97.jpg?v=1545965304', null, null);
INSERT INTO `images` VALUES ('15', '-418774976', '8', '880836672', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-pendant-closeup_925x_e158c6b0-54a3-4582-b60e-9519dc9934c1.jpg?v=1545965304', null, null);
INSERT INTO `images` VALUES ('16', '-418480064', '8', '881033280', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-with-triangle_925x_c6dfd85c-bca8-4cd6-81f9-dac90faf19af.jpg?v=1545965305', null, null);
INSERT INTO `images` VALUES ('17', '-448266176', '8', '873594944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/leather-jacket-and-tea_925x_269dd032-e933-4361-8098-edc5b4a7231a.jpg?v=1545965250', null, null);
INSERT INTO `images` VALUES ('18', '-452001728', '8', '873005120', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/casual-fashion-woman_925x_1ac60223-e02a-44f4-9e3f-c262930cda9e.jpg?v=1545965246', null, null);
INSERT INTO `images` VALUES ('19', '-447512512', '8', '873824320', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-female-models-denim_925x_e362e0ac-e514-499f-8bdc-25b729febbd2.jpg?v=1545965251', null, null);
INSERT INTO `images` VALUES ('20', '-415825856', '8', '881721408', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/dreamcatcher-pendant-necklace_925x_e98914ab-8e4b-432d-ae49-8de4413de325.jpg?v=1545965310', null, null);
INSERT INTO `images` VALUES ('21', '-415793088', '8', '881721408', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gold-dream-catcher-necklace_925x_71a5f402-c304-43ef-920e-a7251767d263.jpg?v=1545965310', null, null);
INSERT INTO `images` VALUES ('22', '-449511360', '8', '873431104', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/city-woman-fashion_925x_2x_0b68d46a-709c-41f3-83b1-7cf73d973d92.jpg?v=1545965249', null, null);
INSERT INTO `images` VALUES ('23', '-415530944', '8', '881885248', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/galaxy-earrings_925x_4e492c2e-09b3-41dc-a6d9-2bb493d38a89.jpg?v=1545965311', null, null);
INSERT INTO `images` VALUES ('24', '-413925312', '8', '882180160', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/blue-gemstone-pendant_925x_f86c00a5-c789-4d9d-9310-b37e63fb1867.jpg?v=1545965313', null, null);
INSERT INTO `images` VALUES ('25', '-413892544', '8', '882180160', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gemstone-necklace_925x_1188293e-a279-446f-9cef-20c46daff5b0.jpg?v=1545965313', null, null);
INSERT INTO `images` VALUES ('26', '-413859776', '8', '882180160', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-necklace_925x_8ee8f1ab-9541-4505-8b19-21f4ab817f1b.jpg?v=1545965313', null, null);
INSERT INTO `images` VALUES ('27', '-413827008', '8', '882180160', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/purple-gemstone-necklace_925x_3c059fac-4ddb-450f-a0d9-e9add963744b.jpg?v=1545965313', null, null);
INSERT INTO `images` VALUES ('28', '-413138880', '8', '882344000', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gold-bird-necklace_925x_e391d5e6-7a38-4ef9-8b3e-12227d8def94.jpg?v=1545965315', null, null);
INSERT INTO `images` VALUES ('29', '-413007808', '8', '882442304', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/elephant-earrings_925x_479edb7c-c772-40ea-9c6a-1f7e6539d505.jpg?v=1545965315', null, null);
INSERT INTO `images` VALUES ('30', '-412450752', '8', '882671680', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/guardian-angel-earrings_925x_c08b0015-fdb8-4ecf-b7b5-596c864da461.jpg?v=1545965317', null, null);
INSERT INTO `images` VALUES ('31', '-412417984', '8', '882671680', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/guardian-angel-earring-closeup_925x_98aab569-9622-426b-b922-cc44038eae3e.jpg?v=1545965317', null, null);
INSERT INTO `images` VALUES ('32', '-440467392', '8', '875724864', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/putting-on-your-shoes_925x_5810c0f7-a48b-496d-96f6-e9615d5811c0.jpg?v=1545965263', null, null);
INSERT INTO `images` VALUES ('33', '-443318208', '8', '874741824', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/woman-outside-brownstone_925x_73111363-9125-477d-bf42-c1c60d62bebb.jpg?v=1545965257', null, null);
INSERT INTO `images` VALUES ('34', '-411729856', '8', '882999360', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-hand-moon-bracelet-_925x_71194756-1437-46f9-aaf0-240a4c421c73.jpg?v=1545965319', null, null);
INSERT INTO `images` VALUES ('35', '-411697088', '8', '882999360', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/moon-friendship-bracelet_925x_36e519df-538f-4146-966f-e906183a1fa8.jpg?v=1545965319', null, null);
INSERT INTO `images` VALUES ('36', '-411631552', '8', '882999360', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-hand-charm-bracelet_925x_0158220a-6c14-4453-a6a1-d8a18ba1a2d6.jpg?v=1545965319', null, null);
INSERT INTO `images` VALUES ('37', '-446791616', '8', '874020928', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/mens-fall-fashion-jacket_925x_cc77df96-e52b-4bf2-8f5c-59916e921659.jpg?v=1545965252', null, null);
INSERT INTO `images` VALUES ('38', '-454819776', '8', '872349760', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-man-in-bright-fashion_925x_04f86403-19c2-481b-94d1-692bbe6df7d8.jpg?v=1545965241', null, null);
INSERT INTO `images` VALUES ('39', '-442204096', '8', '875233344', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/urban-fashion_925x_c2ee59e2-b3c4-40aa-b61e-157289e44462.jpg?v=1545965260', null, null);
INSERT INTO `images` VALUES ('40', '-403144640', '8', '884637760', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/pretty-gold-necklace_925x_5ae3c9e3-6033-450c-bfdf-4ad5f0f4c221.jpg?v=1545965331', null, null);
INSERT INTO `images` VALUES ('41', '-403111872', '8', '884637760', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/necklace-earrings-set_925x_5a93b7e5-bbe4-4912-864d-85280b4a5323.jpg?v=1545965331', null, null);
INSERT INTO `images` VALUES ('42', '-403079104', '8', '884637760', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/inspired-woman_925x_96a1c423-4f8c-4b57-b6fd-828b402674f4.jpg?v=1545965331', null, null);
INSERT INTO `images` VALUES ('43', '-441384896', '8', '875495488', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-red-t-shirt_925x_d5f50500-7697-4a2a-9202-6fdf6ae8bfab.jpg?v=1545965261', null, null);
INSERT INTO `images` VALUES ('44', '-443514816', '8', '874643520', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-hip-woman-at-carnival_925x_3c7de648-c85c-414d-96f0-15b42a1bf342.jpg?v=1545965256', null, null);
INSERT INTO `images` VALUES ('45', '-402063296', '8', '884867136', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/silver-threader-necklace_925x_947d350a-2875-4ab6-b2bf-e505a0edbc84.jpg?v=1545965333', null, null);
INSERT INTO `images` VALUES ('46', '-401997760', '8', '884867136', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/threader-necklace-closeup_925x_083849e0-2415-419b-bfc2-ee7041fa1cee.jpg?v=1545965333', null, null);
INSERT INTO `images` VALUES ('47', '-445153216', '8', '874184768', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/smiling-woman-on-snowy-afternoon_925x_24faa436-4a6c-4dc0-97c9-a067883694cd.jpg?v=1545965254', null, null);
INSERT INTO `images` VALUES ('48', '-448757696', '8', '873529408', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/striped-blouse-fashion_925x_73a8e6fd-84ab-4e8c-bde7-7288ee00b33f.jpg?v=1545965250', null, null);
INSERT INTO `images` VALUES ('49', '-440762304', '8', '875626560', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/woman-in-the-city_925x_0ecc69b2-ff35-46b7-88fa-9a3d27210dd0.jpg?v=1545965262', null, null);
INSERT INTO `images` VALUES ('50', '-401637312', '8', '885194816', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/stylish-summer-necklace_925x_a9381b07-439c-4131-bea3-a6fa1e40df15.jpg?v=1545965334', null, null);
INSERT INTO `images` VALUES ('51', '-442400704', '8', '875102272', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/smiling-woman-poses_925x_d60f8154-73fa-4e71-8a2f-adc5fa1ca63e.jpg?v=1545965259', null, null);
INSERT INTO `images` VALUES ('52', '-450920384', '8', '873136192', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/autumn-photographer-taking-picture_925x_df014c50-8bee-45f7-906a-b5e9c23328e4.jpg?v=1545965248', null, null);
INSERT INTO `images` VALUES ('53', '-444104640', '8', '874446912', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/menswear-blue-zip-up-jacket_925x_e0060c25-daae-469b-93f9-3cfb10f7499a.jpg?v=1545965255', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('94', '878870592', '8', '7 Shakra Bracelet', 'chain-bracelet', null, null);
INSERT INTO `products` VALUES ('95', '879263808', '8', 'Anchor Bracelet Mens', 'leather-anchor', null, null);
INSERT INTO `products` VALUES ('96', '879460416', '8', 'Bangle Bracelet', 'bangle-bracelet', null, null);
INSERT INTO `products` VALUES ('97', '874348608', '8', 'Black Leather Bag', 'black-leather-bag', null, null);
INSERT INTO `products` VALUES ('98', '875331648', '8', 'Blue Silk Tuxedo', 'blue-silk-tuxedo', null, null);
INSERT INTO `products` VALUES ('99', '879722560', '8', 'Boho Bangle Bracelet', 'bangle-bracelet-with-feathers', null, null);
INSERT INTO `products` VALUES ('100', '880017472', '8', 'Boho Earrings', 'boho-earrings', null, null);
INSERT INTO `products` VALUES ('101', '874807360', '8', 'Chequered Red Shirt', 'chequered-red-shirt', null, null);
INSERT INTO `products` VALUES ('102', '880836672', '8', 'Choker with Gold Pendant', 'choker-with-gold-pendant', null, null);
INSERT INTO `products` VALUES ('103', '881033280', '8', 'Choker with Triangle', 'choker-with-triangle', null, null);
INSERT INTO `products` VALUES ('104', '873594944', '8', 'Classic Leather Jacket', 'classic-leather-jacket', null, null);
INSERT INTO `products` VALUES ('105', '873005120', '8', 'Classic Varsity Top', 'classic-varsity-top', null, null);
INSERT INTO `products` VALUES ('106', '873824320', '8', 'Dark Denim Top', 'dark-denim-top', null, null);
INSERT INTO `products` VALUES ('107', '881721408', '8', 'Dreamcatcher Pendant Necklace', 'dreamcatcher-pendant-necklace', null, null);
INSERT INTO `products` VALUES ('108', '873431104', '8', 'Floral White Top', 'floral-white-top', null, null);
INSERT INTO `products` VALUES ('109', '881885248', '8', 'Galaxy Earrings', 'galaxy-earrings', null, null);
INSERT INTO `products` VALUES ('110', '882180160', '8', 'Gemstone Necklace', 'gemstone', null, null);
INSERT INTO `products` VALUES ('111', '882344000', '8', 'Gold Bird Necklace', 'gold-bird-necklace', null, null);
INSERT INTO `products` VALUES ('112', '882442304', '8', 'Gold Elephant Earrings', 'looped-earrings', null, null);
INSERT INTO `products` VALUES ('113', '882671680', '8', 'Guardian Angel Earrings', 'guardian-angel-earrings', null, null);
INSERT INTO `products` VALUES ('114', '875724864', '8', 'LED High Tops', 'led-high-tops', null, null);
INSERT INTO `products` VALUES ('115', '874741824', '8', 'Long Sleeve Cotton Top', 'longsleeve-cotton-top', null, null);
INSERT INTO `products` VALUES ('116', '882999360', '8', 'Moon Charm Bracelet', 'moon-charm-bracelet', null, null);
INSERT INTO `products` VALUES ('117', '874020928', '8', 'Navy Sports Jacket', 'navy-sport-jacket', null, null);
INSERT INTO `products` VALUES ('118', '872349760', '8', 'Ocean Blue Shirt', 'ocean-blue-shirt', null, null);
INSERT INTO `products` VALUES ('119', '875233344', '8', 'Olive Green Jacket', 'olive-green-jacket', null, null);
INSERT INTO `products` VALUES ('120', '884637760', '8', 'Pretty Gold Necklace', 'pretty-gold-necklace', null, null);
INSERT INTO `products` VALUES ('121', '875495488', '8', 'Red Sports Tee', 'red-sports-tee', null, null);
INSERT INTO `products` VALUES ('122', '874643520', '8', 'Silk Summer Top', 'silk-summer-top', null, null);
INSERT INTO `products` VALUES ('123', '884867136', '8', 'Silver Threader Necklace', 'silver-threader-necklace', null, null);
INSERT INTO `products` VALUES ('124', '874184768', '8', 'Soft Winter Jacket', 'dark-winter-jacket', null, null);
INSERT INTO `products` VALUES ('125', '873529408', '8', 'Striped Silk Blouse', 'striped-silk-blouse', null, null);
INSERT INTO `products` VALUES ('126', '875626560', '8', 'Striped Skirt and Top', 'striped-skirt-and-top', null, null);
INSERT INTO `products` VALUES ('127', '885194816', '8', 'Stylish Summer Necklace', 'stylish-summer-neclace', null, null);
INSERT INTO `products` VALUES ('128', '875102272', '8', 'White Cotton Shirt', 'white-cotton-shirt', null, null);
INSERT INTO `products` VALUES ('129', '873136192', '8', 'Yellow Wool Jumper', 'yellow-wool-jumper', null, null);
INSERT INTO `products` VALUES ('130', '874446912', '8', 'Zipped Jacket', 'zipped-jacket', null, null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('7', 'thanhthaobeauty.myshopify.com', '160ff5c29f60f4d897966dfba4690a41', '15', null, null, '2018-12-28 11:02:43', '2018-12-28 03:02:43', null, null, null);
INSERT INTO `shops` VALUES ('8', 'sptapp.myshopify.com', 'ed0c81ac3ac734f52220717a181c432d', '15', null, null, '2018-12-28 10:14:17', '2018-12-28 02:14:17', null, '2', '0');

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
  `id_variant` varchar(50) DEFAULT NULL,
  `id_product` varchar(50) DEFAULT NULL,
  `id_shop` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of variants
-- ----------------------------
INSERT INTO `variants` VALUES ('1', '1636499520', '878870592', '8', 'Blue', '43', 'Blue', null, null, null, '1', null, '-426508224', null);
INSERT INTO `variants` VALUES ('2', '1636663360', '878870592', '8', 'Black', '43', 'Black', null, null, null, '0', null, '-426540992', null);
INSERT INTO `variants` VALUES ('3', '1640661056', '879263808', '8', 'Gold', '70', 'Gold', null, null, null, '1', null, '-425066432', null);
INSERT INTO `variants` VALUES ('4', '1640759360', '879263808', '8', 'Silver', '55', 'Silver', null, null, null, '0', null, '-425000896', null);
INSERT INTO `variants` VALUES ('5', '1641840704', '879460416', '8', 'Default Title', '40', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('6', '1588265024', '874348608', '8', 'Default Title', '30', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('7', '1593999424', '875331648', '8', 'Default Title', '70', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('8', '1642692672', '879722560', '8', 'Default Title', '43', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('9', '1643872320', '880017472', '8', 'Default Title', '28', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('10', '1591541824', '874807360', '8', 'Default Title', '50', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('11', '1646755904', '880836672', '8', 'Default Title', '30', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('12', '1648590912', '881033280', '8', 'Default Title', '48', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('13', '1584332864', '873594944', '8', 'Default Title', '80', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('14', '1580007488', '873005120', '8', 'Small', '60', 'Small', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('15', '1580040256', '873005120', '8', 'Medium', '60', 'Medium', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('16', '1580073024', '873005120', '8', 'Large', '60', 'Large', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('17', '1585807424', '873824320', '8', 'Default Title', '60', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('18', '1658617920', '881721408', '8', 'Default Title', '24', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('19', '1582137408', '873431104', '8', 'Default Title', '75', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('20', '1660551232', '881885248', '8', 'Default Title', '38', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('21', '1661239360', '882180160', '8', 'Blue', '28', 'Blue', null, null, null, '1', null, '-413925312', null);
INSERT INTO `variants` VALUES ('22', '1661272128', '882180160', '8', 'Purple', '28', 'Purple', null, null, null, '0', null, '-413827008', null);
INSERT INTO `variants` VALUES ('23', '1663598656', '882344000', '8', 'Default Title', '80', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('24', '1664581696', '882442304', '8', 'Default Title', '55', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('25', '1665007680', '882671680', '8', 'Default Title', '20', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('26', '1601830976', '875724864', '8', 'Default Title', '80', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('27', '1590919232', '874741824', '8', 'Default Title', '50', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('28', '1666515008', '882999360', '8', 'Default Title', '48', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('29', '1587118144', '874020928', '8', 'Default Title', '60', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('30', '1575059520', '872349760', '8', 'Default Title', '50', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('31', '1592393792', '875233344', '8', 'Default Title', '65', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('32', '1681424448', '884637760', '8', 'Default Title', '45', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('33', '1597308992', '875495488', '8', 'Default Title', '50', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('34', '1589936192', '874643520', '8', 'Default Title', '70', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('35', '1683390528', '884867136', '8', 'Default Title', '15', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('36', '1587675200', '874184768', '8', 'Default Title', '50', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('37', '1583317056', '873529408', '8', 'Default Title', '50', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('38', '1600389184', '875626560', '8', 'Default Title', '50', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('39', '1685127232', '885194816', '8', 'Default Title', '45', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('40', '1592033344', '875102272', '8', 'Default Title', '30', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('41', '1581187136', '873136192', '8', 'Default Title', '80', 'Default Title', null, null, null, '1', null, null, null);
INSERT INTO `variants` VALUES ('42', '1589444672', '874446912', '8', 'Default Title', '65', 'Default Title', null, null, null, '1', null, null, null);
