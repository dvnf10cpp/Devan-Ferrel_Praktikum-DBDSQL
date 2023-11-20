-- TUGAS UNION
INSERT INTO mahasiswa VALUES
    ('155150404', 1,212,'JESSY',2016,'1999-2-10','BANDUNG','F'),
    ('155150405', 2 ,219,'BAMBANG',2014,'1996-9-27','MAKASSAR','M');

SELECT * FROM mahasiswa;

CREATE TABLE mahasiswa_pindahan (
    nim VARCHAR(15) PRIMARY KEY NOT NULL,
    id_seleksi_masuk SMALLINT,
    id_program_studi SMALLINT,
    nama VARCHAR(45),
    angkatan SMALLINT,
    tgl_lahir DATE,
    kota_lahir VARCHAR(60),
    jenis_kelamin CHAR(1) CHECK(jenis_kelamin IN ('F', 'M')),
    FOREIGN KEY(id_seleksi_masuk) REFERENCES seleksi_masuk(id_seleksi_masuk),
    FOREIGN KEY(id_program_studi) REFERENCES program_studi(id_program_studi)
);

INSERT INTO mahasiswa_pindahan VALUES
('155150500', 1 ,211,'BUDI', 2015,'1997-3-3','BANYUWANGI','M'),
('155150501', 2,212,'ANDI',2015,'1997-2-21','JAKARTA','M'),
('155150502', 2 ,211,'DIMAS', 2015,'1998-4-11','SURABAYA','M'),
('155150503', 2 ,211,'DIDIN',2015,'1997-2-26','BANDUNG','M');

SELECT nim, nama, jenis_kelamin, kota_lahir, angkatan FROM mahasiswa
WHERE kota_lahir LIKE 'B%'
UNION
SELECT nim, nama, jenis_kelamin, kota_lahir, angkatan
FROM mahasiswa_pindahan WHERE nama LIKE 'D%'
ORDER BY nim;


SELECT nim, nama, jenis_kelamin, kota_lahir, angkatan FROM mahasiswa
WHERE angkatan = 2015
UNION
SELECT nim, nama, jenis_kelamin, kota_lahir, angkatan
FROM mahasiswa_pindahan WHERE angkatan = 2015 AND kota_lahir NOT LIKE 'M%'
ORDER BY nim;

-- TUGAS SUBQUERY
INSERT INTO mahasiswa VALUES
    ('155150407', 1,212,'HARTONO',2016,'1999-2-10','BANYUWANGI','M'),
    ('155150408', 2 ,219,'DENGKLEK',2014,'1996-9-27','BANYUWANGI','M');

SELECT nim, nama, angkatan FROM mahasiswa
WHERE kota_lahir = (
    SELECT kota_lahir FROM mahasiswa_pindahan WHERE nama = 'BUDI'
);

SELECT nim, nama, angkatan, kota_lahir FROM mahasiswa
WHERE kota_lahir IN (
    SELECT kota_lahir FROM mahasiswa_pindahan
);

