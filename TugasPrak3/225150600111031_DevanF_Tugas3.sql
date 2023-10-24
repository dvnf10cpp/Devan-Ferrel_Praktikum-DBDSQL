CREATE DATABASE akademik;

USE akademik;

-- DDL CREATING TABLES

CREATE TABLE fakultas (
    id_fakultas SMALLINT PRIMARY KEY,
    fakultas VARCHAR(45) NOT NULL
);

CREATE TABLE jurusan (
    id_jurusan SMALLINT PRIMARY KEY,
    id_fakultas SMALLINT,
    jurusan VARCHAR(45) NOT NULL ,
    FOREIGN KEY(id_fakultas) REFERENCES fakultas(id_fakultas)
);

CREATE TABLE strata (
    id_strata SMALLINT PRIMARY KEY,
    singkat VARCHAR(10) NOT NULL,
    strata VARCHAR(45) NOT NULL
);

CREATE TABLE program_studi (
    id_program_studi SMALLINT PRIMARY KEY,
    id_strata SMALLINT,
    id_jurusan SMALLINT,
    program_studi VARCHAR(60),
    FOREIGN KEY(id_strata) REFERENCES strata(id_strata),
    FOREIGN KEY(id_jurusan) REFERENCES jurusan(id_jurusan)
);

CREATE TABLE seleksi_masuk (
    id_seleksi_masuk SMALLINT PRIMARY KEY,
    singkat VARCHAR(12),
    seleksi_masuk VARCHAR(45)
);

CREATE TABLE mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    id_seleksi_masuk SMALLINT,
    id_program_studi SMALLINT,
    nama VARCHAR(45) NOT NULL,
    angkatan SMALLINT,
    tgl_lahir DATE,
    kota_lahir VARCHAR(60),
    jenis_kelamin CHAR(1),
    FOREIGN KEY(id_seleksi_masuk) REFERENCES seleksi_masuk(id_seleksi_masuk),
    FOREIGN KEY(id_program_studi) REFERENCES program_studi(id_program_studi),
    CONSTRAINT check_jk CHECK(jenis_kelamin IN ('W','P'))
);

-- DML INSERTING VALUES INTO TABLE

ALTER TABLE seleksi_masuk MODIFY seleksi_masuk VARCHAR(60);

INSERT INTO fakultas VALUES
(1, 'Ekonomi dan Bisnis'),
(2, 'Ilmu Komputer');

INSERT INTO jurusan VALUES
(21, 2, 'Informatika'),
(22, 2, 'Sistem Informasi'),
(23, 2, 'Teknik Komputer');

INSERT INTO strata VALUES
(1, 'D1', 'Diploma'),
(2, 'S1', 'Sarjana'),
(3, 'S2', 'Magister');

INSERT INTO program_studi VALUES
(211, 2, 21, 'Teknik Informatika'),
(212, 2, 21, 'Teknik Komputer'),
(219, 3, 21, 'Magister Ilmu Komputer');

INSERT INTO seleksi_masuk VALUES
(1, 'SNMPTN', 'SELEKSI NASIONAL MAHASISWA PERGURUAN TINGGI NEGERI'),
(2, 'SBMPTN', 'SELEKSI BERSAMA MAHASISWA PERGURUAN TINGGI NEGERI');

INSERT INTO mahasiswa VALUES
(155150400, 1, 211, 'Putri', 2015, '1997-1-1', 'Malang', 'W'),
(155150401, 1, 211, 'Jono', 2015, '1997-10-2', 'Situbondo', 'P'),
(155150402, 2, 211, 'Bocchi', 2017, '1999-9-17', 'Tokyo', 'W'),
(155150403, 2, 212, 'Ryo', 2017, '1999-4-18', 'Tokyo', 'W'),
(155150404, 2, 212, 'Dengklek', 2016, '1998-5-4', 'Surabaya', 'P'),
(155150405, 2, 212, 'Joni', 2016, '1998-5-4', 'Bekasi', 'P'),
(155150406, 2, 211, 'Dodi', 2016, '1998-5-4', 'Bekasi', 'P');

-- DML UPDATING VALUES FROM TABLE

UPDATE mahasiswa SET id_program_studi = 219 WHERE nama = 'Putri';
UPDATE fakultas SET fakultas = 'Teknik' WHERE id_fakultas = 2;

DELETE FROM mahasiswa WHERE nama = 'Dodi';

SELECT * FROM mahasiswa;