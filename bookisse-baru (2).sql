-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2026 at 11:08 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookisse-baru`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(150) NOT NULL,
  `description` text,
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `category` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `badge` varchar(100) DEFAULT NULL,
  `is_offer` tinyint(1) NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  `is_best_seller` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `description`, `price`, `category`, `image`, `badge`, `is_offer`, `stock`, `is_best_seller`) VALUES
(1, 'Dr Jeykyll & Mr Hyde', 'Robert Lousi Stevenson', 'In Robert Louis Stevenson\'s novella about a large, well-made, smooth-faced man of fifty with a stylish appearance, intelligent mind, and every mark of capacity and kindness', 11.75, 'Fiction', '1793801451_drJekyll.jpeg', 'BEST SELLER', 1, 97, 0),
(2, 'The Little Prince', 'Antoine de Saint-Exupéry', '', 12.50, 'Fantasy', '1793801675_the little prince.jpeg', '', 0, 55, 0),
(3, 'Rich Dad or Poor Dad', 'Robert T Kiyomasi', '', 10.89, 'Business', '1793801795_1787793435_rich dad dan poor dad.jpeg', '', 0, 50, 0),
(4, 'Twiligth', 'Stephenie Mayer', '', 10.00, 'Romance', '1793801880_twiligth.jpeg', '', 0, 84, 0),
(5, 'The Girl On The Train', 'Paula Hawkins', '', 15.00, 'Mystery', '1793801988_1787789374_the girl on the train.jpeg', 'FLASH SALE', 1, 96, 0),
(6, 'Atomic Habbit', 'James Clear', '', 19.00, 'Self Improvement', '1793802063_atomic.jpeg', 'NEW', 1, 48, 0),
(7, 'Gone girl', 'Gllian Flynn', '', 25.56, 'Mystery', '1793802222_1787792684_gone girl.jpeg', 'FLASH SALE', 1, 45, 0),
(8, 'Alice Wonder Land', 'Lewis Caroll', '', 23.10, 'Fiction', '1793802305_1787791757_alice in wonderland.jpeg', 'FLASH SALE', 0, 23, 0),
(9, 'ikigai', 'Ichigo Ichie', '', 12.30, 'Self Improvement', '1793802449_1787793339_ikigai.jpeg', '', 0, 92, 0),
(10, 'the business of the 21th century', 'Robert T Kiyomasi', '', 35.06, 'Business', '1793802578_business.jpeg', '', 0, 72, 0),
(11, 'harry potter and the chamber of secrets', 'J.K.Rowling', '', 35.06, 'Fantasy', '1793802711_potter.jpeg', '', 0, 66, 1),
(12, 'spooky stories 2', 'Rowley jefferson', 'Filled with goofy comic-strip illustrations and lighthearted scares, the book perfectly captures a child\'s wild imagination while gently delivering positive messages about personal boundaries and self-confidence.', 34.00, 'Fiction', '1793802829_spooky.jpeg', '', 0, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `qty` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `book_id`, `qty`) VALUES
(1, 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Fiction'),
(2, 'Self Improvement'),
(3, 'Business'),
(4, 'Fantasy'),
(5, 'Mystery'),
(6, 'Romance');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `created_at`) VALUES
(3, 4, 1, 'hei', '2026-11-09 00:24:37'),
(4, 1, 4, 'gak', '2026-11-09 00:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(30) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_provider` varchar(50) DEFAULT NULL,
  `payment_proof` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `paid_at` datetime DEFAULT NULL,
  `order_code` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `payment_status`, `payment_method`, `payment_provider`, `payment_proof`, `created_at`, `paid_at`, `order_code`) VALUES
