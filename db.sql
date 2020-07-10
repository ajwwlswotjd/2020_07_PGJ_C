-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 20-07-10 21:00
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
-- 테이블 구조 `estimate`
--

CREATE TABLE `estimate` (
  `idx` int(11) NOT NULL,
  `date` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `writer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `estimate`
--

INSERT INTO `estimate` (`idx`, `date`, `content`, `writer`) VALUES
(1, '2020-07-25', '15231', 3),
(2, '2020-07-20', '21421421', 3),
(3, '42121-03-21', '31232321', 3),
(4, '2020-07-08', '323232', 3),
(5, '2020-07-13', 'asdgregregre', 3),
(6, '2020-07-02', 'asdgreghre', 3),
(7, '2020-07-13', 'dfewrg', 3),
(8, '2020-07-02', '이잉 기뮤링~', 4),
(9, '2020-07-15', '가나다라마바사아자차카타파하', 7),
(10, '2020-07-16', '우리엄마 뽀뽀 우리아빠 뽀뽀', 3);

-- --------------------------------------------------------

--
-- 테이블 구조 `est_res`
--

CREATE TABLE `est_res` (
  `idx` int(11) NOT NULL,
  `est_idx` int(11) NOT NULL,
  `exp_idx` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `pay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(18, 5, 3, 34, '132', 3),
(19, 5, 3, 421, '421421421', 3),
(20, 5, 3, 4214, '21421412', 3),
(21, 5, 3, 4214, '21412', 3),
(22, 6, 3, 412421, '421421', 3),
(23, 6, 3, 421421, '42421', 3),
(24, 6, 3, 2142, '1421421', 3),
(25, 6, 3, 214, '21421412', 3),
(26, 6, 3, 4214, '2142142', 3),
(27, 6, 3, 2142, '1421421', 3),
(28, 5, 3, 421421421, '421421', 3),
(29, 4, 3, 123124, 'ewewqewq', 5),
(30, 3, 3, 15222, '232', 5),
(31, 4, 3, 15000, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur esse iusto, cumque autem excepturi, necessitatibus hic nulla est possimus dignissimos, perferendis enim. Culpa facilis deserunt officiis atque provident possimus natus.', 3);

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
(8, 'asdf2', '*7F0C90A004C46C64A0EB9DDDCE5DE0DC437A635C', '157957075459243991.png', 'asdf', 0),
(9, 'a', '*667F407DE7C6AD07358FA38DAED7828A72014B4E', 'img17.png', 'a', 0);

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
(4, '안녕하세요구르트 ㅋㅋㅋㅋ', '157957072246135370.jpg', '157957075459243991.png', 4, '2020-07-09'),
(5, '문준원 화이팅!', '83437424_2544062442506588_2929099139604021248_n.jpg', '83437424_2544062442506588_2929099139604021248_n.jpg', 3, '2020-07-10'),
(6, 'fewfew', '83437424_2544062442506588_2929099139604021248_n.jpg', '83437424_2544062442506588_2929099139604021248_n.jpg', 3, '2020-07-10'),
(7, 'ewfew', '83437424_2544062442506588_2929099139604021248_n.jpg', 'KakaoTalk_20200708_220342071.png', 3, '2020-07-10'),
(8, 'ewqewq', 'KakaoTalk_20200630_190419138.png', '907 요정도..PNG', 3, '2020-07-10'),
(9, 'fewfew', '그림1.png', '백엔드.png', 3, '2020-07-10'),
(10, 'sadfew', 'KakaoTalk_20200708_220342071.png', '사용자 음성.png', 3, '2020-07-10'),
(11, 'ewfew', 'download.jpg', '83437424_2544062442506588_2929099139604021248_n.jpg', 4, '2020-07-10');

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
(8, 5, 1, 3),
(9, 3, 4, 5),
(10, 4, 8, 4),
(11, 4, 7, 3),
(12, 4, 6, 5),
(13, 3, 11, 3);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `estimate`
--
ALTER TABLE `estimate`
  ADD PRIMARY KEY (`idx`);

--
-- 테이블의 인덱스 `est_res`
--
ALTER TABLE `est_res`
  ADD PRIMARY KEY (`idx`);

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
-- 테이블의 AUTO_INCREMENT `estimate`
--
ALTER TABLE `estimate`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 테이블의 AUTO_INCREMENT `est_res`
--
ALTER TABLE `est_res`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `exp_review`
--
ALTER TABLE `exp_review`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 테이블의 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 테이블의 AUTO_INCREMENT `warm`
--
ALTER TABLE `warm`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 테이블의 AUTO_INCREMENT `warm_grade`
--
ALTER TABLE `warm_grade`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
