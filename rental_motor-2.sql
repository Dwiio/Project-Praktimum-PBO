-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 17 Bulan Mei 2026 pada 05.00
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_motor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `motor`
--

CREATE TABLE `motor` (
  `id_motor` int(11) NOT NULL,
  `merk` varchar(50) DEFAULT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `plat_nomor` varchar(20) DEFAULT NULL,
  `harga_sewa` int(11) DEFAULT NULL,
  `status_motor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `motor`
--

INSERT INTO `motor` (`id_motor`, `merk`, `tipe`, `plat_nomor`, `harga_sewa`, `status_motor`) VALUES
(1, 'Yamaha', 'Nmax', 'DR 1234 AG', 30000, 'Tersedia'),
(2, 'Honda', 'Vario 160', 'DR 2345 BG', 25000, 'Tersedia'),
(3, 'Honda', 'Beat', 'DR 3456 CG', 20000, 'Tersedia'),
(4, 'Yamaha', 'Aerox 155', 'DR 4567 DG', 28000, 'Tersedia'),
(5, 'Honda', 'PCX 160', 'DR 5678 EG', 35000, 'Tersedia'),
(6, 'Yamaha', 'Mio M3', 'DR 6789 FG', 18000, 'Tersedia'),
(7, 'Suzuki', 'Address', 'DR 7890 GG', 18000, 'Tersedia'),
(8, 'Honda', 'Scoopy', 'DR 8901 HG', 22000, 'Tersedia'),
(9, 'Yamaha', 'Fazzio', 'DR 9012 IG', 23000, 'Tersedia'),
(10, 'Honda', 'Genio', 'DR 1123 JG', 20000, 'Tersedia'),
(11, 'Yamaha', 'Lexi 125', 'DR 2234 KG', 22000, 'Tersedia'),
(12, 'Suzuki', 'Nex II', 'DR 3345 LG', 17000, 'Tersedia'),
(13, 'Honda', 'CB150R', 'DR 4456 MG', 30000, 'Tersedia'),
(14, 'Yamaha', 'R15', 'DR 5567 NG', 40000, 'Tersedia'),
(15, 'Kawasaki', 'Ninja 250', 'DR 6678 OG', 70000, 'Tersedia'),
(16, 'Honda', 'CRF150L', 'DR 7789 PG', 50000, 'Tersedia'),
(17, 'Yamaha', 'WR155R', 'DR 8890 QG', 55000, 'Tersedia'),
(18, 'Suzuki', 'GSX R150', 'DR 9901 RG', 45000, 'Tersedia'),
(19, 'Kawasaki', 'KLX 150', 'DR 1012 SG', 48000, 'Tersedia'),
(20, 'Honda', 'ADV 160', 'DR 2123 TG', 38000, 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `no_ktp` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `alamat`, `no_hp`, `no_ktp`) VALUES
(1, 'Udin', 'Sleman', '08181818181', '500022020202'),
(2, 'Upin', 'Pugeran', '0820220920910', '50001920910291'),
(3, 'Doni', 'Banguntapan', '0832929298383', '12324252637373'),
(4, 'Budi Santoso', 'Yogyakarta', '081234567890', '3404010101010001'),
(5, 'Andi Pratama', 'Bantul', '082134567891', '3404020202020002'),
(6, 'Rina Sari', 'Sleman', '083245678902', '3404030303030003'),
(7, 'Siti Aminah', 'Kulon Progo', '084356789013', '3404040404040004'),
(8, 'Dewi Lestari', 'Gunungkidul', '085467890124', '3404050505050005'),
(9, 'Agus Setiawan', 'Wonosari', '086578901235', '3404060606060006'),
(10, 'Fajar Ramadhan', 'Kasihan', '087689012346', '3404070707070007');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_rental` int(11) DEFAULT NULL,
  `id_motor` int(11) DEFAULT NULL,
  `tanggal_dikembalikan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rental`
--

CREATE TABLE `rental` (
  `id_rental` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_motor` int(11) DEFAULT NULL,
  `tanggal_sewa` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `status_rental` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rental`
--

INSERT INTO `rental` (`id_rental`, `id_pelanggan`, `id_motor`, `tanggal_sewa`, `tanggal_kembali`, `total_harga`, `status_rental`) VALUES
(1, 1, 1, '2026-05-10', '2026-05-12', 100000, 'Selesai'),
(6, 1, 2, '2026-05-17', '2026-05-19', 100000, 'Selesai');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`id_motor`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`);

--
-- Indeks untuk tabel `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`id_rental`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `motor`
--
ALTER TABLE `motor`
  MODIFY `id_motor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rental`
--
ALTER TABLE `rental`
  MODIFY `id_rental` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
