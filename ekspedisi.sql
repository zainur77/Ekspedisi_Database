-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Des 2021 pada 08.40
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ekspedisi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(20) NOT NULL,
  `alamat_admin` varchar(20) NOT NULL,
  `no_hp_admin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `alamat_admin`, `no_hp_admin`) VALUES
(1, 'sahid', 'jember', '081255312643');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `kategori_barang` varchar(20) NOT NULL,
  `berat_barang` float NOT NULL,
  `panjang` float DEFAULT NULL,
  `lebar` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `kategori_barang`, `berat_barang`, `panjang`, `lebar`) VALUES
(1, 'arduino', 'elektronik', 10, 5, 4),
(3, 'oreo', 'makanan', 10, NULL, NULL),
(4, 'xiomi_redmiNot_10', 'elektronik', 30, 12, 5),
(5, 'sepatu_nike', 'pakaian', 20, 12, 4),
(6, 'jersey', 'pakaian', 10, NULL, NULL),
(7, 'kacamata', 'accecorist', 25, NULL, NULL),
(8, 'jam_tangan', 'accecorist', 30, NULL, NULL),
(9, 'kalung_kupu-kupu', 'accecorist', 6, NULL, NULL),
(10, 'gelang_tasbih', 'accecorist', 5, NULL, NULL),
(11, 'headset', 'elektronik', 5, NULL, NULL),
(12, 'bantal_leher', 'accecorist', 25, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kurir`
--

CREATE TABLE `kurir` (
  `id_kurir` int(11) NOT NULL,
  `nama_kurir` varchar(20) NOT NULL,
  `alamat_kurir` varchar(20) NOT NULL,
  `no_hp_kurir` varchar(20) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kurir`
--

INSERT INTO `kurir` (`id_kurir`, `nama_kurir`, `alamat_kurir`, `no_hp_kurir`, `id_admin`) VALUES
(2, 'asep', 'jember', '083221432112', 1),
(3, 'joni', 'jember', '081922754309', 1),
(4, 'andre', 'jember', '087665110982', 1),
(5, 'fahril', 'jember', '082491423907', 1),
(6, 'dimas', 'jember', '082400810432', 1),
(7, 'riki', 'jember', '089220186430', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerima`
--

CREATE TABLE `penerima` (
  `id_penerima` int(11) NOT NULL,
  `nama_penerima` varchar(20) NOT NULL,
  `alamat_penerima` varchar(20) NOT NULL,
  `no_hp_penerima` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerima`
--

INSERT INTO `penerima` (`id_penerima`, `nama_penerima`, `alamat_penerima`, `no_hp_penerima`) VALUES
(1, 'aldi', 'situbondo', '089245643120'),
(2, 'zahro', 'jember', '081453098765'),
(3, 'cahyo', 'probolinggo', '085196543216'),
(4, 'aris', 'situbondo', '083881267987'),
(5, 'cindy', 'situbondo', '081622919103'),
(6, 'agung', 'banyuwangi', '089730614330'),
(7, 'dendi', 'lumajang', '089220691136'),
(8, 'agus', 'bondowoso', '085906882317'),
(9, 'tio', 'situbondo', '087642945731'),
(10, 'alfarisi', 'bondowoso', '082677405729');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengirim`
--

CREATE TABLE `pengirim` (
  `id_pengirim` int(11) NOT NULL,
  `nama_pengirim` varchar(20) NOT NULL,
  `alamat_pengirim` varchar(20) NOT NULL,
  `no_hp_pengirim` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengirim`
--

INSERT INTO `pengirim` (`id_pengirim`, `nama_pengirim`, `alamat_pengirim`, `no_hp_pengirim`) VALUES
(1, 'anton', 'jember', '082765543103'),
(3, 'luqman', 'bondowoso', '085810226119'),
(4, 'ardi', 'banyuwangi', '089330267543'),
(5, 'renata', 'probolinggo', '083118034621'),
(6, 'yuliana', 'jember', '082719632914'),
(7, 'riski', 'probolinggo', '087330965331'),
(8, 'rudy', 'situbondo', '082124599345'),
(9, 'rika', 'bondowoso', '089453714821'),
(10, 'aji', 'lumajang', '081409582631'),
(11, 'rini', 'situbondo', '087255168439');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pengirim` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_kurir` int(11) NOT NULL,
  `id_penerima` int(11) NOT NULL,
  `waktu_pengiriman` datetime NOT NULL,
  `waktu_penerima` datetime NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pengirim`, `id_barang`, `id_kurir`, `id_penerima`, `waktu_pengiriman`, `waktu_penerima`, `status`) VALUES
(1, 1, 1, 2, 1, '2021-12-06 10:37:15', '2022-01-03 10:37:15', 'diterima'),
(2, 3, 6, 5, 5, '2021-11-02 14:23:20', '2021-11-05 14:23:20', 'diterima'),
(3, 5, 9, 3, 2, '2021-12-01 14:26:23', '2021-12-05 14:26:23', 'diterima'),
(4, 11, 7, 7, 1, '2021-11-04 14:27:55', '2021-11-09 14:27:55', 'diterima'),
(5, 8, 3, 6, 7, '2021-12-03 14:30:18', '2021-12-06 14:30:18', 'diterima'),
(6, 6, 5, 5, 5, '2021-11-08 14:32:32', '2021-11-12 14:32:32', 'diterima'),
(7, 10, 10, 3, 9, '2021-11-26 14:34:01', '2021-11-30 14:34:01', 'diterima'),
(8, 6, 4, 7, 8, '2021-10-11 14:35:14', '2021-10-14 14:35:14', 'diterima'),
(9, 11, 12, 2, 3, '2021-12-02 14:36:25', '2021-12-05 14:36:25', 'diterima'),
(10, 7, 9, 5, 5, '2021-11-13 14:37:56', '2021-11-16 14:37:56', 'diterima');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`id_kurir`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `penerima`
--
ALTER TABLE `penerima`
  ADD PRIMARY KEY (`id_penerima`);

--
-- Indeks untuk tabel `pengirim`
--
ALTER TABLE `pengirim`
  ADD PRIMARY KEY (`id_pengirim`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pengirim` (`id_pengirim`),
  ADD KEY `id_kurir` (`id_kurir`),
  ADD KEY `id_penerima` (`id_penerima`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `kurir`
--
ALTER TABLE `kurir`
  MODIFY `id_kurir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `penerima`
--
ALTER TABLE `penerima`
  MODIFY `id_penerima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pengirim`
--
ALTER TABLE `pengirim`
  MODIFY `id_pengirim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kurir`
--
ALTER TABLE `kurir`
  ADD CONSTRAINT `kurir_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `id_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `id_kurir` FOREIGN KEY (`id_kurir`) REFERENCES `kurir` (`id_kurir`),
  ADD CONSTRAINT `id_pengirim` FOREIGN KEY (`id_pengirim`) REFERENCES `pengirim` (`id_pengirim`),
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_penerima`) REFERENCES `penerima` (`id_penerima`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
