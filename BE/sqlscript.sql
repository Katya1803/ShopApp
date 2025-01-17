-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2023 at 12:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
CREATE DATABASE IF NOT EXISTS ShopApp;
USE ShopApp;

--
-- Database: `ShopApp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Tên danh mục, vd: đồ điện tử'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'Đồ điện tử'),
(3, 'Bánh kẹo'),
(4, 'Đồ gia dụng'),
(5, 'Phụ kiện'),
(6, 'Phụ kiện');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(200) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL CHECK (`price` >= 0),
  `number_of_products` int(11) DEFAULT NULL CHECK (`number_of_products` > 0),
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `color` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(350) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` float NOT NULL CHECK (`price` >= 0),
  `thumbnail` varchar(300) DEFAULT '',
  `description` longtext DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Awesome Steel Lamp', 87003400, '', 'Provident similique voluptate et voluptas at corrupti nobis.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(2, 'Fantastic Bronze Watch', 58466700, '', 'Voluptas nemo quis doloribus nisi optio culpa.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(3, 'Rustic Marble Knife', 48393400, '', 'Quia recusandae delectus dolor cumque.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(5, 'Synergistic Linen Hat', 18774200, '', 'Minus aliquid quibusdam doloribus aut.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(6, 'Gorgeous Bronze Table', 22101100, '', 'Qui voluptatem quia maiores ratione in.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(7, 'Incredible Wooden Coat', 76279200, '', 'Excepturi recusandae maxime est voluptates iste nesciunt ea.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(8, 'Mediocre Wooden Bench', 23243800, '', 'Dignissimos qui eos et officia ut sed.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(9, 'Fantastic Paper Clock', 30983300, '', 'Consequatur voluptas omnis veritatis.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(10, 'Lightweight Wool Shoes', 82800400, '', 'Magni nisi sunt.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(11, 'Rustic Paper Bag', 77551100, '', 'Fuga assumenda omnis autem.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(12, 'Enormous Linen Wallet', 60771400, '', 'Ut cupiditate quia dolorem placeat unde cum quo.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(13, 'Heavy Duty Concrete Hat', 76228200, '', 'Ipsum beatae beatae.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(14, 'Enormous Aluminum Table', 56989200, '', 'Non reprehenderit omnis.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(15, 'Small Iron Shirt', 7908380, '', 'Reiciendis et nemo.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(16, 'Heavy Duty Steel Clock', 10027500, '', 'Voluptates et veritatis ut saepe dolorem.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(17, 'Rustic Steel Knife', 57595000, '', 'Autem iure quia atque.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(18, 'Incredible Wooden Plate', 68164200, '', 'Aut beatae voluptatibus excepturi.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(19, 'Rustic Linen Watch', 46500800, '', 'Et rerum aut accusamus numquam exercitationem minus voluptas.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(20, 'Durable Concrete Gloves', 74534100, '', 'Aut hic officiis.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(21, 'Small Cotton Clock', 66587600, '', 'Hic ea qui dicta.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(22, 'Ergonomic Concrete Shirt', 50360900, '', 'Tempora amet sed omnis est aut est.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 3),
(23, 'Practical Plastic Clock', 20827000, '', 'Quo minus ea impedit et aut.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2),
(24, 'Sleek Steel Car', 37503000, '', 'Dolorem enim et nihil enim unde voluptas aspernatur.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 4),
(25, 'Aerodynamic Marble Shoes', 74958900, '', 'Labore quia sit praesentium assumenda cumque voluptatem accusantium.', '2023-07-31 08:28:28', '2023-07-31 08:28:28', 2);


-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(8, 1, 'f2fcda26-8304-48bc-9472-ead1c297770f_001.jpg'),
(9, 1, '0d83d40d-78e9-4c7d-80ee-3b5b68003104_002.jpg'),
(10, 1, 'cbef6f33-b6b7-45e0-ac44-f1a0b5fe1d4c_003.jpg'),
(11, 1, 'f0a765f0-4d20-4067-b7d7-fa32439deb1a_004.jpg'),
(12, 1, '31dee6df-712c-4fc4-82bb-b9edd48df24b_005.jpg'),
(13, 1, 'aabdceb6-c8de-43aa-9d3f-c2fe6d113ef2_006.jpg'),
(14, 2, '34823684-2d69-4e22-8ad6-aa2bc1ccbaf6_006.jpg'),
(15, 2, '5815f773-c836-464e-a857-ef03d465390e_007.jpg'),
(16, 2, 'e0dc71cb-b492-4aad-a9da-5b864eb9419d_008.jpg'),
(17, 2, 'a1846d28-2fa2-41a6-bcc3-59585be39d78_009.jpg'),
(18, 2, '77c00c01-9f8e-40cc-882c-a1f8e6d30368_010.jpg'),
(19, 3, 'c4bd25e4-620c-44fc-9f69-22edde299a8f_011.jpg'),
(20, 3, '5f0bdbc4-64d5-4114-b590-7c85503a9174_012.jpg'),
(21, 3, 'f139045a-ef18-4aa3-9484-e06721d9150c_013.jpg'),
(22, 3, 'b83bafb2-81b2-45be-a07f-fe610b7be9b8_014.jpg'),
(23, 3, '4619bde9-9395-4850-a43a-6ed958714e03_015.jpg'),
(24, 5, '6ba6318c-ed8b-4f6d-9a9b-d8ca1c6e1afc_016.jpg'),
(25, 5, 'b5d21126-2dd3-42bb-80dd-8f79d999d29c_017.jpg'),
(26, 5, 'f8a83202-74a6-4386-99db-3ef713a26471_016.jpg'),
(27, 5, '0661c814-b39c-47ab-958f-9465679eeb9b_017.jpg'),
(28, 7, '3036dff0-72cd-48d4-9efd-7221f41fc61d_022.jpg'),
(29, 7, 'cb6259db-e46d-48a5-8b7a-6c46a3b55446_023.jpg'),
(30, 7, 'bf379bbd-9e69-4cd6-bc03-d6db54b780b7_024.jpg'),
(31, 7, 'e2856261-99af-4494-82fe-bccb1befb22b_025.jpg'),
(32, 7, 'ccd11465-f64c-444d-90e1-8862ab71a62c_026.jpg'),
(33, 8, '36bf6016-4eff-4864-bf27-1de57e7d6589_027.jpg'),
(34, 8, '07175991-c161-48ce-8e66-a0ec093eea50_028.jpg'),
(35, 8, 'f92c0523-1b77-4233-bdc9-b8dab47536ed_029.jpg'),
(36, 8, 'cd3814e3-0918-440a-bab5-1db67ca4574f_030.jpg'),
(37, 8, '35dda624-858d-499d-867e-0260c358e591_031.jpg'),
(38, 9, '326235eb-015b-4176-8977-fb96df932557_032.jpg'),
(39, 9, 'e950378b-a6ff-40c6-a6b5-b469d841b282_033.jpg'),
(40, 9, '4e8a2b84-96b2-49c4-bbcf-2805934a8076_034.jpg'),
(41, 9, '95251a5e-7eaa-45e9-9571-04b3247ccfab_035.jpg'),
(42, 9, '1178bd64-484b-4e34-84cf-86881d1f8948_036.jpg'),
(43, 10, '3d3097a5-38dc-45b7-81be-7300816ab4b9_037.jpg'),
(44, 10, '390bbdba-c579-4f5a-a455-59d7dbda9c72_038.jpg'),
(45, 10, '29925120-5403-49cc-b85c-922673a0d5ed_039.jpg'),
(46, 10, 'd1fef884-a4c1-471b-8fc9-400195436564_040.jpg'),
(47, 11, '67dedbd7-d14a-4db0-801f-3ab18fdca6d3_038.jpg'),
(48, 11, '3175fef9-b080-4eca-8bc7-e9cc5947c642_039.jpg'),
(49, 11, '2c899f27-f467-4ad2-a52e-6e307d8bdfda_040.jpg'),
(50, 11, '0e32e381-4cb5-4771-a008-1354a612e763_041.jpg'),
(51, 11, 'cad35cbc-fd56-4f4c-b2db-77d04f63a149_042.jpg'),
(52, 12, 'cf00f484-f8a4-4b9a-8a9f-ef74bfd7ebcf_045.jpg'),
(53, 12, '09443def-0c28-40e1-b18d-f1cc8be05464_046.jpg'),
(54, 12, '9fc08b21-eb95-474e-b9c8-9de7bc6360e0_047.jpg'),
(55, 12, '813ad44a-a7bd-432a-bddc-b8f9a32b0039_048.jpg'),
(56, 12, '356a89f7-ef4d-454d-b2ad-da9f4fdaf6d6_049.jpg'),
(57, 13, '862e0948-8961-4c2a-b76a-f2322c846a4b_050.jpg'),
(58, 13, '8db6fb15-d24b-4c7f-b61d-c9d3452dd2fe_051.jpg'),
(59, 13, 'fbf2c23a-a2c3-48fb-ac69-c8ac4913bfb2_052.jpg'),
(60, 13, '25cefd9a-e306-422e-9fbf-8c98141dc81a_053.jpg'),
(61, 13, 'ab864e03-25f0-4537-9ca3-1d2bd431a535_054.jpg'),
(62, 14, 'd152fdfd-6c49-440c-a249-8fdc08646333_055.jpg'),
(63, 14, 'e29ac0a0-8c1f-493f-a66b-6f170de48f94_056.jpg'),
(64, 14, '1a384d85-a6a5-47a7-861d-5fb56054829c_057.jpg'),
(65, 14, '2cf23264-4685-44d8-a371-41c3e5ad9563_058.jpg'),
(66, 14, 'a8a30554-51c9-4a99-9ff4-e25169edc713_059.jpg'),
(67, 15, '904a9f1c-207c-4df6-bb49-c954656a8c06_059.jpg'),
(68, 15, '5d8fd37f-06a5-4906-9252-61ba564723c1_060.jpg'),
(69, 15, '95a13b88-919f-49af-b868-e2bfed0bb98e_061.jpg'),
(70, 15, '0ca19870-50b7-4719-82ae-b6b8272d45cd_062.jpg'),
(71, 15, '26365791-3978-4df8-b6fd-f2f516b1e7e3_063.jpg'),
(72, 16, 'c86bb69d-e5a2-4c93-8f0a-87504a8966ea_064.jpg'),
(73, 16, '93b29ad3-b5ab-40c1-ace8-ec069cba2db1_065.jpg'),
(74, 16, 'd832472c-856a-4243-bc98-531af0b1a1a5_066.jpg'),
(75, 16, '05b3bc62-c8f1-41c3-abd0-3515a1f19ed3_067.jpg'),
(76, 16, 'ee6f30dc-68de-4c8a-bfd7-62df2ed20d22_068.jpg'),
(77, 17, 'dafed832-a59c-41ad-bc60-011fadaf8020_069.jpg'),
(78, 17, '65cf789d-ed86-4fd7-8030-2a79af81a88b_070.jpg'),
(79, 17, 'a2ac276a-5384-4646-ad52-ad00b731cc9b_080.jpg'),
(80, 17, '665a59de-01f1-4a4f-870e-4fc64a43f384_081.jpg'),
(81, 17, 'f3c45546-5b36-403e-b26e-781cb8f2f825_082.jpg'),
(82, 18, 'a98c6339-a19f-4dfe-a230-9a0ea1236192_083.jpg'),
(83, 18, 'a2dc214e-e02d-4b63-bcfd-03926d983833_084.jpg'),
(84, 18, 'b2f38c0a-4b15-480a-8160-314a216b8586_085.jpg'),
(85, 18, 'c69ed25c-c703-49e4-bc5e-f3c94d2ed703_086.jpg'),
(86, 18, '07f74ddc-b4c7-489d-95cb-d417d5277938_087.jpg'),
(87, 19, '699080d6-5b3c-4153-b3cb-140ee06f23f9_088.jpg'),
(88, 19, 'e21a7434-b10d-412a-996b-be2a0703f8b0_089.jpg'),
(89, 19, '121db8eb-34dd-4f28-879e-4206ca84410a_090.jpg'),
(90, 19, '2ad86d1c-2b0a-4817-8fbc-0785f7d74870_091.jpg'),
(91, 19, 'a544ae1e-8cac-4940-9b7e-c7ddd8b40efc_092.jpg'),
(92, 20, 'a8dbe441-3db0-44d5-9b87-baf5b932683e_093.jpg'),
(93, 20, '195b50a0-ec76-4b51-8c34-cfe127be1ae3_094.jpg'),
(94, 20, '4db2c5fd-3593-45bc-b942-ab1f52974b9f_095.jpg'),
(95, 20, 'ecafbacb-d393-417c-988c-ad65b539749e_096.jpg'),
(96, 20, '4253fc5d-899f-4e6d-b45c-c239acbdc5e8_097.jpg'),
(97, 21, '3399c072-8c9b-4206-94fd-c411ff5339b4_093.jpg'),
(98, 21, '9e591a61-f1de-4ccc-a37e-d60b08ad9f7b_094.jpg'),
(99, 21, '8dd9aaa4-8706-4be3-b50b-4621bfd1be93_095.jpg'),
(100, 22, '79e8b5ff-8635-4416-8b4a-461f06ea0c03_096.jpg'),
(101, 22, '113703a7-fcd1-4759-88d2-650987899ad6_097.jpg'),
(102, 22, '01bac487-2758-4a55-be45-ae020dbbf65f_098.jpg'),
(103, 22, '0f6cc84b-a25d-471a-8b33-7281987968a8_099.jpg'),
(104, 23, '742f6cfb-8fdf-4fdf-9bee-68b31a70a470_099.jpg'),
(105, 23, '912a1687-201e-4e80-98ab-f7ebddf157f9_100.jpg'),
(106, 23, 'c1bb4b13-d3e5-4543-9517-debacd1ec1c9_101.jpg'),
(107, 24, '52f4e6a0-d342-4bf4-b7d9-bc7bcf564014_102.jpg'),
(108, 24, '25de850a-1d1d-44b0-bf47-d755b4cc70e9_103.jpg'),
(109, 24, 'af47fc82-8b9f-487c-99cf-bbc453f8189e_104.jpg'),
(110, 25, '6b4e1d1f-1bc2-4f4a-a1a8-567ed652b9bc_104.jpg'),
(111, 25, '71bb68f6-6c70-416c-b506-208a96e0a0ef_105.jpg'),
(112, 25, '7ab15e39-6589-4fe2-9dbe-5ef5ef1775b6_106.jpg'),
(113, 25, '0954d8c6-0bde-406d-8448-8e7570ddb092_108.jpg'),
(114, 26, '8ecbe322-1e99-400c-a11f-faafdf136092_109.jpg'),
(115, 26, '0db7e33b-0133-48b1-aa3d-210235f78016_110.jpg'),
(116, 26, 'fa29af18-1765-4370-955f-4ea0c14ede78_111.jpg'),
(117, 26, '7569bde4-4484-44cb-9338-a14ea927011d_112.jpg'),
(118, 27, '68b52bd4-c6b5-41bf-88f2-8471e90b1f14_113.jpg'),
(119, 27, 'aaa89b16-33c0-4e60-bd07-e89970be7a0a_114.jpg'),
(120, 27, '3e810ada-210a-4449-a25c-df0ffcee8bfd_115.jpg'),
(121, 27, '5d84cbea-90da-4753-b273-10db236b2fad_116.jpg'),
(122, 27, '7435fb50-5b74-4d77-b397-b211ab62c26c_117.jpg'),
(123, 28, '1575726c-6bec-4e9c-a063-fc3ed7589a32_118.jpg'),
(124, 28, 'b0c66298-0fa2-4431-99b9-77583cefe70d_119.jpg'),
(125, 28, 'c52e5599-e351-46ea-b6a4-0729a3118972_120.jpg'),
(126, 28, 'bb36fe37-4ef3-4f9c-8067-825617afbb54_121.jpg'),
(127, 29, '9dd25e0b-b962-4f5c-b798-378998f2c8a8_122.jpg'),
(128, 29, '066c0a93-9553-4aa6-9467-867a14dc368d_123.jpg'),
(129, 29, '1d5b57ce-3f73-48f2-ac92-f96d35dba744_124.jpg'),
(130, 29, '5e2be4c1-c3cc-4225-98c7-656e7bda9ae5_125.jpg'),
(131, 31, 'd40a5b86-a736-4bec-8b80-78dd33928ddd_126.jpg'),
(132, 31, '395efb19-034f-47d6-aa9f-8a773b20971e_127.jpg'),
(133, 32, '0172df63-6c6c-4565-bf5f-c9ac847e77e9_128.jpg'),
(134, 32, '28bb7329-fb63-4e5f-b21c-a66d4a61366d_129.jpg'),
(135, 32, '12babe42-6fd2-45e6-81e9-14ca68a5774e_130.jpg'),
(136, 33, '4bde7c98-7e06-4e20-9081-8aa2c345da02_131.jpg'),
(137, 33, 'e81584ec-0f6c-4f6c-babd-d5275ca64191_132.jpg'),
(138, 33, 'e7c5de4c-b197-408c-a8ee-6209e1392299_133.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(11) NOT NULL,
  `provider` varchar(20) NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) NOT NULL COMMENT 'Tên người dùng',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(50) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT '',
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` int(11) DEFAULT 0,
  `google_account_id` int(11) DEFAULT 0,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`) VALUES
(2, 'Nguyễn Văn A', '012456878', 'Nhà a ngõ b', '$2a$10$WdSf5UuyxQMAHcO502qXredzcc8OZQo4XQZNp3UxeT6/bKbuJx/6y', '2023-08-03 05:36:11', '2023-08-03 05:36:11', 1, '1999-10-25', 0, 0, 2),
(3, 'Tài khoản admin 1', '11223344', 'Đây là admin nhé', '$2a$10$JFQT3HeFUKDl7c/l.iNFAeybFr7Wi3krwgVVR7ieif.2De5p9LGAG', '2023-08-06 00:34:35', '2023-08-06 00:34:35', 1, '1993-10-25', 0, 0, 2),
(5, 'nguyen van test', '33445566', 'dc 123', '$2a$10$kf9WKIKuBShBp5swuRQtQeRDZQD5KA68WgRItaiEmdaA5hNNh1tk6', '2023-08-08 03:02:48', '2023-08-08 03:02:48', 1, '2005-08-08', 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5781;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
DELETE FROM product_images WHERE product_id > 25;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
UPDATE products
SET price = ROUND(RAND() * (95 - 5 + 1) + 5 + RAND(), 2)
WHERE price > 100;
