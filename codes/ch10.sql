 SELECT product_name, sales_amount
  FROM Sales
  WHERE sales_amount > (SELECT AVG(sales_amount) FROM Sales);

  WITH ProductRank AS (
      SELECT product_name, RANK() OVER (ORDER BY sales_amount DESC) as ranking
      FROM Sales
  )
  SELECT product_name
  FROM ProductRank
  WHERE ranking <= 10;

  SELECT product_name, sales_date, 
         SUM(sales_amount) OVER (ORDER BY sales_date) as cumulative_sales
  FROM Sales;

  SELECT strftime('%Y-%m', sales_date) as month, SUM(sales_amount)
  FROM Sales
  GROUP BY month;

  SELECT product_name,
         SUM(CASE WHEN strftime('%m', sales_date) = '01' THEN sales_amount END) as January,
         SUM(CASE WHEN strftime('%m', sales_date) = '02' THEN sales_amount END) as February,
         ...
  FROM Sales
  GROUP BY product_name;

  WITH RecursiveDept AS (
      SELECT department_id, parent_department
      FROM Departments
      WHERE department_id = ?
      UNION ALL
      SELECT d.department_id, d.parent_department
      FROM Departments d JOIN RecursiveDept rd ON d.parent_department = rd.department_id
  )
  SELECT department_id FROM RecursiveDept;

CREATE TABLE karyawan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT,
    gaji REAL
);

INSERT INTO karyawan (nama, gaji) VALUES ('Ari', 5000000);
INSERT INTO karyawan (nama, gaji) VALUES ('Budi', 7500000);
-- ...tambahkan data lainnya...

SELECT nama, gaji 
FROM karyawan 
WHERE gaji > (SELECT AVG(gaji) FROM karyawan);

WITH CTE_HighestSalary AS (
    SELECT MAX(gaji) as maxGaji FROM karyawan
)
SELECT nama, gaji 
FROM karyawan, CTE_HighestSalary 
WHERE gaji = maxGaji;

SELECT nama, gaji, SUM(gaji) OVER (ORDER BY id) AS 'Running Total'
FROM karyawan;

SELECT strftime('%Y-%m', tanggal) AS bulan, SUM(gaji) 
FROM karyawan 
GROUP BY bulan;

CREATE TABLE org_chart (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT,
    atasan_id INTEGER
);

INSERT INTO org_chart (nama, atasan_id) VALUES ('CEO', NULL);
INSERT INTO org_chart (nama, atasan_id) VALUES ('CTO', 1);
-- ...tambahkan data lainnya...

WITH RECURSIVE hierarki AS (
    SELECT id, nama, atasan_id FROM org_chart WHERE atasan_id IS NULL
    UNION ALL
    SELECT o.id, o.nama, o.atasan_id 
    FROM org_chart o 
    JOIN hierarki h ON o.atasan_id = h.id
)
SELECT * FROM hierarki;

CREATE TABLE pegawai (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT,
    jabatan_id INTEGER
);

INSERT INTO pegawai (nama, jabatan_id) VALUES ('Ari', 1);
INSERT INTO pegawai (nama, jabatan_id) VALUES ('Budi', 2);
-- ...tambahkan data lainnya...

CREATE TABLE jabatan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_jabatan TEXT,
    gaji_pokok REAL
);

INSERT INTO jabatan (nama_jabatan, gaji_pokok) VALUES ('Manager', 10000000);
INSERT INTO jabatan (nama_jabatan, gaji_pokok) VALUES ('Staff', 5000000);
-- ...tambahkan data lainnya...

SELECT p.nama, j.gaji_pokok 
FROM pegawai p
JOIN jabatan j ON p.jabatan_id = j.id
WHERE j.gaji_pokok > (SELECT AVG(gaji_pokok) FROM jabatan);

WITH CTE_JumlahPegawai AS (
    SELECT jabatan_id, COUNT(*) as total_pegawai 
    FROM pegawai 
    GROUP BY jabatan_id
)
SELECT j.nama_jabatan, c.total_pegawai
FROM jabatan j
JOIN CTE_JumlahPegawai c ON j.id = c.jabatan_id
WHERE c.total_pegawai > (SELECT AVG(total_pegawai) FROM CTE_JumlahPegawai);

SELECT p.nama 
FROM pegawai p
JOIN jabatan j ON p.jabatan_id = j.id
WHERE j.gaji_pokok = (SELECT MAX(gaji_pokok) FROM jabatan);

WITH CTE_GajiPegawai AS (
    SELECT p.nama, j.gaji_pokok 
    FROM pegawai p
    JOIN jabatan j ON p.jabatan_id = j.id
    ORDER BY j.gaji_pokok ASC
    LIMIT 3
)
SELECT * FROM CTE_GajiPegawai;