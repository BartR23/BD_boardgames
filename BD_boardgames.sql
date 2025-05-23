
-- tabela MOTYWY
CREATE TABLE GP_MOTYWY (
    id_motywu       NUMBER(2,0) NOT NULL,
    nazwa_motywu    VARCHAR2(30),
    CONSTRAINT pk_motywy PRIMARY KEY (id_motywu)
);

-- tabela KATEGORIE_WIEKOWE
CREATE TABLE GP_KATEGORIE_WIEKOWE (
    id_kategorii_wiekowej      NUMBER(2,0) NOT NULL,
    nazwa_k_wiekowej           VARCHAR2(30),
    minimalny_wiek             INTEGER,
    CONSTRAINT pk_kat_wiek PRIMARY KEY (id_kategorii_wiekowej)
);

-- tabela KATEGORIE_LICZBY_GRACZY
CREATE TABLE GP_KATEGORIE_LICZBY_GRACZY (
    id_liczby_graczy        NUMBER(2,0) NOT NULL,
    nazwa_k_l_graczy        VARCHAR2(30),
    min_liczba_graczy       INTEGER,
    max_liczba_graczy       INTEGER,
    CONSTRAINT pk_licz_graczy PRIMARY KEY (id_liczby_graczy)
);

-- tabela LOKALIZACJE
CREATE TABLE GP_LOKALIZACJE (
    id_lokalizacji      NUMBER(3,0) NOT NULL,
    kraj                VARCHAR2(30),
    CONSTRAINT pk_lokalizacje PRIMARY KEY (id_lokalizacji)
);

-- tabela PRODUCENCI
CREATE TABLE GP_PRODUCENCI (
    id_producenta       NUMBER(4,0) NOT NULL,
    nazwa_producenta    VARCHAR2(30),
    id_lokalizacji      NUMBER(3,0),
    CONSTRAINT pk_producenci PRIMARY KEY (id_producenta),
    CONSTRAINT fk_producenci_lok FOREIGN KEY (id_lokalizacji) REFERENCES GP_LOKALIZACJE(id_lokalizacji)
);

-- tabela GRY_PLANSZOWE
CREATE TABLE GP_GRY_PLANSZOWE (
    id_gry                  NUMBER(4,0) NOT NULL,
    nazwa                   VARCHAR2(50),
    nr_wersji               INTEGER,
    data_wydania            DATE,
    id_kategorii_wiekowej   NUMBER(2,0),
    id_motywu               NUMBER(2,0),
    id_liczby_graczy        NUMBER(2,0),
    id_producenta           NUMBER(4,0),
    id_poprzedniej_wersji   NUMBER(4,0),
    CONSTRAINT pk_gry PRIMARY KEY (id_gry),
    CONSTRAINT fk_gry_wiek FOREIGN KEY (id_kategorii_wiekowej) REFERENCES GP_KATEGORIE_WIEKOWE(id_kategorii_wiekowej),
    CONSTRAINT fk_gry_mot FOREIGN KEY (id_motywu) REFERENCES GP_MOTYWY(id_motywu),
    CONSTRAINT fk_gry_gracze FOREIGN KEY (id_liczby_graczy) REFERENCES GP_KATEGORIE_LICZBY_GRACZY(id_liczby_graczy),
    CONSTRAINT fk_gry_prod FOREIGN KEY (id_producenta) REFERENCES GP_PRODUCENCI(id_producenta),
    CONSTRAINT fk_gry_wer FOREIGN KEY (id_poprzedniej_wersji) REFERENCES GP_GRY_PLANSZOWE(id_gry)
);

-- tabela MECHANIKI
CREATE TABLE GP_MECHANIKI (
    id_mechaniki        NUMBER(3,0) NOT NULL,
    nazwa_mechaniki     VARCHAR2(30),
    opis_mechaniki      VARCHAR2(200),
    CONSTRAINT pk_mechaniki PRIMARY KEY (id_mechaniki)
);

-- tabela ELEMENTY_ROZGRYWKI
CREATE TABLE GP_ELEMENTY_ROZGRYWKI (
    id_elementu_rozgrywki       NUMBER(6,0) NOT NULL,
    opis_elementu_rozgrywki     VARCHAR2(200),
    id_mechaniki                NUMBER(3,0),
    id_gry                      NUMBER(4,0),
    CONSTRAINT pk_e_rozgr PRIMARY KEY (id_elementu_rozgrywki),
    CONSTRAINT fk_e_rozg_mech FOREIGN KEY (id_mechaniki) REFERENCES GP_MECHANIKI(id_mechaniki),
    CONSTRAINT fk_e_rozg_gra FOREIGN KEY (id_gry) REFERENCES GP_GRY_PLANSZOWE(id_gry)
);

