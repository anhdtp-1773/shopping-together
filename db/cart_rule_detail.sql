/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-12-26 09:58:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart_rule_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_detail`;
CREATE TABLE `cart_rule_detail` (
  `id_cart_rule` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `id_main_product` varchar(50) DEFAULT NULL,
  `id_related_product` varchar(50) DEFAULT NULL,
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
