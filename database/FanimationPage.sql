-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 22, 2022 at 08:16 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fanimationpage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_name` int(11) NOT NULL,
  `admin_password` char(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand_name`) VALUES
(11, 'asia'),
(19, 'boss'),
(22, 'comet'),
(7, 'Comfee'),
(3, 'Dasin'),
(10, 'Dyson '),
(1, 'iFan'),
(9, 'Jya'),
(8, 'Kangaroo'),
(12, 'LG'),
(2, 'LiFAN'),
(5, 'Panasonic'),
(13, 'samsung'),
(6, 'Senko'),
(21, 'shimono'),
(4, 'Storm'),
(20, 'xiaomi');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `cate_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cate_name`) VALUES
(1, 'industrial fans'),
(2, 'stand fan'),
(3, 'ceiling fans'),
(4, 'floor fan'),
(5, 'air purifier'),
(6, 'quạt hộp'),
(7, 'Quạt Điều Hòa '),
(8, 'quạt cầm tay');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commentsdetails`
--

CREATE TABLE `commentsdetails` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `cmt_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `img` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `material_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `material_name`) VALUES
(2, 'metal'),
(1, 'plastic');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `color` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_quality` int(11) NOT NULL,
  `product_brand` int(11) NOT NULL,
  `product_price` float NOT NULL,
  `product_cate` int(11) NOT NULL,
  `product_avt` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `product_discount` int(11) NOT NULL,
  `product_status` int(11) NOT NULL,
  `product_describe` varchar(8000) COLLATE utf8_unicode_ci NOT NULL,
  `product_material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `product_quantity`, `product_quality`, `product_brand`, `product_price`, `product_cate`, `product_avt`, `product_discount`, `product_status`, `product_describe`, `product_material`) VALUES
(10, 'quạt asia ', 16, 4, 11, 500, 3, 'assets/uploadPrd/asia-l16006-xv0-1-1-org.jpg', 8, 1, 'Quạt treo tường Senko TR1428 \r\n\r\nvận hành 3 tốc độ gió, giúp người sử dụng có thể tùy chọn tốc độ mà mình mong muốn theo từng mục đích sử dụng khác nhau.', 2),
(12, 'Máy lọc không khí kết hợp quạt LG PuriCare AeroTower (Màu be)', 6, 4, 12, 2000, 5, 'assets/uploadPrd/D-1.jpg', 8, 1, 'Máy lọc không khí kết hợp quạt LG mới bắt giữ 99.97% bụi mịn\r\nvới bộ lọc HEPA 360° cùng công nghệ UVnano™.\r\n\r\nMáy lọc khí kèm quạt: sản phẩm có cả chức năng của máy lọc khí và quạt,\r\nđáp ứng nhu cầu được tận hưởng làn gió mát trong lành', 2),
(13, 'Quạt đứng Senko DH1600 ', 20, 4, 6, 50, 2, 'assets/uploadPrd/dung-senko-dh1600-2.jpg', 6, 1, '\r\nQuạt đứng Senko DH1600 với mẫu mã đẹp mắt, màu sắc hài hòa, công suất 47W làm mát nhanh, thay đổi chiều cao linh hoạt, hoạt động bền bỉ với motor bạc thau được làm từ 100% dây đồng\r\n', 1),
(14, 'Quạt Hộp Midea FB40-9H', 15, 3, 7, 300, 6, 'assets/uploadPrd/quat-midea-fb40-9h-mau--org.jpg', 5, 1, 'Thiết kế hiện đại\r\nQuạt hộp Midea FB40-9H có thiết kế dạng để bàn với kiểu dáng hiện đại, kết hợp màu sắc trang nhã, phù hợp lắp đặt sử dụng trong nhiều không gian sống khác nhau. Bạn có thể dùng cho phòng khách, phòng ngủ, phòng làm việc, phòng bếp.', 1),
(15, 'uạt Đứng Công Nghiệp Dasin KSM – 3076H', 15, 4, 3, 200, 1, 'assets/uploadPrd/quat-dung-Dasin-ksm-3076H.jpg', 8, 1, 'Quạt đứng công nghiệp Dasin KSM – 3076H là sản phẩm chất lượng và tốt nhất thị trường hiện nay, với những tính năng vượt chội hơn so với các sản phẩm cùng loại, như lưu lượng gió lớn hơn, có thể thủi xa từ 10 đến 15m, chạy luôn tục 24/7 không quá tải, bảo hành hai năm, chất liệu bền đẹp an toàn cháy nổ trong công nghiệp,  khi quyết định mua quạt đứng Dasin khách hàng yên tâm về một sản phẩm có thể cải thiện môi trường và phục vụ tốt cho doanh nghiệp và công việc cảu công ty.', 2),
(16, 'QUẠT SÀN CÔNG NGHIỆP DASIN KDD-1435', 13, 4, 3, 100, 4, 'assets/uploadPrd/quat-san-cong-nghiep-dasin-kdd-1435.jpg', 8, 1, 'Quạt sàn công nghiệp Dasin KDD-1435\r\nĐiện áp:  220v/50Hz\r\nCông suất: 65w\r\nLưu lượng gió: 3960m3/h\r\nTốc độ gió: 185m/min\r\nVòng quay cánh quạt: 1375 v/p\r\nCường độ dòng điện: 0.32A\r\nTốc độ điều khiển: 3 tốc độ\r\nChế độ đảo chiều: quay gốc 120 độ', 2),
(17, 'Quạt hộp Asia F16001 Xám', 11, 3, 11, 70, 6, 'assets/uploadPrd/10000679-quat-hop-asia-f1600a-xam-1.jpg', 8, 1, 'Thiết kế hình vuông nhỏ gọn, có tay cầm dễ di chuyển\r\nHoạt động êm ái, có thể chuyển hướng lên xuống linh hoạt\r\nTốc độ vòng xoay 1200 vòng/phút làm mát nhanh chóng\r\nCó 3 chế độ gió, có thể tùy chỉnh bằng các nút bấm\r\nKhung máy khít, chắc chắn, an toàn cho gia đình có trẻ nhỏ\r\nPhù hợp để đặt ở bàn học hoặc những nơi có không gian hẹp', 1),
(18, 'Quạt điều hoà Boss FEAB-409-G', 20, 3, 19, 700, 7, 'assets/uploadPrd/10046339-quat-lam-mat-khong-khi-boss-feab-409-g-1_9jqr-30.jpg', 9, 1, 'Thiết kế nhỏ gọn, tích hợp bánh xe, thuận tiện di chuyển qua các phòng\r\nQuạt điều hoà Boss FEAB-409-G sở hữu phong cách thiết kế sang trọng, các chi tiết được tinh giảm bớt, đi cùng màu xám, tạo nên tổng thể tinh tế, phù hợp với mọi không gian nội thất. Dưới đế quạt còn được tích hợp thêm 4 bánh xe linh hoạt, thuận tiện di chuyển qua các phòng. Bên cạnh đó, diện tích làm mát của quạt lên đến 30m2 quạt phù hợp với không gian phòng ngủ, phòng khách, phòng ăn,...', 1),
(19, 'Quạt bàn Senko B1612 Kem cốm', 18, 3, 6, 113, 2, 'assets/uploadPrd/10046885-quat-ban-senko-b1612-kem-com-1.jpg', 7, 1, 'Thiết kế nhỏ, màu sắc trẻ trung\r\nQuạt bàn Senko B1612 Kem cốm sở hữu thiết kế nhỏ gọn, với nhiều màu sắc trẻ trung mang lại cảm giác tươi mới và không khí mát mẻ cho gia đình bạn', 1),
(20, 'Máy lạnh Panasonic 1.5 HP CU/CS-N12WKH-8M', 20, 4, 5, 300, 7, 'assets/uploadPrd/10045217-may-lanh-panasonic-1-5-hp-cu-cs-n12wkh-8m.jpg', 8, 1, 'Thiết kế hiện đại, sang trọng\r\nMáy lạnh Panasonic 1.5 HP CU/CS-N12WKH-8M có thiết kế đơn giản, tông màu trắng hiện đại với các đường bo cong mềm mại mang đến vẻ sang trọng cho không gian nội thất gia đình bạn. Máy có công suất làm mát 1.5 HP, phù hợp cho các phòng có diện tích từ 15 - 20m2 như phòng ngủ, phòng studio nhỏ.', 1),
(21, 'Máy lạnh Panasonic Inverter 1HP CU/CS-VU9UKH-8', 11, 4, 5, 1000, 7, 'assets/uploadPrd/10035897-may-lanh-panasonic-inverter-1-hp-cu-cs-vu9ukh-8-04.jpg', 8, 1, 'Công nghệ iAUTO-X làm lạnh nhanh chóng\r\nMáy lạnh Panasonic làm lạnh nhanh hơn đến 35% so với những chiếc máy lạnh không được trang bị công nghệ Inverter khác. Chiếc máy lạnh này sẽ mang đến cho bạn cảm giác thư giãn và thoải mái nhất khi bước về căn nhà của mình', 1),
(22, 'Quạt không cánh Xiaomi Mijia 2 in 1 kèm lọc không khí', 13, 4, 20, 1211, 5, 'assets/uploadPrd/1-3-510x510.jpg', 9, 1, 'Quạt không cánh tích hợp lọc khí Xiaomi Mijia 2 in 1  là mẫu quạt không cánh mới nhất đến từ thương hiệu Mijia. Không chỉ sở hữu thiết kế không cánh mới lạ, quạt không cánh lọc khí Xiaomi Mijia 2 in 1 còn được trang bị thêm bộ phận lọc không khí công suất cao, mang lại không gian sinh hoạt mát mẻ, trong lành cho bạn và gia đình', 2),
(23, 'Máy Lọc Không Khí Xiaomi Mi Air Purifier ', 15, 5, 20, 2000, 5, 'assets/uploadPrd/1-2.jpg', 9, 1, 'Máy lọc không khí Xiaomi Mi Air Purifier 4 – mẫu máy lọc khí mới nhất đến từ thương hiệu Xiaomi đã chính thức có mặt tại Mi Hà Nội. Máy sở hữu thiết kế hoàn toàn mới, nhỏ gọn, đơn giản và thanh lịch cùng hệ thống lọc khí 3 trong 1 tân tiến, hiện đại bậc nhất. Đây chính là lựa chọn hoàn hảo để mang đến cho bạn và gia đình bầu không khí sạch, trong lành nhất.', 2),
(24, 'Quạt làm mát không khí Shimono SM-918 Xám', 16, 4, 21, 800, 7, 'assets/uploadPrd/10032257-quat-lam-mat-khong-khi-shimono-sm918-xam-1.jpg', 9, 1, 'Khả năng tạo và thổi gió ổn đỉnh với công suất 85W\r\nQuạt làm mát không khí Shimono SM-918 Xám là thiết bị gia dụng có chức năng lọc không khí và tạo gió, hoạt động với công suất 85W, sản phẩm có khả năng tạo ra lưu lượng gió mạnh giúp làm mát không gian phòng sử dụng, mang đến cảm giác thoải mái và dễ chịu cho bạn và người thân nghỉ ngơi, làm việc.', 2),
(25, 'Quạt đứng Senko DTS1607 Đen cam', 25, 3, 6, 150, 2, 'assets/uploadPrd/10032715_quat-dung-senko-dts-1067-den-cam-1.jpg', 8, 1, 'Sải cánh rộng\r\nQuạt đứng Senko DCN1607 đen két có thiết kế 7 cánh quạt với sải cánh rộng 39 cm tạo làn gió mạnh mẽ và dịu mát. Động cơ bạc thau của thiết bị hoạt động êm ái, không gây tiếng ồn. Nan quạt đan khít, lồng quạt chắc chắn đảm bảo an toàn cho bạn.', 2),
(26, 'Quạt sạc Comet CRF0904', 50, 3, 22, 50, 8, 'assets/uploadPrd/10048980-quat-sac-comet-crf0904-2.jpg', 8, 1, 'Thiết kế nhỏ gọn, 3 tốc độ gió\r\nQuạt sạc Comet CRF0904 có thiết kế nhỏ gọn, có thể mang theo mọi lúc mọi nơi. Quạt thích hợp cho nhiều đối tượng sử dụng: nhân viên văn phòng, sinh viên,... Quạt có công suất 3W, 3 tốc độ gió dễ dàng tùy chỉnh theo nhu cầu sử dụng.', 1),
(27, 'Máy lạnh Panasonic Inverter 1 HP CU/CS-PU9XKH-8M', 15, 4, 5, 1500, 7, 'assets/uploadPrd/10050842-may-lanh-panasonic-cu-cs-pu9xkh-8m-4.jpg', 9, 1, 'Điều hòa Panasonic có công suất 1 HP thích hợp cho phòng dưới 15m2\r\nSiêu tiết kiệm điện tới 20% nhờ chế độ Eco + công nghệ AI kết hợp Inverter\r\nChức năng Powerful làm lạnh nhanh hơn 18% cho cảm giác mát lạnh tức thì\r\nCông nghệ Nanoe G loại bỏ bụi mịn 2.5 PM cho không khí luôn trong lành\r\nCánh đảo gió lớn lan tỏa khí mát ra khắp phòng cho cảm giác mát tối ưu\r\nMôi chất lạnh R32 thân thiện với môi trường, công suất làm mát cao hơn', 1);

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

CREATE TABLE `productdetails` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color` char(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status_name`) VALUES
(1, 'In stock'),
(2, 'Out of stock');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_avt` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `user_password`, `user_email`, `user_phone`, `user_avt`, `user_address`, `user_fullname`) VALUES
(1, 'HuynhDuc1909', '7c222fb2927d828af22f592134e8932480637c0d', 'ducleader2003@gmail.com', '1111111111', NULL, 'Việt Nam', 'phạm huỳnh đức'),
(2, 'Duc123', 'a642a77abd7d4f51bf9226ceaf891fcbb5b299b8', 'duc.ph.2045@aptechlearning.edu.vn', '396345593', NULL, 'Việt Nam', 'Phạm Huỳnh Đức'),
(13, 'ducleader', 'f638e2789006da9bb337fd5689e37a265a70f359', 'ducleader2003@gmail', '0396345593', NULL, 'Việt Nam', 'phạm huỳnh đức'),
(15, 'triu1977', 'a642a77abd7d4f51bf9226ceaf891fcbb5b299b8', 'triu1977@gmail.com', '0967167338', NULL, 'Việt Nam', 'Phạm Công Trìu');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_phone` int(11) NOT NULL,
  `shipping_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adminName` (`admin_name`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `commentsdetails`
--
ALTER TABLE `commentsdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `material_name` (`material_name`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productName` (`product_name`),
  ADD KEY `cate_id` (`product_cate`),
  ADD KEY `product_brand` (`product_brand`),
  ADD KEY `product_status` (`product_status`),
  ADD KEY `product_material` (`product_material`);

--
-- Indexes for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_phone` (`user_phone`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commentsdetails`
--
ALTER TABLE `commentsdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `productdetails`
--
ALTER TABLE `productdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `commentsdetails` (`id`);

--
-- Constraints for table `commentsdetails`
--
ALTER TABLE `commentsdetails`
  ADD CONSTRAINT `commentsdetails_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_cate`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_brand`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`product_status`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`product_material`) REFERENCES `material` (`id`);

--
-- Constraints for table `productdetails`
--
ALTER TABLE `productdetails`
  ADD CONSTRAINT `productdetails_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `user_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
