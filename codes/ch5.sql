  SELECT kolom1, kolom2, ...
  FROM nama_tabel
  WHERE kondisi;


  SELECT nama, alamat
  FROM Mahasiswa
  WHERE tahun_masuk = 2020;


  INSERT INTO nama_tabel (kolom1, kolom2, ...)
  VALUES (nilai1, nilai2, ...);


  INSERT INTO Mahasiswa (ID_Mahasiswa, nama, alamat)
  VALUES (1, 'Ali', 'Jl. Melati No. 12');



  UPDATE nama_tabel
  SET kolom1 = nilai1, kolom2 = nilai2, ...
  WHERE kondisi;


  UPDATE Mahasiswa
  SET alamat = 'Jl. Mawar No. 15'
  WHERE ID_Mahasiswa = 1;


  DELETE FROM nama_tabel
  WHERE kondisi;

  DELETE FROM Mahasiswa
  WHERE ID_Mahasiswa = 1;



  CREATE TABLE nama_tabel (
      kolom1 tipe_data1,
      kolom2 tipe_data2,
      ...
  );

  CREATE TABLE Dosen (
      ID_Dosen INT PRIMARY KEY,
      nama VARCHAR(50),
      spesialisasi VARCHAR(50)
  );


DROP TABLE karyawan;



ALTER TABLE [nama_tabel] ADD COLUMN [nama_kolom] [tipe_data];

ALTER TABLE [nama_tabel] DROP COLUMN [nama_kolom];

ALTER TABLE [nama_tabel] RENAME COLUMN [nama_kolom_lama] TO [nama_kolom_baru];

ALTER TABLE [nama_tabel] ALTER COLUMN [nama_kolom] TYPE [tipe_data_baru];



ALTER TABLE produk ADD COLUMN harga INTEGER;

ALTER TABLE produk RENAME COLUMN harga TO harga_produk;



CREATE TABLE produk (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT NOT NULL,
    harga REAL,
    created DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produk (nama, harga) VALUES ('Sepatu', 200000);
INSERT INTO produk (nama, harga) VALUES ('Tas', 150000);
INSERT INTO produk (nama, harga) VALUES ('Kemeja', 100000);


SELECT * FROM produk;

UPDATE produk SET harga = 160000 WHERE id = 2;

DELETE FROM produk WHERE id = 3;

SELECT * FROM produk WHERE harga BETWEEN 100000 AND 200000;

SELECT * FROM produk WHERE DATE(created) = '2023-09-20';

ALTER TABLE produk ADD COLUMN kategori TEXT;

CREATE TABLE produk_temp AS SELECT id, nama, harga, created FROM produk;

DROP TABLE produk;

ALTER TABLE produk_temp RENAME TO produk;

DROP TABLE produk;


