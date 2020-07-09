-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 20-07-09 20:51
-- 서버 버전: 10.4.10-MariaDB
-- PHP 버전: 7.3.12

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
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `idx` int(11) NOT NULL,
  `id` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`idx`, `id`, `password`, `img`, `name`) VALUES
(1, 'asdf1', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'noname01.png', 'asdf'),
(3, 'specialist1', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'specialist1.jpg', '전문가1'),
(4, 'specialist2', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'specialist2.jpg', '전문가2'),
(5, 'specialist3', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'specialist3.jpg', '전문가3'),
(6, 'specialist4', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'specialist4.jpg', '전문가4'),
(7, 'asdf', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', 'user1.jpg', 'asdf');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idx`),
  ADD UNIQUE KEY `id` (`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
