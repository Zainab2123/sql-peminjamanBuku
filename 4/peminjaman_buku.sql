-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
<<<<<<< HEAD
-- Waktu pembuatan: 08 Apr 2026 pada 18.18
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12
=======
-- Generation Time: Apr 08, 2026 at 11:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12
>>>>>>> a13656bef7351b08e367b92f1e8f752c4dd620fa

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman_buku`
--

-- --------------------------------------------------------

--
<<<<<<< HEAD
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `id_user`, `nama`, `kelas`, `no_hp`, `status`) VALUES
(1, 7, 'zainab', 'xii rpl', '12345678910', 'aktif'),
(2, 8, 'user66663', '', '', 'nonaktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
=======
-- Table structure for table `buku`
>>>>>>> a13656bef7351b08e367b92f1e8f752c4dd620fa
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` varchar(255) NOT NULL,
  `stok` int(255) NOT NULL,
<<<<<<< HEAD
  `gambar_buku` varchar(255) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `stok`, `gambar_buku`, `id_kategori`) VALUES
(4, 'MATEMATIKA Untuk SMA/MA Kelas X', 'Dr. Andi Pratama dan Dra. Siti Nuraini', 'Dinamika Edukasi', '2026', 44, 'MATEMATIKA Untuk Kelas X.png', 1),
(5, 'MATEMATIKA Untuk SMA/MA Kelas XI', 'Dr. Andi Pratama dan Dra. Siti Nuraini', 'Dinamika Edukasi', '2026', 45, 'MATEMATIKA Untuk SMAMA Kelas XI.png', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id_detail` int(11) NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `jumlah` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id_detail`, `id_peminjaman`, `id_buku`, `jumlah`) VALUES
(8, 8, 4, 1),
(9, 9, 4, 2),
(10, 10, 4, 2),
(11, 11, 4, 2),
(12, 12, 4, 2),
(13, 13, 4, 2),
(14, 14, 4, 2),
(15, 15, 4, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Matematika'),
(2, 'IPA'),
(3, 'Fisika'),
(4, 'Kimia'),
(5, 'Biologi'),
(6, 'Bahasa Indonesia'),
(7, 'Bahasa Inggris'),
(8, 'IPS'),
(9, 'Sejarah'),
(10, 'Geografi'),
(11, 'Ekonomi'),
(12, 'Sosiologi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tanggal_peminjaman` varchar(255) NOT NULL,
  `tanggal_kembali` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `tanggal_peminjaman`, `tanggal_kembali`, `status`) VALUES
(1, 1, '2026-04-07', '2026-04-07', 'dikembalikan'),
(2, 1, '2026-04-07', '2026-04-07', 'dikembalikan'),
(3, 1, '2026-04-07', '2026-04-08', 'dikembalikan'),
(4, 2, '2026-04-07', '2026-04-07', 'dikembalikan'),
(5, 1, '2026-04-08', '2026-04-08', 'dikembalikan'),
(6, 1, '2026-04-08', '', 'dipinjam'),
(7, 1, '2026-04-08', '', 'dipinjam'),
(8, 1, '2026-04-01', '2026-04-08', 'dikembalikan'),
(9, 1, '2026-04-01', '2026-04-08', 'dikembalikan'),
(10, 1, '2026-04-08', '', 'dipinjam'),
(11, 1, '2026-04-08', '', 'dipinjam'),
(12, 1, '2026-04-08', '', 'dipinjam'),
(13, 1, '2026-04-08', '', 'dipinjam'),
(14, 1, '2026-04-08', '', 'dipinjam'),
(15, 1, '2026-04-08', '', 'dipinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `role`) VALUES
(1, 'siswa', 'siswa123', 'anggota'),
(2, 'admin', 'admin123', 'admin'),
(3, 'siswa2', 'siswa456', 'anggota'),
(4, 'siswa3', 'siswa789', 'anggota'),
(5, 'siswa4', '$2y$10$HK6hLAzdZCoFS7t.Xewn9.SG1FClUtKZsAUOMtKG/tnrMo47bhxIK', 'anggota'),
(6, 'admin2', 'admin456', 'admin'),
(7, 'zainab', '$2y$10$.vc1tjPRz/UYK4/nwYiPv.WkyAPlBoBFVfFgiYWz9TLPRJTMh7fBi', 'anggota'),
(8, 'putri', '$2y$10$ypNsKLqHshBc6LJEknw6DOELbidB60vHaEFFBJbqMJK0sjvDp8ZbK', 'anggota');
=======
  `gambar_buku` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `stok`, `gambar_buku`) VALUES
(1, 'Pura-Pura Untuk Aku', 'Sinta Wardhani', 'Bintang Pustaka', '2021', 35, 'Pura_pura_untuk_aku_di_senja.png');
>>>>>>> a13656bef7351b08e367b92f1e8f752c4dd620fa

--
-- Indexes for dumped tables
--

--
<<<<<<< HEAD
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_peminjaman` (`id_peminjaman`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `detail_peminjaman_ibfk_1` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE;
=======
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
>>>>>>> a13656bef7351b08e367b92f1e8f752c4dd620fa
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
