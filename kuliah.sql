-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2023 at 05:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuliah`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL,
  `nohp` text NOT NULL,
  `email` text NOT NULL,
  `prodi` text NOT NULL,
  `fakultas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id`, `nama`, `nohp`, `email`, `prodi`, `fakultas`) VALUES
(202012345, 'X', '0987654321', 'belajar@gmail.com', 'TI', 'FKD');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_kuliah_mhs`
--

CREATE TABLE `jadwal_kuliah_mhs` (
  `id` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `id_master_makul` int(11) NOT NULL,
  `hari_kuliah` text NOT NULL,
  `jam_kuliah` time NOT NULL,
  `alpa` text NOT NULL,
  `ijin` text NOT NULL,
  `nilai_tugas` float NOT NULL,
  `nilai_uts` float NOT NULL,
  `nilai_uas` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_kuliah_mhs`
--

INSERT INTO `jadwal_kuliah_mhs` (`id`, `id_mhs`, `id_master_makul`, `hari_kuliah`, `jam_kuliah`, `alpa`, `ijin`, `nilai_tugas`, `nilai_uts`, `nilai_uas`) VALUES
(1, 1, 1, 'Jumat', '13:30:00', '1', '1', 100, 100, 100),
(2, 2, 1, 'minggu', '13:30:00', '3', '3', 100, 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ngajar`
--

CREATE TABLE `jadwal_ngajar` (
  `id` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `id_master_makul` int(11) NOT NULL,
  `hari_ngajar` text NOT NULL,
  `jam_ngajar` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_ngajar`
--

INSERT INTO `jadwal_ngajar` (`id`, `id_dosen`, `id_master_makul`, `hari_ngajar`, `jam_ngajar`) VALUES
(1, 202012345, 1, 'Kamis', '13:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `id_mhs` int(11) NOT NULL,
  `id_dosen` int(11) NOT NULL,
  `kode_ruangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `id_mhs`, `id_dosen`, `kode_ruangan`) VALUES
(1, 1, 202012345, 'B.2.1'),
(2, 2, 202012345, 'B.2.1');

-- --------------------------------------------------------

--
-- Table structure for table `master_makul`
--

CREATE TABLE `master_makul` (
  `id` int(11) NOT NULL,
  `nama_makul` text NOT NULL,
  `jumlah_sks` int(11) NOT NULL,
  `durasi_makul` int(11) NOT NULL,
  `semester` text NOT NULL,
  `prodi` text NOT NULL,
  `fakultas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_makul`
--

INSERT INTO `master_makul` (`id`, `nama_makul`, `jumlah_sks`, `durasi_makul`, `semester`, `prodi`, `fakultas`) VALUES
(1, 'RPL ', 3, 120, 'ganjil', 'TI', 'FKD');

-- --------------------------------------------------------

--
-- Table structure for table `mhs`
--

CREATE TABLE `mhs` (
  `id` int(11) NOT NULL,
  `nim` text NOT NULL,
  `nama` text NOT NULL,
  `nohp` text NOT NULL,
  `alamat` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mhs`
--

INSERT INTO `mhs` (`id`, `nim`, `nama`, `nohp`, `alamat`, `email`) VALUES
(1, '12345', 'tresi', '098xxxxxxx', 'batang', 'tresi@gmail.com'),
(2, '098', 'Juliade', '123456', 'mars', 'mars@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_kuliah_mhs`
--
ALTER TABLE `jadwal_kuliah_mhs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mhs` (`id_mhs`),
  ADD KEY `id_master_makul` (`id_master_makul`);

--
-- Indexes for table `jadwal_ngajar`
--
ALTER TABLE `jadwal_ngajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_master_makul` (`id_master_makul`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_mhs` (`id_mhs`);

--
-- Indexes for table `master_makul`
--
ALTER TABLE `master_makul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal_kuliah_mhs`
--
ALTER TABLE `jadwal_kuliah_mhs`
  ADD CONSTRAINT `jadwal_kuliah_mhs_ibfk_1` FOREIGN KEY (`id_mhs`) REFERENCES `mhs` (`id`),
  ADD CONSTRAINT `jadwal_kuliah_mhs_ibfk_2` FOREIGN KEY (`id_master_makul`) REFERENCES `master_makul` (`id`);

--
-- Constraints for table `jadwal_ngajar`
--
ALTER TABLE `jadwal_ngajar`
  ADD CONSTRAINT `jadwal_ngajar_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id`),
  ADD CONSTRAINT `jadwal_ngajar_ibfk_2` FOREIGN KEY (`id_master_makul`) REFERENCES `master_makul` (`id`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`id_mhs`) REFERENCES `mhs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
