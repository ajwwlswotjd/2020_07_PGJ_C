-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 20-07-09 20:23
-- 서버 버전: 10.4.11-MariaDB
-- PHP 버전: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `db`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `exp_review`
--

CREATE TABLE `exp_review` (
  `idx` int(11) NOT NULL,
  `exp_idx` int(11) NOT NULL,
  `writer` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `content` text NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `exp_review`
--

INSERT INTO `exp_review` (`idx`, `exp_idx`, `writer`, `pay`, `content`, `grade`) VALUES
(1, 4, 8, 14000, 'asdf', 3),
(2, 5, 8, 15600, '전문가3 화이팅!!', 5),
(3, 5, 8, 124, '213', 3),
(4, 5, 8, 3123, '21321', 3),
(5, 5, 8, 213213, '21321', 3),
(6, 4, 8, 123, '21321', 5),
(7, 3, 8, 321321, '321', 1),
(8, 3, 8, 12321, '321', 5),
(9, 3, 8, 21313, '12321', 4),
(10, 3, 8, 21, '3213', 4),
(11, 3, 8, 12321321, '213321', 4),
(12, 3, 8, 21321, '3213213', 4),
(13, 3, 8, 321321, '321321', 4),
(14, 3, 8, 12321, '3123', 5),
(15, 3, 8, 21321321, '321321', 5),
(16, 3, 8, 2132132, '3213', 5),
(17, 6, 8, 123, '124', 5);

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `idx` int(11) NOT NULL,
  `id` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`idx`, `id`, `password`, `img`, `name`, `level`) VALUES
(1, 'asdf1', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'noname01.png', 'asdf', 0),
(3, 'specialist1', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'specialist1.jpg', '전문가1', 1),
(4, 'specialist2', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'specialist2.jpg', '전문가2', 1),
(5, 'specialist3', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'specialist3.jpg', '전문가3', 1),
(6, 'specialist4', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'specialist4.jpg', '전문가4', 1),
(7, 'asdf', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'user1.jpg', 'asdf', 0),
(8, 'asdf2', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', '157957075459243991.png', 'asdf', 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `warm`
--

CREATE TABLE `warm` (
  `idx` int(11) NOT NULL,
  `know` text NOT NULL,
  `before_img` varchar(100) NOT NULL,
  `after_img` varchar(100) NOT NULL,
  `writer` int(11) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `warm`
--

INSERT INTO `warm` (`idx`, `know`, `before_img`, `after_img`, `writer`, `date`) VALUES
(1, 'ㄴㅇㄹㄴㅇㄹㅇ', 'CRY.jpg', 'CRY.jpg', 3, '2020-07-09'),
(2, 'ㄹ홓', 'AGREE.jpg', 'CRY.jpg', 3, '2020-07-09'),
(3, '그냥 물만 엄청 마셨는데 야줌이 자꾸 마려우니까 잠이 안와요 개꿀 ㅋㅋㅋ', 'AGREE.jpg', 'ZZZ.jpg', 3, '2020-07-09'),
(4, '안녕하세요구르트 ㅋㅋㅋㅋ', '157957072246135370.jpg', '157957075459243991.png', 4, '2020-07-09');

-- --------------------------------------------------------

--
-- 테이블 구조 `warm_grade`
--

CREATE TABLE `warm_grade` (
  `idx` int(11) NOT NULL,
  `user_idx` int(11) NOT NULL,
  `warm_idx` int(11) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `warm_grade`
--

INSERT INTO `warm_grade` (`idx`, `user_idx`, `warm_idx`, `grade`) VALUES
(1, 3, 1, 3),
(2, 4, 1, 5),
(3, 4, 2, 5),
(4, 4, 3, 1),
(5, 5, 4, 3),
(6, 5, 3, 5),
(7, 5, 2, 1),
(8, 5, 1, 3);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `exp_review`
--
ALTER TABLE `exp_review`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idx`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 테이블의 인덱스 `warm`
--
ALTER TABLE `warm`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `warm_grade`
--
ALTER TABLE `warm_grade`
  ADD PRIMARY KEY (`idx`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `exp_review`
--
ALTER TABLE `exp_review`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 테이블의 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 테이블의 AUTO_INCREMENT `warm`
--
ALTER TABLE `warm`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `warm_grade`
--
ALTER TABLE `warm_grade`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
