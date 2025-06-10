import oracledb
import getpass
import os

#userpwd = getpass.getpass(prompt="Podaj haslo: ")
userpwd = os.environ.get("DBPSWD1")

connection = oracledb.connect(user="system",
                              password=userpwd,
                              host="localhost",
                              port=1521,
                              service_name="xepdb1")

cursor = connection.cursor()

## Dodawanie rekordu
#cursor.execute("INSERT INTO gp_recenzenci (id_recenzenta, imie, nazwisko)\
 #               VALUES (208, 'Zenon', 'Kawa')")

## Aktualizacja tabeli
#cursor.execute("UPDATE gp_recenzenci SET imie = 'Zenobiusz' WHERE id_recenzenta = 208")


## Usuwanie rekordu
cursor.execute("DELETE FROM gp_recenzenci WHERE id_recenzenta = 208")

cursor.execute("SELECT * FROM gp_recenzenci")

wyniki = cursor.fetchall()

for row in wyniki:
    print(row)

connection.commit()

connection.close()