-- tabela KOMPONENTY
CREATE TABLE GP_KOMPONENTY (
    id_komponentu       NUMBER(2,0) NOT NULL,
    nazwa_komponentu    VARCHAR2(30),
    CONSTRAINT pk_komponenty PRIMARY KEY (id_komponentu)
);

-- tabela ELEMENTY_ZESTAWU
CREATE TABLE GP_ELEMENTY_ZESTAWU (
    id_elementu_zestawu     NUMBER(6,0) NOT NULL,
    liczba_komponentow      INTEGER,
    id_komponentu           NUMBER(2,0),
    id_gry                  NUMBER(4,0),
    CONSTRAINT pk_e_zest PRIMARY KEY (id_elementu_zestawu),
    CONSTRAINT fk_e_zest_komp FOREIGN KEY (id_komponentu) REFERENCES GP_KOMPONENTY(id_komponentu),
    CONSTRAINT fk_e_zest_gra FOREIGN KEY (id_gry) REFERENCES GP_GRY_PLANSZOWE(id_gry)
);

-- tabela RECENZENCI
CREATE TABLE GP_RECENZENCI (
    id_recenzenta       NUMBER(3,0) NOT NULL,
    imie                VARCHAR2(30),
    nazwisko            VARCHAR2(30),
    CONSTRAINT pk_recenzenci PRIMARY KEY (id_recenzenta)
);

-- tabela OCENY
CREATE TABLE GP_OCENY (
    id_oceny        NUMBER(2,0) NOT NULL,
    ocena           NUMBER(2,1),
    CONSTRAINT pk_oceny PRIMARY KEY (id_oceny)
);

-- tabela RECENZJE
CREATE TABLE GP_RECENZJE (
    id_recenzji         NUMBER(4,0) NOT NULL,
    recenzja            CLOB,
    id_gry              NUMBER(4,0),
    id_recenzenta       NUMBER(3,0),
    id_oceny            NUMBER(2,0),
    CONSTRAINT pk_recenzje PRIMARY KEY (id_recenzji),
    CONSTRAINT fk_recenzje_gra FOREIGN KEY (id_gry) REFERENCES GP_GRY_PLANSZOWE(id_gry),
    CONSTRAINT fk_recenzje_rec FOREIGN KEY (id_recenzenta) REFERENCES GP_RECENZENCI(id_recenzenta),
    CONSTRAINT fk_recenzje_oc FOREIGN KEY (id_oceny) REFERENCES GP_OCENY(id_oceny)
);

-- wypelnienie tabeli MOTYWY
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('10','Adventure');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('15', 'Civil War');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('20', 'Fantasy');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('25', 'Farming');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('30', 'Industry');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('35', 'Historical simulation');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('40', 'Mafia');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('45', 'Murder mystery');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('50', 'Mythology');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('55', 'Nautical');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('60', 'Political');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('65', 'Science fiction');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('70', 'Sports');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('75', 'Train');
INSERT INTO gp_motywy (id_motywu, nazwa_motywu) VALUES ('80', 'Travel');

-- wypelnienie tabeli KATEGORIE_WIEKOWE
INSERT INTO gp_kategorie_wiekowe (id_kategorii_wiekowej, nazwa_k_wiekowej, minimalny_wiek) VALUES (10,'Children''s', 4);
INSERT INTO gp_kategorie_wiekowe (id_kategorii_wiekowej, nazwa_k_wiekowej, minimalny_wiek) VALUES (11,'Family', 8);
INSERT INTO gp_kategorie_wiekowe (id_kategorii_wiekowej, nazwa_k_wiekowej, minimalny_wiek) VALUES (12,'Adult', 18);

