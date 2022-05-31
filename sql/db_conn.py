import psycopg2 as pg
db = "dbname='taxi2016' user='postgres' host='localhost' password = 'postgres'"
conn = pg.connect(db)