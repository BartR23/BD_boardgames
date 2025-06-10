select * from gp_kategorie_liczby_graczy;

select * from gp_producenci
where id_lokalizacji = (select id_lokalizacji from gp_lokalizacje
                        where kraj = 'Francja');
                        
select * from gp_lokalizacje;

select nazwa, data_wydania from gp_gry_planszowe
where data_wydania > '00/01/01';

SELECT * FROM GP_GRY_PLANSZOWE;
select * from gp_recenzje;

SELECT g.nazwa AS "NAZWA GRY", ez.id_komponentu, k.nazwa_komponentu, ez.liczba_komponentow AS "LICZBA KOSCI"
FROM gp_gry_planszowe g JOIN gp_elementy_zestawu ez ON g.id_gry = ez.id_gry JOIN  gp_komponenty k ON ez.id_komponentu = k.id_komponentu
GROUP BY g.nazwa, ez.id_komponentu, k.nazwa_komponentu, ez.liczba_komponentow HAVING ez.id_komponentu = 11;

SELECT g.nazwa AS "NAZWA GRY", ez.liczba_komponentow AS "LICZBA KOSCI"
FROM gp_gry_planszowe g JOIN gp_elementy_zestawu ez ON g.id_gry = ez.id_gry JOIN  gp_komponenty k ON ez.id_komponentu = k.id_komponentu
GROUP BY g.nazwa, ez.id_komponentu, ez.liczba_komponentow HAVING ez.id_komponentu = 11;

SELECT g.nazwa AS "NAZWA GRY", ez.liczba_komponentow AS "LICZBA KOSCI"
FROM gp_gry_planszowe g JOIN gp_elementy_zestawu ez ON g.id_gry = ez.id_gry JOIN  gp_komponenty k ON ez.id_komponentu = k.id_komponentu
GROUP BY g.nazwa, ez.id_komponentu, ez.liczba_komponentow 
HAVING ez.id_komponentu = (SELECT id_komponentu FROM gp_komponenty WHERE nazwa_komponentu = 'kostka');


SELECT g.nazwa AS "NAZWA GRY", l.kraj AS "KRAJ WYDANIA"
FROM gp_gry_planszowe g JOIN gp_producenci p ON g.id_producenta = p.id_producenta JOIN gp_lokalizacje l ON p.id_lokalizacji = l.id_lokalizacji
GROUP BY g.nazwa, l.kraj HAVING l.kraj IN ('Polska', 'Czechy');



select * from gp_gry_planszowe
where data_wydania > '99/01/01';

select * from gp_gry_planszowe
where (select extract(year from data_wydania) from gp_gry_planszowe) = 2000;


select * from gp_producenci
where id_lokalizacji = id_kraju('Francja');

select extract(year from data_wydania) as rok from gp_gry_planszowe;

select * from gp_gry_planszowe
where extract(year from data_wydania) = 2000;

select id_lokalizacji
from gp_lokalizacje
where kraj = 'Francja';



select id_kraju('Francja') from dual;

select * from gp_producenci 
where id_lokalizacji = id_kraju('Francja');

EXEC nowa_lokalizacja(123, 'Portugalia');

select * from gp_lokalizacje;
delete from gp_lokalizacje where id_lokalizacji = 123;



CREATE TABLE gp_mechaniki_kopia AS SELECT * FROM gp_mechaniki;
drop table gp_mechaniki_kopia;

select * from gp_mechaniki;

select * from gp_mechaniki where id_mechaniki = 335;
select g.nazwa, e.id_mechaniki from gp_gry_planszowe g JOIN gp_elementy_rozgrywki e ON g.id_gry = e.id_gry
group by g.nazwa, e.id_mechaniki having e.id_mechaniki = 335;

select gp_gry_z_mechanika(335) from dual;
select * from table (gp_gry_z_mechanika(335))
/

select * from gp_motywy;
select * from table (gp_gry_z_motywem('Adventure'))
/

select * from global_name;

select * from gp_recenzenci;

select * from gp_lokalizacje;