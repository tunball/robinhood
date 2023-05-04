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


