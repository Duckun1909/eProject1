-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 30, 2022 at 07:45 PM
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
(25, 'Clever Mart'),
(22, 'comet'),
(7, 'Comfee'),
(28, 'daikin'),
(3, 'Dasin'),
(10, 'Dyson '),
(1, 'iFan'),
(9, 'Jya'),
(8, 'Kangaroo'),
(24, 'lexiu'),
(12, 'LG'),
(2, 'LiFAN'),
(23, 'nakatomi'),
(27, 'nanyoo'),
(5, 'Panasonic'),
(26, 'quạt mini'),
(13, 'samsung'),
(6, 'Senko'),
(21, 'shimono'),
(30, 'Smartmi'),
(4, 'Storm'),
(29, 'toshiba'),
(20, 'xiaomi');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `quantity`, `user_id`) VALUES
(15, 10, 5, 1),
(16, 39, 3, 1),
(18, 12, 2, 1);

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
(8, 'quạt cầm tay'),
(9, 'quạt treo tường '),
(10, 'quạt hút '),
(11, 'quạt bàn'),
(12, 'quạt mini'),
(13, 'quạt đeo cổ ');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `cmt_date` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `content`, `rating`, `cmt_date`, `user_id`) VALUES
(2, 19, 'sản phẩm thật tuỵt zời', NULL, '2022-09-29', 1),
(11, 28, '6', NULL, '2022-09-27', 16),
(14, 19, 'shop siu đỉnh xin phép cho 10 đỉm ạ', NULL, '2022-09-28', 16);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `img` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `product_id`, `img`) VALUES
(1, 10, 'assets/uploadPrd/asia-l16006-xv0-1-1-org.jpg'),
(2, 12, 'assets/uploadPrd/D-1.jpg'),
(3, 13, 'assets/uploadPrd/dung-senko-dh1600-2.jpg'),
(4, 14, 'assets/uploadPrd/quat-midea-fb40-9h-mau--org.jpg'),
(5, 15, 'assets/uploadPrd/quat-dung-Dasin-ksm-3076H.jpg'),
(6, 16, 'assets/uploadPrd/quat-san-cong-nghiep-dasin-kdd-1435.jpg'),
(7, 17, 'assets/uploadPrd/10000679-quat-hop-asia-f1600a-xam-1.jpg'),
(8, 18, 'assets/uploadPrd/10046339-quat-lam-mat-khong-khi-boss-feab-409-g-1_9jqr-30.jpg'),
(9, 19, 'assets/uploadPrd/10046885-quat-ban-senko-b1612-kem-com-1.jpg'),
(10, 20, 'assets/uploadPrd/10045217-may-lanh-panasonic-1-5-hp-cu-cs-n12wkh-8m.jpg'),
(11, 21, 'assets/uploadPrd/10035897-may-lanh-panasonic-inverter-1-hp-cu-cs-vu9ukh-8-04.jpg'),
(12, 22, 'assets/uploadPrd/1-3-510x510.jpg'),
(13, 23, 'assets/uploadPrd/1-2.jpg'),
(14, 24, 'assets/uploadPrd/10032257-quat-lam-mat-khong-khi-shimono-sm918-xam-1.jpg'),
(15, 25, 'assets/uploadPrd/10032715_quat-dung-senko-dts-1067-den-cam-1.jpg'),
(16, 26, 'assets/uploadPrd/10048980-quat-sac-comet-crf0904-2.jpg'),
(17, 27, 'assets/uploadPrd/10050842-may-lanh-panasonic-cu-cs-pu9xkh-8m-4.jpg'),
(18, 28, 'assets/uploadPrd/quat-tran-3-canh-panasonic-f48dgl.jpg'),
(19, 29, 'assets/uploadPrd/quat-treo-tuong-cong-nghiep-dasin-kwp-1845.jpg'),
(20, 30, 'assets/uploadPrd/quat-treo-tuong-cong-nghiep-kwp-3076-600x600.jpg'),
(21, 31, 'assets/uploadPrd/quat-dung-3-dau-dasin-dst-1845-300x300.jpg'),
(22, 32, 'assets/uploadPrd/quat-dung-ksi-1845.jpg'),
(23, 33, 'assets/uploadPrd/fa6e1c421211d74f8e00-600x600.jpg'),
(24, 34, 'assets/uploadPrd/image_2021_10_01T03_32_05_970Z.jpg'),
(25, 35, 'assets/uploadPrd/dieu-hoa-mat-diem-nakatomi-sac-407-tc-1-600x600.jpg'),
(26, 36, 'assets/uploadPrd/den-quat-tran-thong-minh-yeelight-c1060-dc-inverter-sieu-tiet-kiem-dien-ket-noi-app-2.jpg'),
(27, 37, 'assets/uploadPrd/1-75.jpg'),
(28, 38, 'assets/uploadPrd/nmbTgR_simg_de2fe0_250x250_maxb.jpg'),
(29, 39, 'assets/uploadPrd/LRSkec_simg_d0daf0_800x1200_max.jpg'),
(30, 40, 'assets/uploadPrd/6B1FUP_simg_d0daf0_800x1200_max.jpg'),
(31, 41, 'assets/uploadPrd/5632a113b34d6a683078857a1eb2f576.jpg'),
(32, 42, 'assets/uploadPrd/14c425e2fbee93320cf6ecb2bb37fcf4.j[g.jpg'),
(33, 43, 'assets/uploadPrd/mzpMcl5VEqSsRPftpvO0_simg_de2fe0_250x250_maxb.jpg'),
(34, 44, 'assets/uploadPrd/quat-hut-gan-tran-nanyoo-BPT15-44-S.jpg'),
(35, 45, 'assets/uploadPrd/quat-thong-am-tran-hut-thang-panasonic-fv15tgu1.jpg'),
(36, 46, 'assets/uploadPrd/10046305-may-lanh-samsung-inverter-1-hp-ar10tyhycwknsv.jpg'),
(37, 47, 'assets/uploadPrd/10051422-may-lanh-daikin-inverter-1-hp-ftkb25wmvmv-2.jpg'),
(38, 48, 'assets/uploadPrd/10048578-may-lanh-toshiba-inverter-1-5-hp-ras-h13c3kcvg-v.jpg'),
(39, 49, 'assets/uploadPrd/gallery1.jpg'),
(40, 50, 'assets/uploadPrd/9-7.jpg');

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
(4, 'hợp kim '),
(2, 'metal'),
(3, 'nhôm '),
(1, 'plastic');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_phone` int(11) NOT NULL,
  `shipping_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_date` date NOT NULL,
  `status` int(11) NOT NULL
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
(27, 'Máy lạnh Panasonic Inverter 1 HP CU/CS-PU9XKH-8M', 15, 4, 5, 1500, 7, 'assets/uploadPrd/10050842-may-lanh-panasonic-cu-cs-pu9xkh-8m-4.jpg', 9, 1, 'Điều hòa Panasonic có công suất 1 HP thích hợp cho phòng dưới 15m2\r\nSiêu tiết kiệm điện tới 20% nhờ chế độ Eco + công nghệ AI kết hợp Inverter\r\nChức năng Powerful làm lạnh nhanh hơn 18% cho cảm giác mát lạnh tức thì\r\nCông nghệ Nanoe G loại bỏ bụi mịn 2.5 PM cho không khí luôn trong lành\r\nCánh đảo gió lớn lan tỏa khí mát ra khắp phòng cho cảm giác mát tối ưu\r\nMôi chất lạnh R32 thân thiện với môi trường, công suất làm mát cao hơn', 1),
(28, 'Quạt Trần Panasonic F-48DGL', 5, 4, 5, 1200, 3, 'assets/uploadPrd/quat-tran-3-canh-panasonic-f48dgl.jpg', 9, 1, 'Quạt trần thông minh Wi-Fi Panasonic F-48DGL - 3 cánh nhỏ gọn - Có đèn LED\r\n\r\nQuạt trần Panasonic F-48DGL là dòng quạt cao cấp được Panasonic nghiên cứu và cho ra mắt. Quạt có thiết kế hiện đại cùng nhiều tính năng vượt trội so với những dòng quạt trần thông thường khác, là lựa chọn thông minh giúp xua tan không khí nóng trong những ngày hè.', 1),
(29, 'Quạt treo tường công nghiệp Dasin KWP – 1845', 23, 3, 3, 700, 9, 'assets/uploadPrd/quat-treo-tuong-cong-nghiep-dasin-kwp-1845.jpg', 10, 1, 'Quạt treo tường công nghiệp  KWP – 1845 là dòng quạt công nghiệp công suất lớn của thương hiệu Dasin với thiết kế nhỏ gọn chắc chắn, vừa có độ an toàn cao khi sử dụng, vừa tiết kiệm điện năng, được bảo hành lên tới 2 năm.', 1),
(30, 'Quạt treo tường 3 pha KWP – 3076 (380v)', 5, 3, 3, 650, 9, 'assets/uploadPrd/quat-treo-tuong-cong-nghiep-kwp-3076-600x600.jpg', 8, 1, 'Quạt treo tường công nghiệp 3 pha KWP – 3076 là sản phẩm quạt điện Dasin – thương hiệu đến từ Đài Loan.\r\n\r\nCó thể bạn không biết, nhưng Dasin có hơn 20 năm kinh nghiệm trong ngành sản xuất quạt và đã xuất khẩu đi hơn 20 quốc gia trên thế giới, và quạt treo tường 3 pha KWP – 3076 là một trong những sản phẩm tiêu biểu nhất.\r\n\r\nNếu bạn có nhà xưởn sản xuất có sẵn nguồn điện 3 pha (380v) thì KWP – 3076 là sự lựa chọn tốt nhất để làm mát đó.', 3),
(31, 'Quạt đứng 3 đầu Dasin DST – 1845', 10, 3, 3, 700, 2, 'assets/uploadPrd/quat-dung-3-dau-dasin-dst-1845-300x300.jpg', 10, 1, 'Quạt đứng công nghiệp 3 đầu DST – 1845 thương hiệu Dasin là sản phẩm mang nhiều cải tiến, vừa tiết kiệm không gian vừa tiết kiệm điện năng.', 3),
(32, 'Quạt đứng công nghiệp Dasin KSI – 1845', 10, 3, 3, 400, 2, 'assets/uploadPrd/quat-dung-ksi-1845.jpg', 7, 1, 'Quạt đứng công nghiệp Dasin KSI -1845 được thiết kế đẹp mắt, công suất lớn mà giá thành lai phải chăng. Quạt là sản phẩm của thương hiệu Dasin- thương hiệu dẫn đầu ngành sản xuất quạt công nghiệp đến từ Đài Loan.', 1),
(33, 'Quạt hút công nghiệp di động KIN – 500', 16, 3, 3, 205, 1, 'assets/uploadPrd/fa6e1c421211d74f8e00-600x600.jpg', 9, 1, 'Quạt hút công nghiệp di động Dasin KIN – 500 là một trong những sảm phẩm tiêu biểu của Dasin, hội tụ những điểm tốt nhất về chất lượng, độ hiệu quả cũng như tính tiết kiệm khi hoạt động.', 3),
(34, 'Quạt hút công nghiệp Dasin KIN ', 10, 3, 3, 300, 10, 'assets/uploadPrd/image_2021_10_01T03_32_05_970Z.jpg', 9, 1, 'Quạt hút công nghiệp Dasin KIN- 200 là dòng quạt hút xách tay chuyên dùng trong các hệ thống bếp nấu, kho hàng, xưởng gỗ hay các khu công nghiệp, nhà máy, nhà xưởng…\r\n\r\nVới thiết kế dạng hướng trục nhỏ gọn và nhẹ, có tay xách nên dễ dàng để di chuyển các vị trí, hơn nữa lại có thể gắn ống vải simili làm tăng khả năng và phạm vi sử dụng nên đây là mẫu quạt hút rất được người dùng ưa chuộng!', 3),
(35, 'Máy lạnh di động Nakatomi SAC – 407TC', 6, 4, 23, 500, 7, 'assets/uploadPrd/dieu-hoa-mat-diem-nakatomi-sac-407-tc-1-600x600.jpg', 9, 1, 'Máy lạnh di động là sản phẩm thay thế điều hòa treo tường, với thiết kế tiện lợi có thể di chuyển dễ dàng đến những vị trí cần thiết. Là một trong những sản phẩm đang được chú ý nhiều nhất hiện nay thì máy lạnh di động nakatomi SAC-407TC luôn được người tiêu dùng đánh giá cao về mặt thiết kế cho đến hoạt động.', 1),
(36, 'Đèn quạt trần thông minh Xiaomi Yeelight C1060 – DC Inverter siêu tiết kiệm điện', 20, 4, 20, 670, 3, 'assets/uploadPrd/den-quat-tran-thong-minh-yeelight-c1060-dc-inverter-sieu-tiet-kiem-dien-ket-noi-app-2.jpg', 10, 1, 'Một thiết kế nổi bật và sáng tạo của Yeelight mà Mi Hà Nội sẽ giới thiệu đến người dùng chính là chiếc Đèn quạt trần thông minh Xiaomi Yeelight C1060. Với khả năng dùng cùng lúc cả 2 tính năng là đèn và quạt hoặc có thể dùng 1 trong 2 tính năng đó tùy ý, khi bật quạt cánh sẽ tự động bung ra và khi tắt quạt cánh sẽ tự động cụp lại cất giấu phía trên để trở thành một chiếc đèn treo trần đích thực. Không những vậy chiếc đèn quạt này còn được trang bị công nghệ DC Inverter thế hệ mới siêu tiết kiệm điện.', 1),
(37, 'Quạt đứng không cánh thông minh Lexiu SS4', 15, 4, 24, 1025, 5, 'assets/uploadPrd/1-75.jpg', 10, 1, 'Từ lâu những chiếc quạt cây đã trở thành một sản phẩm không thể thiếu trong mỗi gia đình vào mùa hè oi ả. Nhưng nếu gia đình nào có trẻ nhỏ đều trở nên lo lắng mỗi khi nhưng đứa trẻ lại gần những chiếc quạt này. Hiểu được điều này Xiaomi đã cho ra đời chiếc quạt không cánh với công xuất lớn đảm bảo an toàn cho tất cả mọi người đặc biệt là trẻ nhỏ là Quạt không cánh Xiaomi Lexiu SS4.', 1),
(38, 'Quạt máy để bàn', 40, 3, 25, 30, 11, 'assets/uploadPrd/nmbTgR_simg_de2fe0_250x250_maxb.jpg', 9, 1, 'Khi thời tiết nóng hơn, nhu cầu sử dụng các thiết bị chống nóng cũng trở lên thiết yếu. Máy lạnh tuy là thiết bị tốt, nhưng với diện tích to lớn của căn phòng làm việc, hơi mát từ máy lạnh rất khó đáp ứng nhu cầu làm mát của cá nhân bạn. Hãy trang bị cho mình ngay một chiếc quạt điều hòa mini hơi nước Clever Mart nhỏ gọn với nhiều tính năng vượt trội.', 1),
(39, 'Quạt lồng sắt mini 819', 26, 3, 26, 25, 11, 'assets/uploadPrd/LRSkec_simg_d0daf0_800x1200_max.jpg', 9, 1, 'Quạt lồng sắt mini 819 cực được thiết kế với kiểu dáng nhỏ gọn', 4),
(40, 'Quạt Cầm Tay Comet CRF0904', 70, 3, 26, 30, 12, 'assets/uploadPrd/6B1FUP_simg_d0daf0_800x1200_max.jpg', 9, 1, 'Thiết kế nhỏ gọn, hiện đại\r\nQuạt Sạc Comet CRF0904 có thiết kế nhỏ gọn, đẹp mắt, có thể mang theo mọi lúc mọi nơi. Sản phẩm thích hợp cho nhiều đối tượng sử dụng khác nhau: nhân viên văn phòng, các bạn sinh viên,...\r\nKhi xoay Quạt theo chiều mũi tên phía sau thân, Quạt sẽ chuyển sang chế độ nằm ngang, thuận tiện để trên bàn làm việc, bàn học...mà không cần phải cầm nắm nữa, rất tiện dụng. LƯU Ý: Khi muốn Quạt CRF0904 trở lại kiểu cầm tay, Bạn xoay quạt ngược lại hướng xoay ban đầu', 1),
(41, 'Quạt Đeo Cổ Mini, Quạt USB Tích Điện Không Cánh Tiện Lợi, Thời Trang', 60, 3, 26, 15, 13, 'assets/uploadPrd/5632a113b34d6a683078857a1eb2f576.jpg', 7, 1, 'Quạt làm mát đeo cổ tiện lợi không cánh\r\n- Tên sản phẩm: Quạt mini đeo cổ không cánh \r\n- Thiết kế sáng tạo với hai tua bin không cánh, người tóc dài không bị mắc vướng tóc khi dử dụng\r\n- Biên độ thổi rộng 360 độ, không thổi trực tiếp vào mặt\r\n- Kết cấu dẫn gió dốc nghiêng mang lại cảm giác mát mẻ dễ chịu', 1),
(42, 'Quạt tích điện mini cầm tay để bàn nhỏ gọn 3 tốc độ gió N9 có pin sạc đi kèm', 70, 3, 26, 15, 12, 'assets/uploadPrd/14c425e2fbee93320cf6ecb2bb37fcf4.j[g.jpg', 4, 1, 'Quạt Mini Tích Điện Cầm Tay Có Giá Đỡ Để Bàn 3 Chế Độ Gió N9 [Có Chọn Màu]\r\n\r\nQuạt cầm tay mini hay để bàn đều được\r\n\r\n- Quạt tích điện mini có thiết kế nhỏ gọn, thuận tiện sử dụng cho 1 người hoặc mang theo trong các chuyến đi \r\n\r\n- Chất liệu nhựa ABS cao cấp và an toàn, tăng tuổi thọ và sự bền bỉ\r\n\r\n- Quạt cầm tay có 3 cấp độ gió với một nút điều khiển rất dễ dàng và tiện lợi cho người dùng\r\n\r\n- Quạt tích điện mini có thể hoạt động liên tục trong nhiều giờ liền, khi hết pin có thể sạc lại dễ dàng thông qua cổng USB cốc sạc của điện thoại hoặc cắm qua cổng USB của laptop và máy tính. \r\n\r\n- Với thời gian sạc đầy pin khoảng 1,5 giờ, quạt có thể hoạt động liên tục trong nhiều giờ. Bên cạnh đó quạt chạy rất êm, không gây ồn ào làm ảnh hưởng đến mọi người xung quanh.\r\n\r\n- Quạt được đi kèm 1 chân đế giúp trở thành 1 chiếc quạt để bàn học hoặc bàn văn phòng làm việc. Ngoài ra còn có 1 dây đeo giúp b mang theo quạt mini đi bên minh', 1),
(43, 'Quạt sạc cầm tay Comet CRF0904 ', 40, 3, 22, 17, 12, 'assets/uploadPrd/mzpMcl5VEqSsRPftpvO0_simg_de2fe0_250x250_maxb.jpg', 4, 1, 'Quạt sạc mini đa năng Comet CRF0904 được thiết kế đặc biệt dành cho dân công sở, các bạn sinh viên và các gia đình có trẻ em nhỏ. Quạt có thiết kế gọn nhẹ, dễ dàng di chuyển, tiện ích có thể thích hợp trong mọi không gian và sử dụng ở mọi nơi như phòng làm việc, phòng ngủ, mang đi chơi, đi du lịch, dã ngoại....,Với chất liệu nhựa ABS có tính thẩm mỹ cao và an toàn cho sức khoẻ. Đây sẽ là sản phẩm tuyệt vời đối với mọi người tiêu dùng.\r\n\r\n', 1),
(44, 'Quạt hút gắn trần Nanyoo BPT10-23-S nối ống D100mm', 20, 3, 27, 310, 3, 'assets/uploadPrd/quat-hut-gan-tran-nanyoo-BPT15-44-S.jpg', 9, 1, 'Quạt hút gắn trần Nanyoo BPT10-23-S Ống D100mm kích thước lắp 240mm x 240mm\r\nQuạt hút gắn trần Nanyoo có 1 chiều hút, hoạt động với công suất 16W, quay với tốc độ đạt 747 vòng/phút, áp suất là 110Pa. Quạt sử dụng tiết kiệm điện năng, chất lượng ổn định, độ bền cao. Độ ồn thấp chỉ 35DB', 1),
(45, 'Quạt hút âm trần không ống Panasonic FV-15TGU1', 25, 3, 5, 100, 3, 'assets/uploadPrd/quat-thong-am-tran-hut-thang-panasonic-fv15tgu1.jpg', 9, 1, ' Thiết kế âm trần thời trang, sang trọng.\r\n\r\n- Khử mùi, loại bỏ bụi bẩn và không khí ô nhiễm\r\n\r\n- Công suất tối đa 11W, độ ồn 35dB\r\n\r\n- Lưu lượng gió 240CHM\r\n\r\n- kích thước lỗ khoét 217mm, độ sâu trần tối thiểu 125mm', 1),
(46, 'Máy lạnh Samsung Inverter 1 HP AR10TYHYCWKNSV', 30, 4, 13, 200, 7, 'assets/uploadPrd/10046305-may-lanh-samsung-inverter-1-hp-ar10tyhycwknsv.jpg', 8, 1, 'Bộ lọc Tri-Care lọc sạch 99% vi khuẩn, bụi siêu mịn và tác nhân dị ứng\r\nMáy lạnh Samsung Inverter 1 HP AR10TYHYCWKNSV được trang bị bộ lọc Tri-Care lọc sạch 99% vi khuẩn, giúp dễ dàng loại bỏ sạch bụi siêu mịn và các tác nhân dị ứng, bảo vệ tốt sức khỏe người dùng được chứng nhận bởi tổ chức quốc tế ITEA và Intertek. Bên cạnh tiêu chí chọn mua máy lạnh nào tốt cho sức khỏe, nếu bạn đang tìm kiếm một chiếc máy lạnh cho không gian phòng nhỏ dưới 15m2 thì chiếc máy lạnh 1HP này là một sự lựa chọn phù hợp. ', 1),
(47, 'Máy lạnh Daikin Inverter 1 HP FTKB25WMVMV', 20, 5, 28, 300, 7, 'assets/uploadPrd/10051422-may-lanh-daikin-inverter-1-hp-ftkb25wmvmv-2.jpg', 9, 1, 'Daikin Inverter FTKB - Vận Hành Êm Ái Tối Đa, Tiết Kiệm Điện Năng Hiệu Quả\r\nMáy lạnh Daikin Inverter 1 HP FTKB25WMVMV được trang bị công nghệ Inverter giúp tiết kiệm điện gấp nhiều lần so với những dòng máy lạnh thông thường, giảm hóa đơn tiền điện hàng tháng đáng kể cho gia đình bạn. Công nghệ này còn cải tiến độ ồn dàn nóng và dàn lạnh, cho máy hoạt động êm ái, duy trì nhiệt độ ổn định và đạt công suất tối ưu. Đồng thời, chế độ Econo tích hợp trên máy sẽ hoạt động ở công suất thấp, thích hợp sử dụng vào buổi tối hay những ngày thời tiết không quá nóng, đem đến hiệu quả tiết kiệm điện.', 1),
(48, 'Máy lạnh Toshiba Inverter 1.5 HP RAS-H13C3KCVG-V', 15, 4, 29, 350, 7, 'assets/uploadPrd/10048578-may-lanh-toshiba-inverter-1-5-hp-ras-h13c3kcvg-v.jpg', 9, 1, 'Công nghệ chống bám bẩn Magic Coil ngăn ngừa bụi bẩn, vi khuẩn\r\nMáy lạnh Toshiba Inverter 1.5 HP RAS-H13C3KCVG-V đột phá với lớp phủ đặc biệt Magic Coil ngăn ngừa bụi bẩn, vi khuẩn, nấm mốc bám vào dàn lạnh giúp máy luôn hoạt động tối ưu và bền bỉ. Không chỉ vậy, công nghệ này còn giúp nâng cao khả năng làm lạnh nhanh, tiết kiệm điện năng tối ưu, tối ưu hóa tính năng lọc khí và giảm chi phí bảo trì và số lần vệ sinh sản phẩm. Với công suất 1.5 HP, máy lạnh Toshiba thích hợp sử dụng cho không gian phòng khoảng 15 - 20m2.', 1),
(49, 'ĐIỀU HÒA KHÔNG KHÍ TOSHIBA RAS-H18U2KSG-V', 10, 4, 29, 800, 7, 'assets/uploadPrd/gallery1.jpg', 9, 1, 'Làm lạnh nhanh, an toàn\r\nĐiều hòa không khí Toshiba RAS-H18U2KSG-V\r\nĐiều hòa không khí Toshiba RAS-H18U2KSG-V\r\nĐiều hòa không khí Toshiba RAS-H18U2KSG-V\r\nCó thiết kế đơn giản, phù hợp với mọi mọi không gian nhà ở. Sử dụng nhiều tính năng vượt trội và trải nghiệm chất lượng.', 1),
(50, 'Quạt Thông Minh Smartmi Gen 3 (ZLBPLDS05ZM) – Bản Quốc Tế', 30, 3, 30, 300, 2, 'assets/uploadPrd/9-7.jpg', 8, 1, 'Phiên bản quạt mới nhất năm 2020 Quạt Xiaomi Thông Minh Smartmi gen 3  đã có mặt tại Mi Hanoi, với nhiều tính năng được cải thiện. Đặc biệt ở phiên bản này nhà sản xuất Xiaomi đã bao gồm cả điều khiển kèm theo đi với quạt, điều mà những phiên bản trước không hề có. Cùng tìm hiểu chiếc quạt này xem quạt Smartmi gen 3 có những cải tiến gì nội bật nhé!', 1);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `deleteGallery` BEFORE DELETE ON `product` FOR EACH ROW DELETE FROM gallery WHERE product_id = OLD.id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertGallery` AFTER INSERT ON `product` FOR EACH ROW INSERT INTO gallery VALUES(null, NEW.id, NEW.product_avt)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateGallery` AFTER UPDATE ON `product` FOR EACH ROW UPDATE gallery SET img = NEW.product_avt WHERE img = OLD.product_avt
$$
DELIMITER ;

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
(16, 'ut1976', '05b530ad0fb56286fe051d5f8be5b8453f1cd93f', 'ut1976@gmail.com', '0384663721', NULL, 'Thái bình', 'Phạm Thị Út');

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

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
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `commentsdetails_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `commentsdetails_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orderdetails` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `orderdetails` (`user_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_cate`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_brand`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`product_status`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`product_material`) REFERENCES `material` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
