-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2021 at 07:20 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbperpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idAdmin` varchar(10) NOT NULL,
  `user` varchar(25) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `namaLengkap` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idAdmin`, `user`, `pass`, `namaLengkap`, `status`) VALUES
('AP-001', 'admin', 'admin', 'Perpustakaanku', 'ADMIN'),
('AP-002', 'galih', 'galih', 'galihmaulana', 'PETUGAS'),
('AP-003', 'adit', 'adit', 'adityanurpratama', 'PETUGAS'),
('AP-004', 'noval', 'noval', 'novaldzaki', 'PETUGAS'),
('AP-005', 'rafi', 'rafi', 'fakhrudin', 'PETUGAS'),
('AP-006', 'khalid', 'khalid', 'khalid', 'PETUGAS');
-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `nim` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `prodi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`nim`, `nama`, `kelas`, `prodi`) VALUES
(1301204042, 'Galih Maulana', 'IF-44-12', 'Informatika'),
(1301200489, 'Aditya Nur Pratama', 'IF-44-12', 'Informatika'),
(1301204505, 'Noval Dzaki', 'IF-44-12', 'Informatika'),
(1301202440, 'Rafi Fakhrudin', 'IF-44-12', 'Informatika'),
(1301204336, 'Khalid', 'IF-44-12', 'Informatika');
-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kodeBuku` varchar(10) NOT NULL,
  `judulBuku` varchar(30) NOT NULL,
  `pengarang` varchar(20) NOT NULL,
  `penerbit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kodeBuku`, `judulBuku`, `pengarang`, `penerbit`) VALUES
('BK-00001', 'DanauGalau', 'Galih', 'Telyu'),
('BK-00002', 'PengabdiAnime', 'Aditya', 'Wibuu'),
('BK-00003', 'AttackOnZilong', 'Noval', 'LegendaSeluler'),
('BK-00004', 'Kupu-Kupu Malam', 'Rafi', 'Butterfly');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `idPeminjaman` varchar(10) NOT NULL,
  `kodeBuku` varchar(10) NOT NULL,
  `nim` int(10) NOT NULL,
  `idAdmin` varchar(10) NOT NULL,
  `tglPeminjaman` date NOT NULL,
  `tglPengembalian` date NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`idPeminjaman`, `kodeBuku`, `nim`, `idAdmin`, `tglPeminjaman`, `tglPengembalian`, `status`) VALUES
('PJM-001', 'BK-00004', 1301204042, 'AP-002', '2023-01-01', '2023-01-02', 'Selesai'),
('PJM-002', 'BK-00003', 1301200489, 'AP-003', '2023-01-02', '2023-01-03', 'Belum Kembali'),
('PJM-003', 'BK-00001', 1301204505, 'AP-005', '2023-01-03', '2023-01-04', 'Selesai'),
('PJM-004', 'BK-00002', 1301204336, 'AP-004', '2023-01-04', '2023-01-05', 'Belum Kembali');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `idPengembalian` varchar(10) NOT NULL,
  `idPeminjaman` varchar(10) NOT NULL,
  `tglPeminjaman` date NOT NULL,
  `tglPengembalian` date NOT NULL,
  `denda` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`idPengembalian`, `idPeminjaman`, `tglPeminjaman`, `tglPengembalian`, `denda`) VALUES
('PGM-001', 'PJM-001', '2023-01-01', '2023-01-02', 'Bebas Denda'),
('PGM-002', 'PJM-003', '2023-01-03', '2023-01-06', '20000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kodeBuku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`idPeminjaman`),
  ADD KEY `kodeBuku` (`kodeBuku`),
  ADD KEY `nim` (`nim`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`idPengembalian`),
  ADD KEY `idPeminjaman` (`idPeminjaman`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`kodeBuku`) REFERENCES `buku` (`kodeBuku`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `anggota` (`nim`),
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`idAdmin`);

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`idPeminjaman`) REFERENCES `peminjaman` (`idPeminjaman`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
