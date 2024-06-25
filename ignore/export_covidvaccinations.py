import pandas as pd
from sqlalchemy.engine import URL
from sqlalchemy import create_engine

url_obj = URL.create(
    "mssql+pyodbc",
     host= "ALEXANDRUPC\SQLSERVER2022",
     database= "ProjectsDB",
     query= {
         "driver": "ODBC Driver 18 for SQL Server",
         "TrustServerCertificate": "yes",
         "authentication": "ActiveDirectoryIntegrated",
     },
)

con = create_engine(url_obj)

file_path = "D:\Projects and practice\PBI practice\Covid-19 project\CovidVaccinations_updated.xlsx"

with con.connect() as conn, conn.begin():
    df = pd.read_sql_query('''select * from CovidVaccinations''', conn)
    df.to_excel(file_path)
