-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2019 at 03:56 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule`
--

CREATE TABLE `cart_rule` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_rule`
--

INSERT INTO `cart_rule` (`id`, `id_shop`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 'asdf', 1, '2019-01-03 10:49:57', '2019-01-03 10:49:57'),
(2, 8, 'asdf', 1, '2019-01-03 10:52:54', '2019-01-03 10:52:54'),
(3, 8, 'asdf', 1, '2019-01-03 10:55:21', '2019-01-03 10:55:21'),
(4, 8, 'asfd', 1, '2019-01-03 10:55:57', '2019-01-03 10:55:57'),
(5, 8, 'asdf', 1, '2019-01-03 10:56:54', '2019-01-03 10:56:54'),
(6, 8, 'adsf', 1, '2019-01-03 10:57:43', '2019-01-03 10:57:43'),
(7, 8, 'adsf', 1, '2019-01-03 10:58:46', '2019-01-03 10:58:46'),
(8, 8, 'asdf', 1, '2019-01-03 11:00:39', '2019-01-03 11:00:39'),
(9, 8, 'asdf', 1, '2019-01-03 11:01:47', '2019-01-03 11:01:47'),
(10, 8, 'adf', 1, '2019-01-03 11:02:56', '2019-01-03 11:02:56'),
(11, 8, 'asdfads', 1, '2019-01-03 11:04:34', '2019-01-03 11:04:34'),
(12, 8, 'adf', 1, '2019-01-03 11:04:47', '2019-01-03 11:04:47'),
(13, 8, 'asdf', 1, '2019-01-03 11:07:37', '2019-01-03 11:07:37'),
(14, 8, 'asdfasfd', 1, '2019-01-03 11:09:30', '2019-01-03 11:09:30'),
(15, 8, '123', 1, '2019-01-03 11:10:34', '2019-01-03 11:10:34'),
(16, 8, 'asdf', 1, '2019-01-03 11:11:18', '2019-01-03 11:11:18'),
(17, 8, 'asdf', 1, '2019-01-03 11:12:03', '2019-01-03 11:12:03'),
(18, 8, 'asdf', 1, '2019-01-03 11:12:53', '2019-01-03 11:12:53'),
(19, 8, 'asdf', 1, '2019-01-03 11:13:48', '2019-01-03 11:13:48'),
(20, 8, 'asdf', 1, '2019-01-03 11:14:17', '2019-01-03 11:14:17'),
(21, 8, 'asdf', 1, '2019-01-03 11:15:44', '2019-01-03 11:15:44'),
(22, 8, 'asdf', 1, '2019-01-03 11:16:24', '2019-01-03 11:16:24'),
(23, 8, 'nam', 1, '2019-01-03 11:18:24', '2019-01-03 11:18:24'),
(24, 8, 'asfd', 1, '2019-01-03 11:19:20', '2019-01-03 11:19:20'),
(25, 8, 'asdfas', 1, '2019-01-03 11:19:49', '2019-01-03 11:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_detail`
--

CREATE TABLE `cart_rule_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_cart_rule` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `id_main_product` varchar(50) NOT NULL DEFAULT '0',
  `id_related_product` varchar(50) NOT NULL DEFAULT '0',
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_rule_detail`
--

INSERT INTO `cart_rule_detail` (`id`, `id_cart_rule`, `id_shop`, `id_main_product`, `id_related_product`, `reduction_percent`, `reduction_amount`, `created_at`, `updated_at`) VALUES
(41, 24, 8, '0', '874184768', '0.00', '0.00', NULL, NULL),
(42, 24, 8, '0', '874348608', '0.00', '0.00', NULL, NULL),
(43, 24, 8, '873005120', '0', '0.00', '0.00', NULL, NULL),
(44, 25, 8, '0', '874184768', '0.00', '0.00', NULL, NULL),
(45, 25, 8, '0', '874348608', '0.00', '0.00', NULL, NULL),
(46, 25, 8, '873005120', '0', '0.00', '0.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `shop_id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_charge` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`id`, `charge_id`, `test`, `status`, `name`, `terms`, `type`, `price`, `capped_amount`, `trial_days`, `billing_on`, `activated_on`, `trial_ends_on`, `cancelled_on`, `created_at`, `updated_at`, `deleted_at`, `shop_id`, `plan_id`, `description`, `reference_charge`) VALUES
(1, 3490283584, 1, 'active', 'Demo', 'Demo terms', 1, '5.00', '10.00', 1, '2018-12-28 16:00:00', '2018-12-27 16:00:00', '2018-12-28 16:00:00', NULL, '2018-12-27 19:14:17', '2018-12-27 19:14:17', NULL, 8, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_image` varchar(50) DEFAULT NULL,
  `id_shop` int(11) DEFAULT NULL,
  `id_product` varchar(50) DEFAULT NULL,
  `src` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `id_image`, `id_shop`, `id_product`, `src`, `created_at`, `updated_at`) VALUES