-- wypelnianie tabeli KATEGORIE_LICZBY_GRACZY
INSERT INTO gp_kategorie_liczby_graczy (id_liczby_graczy, nazwa_k_l_graczy, min_liczba_graczy, max_liczba_graczy) VALUES (10,'One-player', 1, 1);
INSERT INTO gp_kategorie_liczby_graczy (id_liczby_graczy, nazwa_k_l_graczy, min_liczba_graczy, max_liczba_graczy) VALUES (12,'Two-player', 2, 2);
INSERT INTO gp_kategorie_liczby_graczy (id_liczby_graczy, nazwa_k_l_graczy, min_liczba_graczy, max_liczba_graczy) VALUES (14,'Multiplayer', 2, 8);
INSERT INTO gp_kategorie_liczby_graczy (id_liczby_graczy, nazwa_k_l_graczy, min_liczba_graczy, max_liczba_graczy) VALUES (16,'Large multiplayer', 4, null);

-- wypelnianie tabeli LOKALIZACJE
INSERT INTO gp_lokalizacje (id_lokalizacji, kraj) VALUES (101,'Francja');
INSERT INTO gp_lokalizacje (id_lokalizacji, kraj) VALUES (102,'Stany Zjednoczone');
INSERT INTO gp_lokalizacje (id_lokalizacji, kraj) VALUES (103,'Czechy');
INSERT INTO gp_lokalizacje (id_lokalizacji, kraj) VALUES (104,'Niemcy');
INSERT INTO gp_lokalizacje (id_lokalizacji, kraj) VALUES (105,'Polska');
INSERT INTO gp_lokalizacje (id_lokalizacji, kraj) VALUES (106,'Chiny');

-- wypelnianie tabeli PRODUCENCI
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1010,'Asmodee', 101);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1020,'Hasbro Gaming', 102);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1030,'Mattel', 102);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1040,'Fantasy Flight Games', 102);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1050,'Czech Games Edition', 103);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1060,'Days of Wonder', 102);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1070,'Z-Man Games', 104);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1080,'Rio Grande Games', 102);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1090,'Repos Production', 101);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1100,'Stonemaier Games', 102);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1110,'Portal Games', 105);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1120,'Egmont Polska', 105);
INSERT INTO gp_producenci (id_producenta, nazwa_producenta, id_lokalizacji) VALUES (1130,'Yunnan Hongsheng', 106);

-- wypelnianie tabeli MECHANIKI
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (301,'Auction', 'Aukcyjne gry planszowe to te, które używają licytacji, przypisywania wartości do różnych przedmiotów');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (303,'Area control', 'Gry z jakąś formą mapy lub planszy definiującą przestrzeń, o którą gracze konkurują, aby dominować');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (305,'Campaign', 'Gry są definiowane przez graczy po serii powiązanych scenariuszy, w których wynik jednego scenariusza będzie miały wpływ na następny');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (307,'City building', 'Gry obejmują budowanie i zarządzanie miastem poprzez decyzje dotyczące planowania');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (309,'Cooperative', 'To gry, w których wszyscy gracze pracują razem, aby osiągnąć wspólny cel, a nie konkurować ze sobą');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (311,'Cross and circle', 'To gry wyścigowe z planszami składającymi się z koła podzielonego na cztery równe części przez krzyż wpisany w niego');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (313,'Economic', 'Gry planszowe obejmujące zarządzanie zasobami i podejmowanie mądrych decyzji o tym, jak wydawać lub inwestować pieniądze');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (315,'Educational', 'To gry, które mają na celu nauczanie nowych pomysłów, koncepcji, tematów');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (317,'Guessing', 'To gry, które angażują gracza lub graczy, odgadujących odpowiedź na pytanie w oparciu o wskazówki innego gracza');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (319,'Hidden role', 'To gry z udziałem gracza lub graczy z ukrytą rolą w grupie, w której reszta graczy musi ją zidentyfikować');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (321,'Memory', 'Gry pamięciowe dotyczą zapamiętywania pewnych faktów, liczb i innych informacji');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (323,'Paper-and-pencil', 'To gry, które można odtwarzać wyłącznie za pomocą narzędzi do pisania, zwykle bez wymazywania');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (325,'Party', 'To gry, które zachęcają do interakcji społecznych. Są one przeznaczone dla większych grup');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (327,'Physical skills', 'To gry, które obejmują wyzwania związane z umiejętnościami motorycznymi');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (329,'Puzzle', 'Gry planszowe oparte na rozwiązywaniu zagadki, są zwykle grami dla jednego gracza');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (331,'Race', 'Gry, w których każdy gracz ma cel, aby zakończyć zadanie jako pierwszy');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (333,'Word', 'Gry wykorzystujące testowanie słownictwa graczy, umiejętności twórczego myślenia, pisowni lub szybkiego wymyślania słów');
INSERT INTO gp_mechaniki (id_mechaniki, nazwa_mechaniki, opis_mechaniki) VALUES (335,'Wargame', 'Są opartymi na strategii grami planszowymi z motywem wojennym. Ich mechanika jest ściśle związana z symulacją bitew');

