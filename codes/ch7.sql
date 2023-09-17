

  SELECT COUNT(ID_Mahasiswa) FROM Mahasiswa;

  SELECT SUM(nilai) FROM Ujian;
 
  SELECT AVG(nilai) FROM Ujian;

  SELECT MAX(nilai), MIN(nilai) FROM Ujian;

  SELECT UPPER(nama), LOWER(nama) FROM Mahasiswa;

  SELECT LENGTH(nama) FROM Mahasiswa;
 
  SELECT TRIM(nama) FROM Mahasiswa;

  SELECT SUBSTR(nama, 1, 3) FROM Mahasiswa;

  SELECT NOW();

  SELECT DATE(NOW());

  SELECT YEAR(tanggal_lahir), MONTH(tanggal_lahir), DAY(tanggal_lahir) FROM Mahasiswa;

  SELECT * FROM Mahasiswa WHERE kota = 'Jakarta';

  SELECT * FROM Mahasiswa WHERE kota <> 'Jakarta';

  SELECT * FROM Mahasiswa WHERE skor > 75;

  SELECT * FROM Mahasiswa WHERE skor >= 50;

  SELECT * FROM Mahasiswa WHERE tanggal_lahir < '2000-01-01';

  SELECT * FROM Mahasiswa WHERE tanggal_daftar > '2022-01-01';

  SELECT * FROM Mahasiswa WHERE MONTH(tanggal_lahir) = 7;

  SELECT * FROM Mahasiswa
  WHERE tahun_pendaftaran = 2020 AND kota = 'Jakarta';

  SELECT * FROM Mahasiswa
  WHERE tahun_pendaftaran = 2020 OR kota = 'Jakarta';

  SELECT * FROM Mahasiswa
  WHERE NOT kota = 'Jakarta';

  SELECT * FROM Mahasiswa
  WHERE tahun_pendaftaran = 2020 AND (kota = 'Jakarta' OR kota = 'Bandung');

CREATE TABLE produk (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_produk TEXT,
    harga FLOAT,
    stok INTEGER,
    created DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produk (nama_produk, harga, stok) VALUES 
('Laptop', 1000.50, 10),
('Mouse', 25.00, 50),
('Keyboard', 45.00, 30),
('Monitor', 250.75, 20),
('Speaker', 75.00, 40),
('Charger Laptop', 55.25, 25),
('Earphone', 17.50, 60),
('Webcam', 120.00, 15),
('Microphone', 80.00, 10),
('Tablet', 300.50, 8),
('Printer', 210.00, 12),
('Scanner', 185.75, 6),
('Hard Drive', 95.00, 14),
('USB Drive', 15.00, 80),
('RAM', 70.00, 20),
('Graphics Card', 400.75, 5),
('Power Supply', 90.00, 25),
('Motherboard', 150.50, 7),
('Cooling Fan', 45.00, 30),
('Router', 60.00, 40);


   SELECT * FROM produk 
   WHERE (harga BETWEEN 50 AND 500) AND stok < 30;

     SELECT SUM(harga) AS total_harga FROM produk;

     SELECT AVG(harga) AS rata_rata_harga FROM produk;

     SELECT SUM(stok) AS total_stok FROM produk;

   SELECT UPPER(nama_produk) AS nama_produk_kapital FROM produk;

     SELECT * FROM produk 
     WHERE created >= datetime('now', '-30 day');

     SELECT julianday(MAX(created)) - julianday(MIN(created)) AS selisih_hari 
     FROM produk;
