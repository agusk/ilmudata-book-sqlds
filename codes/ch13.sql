 CREATE TABLE nama_tabel (
       kolom1 tipe_data1,
       kolom2 tipe_data2,
       ...
   );

   ALTER TABLE nama_tabel ADD COLUMN kolom_baru tipe_data;

   DROP TABLE nama_tabel;

   INSERT INTO nama_tabel (kolom1, kolom2, ...) VALUES (nilai1, nilai2, ...);

   UPDATE nama_tabel SET kolom1 = nilai1, kolom2 = nilai2 WHERE kondisi;

   DELETE FROM nama_tabel WHERE kondisi;

   SELECT kolom1, kolom2, ... FROM nama_tabel WHERE kondisi;

   SELECT * FROM nama_tabel WHERE kolom = nilai;

   SELECT * FROM nama_tabel ORDER BY kolom ASC/DESC;

   SELECT * FROM nama_tabel LIMIT jumlah OFFSET mulai;

   SELECT kolom, COUNT(*) FROM nama_tabel GROUP BY kolom;

   SELECT kolom, COUNT(*) FROM nama_tabel GROUP BY kolom HAVING COUNT(*) > nilai;

   SELECT * FROM tabel1 INNER JOIN tabel2 ON tabel1.kolom = tabel2.kolom;

   SELECT * FROM tabel1 LEFT JOIN tabel2 ON tabel1.kolom = tabel2.kolom;
 
   SELECT * FROM tabel1 CROSS JOIN tabel2;
  
   PRAGMA table_info(nama_tabel);