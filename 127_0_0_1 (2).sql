-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2023-07-09 01:40:03
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `php_db_app`
--


-- --------------------------------------------------------

--
-- テーブルの構造 `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_code` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `vendor_code` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `price`, `stock_quantity`, `vendor_code`, `updated_at`) VALUES
(1, 1001, '小物入れ', 800, 30, 1111, '2022-01-01 00:00:00'),
(2, 1002, 'ペンケース', 1500, 15, 1111, '2022-01-02 00:00:00'),
(3, 2001, 'チリ産赤ワイン', 4000, 10, 2222, '2022-02-01 00:00:00'),
(4, 2002, 'カナダ産メープルシロップ', 1800, 20, 2222, '2022-02-02 00:00:00'),
(5, 3001, 'りんご3個セット', 600, 50, 3333, '2022-03-01 00:00:00'),
(6, 3002, 'みかん8個セット', 200, 80, 3333, '2022-03-02 00:00:00'),
(7, 4001, 'ワイヤレスヘッドホン', 12000, 10, 4444, '2022-04-01 00:00:00'),
(8, 4002, 'コードレス掃除機', 8000, 15, 4444, '2022-04-02 00:00:00'),
(9, 5001, 'スチールラック3段', 3300, 5, 5555, '2022-05-01 00:00:00'),
(10, 5002, 'ステンレスハンガー10個セット', 2000, 20, 5555, '2022-05-02 00:00:00'),
(12, 6002, '電動昇降デスク', 27000, 3, 5555, '2023-07-05 11:03:03');

-- --------------------------------------------------------

--
-- テーブルの構造 `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `vendor_code` int(11) NOT NULL,
  `vendor_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `vendors`
--

INSERT INTO `vendors` (`id`, `vendor_code`, `vendor_name`) VALUES
(1, 1111, 'SAMURAI商店'),
(2, 2222, 'SAMURAI貿易'),
(3, 3333, 'SAMURAI物産'),
(4, 4444, 'SAMURAI商事'),
(5, 5555, 'SAMURAI工業');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_code` (`vendor_code`);

--
-- テーブルのインデックス `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_code` (`vendor_code`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- テーブルの AUTO_INCREMENT `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendors` (`vendor_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
