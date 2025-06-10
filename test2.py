import oracledb
import os
import sqlalchemy as db

userpwd = os.environ.get("DBPSWD1")


oracle_engine = db.create_engine("oracle+oracledb://system:"+userpwd+"@localhost:1521/?service_name=xepdb1")
oracle_connection = oracle_engine.connect()

metadata = db.MetaData()

lokalizacje = db.Table('gp_lokalizacje', metadata, autoload_with=oracle_engine)
#print(repr(metadata.tables['gp_lokalizacje']))
#print(lokalizacje.columns.keys())

## SELECT *
query = lokalizacje.select() 
#print(query)

## Dodawanie rekordu
#query1 = db.insert(lokalizacje).values(id_lokalizacji=107, kraj='Anglia')
#exe1 = oracle_connection.execute(query1)
#query2 = db.insert(lokalizacje).values(id_lokalizacji=108, kraj='Hiszpania')
#exe2 = oracle_connection.execute(query2)

## Selekcja
#query3 = lokalizacje.select().where(lokalizacje.columns.id_lokalizacji == 106)
#exe3 = oracle_connection.execute(query3)

## Usuwanie rekordu
query4 = lokalizacje.delete().where(lokalizacje.columns.id_lokalizacji.in_([107,108]))
exe4 = oracle_connection.execute(query4)

## Wyświetlenie wyniku
result = oracle_connection.execute(query).fetchall()
for row in result: print(row)

oracle_connection.commit()
