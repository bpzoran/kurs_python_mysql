import mysql.connector

moja_baza = mysql.connector.connect(
    host="localhost",
    user="admin",
    passwd="Admin123!",
    database="knjige"
)

moj_kursor = moja_baza.cursor()

# PRIKAZ BAZA

# moj_kursor.execute("SHOW DATABASES")
# for baza in moj_kursor:
#     print(baza[0])

# PRIKAZ TABELA

# moj_kursor.execute("SHOW TABLES")
# for tabela in moj_kursor:
#     print(tabela[0])

# PRIKAZ PODATAKA IZ TABELA

# sql_komanda_za_selektovanje_knjiga = "SELECT naziv_knjige, zanr FROM knjiga"
# sql_komanda_za_selektovanje_pisaca = "SELECT ime_pisca, godina_rodjenja FROM pisac"
#
# moj_kursor.execute(sql_komanda_za_selektovanje_knjiga)
# rezultat_upita_za_knjige = moj_kursor.fetchall()
# for red in rezultat_upita_za_knjige:
#     print(red)
#
# moj_kursor.execute(sql_komanda_za_selektovanje_pisaca)
# rezultat_upita_za_pisce = moj_kursor.fetchall()
# for red in rezultat_upita_za_pisce:
#     print(red)

# DODAVANJE JEDNOG REDA U TABELU

sql_komanda_za_dodavanje_pisca = "INSERT INTO pisac (ime_pisca, godina_rodjenja) VALUES (%s, %s)"
# unos_pisca = ("Slobodan Zelic", 1998)
# moj_kursor.execute(sql_komanda_za_dodavanje_pisca, unos_pisca)
# moja_baza.commit()

# DODAVANJE VISE REDOVA U TABELU
unos_vise_pisaca = [
    ("Marko Markovic", 1992),
    ("Jovan Jovanovic", 1978),
    ("Pedja Pedjanovic", 1964),
]
moj_kursor.executemany(sql_komanda_za_dodavanje_pisca, unos_vise_pisaca)
moja_baza.commit()

