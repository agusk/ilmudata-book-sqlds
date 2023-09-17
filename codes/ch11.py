import pandas as pd
import sqlite3

# Koneksi ke database SQLite
conn = sqlite3.connect('your_database.db')

# Query dengan SQL dan muat hasilnya ke DataFrame
df = pd.read_sql_query("SELECT * FROM your_table", conn)