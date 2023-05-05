GRANT ALL PRIVILEGES ON *.* TO 'tanva'@'%' IDENTIFIED BY '1234';


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
(1, 1, 'To do', 1, '2023-05-05 04:01:51');

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
(1, 'Job 1', 'Job 1 Robinhood mid the economic hardships caused by COVID-19, a homegrown food delivery platform for the Thai people has been created by the SCB Group, motivated by the Group’s strong determination to support society by helping to lower the cost of living, particularly for those preferring to dine at home.  With food delivery services gaining in popularity, SCB came up with the idea of creating a “Robinhood” food delivery application, inspired by the securities trading firm of the same name that does not charge service fees.  Employing the same concept, the new food delivery platform will not charge any subscription, GP (Gross Profit), or other fees.  Eateries will be able to recoup the full amount of their costs', 'To do', 2, '2023-05-01 10:00:00', 'Y'),
(2, 'Job 2', 'Job 2 detail The SCB Group’s new generation team was tasked with building the application. Normally a project of this type would take at least six to twelve months to develop.  However, by using existing Bank resources, such as its robust technology infrastructure, it’s Mae Manee project restaurant network, the resources of close partner Google My Business, and the delivery messengers of the Bank’s business partner Skootar, the application was completed in just three months, and new partners are being continually added.  This approach enabled SCB to effectively lower its costs, unlike other new startups.\r\n\r\nสินค้าที่ได้รับความนิยมใน Robinhood Mart คือ ผักสวนครัว เนื้อสัตว์ และยาตามลำดับ\r\n\r\nช่วงพีคจะอยู่ในวันพฤหัสบดีและวันอาทิตย์ เวลาพีค คือ 11.00-15.00 น. จึงช่วยเติมงานให้กับไรเดอร์ของ Robinhood ในช่วงนอกเวลาส่งอาหาร', 'In Progress', 1, '2023-05-04 11:00:00', 'N'),
(3, 'Job 3', 'Job 3 detail Robinhood will speed up payment, with a goal of sellers receiving their money within one hour after closing an order.   Payments will be credited to both sellers and delivery messengers automatically via the digital system without any cash involved.', 'Done', 1, '2023-05-04 12:00:00', 'N'),
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
(1, 'Tanva', 'https://www.w3schools.com/howto/img_avatar.png', 'tanva.ball@gmail.com'),
(2, 'User1', 'https://www.w3schools.com/howto/img_avatar2.png', 'robinhood1@robinhood.co.th'),
(3, 'User2', 'https://www.w3schools.com/howto/img_avatar2.png', 'robinhood2@robinhood.co.th');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
