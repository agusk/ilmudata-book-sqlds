CREATE TABLE mahasiswa (
        id INTEGER PRIMARY KEY ,
        nama TEXT NOT NULL,
        jurusan TEXT NOT NULL
    );



INSERT INTO mahasiswa (nama, jurusan) VALUES ('Ali', 'Teknik Informatika');
INSERT INTO mahasiswa (nama, jurusan) VALUES ('Budi', 'Sistem Informasi'); 

SELECT * FROM mahasiswa;