(24, 4, 10.89, 'shipped', 'paid', 'E-Wallet', 'QRIS', '86774c735e0263d50d73cf329f8c61e1.jpg', '2026-11-09 00:25:57', '2026-11-09 07:27:34', 'TBJ09112624'),
(25, 4, 12.50, 'cancelled', 'rejected', 'Bank Transfer', NULL, 'c903d3a1740d03a72b1d703c999a6863.jpg', '2026-11-09 00:29:01', NULL, 'TBJ09112625'),
(31, 4, 35.06, 'processing', 'paid', 'Bank Transfer', NULL, '2cb6183d2f151853a3b3522155122758.jpg', '2026-11-09 13:06:05', '2026-11-09 20:06:59', 'TBJ09112631'),
(32, 4, 10.89, 'complete', 'paid', 'Bank Transfer', NULL, 'ef9b981ebdeabe0b75c0f98e88b2f0a0.jpg', '2026-11-09 15:07:31', '2026-11-09 22:10:13', 'TBJ09112632'),
(33, 4, 35.06, 'processing', 'paid', 'E-Wallet', 'GoPay', 'bcb12d44cad1b24f672ea89c4e9213ae.webp', '2026-11-10 02:15:13', '2026-11-10 09:30:16', 'TBJ10112633'),
(34, 4, 12.50, 'pending', 'pending', NULL, NULL, NULL, '2026-11-10 04:03:01', NULL, 'TBJ10112634'),
(35, 5, 35.06, 'complete', 'paid', 'E-Wallet', 'QRIS', 'a86ed98d2089141d443386a32190f1ff.jpg', '2026-11-10 04:26:41', '2026-11-10 11:29:54', 'TBJ10112635'),
(36, 5, 10.00, 'shipped', 'paid', 'E-Wallet', 'QRIS', '070b6566cb2910e7d7a30d216fb0cc75.jpg', '2026-11-10 06:13:11', '2026-11-10 13:15:51', 'TBJ10112636');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `book_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `book_id`, `quantity`, `price`) VALUES
(26, 24, 3, 1, 10.89),
(27, 25, 2, 1, 12.50),
(38, 31, 11, 1, 35.06),
(39, 32, 3, 1, 10.89),
(40, 33, 11, 1, 35.06),
(41, 34, 2, 1, 12.50),
(42, 35, 11, 1, 35.06),
(43, 36, 4, 1, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `return_requests`
--

CREATE TABLE `return_requests` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reason` text NOT NULL,
  `video_proof` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `admin_note` text,
  `return_tracking_number` varchar(100) DEFAULT NULL,
  `return_shipping_proof` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewed_at` datetime DEFAULT NULL,
  `return_shipped_at` datetime DEFAULT NULL,
  `return_received_at` datetime DEFAULT NULL,
  `refund_processed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `store_name` varchar(150) DEFAULT 'BOOKISSE',
  `store_email` varchar(150) DEFAULT NULL,
  `store_phone` varchar(30) DEFAULT NULL,
  `store_address` text,
  `store_status` varchar(30) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `store_name`, `store_email`, `store_phone`, `store_address`, `store_status`) VALUES
(1, 'BOOKISSE', NULL, NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` text,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `role`, `created_at`, `profile_picture`) VALUES
(1, 'Administrator', 'admin@bookisse.com', '$2y$10$V6Ph4jEE6UH.3QJ32NqAzuubreS/Z/lEEqIvENwNZWSgsiFDozsre', NULL, NULL, 'admin', '2026-11-04 13:05:46', NULL),
(3, 'yamaha lex', 'lexi@gmail.com', '$2y$10$ygmpUrjx9knIqgefOityz.8IeHYq8PVTd09tz7syCG1A02TI/7AFe', '084567890651', 'Indonesia', 'user', '2026-11-07 09:12:11', 'uploads/profile/user_3_3343ab953b50369c.png'),
(4, 'Alia', 'Allia@gmail.com', '$2y$10$VrhKUNmPq2cfLYmwD5LLr.y/kZGwPjTv8iOEpa6j4DvckFczWsUKy', '081234567890', 'Indonesia', 'user', '2026-11-09 00:23:24', 'uploads/profile/user_4_d280d5da786d741a.jpg'),
(5, 'aurora', 'aurora@gmail.com', '$2y$10$Wp6zvZjBMa7n2de5Cq4sCu3PLBDh9F.NA565/qILDrTByIbG7FzbG', NULL, NULL, 'user', '2026-11-10 04:26:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `book_id`) VALUES
(9, 4, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cart_item` (`user_id`,`book_id`),
  ADD KEY `fk_cart_book` (`book_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_messages_sender` (`sender_id`),
  ADD KEY `fk_messages_receiver` (`receiver_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_code` (`order_code`),
  ADD KEY `fk_orders_user` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_items_order` (`order_id`),
  ADD KEY `fk_order_items_book` (`book_id`);

--
-- Indexes for table `return_requests`
--
ALTER TABLE `return_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `idx_return_user` (`user_id`),
  ADD KEY `idx_return_status` (`status`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_wishlist_item` (`user_id`,`book_id`),
  ADD KEY `fk_wishlist_book` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `return_requests`
--
ALTER TABLE `return_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_messages_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_wishlist_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
