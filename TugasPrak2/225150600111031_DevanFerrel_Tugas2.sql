-- NAMA : Devan Ferrel
-- NIM  : 225150600111031

CREATE DATABASE `penjualandvd`;

USE `penjualandvd`;

CREATE TABLE `movie` (
    kode_dvd VARCHAR(10) PRIMARY KEY,
    judul VARCHAR(60) NOT NULL,
    harga_sewa DOUBLE NOT NULL,
    denda DOUBLE NOT NULL,
    tahun_rilis SMALLINT NOT NULL
);

CREATE TABLE `genre` (
    id_genre SMALLINT PRIMARY KEY,
    genre VARCHAR(45) NOT NULL
);

CREATE TABLE `genre_movie` (
    id_genre SMALLINT,
    kode_dvd VARCHAR(10),
    FOREIGN KEY(id_genre) REFERENCES genre(id_genre),
    FOREIGN KEY(kode_dvd) REFERENCES movie(kode_dvd),
    PRIMARY KEY(id_genre, kode_dvd)
);

CREATE TABLE `kecamatan` (
    id_kecamatan SMALLINT PRIMARY KEY,
    kecamatan VARCHAR(45) NOT NULL
);

CREATE TABLE `kelurahan` (
    id_kelurahan SMALLINT PRIMARY KEY,
    id_kecamatan SMALLINT,
    kelurahan VARCHAR(45) NOT NULL,
    FOREIGN KEY(id_kecamatan) REFERENCES kecamatan(id_kecamatan)
);

CREATE TABLE `pelanggan` (
    kode_pelanggan VARCHAR(10) PRIMARY KEY,
    id_kelurahan SMALLINT,
    nama VARCHAR(45) NOT NULL,
    alamat VARCHAR(45) NOT NULL,
    jenis_kelamin CHAR(1),
    FOREIGN KEY(id_kelurahan) REFERENCES kelurahan(id_kelurahan),
    CONSTRAINT chk_jenis_kelamin CHECK (jenis_kelamin IN ('P','L'))
);

CREATE TABLE `kontak_pelanggan` (
    no_hp VARCHAR(25),
    kode_pelanggan VARCHAR(10),
    FOREIGN KEY(kode_pelanggan) REFERENCES pelanggan(kode_pelanggan)
);

CREATE TABLE `transaksi` (
    kode_dvd VARCHAR(10),
    kode_pelanggan VARCHAR(10),
    tanggal_sewa DATE,
    tanggal_wajib_kembali DATE,
    tanggal_realisasi_kembali DATE,
    FOREIGN KEY(kode_dvd) REFERENCES movie(kode_dvd),
    FOREIGN KEY(kode_pelanggan) REFERENCES pelanggan(kode_pelanggan),
    PRIMARY KEY(kode_dvd, kode_pelanggan, tanggal_sewa)
);

ALTER TABLE movie MODIFY COLUMN tahun_rilis YEAR(4);