-- wypelnianie tabeli KOMPONENTY
INSERT INTO gp_komponenty (id_komponentu, nazwa_komponentu) VALUES (11,'kostka');
INSERT INTO gp_komponenty (id_komponentu, nazwa_komponentu) VALUES (12,'książka');
INSERT INTO gp_komponenty (id_komponentu, nazwa_komponentu) VALUES (13,'karty');
INSERT INTO gp_komponenty (id_komponentu, nazwa_komponentu) VALUES (14,'akcesoria elektroniczne');
INSERT INTO gp_komponenty (id_komponentu, nazwa_komponentu) VALUES (15,'system gry');
INSERT INTO gp_komponenty (id_komponentu, nazwa_komponentu) VALUES (16,'miniaturki');
INSERT INTO gp_komponenty (id_komponentu, nazwa_komponentu) VALUES (17,'kafelki');
 
-- wypelnienie tabeli RECENZENCI
INSERT INTO gp_recenzenci (id_recenzenta, imie, nazwisko) VALUES (201,'Wanda', 'Raczyńska');
INSERT INTO gp_recenzenci (id_recenzenta, imie, nazwisko) VALUES (202,'Tymon', 'Słupek');
INSERT INTO gp_recenzenci (id_recenzenta, imie, nazwisko) VALUES (203,'Iwona', 'Cebulak');
INSERT INTO gp_recenzenci (id_recenzenta, imie, nazwisko) VALUES (204,'Mieczysław', 'Siarkiewicz');
INSERT INTO gp_recenzenci (id_recenzenta, imie, nazwisko) VALUES (205,'Pola', 'Machniak');
INSERT INTO gp_recenzenci (id_recenzenta, imie, nazwisko) VALUES (206,'Aleksander', 'Osadnik');
INSERT INTO gp_recenzenci (id_recenzenta, imie, nazwisko) VALUES (207,'Maja', 'Serkowska');

-- wypelnienie tabeli OCENY
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (11,0);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (12,0.5);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (13,1);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (14,1.5);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (15,2);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (16,2.5);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (17,3);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (18,3.5);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (19,4);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (20,4.5);
INSERT INTO gp_oceny (id_oceny, ocena) VALUES (21,5);

-- wypelnienie tabeli GRY_PLANSZOWE
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5001, 'El Grande', 1, to_date('01-03-1995','DD-MM-RRRR'), 11, 35, 14, 1080, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5002, 'Scythe', 1, to_date('10-04-2016','DD-MM-RRRR'), 11, 15, 14, 1100, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5003, 'Charterstone', 1, to_date('15-05-2017','DD-MM-RRRR'), 11, 15, 14, 1100, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5004, '7 Wonders', 1, to_date('01-06-2010','DD-MM-RRRR'), 11, 50, 14, 1090, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5005, 'Pandemic', 1, to_date('14-07-2008','DD-MM-RRRR'), 11, 65, 14, 1070, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5006, 'Ludo', 1, to_date('01-01-1896','DD-MM-RRRR'), 10, null, 14, null, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5007, 'Monopoly Hasbro', 1, to_date('11-09-1992','DD-MM-RRRR'), 11, 30, 14, 1020, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5008, 'Wingspan', 1, to_date('03-02-2019','DD-MM-RRRR'), 10, 25, 14, 1100, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5009, 'Battleship Hasbro', 1, to_date('04-04-1994','DD-MM-RRRR'), 11, 55, 12, 1020, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5010, 'Mafia Egmont', 1, to_date('08-08-2012','DD-MM-RRRR'), 11, 40, 16, 1120, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5011, 'Codenames', 1, to_date('09-12-2015','DD-MM-RRRR'), 10, 10, 14, 1050, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5012, 'Concept', 1, to_date('18-07-2013','DD-MM-RRRR'), 10, 80, 16, 1090, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5013, 'Blokus', 1, to_date('01-09-2000','DD-MM-RRRR'), 10, null, 14, 1030, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5014, 'Scrabble', 1, to_date('01-03-1948','DD-MM-RRRR'), 10, null, 14, 1020, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5015, 'Twilight Imperium', 1, to_date('11-10-1997','DD-MM-RRRR'), 11, 65, 14, 1040, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5016, 'TransAmerica', 1, to_date('12-12-2000','DD-MM-RRRR'), 11, 75, 14, 1080, null);
INSERT INTO gp_gry_planszowe (id_gry, nazwa, nr_wersji, data_wydania, id_kategorii_wiekowej, id_motywu, id_liczby_graczy, id_producenta, id_poprzedniej_wersji) 
    VALUES (5017, 'Eldritch Horror', 1, to_date('18-08-2013','DD-MM-RRRR'), 12, 65, 14, 1040, null);

