CREATE TABLE Mahasiswa (
    ID_Mahasiswa INT PRIMARY KEY,
    nama TEXT,
    alamat TEXT
);

INSERT INTO Mahasiswa (ID_Mahasiswa, nama, alamat)
VALUES (1, 'Ali', 'Jl. Melati No. 12');

SELECT * FROM Mahasiswa;