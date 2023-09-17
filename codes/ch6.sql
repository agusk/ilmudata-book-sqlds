
  SELECT kolom1, kolom2, ...
  FROM nama_tabel
  WHERE kondisi;

  SELECT nama, alamat
  FROM Mahasiswa
  WHERE tahun_masuk = 2020;

  SELECT kolom1, kolom2, ...
  FROM nama_tabel
  WHERE kondisi
  ORDER BY kolom1 [ASC|DESC], kolom2 [ASC|DESC], ...;

  SELECT ID_Mahasiswa, nama, nilai
  FROM Mahasiswa
  ORDER BY nilai DESC;

  SELECT nama, nilai
  FROM Mahasiswa
  WHERE nilai > 50
  ORDER BY nilai DESC;

  SELECT kolom1, kolom2, ...
  FROM nama_tabel
  LIMIT jumlah;

  SELECT nama, alamat
  FROM Mahasiswa
  LIMIT 5;

  SELECT kolom1, kolom2, ...
  FROM nama_tabel
  LIMIT jumlah
  OFFSET jumlah_baris_yang_dilewati;

  SELECT nama, alamat
  FROM Mahasiswa
  LIMIT 5
  OFFSET 10;

  SELECT nama, nilai
  FROM Mahasiswa
  WHERE nilai > 50
  ORDER BY nilai DESC
  LIMIT 5
  OFFSET 10;

    CREATE TABLE produk (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_produk TEXT NOT NULL,
        harga INTEGER NOT NULL,
        created DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    INSERT INTO produk (nama_produk, harga) VALUES ('Sepatu', 150000);
    INSERT INTO produk (nama_produk, harga) VALUES ('Kaos', 50000);
    INSERT INTO produk (nama_produk, harga) VALUES ('Celana', 75000);
    INSERT INTO produk (nama_produk, harga) VALUES ('Jaket', 200000);
    INSERT INTO produk (nama_produk, harga) VALUES ('Topi', 35000);

    SELECT * FROM produk WHERE harga > 100000;

    SELECT * FROM produk WHERE nama_produk LIKE '%Sepatu%';

    SELECT * FROM produk ORDER BY harga ASC;

    SELECT * FROM produk ORDER BY created DESC;

    SELECT * FROM produk ORDER BY harga DESC LIMIT 3;

    SELECT * FROM produk ORDER BY created ASC LIMIT 3 OFFSET 2;

    CREATE TABLE produk (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_produk TEXT NOT NULL,
        harga INTEGER NOT NULL,
        created DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    INSERT INTO produk (nama_produk, harga) VALUES 
    ('Sepatu A', 150000),
    ('Kaos A', 50000),
    ('Celana A', 75000),
    ('Jaket A', 200000),
    ('Topi A', 35000),
    ('Sepatu B', 155000),
    ('Kaos B', 52000),
    ('Celana B', 78000),
    ('Jaket B', 220000),
    ('Topi B', 38000),
    ('Sepatu C', 160000),
    ('Kaos C', 53000),
    ('Celana C', 79000),
    ('Jaket C', 230000),
    ('Topi C', 39000),
    ('Sepatu D', 165000),
    ('Kaos D', 54000),
    ('Celana D', 80000),
    ('Jaket D', 240000),
    ('Topi D', 40000);

    SELECT * FROM produk ORDER BY id ASC LIMIT 5 OFFSET 0;

    SELECT * FROM produk ORDER BY id ASC LIMIT 5 OFFSET 5;

    SELECT * FROM produk ORDER BY id ASC LIMIT 5 OFFSET 10;
