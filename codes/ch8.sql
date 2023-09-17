
CREATE TABLE Person (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT
);

CREATE TABLE License (
    LicenseID INTEGER PRIMARY KEY AUTOINCREMENT,
    LicenseNumber TEXT,
    PersonID INTEGER,
    FOREIGN KEY (PersonID) REFERENCES Person(ID)
);

CREATE TABLE Teacher (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT
);

CREATE TABLE Student (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT,
    TeacherID INTEGER,
    FOREIGN KEY (TeacherID) REFERENCES Teacher(ID)
);

CREATE TABLE Student (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT
);

CREATE TABLE Course (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    CourseName TEXT
);

CREATE TABLE StudentCourse (
    StudentID INTEGER,
    CourseID INTEGER,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(ID),
    FOREIGN KEY (CourseID) REFERENCES Course(ID)
);

  SELECT Mahasiswa.Nama, Nilai.MataPelajaran, Nilai.Nilai
  FROM Mahasiswa
  INNER JOIN Nilai ON Mahasiswa.ID_Mahasiswa = Nilai.ID_Mahasiswa;

  SELECT Mahasiswa.Nama, Nilai.MataPelajaran, Nilai.Nilai
  FROM Mahasiswa
  LEFT JOIN Nilai ON Mahasiswa.ID_Mahasiswa = Nilai.ID_Mahasiswa;

CREATE TABLE pelanggan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT NOT NULL,
    email TEXT NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO pelanggan (nama, email)
VALUES 
('Ali', 'ali@email.com'),
('Rina', 'rina@email.com'),
('Luna', 'luna@email.com'),
('Budi', 'budi@email.com'),
('Dian', 'dian@email.com');

CREATE TABLE pesanan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pelanggan INTEGER,
    produk TEXT NOT NULL,
    jumlah INTEGER NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id)
);

INSERT INTO pesanan (id_pelanggan, produk, jumlah)
VALUES 
(1, 'Buku SQL', 2),
(2, 'Buku Python', 1),
(3, 'Buku Java', 3),
(2, 'Buku C++', 1),
(5, 'Buku Design', 2);

SELECT p.nama, pes.produk, pes.jumlah
FROM pelanggan p
JOIN pesanan pes ON p.id = pes.id_pelanggan;

SELECT p.nama
FROM pelanggan p
LEFT JOIN pesanan pes ON p.id = pes.id_pelanggan
WHERE pes.id IS NULL;

SELECT produk, SUM(jumlah) as total_pesanan
FROM pesanan
GROUP BY produk;

CREATE TABLE kategori_produk (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    kategori TEXT NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO kategori_produk (kategori)
VALUES 
('Pemrograman'),
('Desain'),
('Database');

ALTER TABLE pesanan ADD COLUMN id_kategori INTEGER REFERENCES kategori_produk(id);

UPDATE pesanan SET id_kategori = 1 WHERE produk LIKE 'Buku SQL' OR produk LIKE 'Buku Python' OR produk LIKE 'Buku Java' OR produk LIKE 'Buku C++';
UPDATE pesanan SET id_kategori = 2 WHERE produk LIKE 'Buku Design';
UPDATE pesanan SET id_kategori = 3 WHERE produk LIKE 'Buku Database';

SELECT pes.produk, kat.kategori
FROM pesanan pes
JOIN kategori_produk kat ON pes.id_kategori = kat.id;

SELECT kat.kategori, COUNT(pes.id) as jumlah_pesanan
FROM kategori_produk kat
LEFT JOIN pesanan pes ON kat.id = pes.id_kategori
GROUP BY kat.kategori;

SELECT DISTINCT p.nama
FROM pelanggan p
JOIN pesanan pes ON p.id = pes.id_pelanggan
JOIN kategori_produk kat ON pes.id_kategori = kat.id
WHERE kat.kategori = 'Pemrograman';

SELECT pes.produk
FROM pesanan pes
LEFT JOIN kategori_produk kat ON pes.id_kategori = kat.id
WHERE kat.kategori IS NULL;