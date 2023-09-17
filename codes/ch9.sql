CREATE TABLE pelanggan (
        id_pelanggan INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT NOT NULL,
        alamat TEXT
    );

    CREATE TABLE produk (
        id_produk INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_produk TEXT NOT NULL,
        harga REAL NOT NULL
    );

    CREATE TABLE penjualan (
        id_penjualan INTEGER PRIMARY KEY AUTOINCREMENT,
        id_pelanggan INTEGER,
        id_produk INTEGER,
        jumlah INTEGER NOT NULL,
        tanggal_penjualan DATE DEFAULT CURRENT_DATE,
        FOREIGN KEY(id_pelanggan) REFERENCES pelanggan(id_pelanggan),
        FOREIGN KEY(id_produk) REFERENCES produk(id_produk)
    );

    INSERT INTO pelanggan (nama, alamat) VALUES ('John Doe', 'Jl. Merdeka No.1');
    INSERT INTO pelanggan (nama, alamat) VALUES ('Jane Smith', 'Jl. Diponegoro No.23');

    INSERT INTO produk (nama_produk, harga) VALUES ('Laptop', 15000000);
    INSERT INTO produk (nama_produk, harga) VALUES ('Mouse', 200000);

    INSERT INTO penjualan (id_pelanggan, id_produk, jumlah) VALUES (1, 1, 2);
    INSERT INTO penjualan (id_pelanggan, id_produk, jumlah) VALUES (2, 2, 5);

    SELECT * FROM penjualan;

    SELECT p.nama, pr.nama_produk, pen.jumlah, pen.tanggal_penjualan 
    FROM pelanggan p 
    JOIN penjualan pen ON p.id_pelanggan = pen.id_pelanggan 
    JOIN produk pr ON pr.id_produk = pen.id_produk;

    SELECT pr.nama_produk, SUM(pen.jumlah) as total_terjual 
    FROM produk pr 
    JOIN penjualan pen ON pr.id_produk = pen.id_produk 
    GROUP BY pr.nama_produk;

    SELECT pr.nama_produk, SUM(pen.jumlah) as total_terjual 
    FROM produk pr 
    JOIN penjualan pen ON pr.id_produk = pen.id_produk 
    GROUP BY pr.nama_produk 
    ORDER BY total_terjual DESC LIMIT 1;

    SELECT p.nama, COUNT(pen.id_penjualan) as total_pembelian 
    FROM pelanggan p 
    JOIN penjualan pen ON p.id_pelanggan = pen.id_pelanggan 
    GROUP BY p.nama 
    ORDER BY total_pembelian DESC LIMIT 1;