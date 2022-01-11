-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jan 2022 pada 03.32
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lets-migo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkout`
--

CREATE TABLE `checkout` (
  `id_checkout` int(11) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `no_telp` int(16) NOT NULL,
  `nama_kota` varchar(50) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `kode_pos` int(7) NOT NULL,
  `jenis_pengiriman` enum('Instant','Medium','Premium') NOT NULL,
  `jenis_pembayaran` enum('COD','Gopay','Ovo') NOT NULL,
  `status` enum('pending','accept','reject') NOT NULL,
  `waktu_belanja` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `checkout`
--

INSERT INTO `checkout` (`id_checkout`, `nama_pembeli`, `no_telp`, `nama_kota`, `alamat`, `kode_pos`, `jenis_pengiriman`, `jenis_pembayaran`, `status`, `waktu_belanja`) VALUES
(17, 'giyar', 9324883, 'Jakarta', '', 11348, 'Instant', 'Gopay', 'accept', '2021-12-07 19:12:03'),
(18, 'paman', 978378, 'Jakarta', 'jbbbjb', 11169, 'Instant', 'Gopay', 'accept', '2021-12-07 20:12:26'),
(19, 'bagas', 943278329, 'Jakarta', 'jl. mangga', 11348, 'Instant', 'COD', 'reject', '2021-12-12 18:12:15'),
(20, 'pip', 4372647, 'Jakarta', 'jl. jambu', 11169, 'Instant', 'Gopay', 'accept', '2021-12-12 18:12:52'),
(21, 'ubay', 2147483647, 'Medan', 'jln jln', 29238, 'Medium', 'Gopay', 'reject', '2021-12-12 19:12:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id_migo` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `harga` int(200) NOT NULL,
  `gambar` varchar(250) NOT NULL,
  `stock` int(200) NOT NULL,
  `deskripsi` char(200) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id_migo`, `nama`, `harga`, `gambar`, `stock`, `deskripsi`, `createdAt`) VALUES
(28, 'Pajero Sport', 1050000000, '61b699162b0e3.jpg', 2, 'Baru', '0000-00-00 00:00:00'),
(30, 'suzukiS', 300000000, '61b698f438ba5.jpg', 3, 'Baru', '0000-00-00 00:00:00'),
(31, 'Honda civic', 700000000, '61b699668ccbb.jpg', 3, 'Baru', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `no_telp` varchar(200) NOT NULL,
  `level` enum('penjual','pembeli') NOT NULL,
  `umur` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `no_telp`, `level`, `umur`) VALUES
(17, 'user', '$2y$10$fwpG9mgm7NAEmiHrGuS5leByAf1M073CHPsZj/nEKGVE23ShdHqgi', 'user@gmail.com', '9259237', 'pembeli', 11),
(18, 'admin', '$2y$10$.ZD1sG15TkywMUH03P0Qm.p4cgXRqT0kyMhwoW9sOX/9VLh/etEJi', 'admin@gmail.com', '0i29238493829', 'penjual', 16),
(19, 'paman', '$2y$10$qNHux5MDHbH0f85kh03HkuxiLJbhQLDkcGM1qV3hL1hKC0xLTprDa', 'user@gmail.com', '97978', 'pembeli', 12),
(20, 'pip', '$2y$10$fP0uD/B8G2esxi6piwOR2.NyjlTNSZSmTbJOmrq5a.vhI3yJ0xE.K', 'pip@gmail.com', '0402499038', 'pembeli', 17),
(21, 'ubay', '$2y$10$Grr0AC65kXswj9vtuimsC.GbsaJY34ECXRf./bLWVKp5ZJ2xcg2LC', 'ubay@gmail.com', '01237281', 'pembeli', 11);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id_checkout`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_migo`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id_checkout` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id_migo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
