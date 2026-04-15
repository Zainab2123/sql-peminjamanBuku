-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 15 Apr 2026 pada 17.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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
(6, 2, 'user84162', '', '', 'aktif'),
(7, 3, 'user59263', '', '', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` varchar(255) NOT NULL,
  `stok` int(255) NOT NULL,
  `gambar_buku` varchar(255) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `status` enum('akan_datang','rilis') DEFAULT 'rilis',
  `tanggal_rilis` date DEFAULT NULL,
  `auto_release` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `stok`, `gambar_buku`, `id_kategori`, `status`, `tanggal_rilis`, `auto_release`) VALUES
(1, 'MATEMATIKA Untuk SMA/MA Kelas X', 'Dr. Andi Pratama dan Dra. Siti Nuraini', 'Dinamika Edukasi', '2026', 10, 'MATEMATIKA Untuk SMAMA Kelas X.png', 1, 'rilis', NULL, 0),
(2, 'MATEMATIKA Untuk SMA/MA Kelas XI', 'Dr. Andi Pratama dan Dra. Siti Nuraini', 'Dinamika Edukasi', '2026', 15, '', 1, 'akan_datang', '2026-04-30', 0);

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
(49, 1, 1, 1),
(50, 2, 1, 1),
(51, 3, 1, 1),
(52, 4, 1, 2),
(53, 5, 1, 1),
(54, 6, 1, 2),
(55, 7, 1, 2),
(56, 8, 2, 2),
(57, 9, 1, 1),
(58, 10, 2, 14);

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
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `tipe` enum('permohonan_pinjam','permohonan_kembali','disetujui_pinjam','ditolak_pinjam','disetujui_kembali','ditolak_kembali') NOT NULL,
  `pesan` text NOT NULL,
  `id_peminjaman` int(11) NOT NULL,
  `dibaca` tinyint(1) DEFAULT 0,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `notifikasi`
--

INSERT INTO `notifikasi` (`id_notifikasi`, `id_user`, `id_admin`, `tipe`, `pesan`, `id_peminjaman`, `dibaca`, `tanggal`) VALUES
(18, 1, 1, '', 'Anda telah menyetujui peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 4, 1, '2026-04-15 03:06:48'),
(20, 1, 1, '', 'Anda telah menyetujui peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 5, 1, '2026-04-15 03:09:24'),
(22, 1, 1, '', 'Anda telah menyetujui pengembalian buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 3, 1, '2026-04-15 03:19:38'),
(24, 1, 1, '', 'Anda telah menyetujui peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 6, 1, '2026-04-15 03:19:50'),
(27, 1, 1, '', 'Anda telah menyetujui pengembalian buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 6, 1, '2026-04-15 03:22:11'),
(30, 1, 1, '', 'Anda telah menyetujui peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 7, 1, '2026-04-15 03:22:40'),
(33, 1, 1, '', 'Anda telah menyetujui peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 7, 1, '2026-04-15 03:23:01'),
(35, 1, 1, '', 'Anda telah menyetujui peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 5, 1, '2026-04-15 03:23:03'),
(37, 1, 1, '', 'Anda telah menyetujui peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 4, 1, '2026-04-15 03:23:08'),
(39, 1, 1, '', 'Anda telah menyetujui pengembalian buku \"MATEMATIKA Untuk SMA/MA Kelas X\".', 3, 1, '2026-04-15 03:23:16'),
(40, 1, 1, 'permohonan_pinjam', 'user84162 memohon untuk meminjam buku \"MATEMATIKA Untuk SMA/MA Kelas XI\" sebanyak 2 eksemplar.', 8, 1, '2026-04-15 03:30:01'),
(41, 2, NULL, '', 'Permohonan peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas XI\" sebanyak 2 eksemplar berhasil dikirim! Menunggu persetujuan admin.', 8, 1, '2026-04-15 03:30:01'),
(42, 1, 1, 'permohonan_pinjam', 'user84162 memohon untuk meminjam buku \"MATEMATIKA Untuk SMA/MA Kelas X\" sebanyak 1 eksemplar.', 9, 1, '2026-04-15 11:36:14'),
(43, 2, NULL, '', 'Permohonan peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas X\" sebanyak 1 eksemplar berhasil dikirim! Menunggu persetujuan admin.', 9, 1, '2026-04-15 11:36:14'),
(44, 1, 1, 'permohonan_pinjam', 'user84162 memohon untuk meminjam buku \"MATEMATIKA Untuk SMA/MA Kelas XI\" sebanyak 14 eksemplar.', 10, 1, '2026-04-15 13:17:55'),
(45, 2, NULL, '', 'Permohonan peminjaman buku \"MATEMATIKA Untuk SMA/MA Kelas XI\" sebanyak 14 eksemplar berhasil dikirim! Menunggu persetujuan admin.', 10, 0, '2026-04-15 13:17:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tanggal_peminjaman` varchar(255) NOT NULL,
  `tanggal_kembali` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `tanggal_peminjaman`, `tanggal_kembali`, `status`) VALUES
(1, 6, '2026-04-14', '2026-04-14', 'dikembalikan'),
(2, 6, '2026-04-14', '', 'ditolak_pinjam'),
(3, 6, '2026-04-14', '2026-04-15', 'dikembalikan'),
(4, 6, '2026-04-15', '', 'dipinjam'),
(5, 6, '2026-04-15', '', 'dipinjam'),
(6, 6, '2026-04-15', '2026-04-15', 'dikembalikan'),
(7, 6, '2026-04-15', '', 'dipinjam'),
(8, 6, '2026-04-15', '', 'menunggu_pinjam'),
(9, 6, '2026-04-15', '', 'menunggu_pinjam'),
(10, 6, '2026-04-15', '', 'menunggu_pinjam');

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
(1, 'admin', 'admin123', 'admin'),
(2, 'Zainab', '$2y$10$Ro9OqO8zoAbTBsc9ypuoFubVpa2Le5U44dC0puEhBkunLmre10hou', 'anggota'),
(3, 'Zae', '$2y$10$0Vjjn8qjxutmW1EsJ1AUFOWSaERKcz/8DVpuZTDSQHASoOaBkyv1q', 'anggota');

--
-- Indexes for dumped tables
--

--
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
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `fk_notif_user` (`id_user`),
  ADD KEY `fk_notif_admin` (`id_admin`),
  ADD KEY `fk_notif_peminjaman` (`id_peminjaman`);

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
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Ketidakleluasaan untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `fk_notif_admin` FOREIGN KEY (`id_admin`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_notif_peminjaman` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_notif_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