-- wypelnianie tabeli ELEMENTY_ROZGRYWKI
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1010, 'Skupowanie obszarów', 301, 5001);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1020, 'Skupowanie obszarów', 301, 5002);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1030, 'Bitwy', 335, 5002);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1040, 'Gromadzenie terytoriów', 303, 5002);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1050, 'Budowanie scenariuszy', 305, 5003);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1060, 'Wznoszenie budowli', 307, 5004);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1070, 'Współpraca graczy', 309, 5005);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1080, 'Gra na podzielonej planszy', 311, 5006);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1090, 'Gospodarowanie zasobami', 313, 5007);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1100, 'Gromadzenie terytoriów', 303, 5007);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1110, 'Skupowanie obszarów', 301, 5007);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1120, 'Zdobywanie wiedzy', 315, 5008);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1130, 'Wzajemne zgadywanie', 317, 5009);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1140, 'Próba odgadnięcia roli gracza', 319, 5010);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1150, 'Odszukiwanie zapamiętanych obrazów', 321, 5011);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1160, 'Wzajemna interakcja', 325, 5012);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1170, 'Wzajemne zgadywanie', 317, 5012);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1180, 'Ułożenie docelowego wzoru', 329, 5013);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1190, 'Znajomość słownictwa', 333, 5014);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1200, 'Opracowanie strategii', 335, 5015);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1210, 'Gromadzenie terytoriów', 303, 5016);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1220, 'Współpraca graczy', 309, 5017);
INSERT INTO gp_elementy_rozgrywki (id_elementu_rozgrywki, opis_elementu_rozgrywki, id_mechaniki, id_gry) VALUES (1230, 'Opracowanie strategii', 335, 5017);

-- wypelnianie tabeli ELEMENTY_ZESTAWU
INSERT INTO gp_elementy_zestawu (id_elementu_zestawu, liczba_komponentow, id_komponentu, id_gry) VALUES (3000, 170, 13, 5008);
INSERT INTO gp_elementy_zestawu (id_elementu_zestawu, liczba_komponentow, id_komponentu, id_gry) VALUES (3001, 60, 13, 5007);
INSERT INTO gp_elementy_zestawu (id_elementu_zestawu, liczba_komponentow, id_komponentu, id_gry) VALUES (3002, 2, 11, 5007);
INSERT INTO gp_elementy_zestawu (id_elementu_zestawu, liczba_komponentow, id_komponentu, id_gry) VALUES (3003, 104, 16, 5007);
INSERT INTO gp_elementy_zestawu (id_elementu_zestawu, liczba_komponentow, id_komponentu, id_gry) VALUES (3004, 161, 16, 5001);
INSERT INTO gp_elementy_zestawu (id_elementu_zestawu, liczba_komponentow, id_komponentu, id_gry) VALUES (3005, 119, 13, 5001);

-- wypelnianie tabeli RECENZJE
INSERT INTO gp_recenzje (id_recenzji, recenzja, id_gry, id_recenzenta, id_oceny) VALUES (9100, 'Mimo iż gra wydaje się być dobra dla każdego, to jednak nie jest najlepszym pomysłem, gdy w pobliżu znajdują się małe dzieci. Niewielkich rozmiarów elementy mogą zostać łatwo połknięte przez maluchy. Poza tym w "Battleship..." może zagrać dosłownie każdy. Zapewnia ona wiele dobrej zabawy, zmusza do myślenia strategicznego, a całość po prostu cieszy oko', 5009, 203, 20);
INSERT INTO gp_recenzje (id_recenzji, recenzja, id_gry, id_recenzenta, id_oceny) VALUES (9200, 'Jej największe zalety to szybka rozgrywka oraz fakt, że sprawia przyjemność zarówno w rozgrywkach dwuosobowych, jak i na siedmiu graczy. Warto jednak pamiętać, że gra jest mocno losowa, co u niektórych skreśli ją w przedbiegach', 5004, 206, 18);
