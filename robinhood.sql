-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: May 04, 2023 at 02:18 PM
-- Server version: 5.7.37
-- PHP Version: 8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `robinhood`
--

-- --------------------------------------------------------


--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `email`) VALUES
(1, 'ธันวา จาดเอี่ยม', 'https://www.w3schools.com/howto/img_avatar.png', 'tanva.ball@gmail.com'),
(2, 'User1', 'https://www.w3schools.com/howto/img_avatar2.png', 'robinhood@robinhood.co.th');

--


CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('To do','In Progress','Done') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `assigned` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `detail`, `status`, `created_by`, `created_at`, `assigned`) VALUES
(1, 'Job 1', 'Robinhood แถลงข่าวเปิดตัวไปตั้งแต่เมื่อเดือนมิถุนายนปีนี้ โดยได้กระแสตอบรับที่ดีมาก จากการชูจุดเด่นไม่เก็บค่าธรรมเนียมการใช้แพลตฟอร์ม (GP) เหมือนกับเจ้าอื่น ที่บางแห่งปรับขึ้นมากกว่าเดิมแม้ผู้คนในประเทศจะอยู่ในช่วงเวลาแห่งความยากลำบาก ซึ่งการเปิดตัวไปในวันนั้นต้องบอกว่าเป็นเพียงแค่น้ำจิ้ม เพื่อเรียกให้ฝั่งร้านอาหาร รวมถึงไรเดอร์ให้มาสมัครเข้าร่วมแพลตฟอร์ม รวมถึงพัฒนาแอป เก็บฟีดแบคเพิ่มเติม และด้วยข้อมูลที่ได้มาจากหลายฝ่ายนี้เอง ทำให้การเปิดตัวของ Robinhood ก็ล่าช้าลงไปมาก เพราะต้องการปรับปรุงประสบการณ์ใช้งานให้ตอบโจทย์ที่สุด และหาจุดแข็งที่ทำให้สู้กับแพลตฟอร์มต่างชาติอื่น ๆ ได้นั่นเอง โดยปัจจุบัน Robinhood มีจำนวนร้านค้าเข้ามาร่วมในแพลตฟอร์มแล้วกว่า 16,000 ร้านค้า และมีไรเดอร์ในสังกัดพร้อมให้บริการแล้วกว่า 10,000 ชีวิต', 'To do', 2, '2023-05-01 10:00:00', 'Y'),
(2, 'Job 2', 'Job 2 detail', 'In Progress', 1, '2023-05-04 11:00:00', 'Y'),
(3, 'Job 3', 'Job 3 detail', 'Done', 1, '2023-05-04 12:00:00', 'N'),
(4, 'Job 4', 'Job 4 detail', 'To do', 2, '2023-05-04 13:00:00', 'N'),
(5, 'Job 5', 'Job 5 detail', 'In Progress', 1, '2023-05-04 14:00:00', 'N'),
(6, 'Job 6', 'Job 6 detail', 'Done', 2, '2023-05-04 15:00:00', 'N'),
(7, 'Job 7', 'Job 7 detail', 'To do', 1, '2023-05-04 16:00:00', 'N'),
(8, 'Job 8', 'Job 8 detail', 'In Progress', 2, '2023-05-04 17:00:00', 'N'),
(9, 'Job 9', 'Job 9 detail', 'Done', 1, '2023-05-04 18:00:00', 'N'),
(10, 'Job 10', 'Job 10 detail', 'To do', 2, '2023-05-04 19:00:00', 'N'),
(11, 'Job 11', 'Job 11 detail', 'In Progress', 1, '2023-05-04 20:00:00', 'N'),
(12, 'Job 12', 'Job 12 detail', 'Done', 2, '2023-05-04 21:00:00', 'N'),
(13, 'Job 13', 'Job 13 detail', 'To do', 1, '2023-05-04 22:00:00', 'N'),
(14, 'Job 14', 'Job 14 detail', 'In Progress', 2, '2023-05-04 23:00:00', 'N'),
(15, 'Job 15', 'Job 15 detail', 'Done', 1, '2023-05-05 00:00:00', 'N'),
(16, 'Job 16', 'Job 16 detail', 'To do', 2, '2023-05-05 01:00:00', 'N'),
(17, 'Job 17', 'Job 17 detail', 'In Progress', 1, '2023-05-05 02:00:00', 'N'),
(18, 'Job 18', 'Job 18 detail', 'Done', 2, '2023-05-05 03:00:00', 'N'),
(19, 'Job 19', 'Job 19 detail', 'To do', 1, '2023-05-05 04:00:00', 'N'),
(20, 'Job 20', 'Job 20 detail', 'In Progress', 2, '2023-05-05 05:00:00', 'N');

-- --------------------------------------------------------


--
-- Table structure for table `assigned_jobs`
--

CREATE TABLE `assigned_jobs` (
  `id` int(11) NOT NULL,
  `jobs_id` int(11) DEFAULT NULL,
  `status` enum('To do','In Progress','Done') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assigned_jobs`
--

INSERT INTO `assigned_jobs` (`id`, `jobs_id`, `status`, `created_by`, `created_at`) VALUES
(1, 1, 'To do', 1, '2023-05-04 13:04:13'),
(2, 1, 'To do', 1, '2023-05-04 13:04:15'),
(3, 1, 'To do', 1, '2023-05-04 13:04:36'),
(4, 2, 'To do', 1, '2023-05-04 13:05:36'),
(5, 2, 'To do', 1, '2023-05-04 14:03:29');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `jobs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `detail`, `created_by`, `created_at`, `jobs_id`) VALUES
(21, 'This is a comment by user 1 on job 1', 1, '2023-05-04 03:13:47', 1),
(22, 'This is a comment by user 2 on job 1', 2, '2023-05-04 03:13:47', 1),
(23, 'This is a comment by user 3 on job 1', 1, '2023-05-04 03:13:47', 1),
(24, 'This is a comment by user 4 on job 2', 2, '2023-05-04 03:13:47', 2),
(25, 'This is a comment by user 5 on job 2', 1, '2023-05-04 03:13:47', 2),
(26, 'This is a comment by user 6 on job 2', 2, '2023-05-04 03:13:47', 2),
(27, 'This is a comment by user 1 on job 3', 1, '2023-05-04 03:13:47', 3),
(28, 'This is a comment by user 2 on job 3', 2, '2023-05-04 03:13:47', 3),
(29, 'This is a comment by user 3 on job 3', 1, '2023-05-04 03:13:47', 3),
(30, 'This is a comment by user 4 on job 4', 2, '2023-05-04 03:13:47', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--


-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_jobs`
--
ALTER TABLE `assigned_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coment_user` (`created_by`),
  ADD KEY `comment_job` (`jobs_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_create` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned_jobs`
--
ALTER TABLE `assigned_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `coment_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_job` FOREIGN KEY (`jobs_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `user_create` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;