(1, '-426540992', 8, '878870592', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/7-chakra-bracelet_925x_240c2ceb-11bf-43b6-8261-df7a33ba3b17.jpg?v=1545965290', NULL, NULL),
(2, '-426508224', 8, '878870592', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/navy-blue-chakra-bracelet_925x_16f633a4-d758-4984-bf3e-73be1397897b.jpg?v=1545965290', NULL, NULL),
(3, '-425066432', 8, '879263808', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/anchor-bracelet-mens_925x_7ae00987-86ca-416e-a589-8274a9a204e3.jpg?v=1545965292', NULL, NULL),
(4, '-425000896', 8, '879263808', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/anchor-bracelet-for-men_925x_f20cc85c-deaa-4edf-b150-e8670265cb4f.jpg?v=1545965292', NULL, NULL),
(5, '-424968128', 8, '879263808', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/leather-anchor-bracelet-for-men_925x_7d1f3d24-cc8a-4b92-b551-4ca6a30ce83d.jpg?v=1545965292', NULL, NULL),
(6, '-424345536', 8, '879460416', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/bangle-bracelet-with-jewels_925x_e1c2d885-b589-436a-83e8-ec705f0271dd.jpg?v=1545965293', NULL, NULL),
(7, '-444497856', 8, '874348608', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/black-bag-over-the-shoulder_925x_9e2f67db-762e-416e-8955-55e6fda64233.jpg?v=1545965254', NULL, NULL),
(8, '-441745344', 8, '875331648', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/man-adjusts-blue-tuxedo-bowtie_925x_17c631fd-56ad-4934-818a-0a2d7d46946c.jpg?v=1545965261', NULL, NULL),
(9, '-422870976', 8, '879722560', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/bangle-bracelet-with-feathers_925x_81ad2199-1603-4a17-a708-e29a8aa15f13.jpg?v=1545965295', NULL, NULL),
(10, '-421691328', 8, '880017472', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/boho-earrings_925x_45439637-0c9c-4f8b-8193-f6a4a376bfe3.jpg?v=1545965298', NULL, NULL),
(11, '-421658560', 8, '880017472', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/inspired-woman_925x_61e4b40f-e0cf-4a19-a600-7e041c779a30.jpg?v=1545965298', NULL, NULL),
(12, '-421625792', 8, '880017472', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/necklace-earrings-set_925x_b3a8634c-7079-4aec-833b-65e186d12953.jpg?v=1545965298', NULL, NULL),
(13, '-443187136', 8, '874807360', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/red-plaid-shirt_925x_a5654ad7-0148-4452-b866-b487d7781b27.jpg?v=1545965258', NULL, NULL),
(14, '-418807744', 8, '880836672', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-with-gold-pendant_925x_fe79bb70-6c05-4dc8-8e45-7a03d8f3ae97.jpg?v=1545965304', NULL, NULL),
(15, '-418774976', 8, '880836672', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-pendant-closeup_925x_e158c6b0-54a3-4582-b60e-9519dc9934c1.jpg?v=1545965304', NULL, NULL),
(16, '-418480064', 8, '881033280', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/choker-with-triangle_925x_c6dfd85c-bca8-4cd6-81f9-dac90faf19af.jpg?v=1545965305', NULL, NULL),
(17, '-448266176', 8, '873594944', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/leather-jacket-and-tea_925x_269dd032-e933-4361-8098-edc5b4a7231a.jpg?v=1545965250', NULL, NULL),
(18, '-452001728', 8, '873005120', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/casual-fashion-woman_925x_1ac60223-e02a-44f4-9e3f-c262930cda9e.jpg?v=1545965246', NULL, NULL),
(19, '-447512512', 8, '873824320', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-female-models-denim_925x_e362e0ac-e514-499f-8bdc-25b729febbd2.jpg?v=1545965251', NULL, NULL),
(20, '-415825856', 8, '881721408', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/dreamcatcher-pendant-necklace_925x_e98914ab-8e4b-432d-ae49-8de4413de325.jpg?v=1545965310', NULL, NULL),
(21, '-415793088', 8, '881721408', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gold-dream-catcher-necklace_925x_71a5f402-c304-43ef-920e-a7251767d263.jpg?v=1545965310', NULL, NULL),
(22, '-449511360', 8, '873431104', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/city-woman-fashion_925x_2x_0b68d46a-709c-41f3-83b1-7cf73d973d92.jpg?v=1545965249', NULL, NULL),
(23, '-415530944', 8, '881885248', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/galaxy-earrings_925x_4e492c2e-09b3-41dc-a6d9-2bb493d38a89.jpg?v=1545965311', NULL, NULL),
(24, '-413925312', 8, '882180160', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/blue-gemstone-pendant_925x_f86c00a5-c789-4d9d-9310-b37e63fb1867.jpg?v=1545965313', NULL, NULL),
(25, '-413892544', 8, '882180160', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gemstone-necklace_925x_1188293e-a279-446f-9cef-20c46daff5b0.jpg?v=1545965313', NULL, NULL),
(26, '-413859776', 8, '882180160', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-necklace_925x_8ee8f1ab-9541-4505-8b19-21f4ab817f1b.jpg?v=1545965313', NULL, NULL),
(27, '-413827008', 8, '882180160', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/purple-gemstone-necklace_925x_3c059fac-4ddb-450f-a0d9-e9add963744b.jpg?v=1545965313', NULL, NULL),
(28, '-413138880', 8, '882344000', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/gold-bird-necklace_925x_e391d5e6-7a38-4ef9-8b3e-12227d8def94.jpg?v=1545965315', NULL, NULL),
(29, '-413007808', 8, '882442304', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/elephant-earrings_925x_479edb7c-c772-40ea-9c6a-1f7e6539d505.jpg?v=1545965315', NULL, NULL),
(30, '-412450752', 8, '882671680', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/guardian-angel-earrings_925x_c08b0015-fdb8-4ecf-b7b5-596c864da461.jpg?v=1545965317', NULL, NULL),
(31, '-412417984', 8, '882671680', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/guardian-angel-earring-closeup_925x_98aab569-9622-426b-b922-cc44038eae3e.jpg?v=1545965317', NULL, NULL),
(32, '-440467392', 8, '875724864', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/putting-on-your-shoes_925x_5810c0f7-a48b-496d-96f6-e9615d5811c0.jpg?v=1545965263', NULL, NULL),
(33, '-443318208', 8, '874741824', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/woman-outside-brownstone_925x_73111363-9125-477d-bf42-c1c60d62bebb.jpg?v=1545965257', NULL, NULL),
(34, '-411729856', 8, '882999360', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-hand-moon-bracelet-_925x_71194756-1437-46f9-aaf0-240a4c421c73.jpg?v=1545965319', NULL, NULL),
(35, '-411697088', 8, '882999360', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/moon-friendship-bracelet_925x_36e519df-538f-4146-966f-e906183a1fa8.jpg?v=1545965319', NULL, NULL),
(36, '-411631552', 8, '882999360', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-hand-charm-bracelet_925x_0158220a-6c14-4453-a6a1-d8a18ba1a2d6.jpg?v=1545965319', NULL, NULL),
(37, '-446791616', 8, '874020928', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/mens-fall-fashion-jacket_925x_cc77df96-e52b-4bf2-8f5c-59916e921659.jpg?v=1545965252', NULL, NULL),
(38, '-454819776', 8, '872349760', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-man-in-bright-fashion_925x_04f86403-19c2-481b-94d1-692bbe6df7d8.jpg?v=1545965241', NULL, NULL),
(39, '-442204096', 8, '875233344', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/urban-fashion_925x_c2ee59e2-b3c4-40aa-b61e-157289e44462.jpg?v=1545965260', NULL, NULL),
(40, '-403144640', 8, '884637760', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/pretty-gold-necklace_925x_5ae3c9e3-6033-450c-bfdf-4ad5f0f4c221.jpg?v=1545965331', NULL, NULL),
(41, '-403111872', 8, '884637760', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/necklace-earrings-set_925x_5a93b7e5-bbe4-4912-864d-85280b4a5323.jpg?v=1545965331', NULL, NULL),
(42, '-403079104', 8, '884637760', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/inspired-woman_925x_96a1c423-4f8c-4b57-b6fd-828b402674f4.jpg?v=1545965331', NULL, NULL),
(43, '-441384896', 8, '875495488', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/womens-red-t-shirt_925x_d5f50500-7697-4a2a-9202-6fdf6ae8bfab.jpg?v=1545965261', NULL, NULL),
(44, '-443514816', 8, '874643520', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/young-hip-woman-at-carnival_925x_3c7de648-c85c-414d-96f0-15b42a1bf342.jpg?v=1545965256', NULL, NULL),
(45, '-402063296', 8, '884867136', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/silver-threader-necklace_925x_947d350a-2875-4ab6-b2bf-e505a0edbc84.jpg?v=1545965333', NULL, NULL),
(46, '-401997760', 8, '884867136', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/threader-necklace-closeup_925x_083849e0-2415-419b-bfc2-ee7041fa1cee.jpg?v=1545965333', NULL, NULL),
(47, '-445153216', 8, '874184768', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/smiling-woman-on-snowy-afternoon_925x_24faa436-4a6c-4dc0-97c9-a067883694cd.jpg?v=1545965254', NULL, NULL),
(48, '-448757696', 8, '873529408', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/striped-blouse-fashion_925x_73a8e6fd-84ab-4e8c-bde7-7288ee00b33f.jpg?v=1545965250', NULL, NULL),
(49, '-440762304', 8, '875626560', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/woman-in-the-city_925x_0ecc69b2-ff35-46b7-88fa-9a3d27210dd0.jpg?v=1545965262', NULL, NULL),
(50, '-401637312', 8, '885194816', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/stylish-summer-necklace_925x_a9381b07-439c-4131-bea3-a6fa1e40df15.jpg?v=1545965334', NULL, NULL),
(51, '-442400704', 8, '875102272', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/smiling-woman-poses_925x_d60f8154-73fa-4e71-8a2f-adc5fa1ca63e.jpg?v=1545965259', NULL, NULL),
(52, '-450920384', 8, '873136192', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/autumn-photographer-taking-picture_925x_df014c50-8bee-45f7-906a-b5e9c23328e4.jpg?v=1545965248', NULL, NULL),
(53, '-444104640', 8, '874446912', 'https://cdn.shopify.com/s/files/1/0148/5150/6240/products/menswear-blue-zip-up-jacket_925x_e0060c25-daae-469b-93f9-3cfb10f7499a.jpg?v=1545965255', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `capped_amount` decimal(8,2) DEFAULT NULL,
  `terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `test` tinyint(1) NOT NULL DEFAULT '0',
  `on_install` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `type`, `name`, `price`, `capped_amount`, `terms`, `trial_days`, `test`, `on_install`, `created_at`, `updated_at`) VALUES
(2, 1, 'Demo', '5.00', '10.00', 'Demo terms', 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_shopify_product` varchar(50) NOT NULL,
  `id_shop` int(11) DEFAULT NULL,
  `title` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `handle` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `id_shopify_product`, `id_shop`, `title`, `handle`, `created_at`, `updated_at`) VALUES
(94, '878870592', 8, '7 Shakra Bracelet', 'chain-bracelet', NULL, NULL),
(95, '879263808', 8, 'Anchor Bracelet Mens', 'leather-anchor', NULL, NULL),
(96, '879460416', 8, 'Bangle Bracelet', 'bangle-bracelet', NULL, NULL),
(97, '874348608', 8, 'Black Leather Bag', 'black-leather-bag', NULL, NULL),
(98, '875331648', 8, 'Blue Silk Tuxedo', 'blue-silk-tuxedo', NULL, NULL),
(99, '879722560', 8, 'Boho Bangle Bracelet', 'bangle-bracelet-with-feathers', NULL, NULL),
(100, '880017472', 8, 'Boho Earrings', 'boho-earrings', NULL, NULL),
(101, '874807360', 8, 'Chequered Red Shirt', 'chequered-red-shirt', NULL, NULL),
(102, '880836672', 8, 'Choker with Gold Pendant', 'choker-with-gold-pendant', NULL, NULL),
(103, '881033280', 8, 'Choker with Triangle', 'choker-with-triangle', NULL, NULL),
(104, '873594944', 8, 'Classic Leather Jacket', 'classic-leather-jacket', NULL, NULL),
(105, '873005120', 8, 'Classic Varsity Top', 'classic-varsity-top', NULL, NULL),
(106, '873824320', 8, 'Dark Denim Top', 'dark-denim-top', NULL, NULL),
(107, '881721408', 8, 'Dreamcatcher Pendant Necklace', 'dreamcatcher-pendant-necklace', NULL, NULL),
(108, '873431104', 8, 'Floral White Top', 'floral-white-top', NULL, NULL),
(109, '881885248', 8, 'Galaxy Earrings', 'galaxy-earrings', NULL, NULL),
(110, '882180160', 8, 'Gemstone Necklace', 'gemstone', NULL, NULL),
(111, '882344000', 8, 'Gold Bird Necklace', 'gold-bird-necklace', NULL, NULL),
(112, '882442304', 8, 'Gold Elephant Earrings', 'looped-earrings', NULL, NULL),
(113, '882671680', 8, 'Guardian Angel Earrings', 'guardian-angel-earrings', NULL, NULL),
(114, '875724864', 8, 'LED High Tops', 'led-high-tops', NULL, NULL),
(115, '874741824', 8, 'Long Sleeve Cotton Top', 'longsleeve-cotton-top', NULL, NULL),
(116, '882999360', 8, 'Moon Charm Bracelet', 'moon-charm-bracelet', NULL, NULL),
(117, '874020928', 8, 'Navy Sports Jacket', 'navy-sport-jacket', NULL, NULL),
(118, '872349760', 8, 'Ocean Blue Shirt', 'ocean-blue-shirt', NULL, NULL),
(119, '875233344', 8, 'Olive Green Jacket', 'olive-green-jacket', NULL, NULL),
(120, '884637760', 8, 'Pretty Gold Necklace', 'pretty-gold-necklace', NULL, NULL),
(121, '875495488', 8, 'Red Sports Tee', 'red-sports-tee', NULL, NULL),
(122, '874643520', 8, 'Silk Summer Top', 'silk-summer-top', NULL, NULL),
(123, '884867136', 8, 'Silver Threader Necklace', 'silver-threader-necklace', NULL, NULL),
(124, '874184768', 8, 'Soft Winter Jacket', 'dark-winter-jacket', NULL, NULL),
(125, '873529408', 8, 'Striped Silk Blouse', 'striped-silk-blouse', NULL, NULL),
(126, '875626560', 8, 'Striped Skirt and Top', 'striped-skirt-and-top', NULL, NULL),
(127, '885194816', 8, 'Stylish Summer Necklace', 'stylish-summer-neclace', NULL, NULL),
(128, '875102272', 8, 'White Cotton Shirt', 'white-cotton-shirt', NULL, NULL),
(129, '873136192', 8, 'Yellow Wool Jumper', 'yellow-wool-jumper', NULL, NULL),
(130, '874446912', 8, 'Zipped Jacket', 'zipped-jacket', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) UNSIGNED NOT NULL,
  `shopify_domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopify_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_shop_owner` int(11) DEFAULT NULL,
  `charge_id` bigint(20) DEFAULT NULL,
  `grandfatherd` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` int(10) DEFAULT NULL,
  `freemium` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `shopify_domain`, `shopify_token`, `id_shop_owner`, `charge_id`, `grandfatherd`, `created_at`, `updated_at`, `namespace`, `plan_id`, `freemium`) VALUES
(7, 'thanhthaobeauty.myshopify.com', '160ff5c29f60f4d897966dfba4690a41', 15, NULL, NULL, '2018-12-28 04:02:43', '2018-12-27 20:02:43', NULL, NULL, NULL),
(8, 'sptapp.myshopify.com', 'ed0c81ac3ac734f52220717a181c432d', 15, NULL, NULL, '2018-12-28 03:14:17', '2018-12-27 19:14:17', NULL, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_owner`
--

CREATE TABLE `shop_owner` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_owner`
--

INSERT INTO `shop_owner` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(15, 'sptapp', 'namdv@hamsa.vn', '', 'Ha Noi, Ha noi, Ha noi', '2018-12-27 19:14:04', '2018-12-27 19:14:04');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `id_variant`, `id_product`, `id_shop`, `title`, `price`, `option1`, `option2`, `option3`, `currency_code`, `quantity`, `created_at`, `id_image`, `updated_at`) VALUES
(1, '1636499520', '878870592', 8, 'Blue', '43', 'Blue', NULL, NULL, NULL, 1, NULL, '-426508224', NULL),
(2, '1636663360', '878870592', 8, 'Black', '43', 'Black', NULL, NULL, NULL, 0, NULL, '-426540992', NULL),
(3, '1640661056', '879263808', 8, 'Gold', '70', 'Gold', NULL, NULL, NULL, 1, NULL, '-425066432', NULL),
(4, '1640759360', '879263808', 8, 'Silver', '55', 'Silver', NULL, NULL, NULL, 0, NULL, '-425000896', NULL),
(5, '1641840704', '879460416', 8, 'Default Title', '40', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(6, '1588265024', '874348608', 8, 'Default Title', '30', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(7, '1593999424', '875331648', 8, 'Default Title', '70', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(8, '1642692672', '879722560', 8, 'Default Title', '43', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(9, '1643872320', '880017472', 8, 'Default Title', '28', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(10, '1591541824', '874807360', 8, 'Default Title', '50', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(11, '1646755904', '880836672', 8, 'Default Title', '30', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(12, '1648590912', '881033280', 8, 'Default Title', '48', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(13, '1584332864', '873594944', 8, 'Default Title', '80', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(14, '1580007488', '873005120', 8, 'Small', '60', 'Small', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(15, '1580040256', '873005120', 8, 'Medium', '60', 'Medium', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(16, '1580073024', '873005120', 8, 'Large', '60', 'Large', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(17, '1585807424', '873824320', 8, 'Default Title', '60', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(18, '1658617920', '881721408', 8, 'Default Title', '24', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(19, '1582137408', '873431104', 8, 'Default Title', '75', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(20, '1660551232', '881885248', 8, 'Default Title', '38', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(21, '1661239360', '882180160', 8, 'Blue', '28', 'Blue', NULL, NULL, NULL, 1, NULL, '-413925312', NULL),
(22, '1661272128', '882180160', 8, 'Purple', '28', 'Purple', NULL, NULL, NULL, 0, NULL, '-413827008', NULL),
(23, '1663598656', '882344000', 8, 'Default Title', '80', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(24, '1664581696', '882442304', 8, 'Default Title', '55', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(25, '1665007680', '882671680', 8, 'Default Title', '20', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(26, '1601830976', '875724864', 8, 'Default Title', '80', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(27, '1590919232', '874741824', 8, 'Default Title', '50', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(28, '1666515008', '882999360', 8, 'Default Title', '48', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(29, '1587118144', '874020928', 8, 'Default Title', '60', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(30, '1575059520', '872349760', 8, 'Default Title', '50', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(31, '1592393792', '875233344', 8, 'Default Title', '65', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(32, '1681424448', '884637760', 8, 'Default Title', '45', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(33, '1597308992', '875495488', 8, 'Default Title', '50', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(34, '1589936192', '874643520', 8, 'Default Title', '70', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(35, '1683390528', '884867136', 8, 'Default Title', '15', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(36, '1587675200', '874184768', 8, 'Default Title', '50', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(37, '1583317056', '873529408', 8, 'Default Title', '50', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(38, '1600389184', '875626560', 8, 'Default Title', '50', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(39, '1685127232', '885194816', 8, 'Default Title', '45', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(40, '1592033344', '875102272', 8, 'Default Title', '30', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(41, '1581187136', '873136192', 8, 'Default Title', '80', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(42, '1589444672', '874446912', 8, 'Default Title', '65', 'Default Title', NULL, NULL, NULL, 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_rule`
--
ALTER TABLE `cart_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_rule_detail`
--
ALTER TABLE `cart_rule_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `charges_charge_id_unique` (`charge_id`),
  ADD KEY `charges_shop_id_foreign` (`shop_id`),
  ADD KEY `charges_plan_id_foreign` (`plan_id`),
  ADD KEY `charges_reference_charge_foreign` (`reference_charge`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_owner`
--
ALTER TABLE `shop_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_rule`
--
ALTER TABLE `cart_rule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cart_rule_detail`
--
ALTER TABLE `cart_rule_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_owner`
--
ALTER TABLE `shop_owner`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `charges_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  ADD CONSTRAINT `charges_reference_charge_foreign` FOREIGN KEY (`reference_charge`) REFERENCES `charges` (`charge_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `charges_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
