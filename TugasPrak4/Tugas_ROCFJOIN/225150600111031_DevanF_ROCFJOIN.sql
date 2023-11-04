USE akademik;

-- RO CF 1
INSERT INTO mahasiswa VALUES
('155150402',2 ,211,'JOKO',2015,'1998-2-10','SURABAYA','M'),
('155150403',2 ,211,'JUJUN',2015,'1997-9-27','BANYUWANGI','M');

-- RO CF 2
CREATE VIEW LATIHAN_1 AS
    SELECT
        CONCAT(nim, id_seleksi_masuk, id_program_studi) AS nim_gabungan,
        (YEAR(CURRENT_TIMESTAMP()) - YEAR(tgl_lahir)) AS umur
    FROM mahasiswa;
SELECT * FROM LATIHAN_1;

-- RO CF 3
-- Melakukan insert dengan prodi berbeda dan angkatan berbeda
INSERT INTO mahasiswa VALUES ('155150404', 1, 212, 'Dengklek', 2016, '1999-05-30', 'Bekasi', 'M');
INSERT INTO mahasiswa VALUES ('155150405', 1, 211, 'Alice', 2016, '1999-11-30', 'Bekasi', 'F');

CREATE VIEW LATIHAN_2 AS
    SELECT
        id_program_studi, angkatan, COUNT(*) AS coba
    FROM mahasiswa
    GROUP BY id_program_studi, angkatan;
SELECT * FROM LATIHAN_2;

-- JOIN 1
SELECT
    mahasiswa.nim, mahasiswa.nama, mahasiswa.angkatan, program_studi.program_studi, seleksi_masuk.seleksi_masuk
    FROM mahasiswa
    JOIN program_studi ON mahasiswa.id_program_studi = program_studi.id_program_studi
    JOIN seleksi_masuk ON mahasiswa.id_seleksi_masuk = seleksi_masuk.id_seleksi_masuk;

SELECT
    jurusan.jurusan, program_studi.program_studi
    FROM jurusan
    LEFT JOIN program_studi ON program_studi.id_jurusan = jurusan.id_jurusan;