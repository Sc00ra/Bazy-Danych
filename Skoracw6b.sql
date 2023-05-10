USE Firma

CREATE DATABASE Firma;

CREATE SCHEMA  ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (

id_pracownika VARCHAR(5) PRIMARY KEY,
imie	VARCHAR(20) NOT NULL,
nazwisko VARCHAR(20) NOT NULL,
adres	VARCHAR(100) NOT NULL,
telefon VARCHAR(12),

);

CREATE TABLE ksiegowosc.godziny (

id_godziny VARCHAR(5) PRIMARY KEY,
data	DATE NOT NULL,
liczba_godzin SMALLINT NOT NULL,
id_pracownika	VARCHAR(5) FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
);

CREATE TABLE ksiegowosc.pensje (

id_pensji VARCHAR(5) PRIMARY KEY,
stanowisko	VARCHAR(30) NOT NULL,
kwota MONEY NOT NULL,
);

CREATE TABLE ksiegowosc.premie (

id_premii VARCHAR(5) PRIMARY KEY,
rodzaj	VARCHAR(30),
kwota MONEY NOT NULL,

);

CREATE TABLE ksiegowosc.wynagrodzenie (

id_wynagrodzenia VARCHAR(5) PRIMARY KEY,
data DATE NOT NULL,
id_pracownika VARCHAR(5) FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
id_godziny VARCHAR(5) FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
id_pensji VARCHAR(5) FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji),
id_premii VARCHAR(5) FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii) NULL,

);

INSERT INTO ksiegowosc.pracownicy VALUES ('A01', 'Lukasz','Firak', 'Kobierzyn', '777777777');
INSERT INTO ksiegowosc.pracownicy VALUES ('A02', 'Bartosz','Turon', 'Morze', '111111111');
INSERT INTO ksiegowosc.pracownicy VALUES ('A03', 'Piter','Farmazon', 'Jabolowice', '222222222');
INSERT INTO ksiegowosc.pracownicy VALUES ('A04', 'Tomasz','Starosta', 'A0', '333333333');
INSERT INTO ksiegowosc.pracownicy VALUES ('A05', 'Bartosz','Scoora', 'Biezanow', '444444444');
INSERT INTO ksiegowosc.pracownicy VALUES ('A06', 'Wiktor','Salvatti', 'ctf_2fort', '555555555');
INSERT INTO ksiegowosc.pracownicy VALUES ('A07', 'Wojtek','Zagubiony', 'null', '666666666');
INSERT INTO ksiegowosc.pracownicy VALUES ('A08', 'Klaudia','Boniuk', 'Filutek', '888888888');
INSERT INTO ksiegowosc.pracownicy VALUES ('A09', 'Brunon','Grzyb', 'Wielka Polska', '999999999');
INSERT INTO ksiegowosc.pracownicy VALUES ('A10', 'Mateusz','Witam', 'Gory', '101010101');



INSERT INTO ksiegowosc.godziny VALUES ('G01', '2012-12-12',250, 'A01');
INSERT INTO ksiegowosc.godziny VALUES ('G02', '2012-12-13',250, 'A02');
INSERT INTO ksiegowosc.godziny VALUES ('G03', '2012-12-14',250, 'A03');
INSERT INTO ksiegowosc.godziny VALUES ('G04', '2012-12-15',250, 'A04');
INSERT INTO ksiegowosc.godziny VALUES ('G05', '2012-12-16',250, 'A05');
INSERT INTO ksiegowosc.godziny VALUES ('G06', '2012-12-17',250, 'A06');
INSERT INTO ksiegowosc.godziny VALUES ('G07', '2012-12-18',250, 'A07');
INSERT INTO ksiegowosc.godziny VALUES ('G08', '2012-12-19',250, 'A08');
INSERT INTO ksiegowosc.godziny VALUES ('G09', '2012-12-20',250, 'A09');
INSERT INTO ksiegowosc.godziny VALUES ('G10', '2012-12-21',250, 'A10');

INSERT INTO ksiegowosc.pensje VALUES ('P01', 'Pacjent',3490 );
INSERT INTO ksiegowosc.pensje VALUES ('P02', 'Profesor',3492 );
INSERT INTO ksiegowosc.pensje VALUES ('P03', 'Zlota raczka',3491);
INSERT INTO ksiegowosc.pensje VALUES ('P04', 'Przelozony',3493);
INSERT INTO ksiegowosc.pensje VALUES ('P05', 'Ochrona',3491);
INSERT INTO ksiegowosc.pensje VALUES ('P06', 'Premier',3492);
INSERT INTO ksiegowosc.pensje VALUES ('P07', 'Poszukiwacz',3499);
INSERT INTO ksiegowosc.pensje VALUES ('P08', 'Kucharz',3490);
INSERT INTO ksiegowosc.pensje VALUES ('P09', 'HR',3493);
INSERT INTO ksiegowosc.pensje VALUES ('P10', 'Odkopywacz',3490);

INSERT INTO ksiegowosc.premie VALUES ('PR01', 'Za ladne oczy',5);
INSERT INTO ksiegowosc.premie VALUES ('PR02', 'Nie obijanie sie',2.50);
INSERT INTO ksiegowosc.premie VALUES ('PR03',NULL,5.50);
INSERT INTO ksiegowosc.premie VALUES ('PR04',NULL,5.51);
INSERT INTO ksiegowosc.premie VALUES ('PR05',NULL,5.52);
INSERT INTO ksiegowosc.premie VALUES ('PR06',NULL,5.53);
INSERT INTO ksiegowosc.premie VALUES ('PR07',NULL,5.54);
INSERT INTO ksiegowosc.premie VALUES ('PR08',NULL,5.55);
INSERT INTO ksiegowosc.premie VALUES ('PR09',NULL,5.56);
INSERT INTO ksiegowosc.premie VALUES ('PR10',NULL,5.57);

INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W01','2012-12-12','A01','G01','P01','PR01');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W02','2012-12-12','A02','G02','P02','PR10');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W03','2012-12-12','A03','G03','P03','PR09');
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W04','2012-12-12','A04','G04','P04',NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W05','2012-12-12','A05','G05','P05',NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W06','2012-12-12','A06','G06','P06',NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W07','2012-12-12','A07','G07','P07',NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W08','2012-12-12','A08','G08','P08',NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W09','2012-12-12','A09','G09','P09',NULL);
INSERT INTO ksiegowosc.wynagrodzenie VALUES ('W10','2012-12-12','A10','G10','P10',NULL);

--a)
ALTER TABLE ksiegowosc.pracownicy 
ALTER COLUMN telefon VARCHAR(16);

SELECT * FROM ksiegowosc.pracownicy

UPDATE	ksiegowosc.pracownicy 
SET
	telefon = '(+48)' + telefon
--b)
UPDATE ksiegowosc.pracownicy
SET
	telefon = LEFT(telefon,8) + '-' + SUBSTRING(telefon,8,3) + '-' + RIGHT(telefon,3)
--c)
SELECT TOP 1 pr.id_pracownika, UPPER(pr.imie) as imie, UPPER(pr.nazwisko) as nazwisko, UPPER(pr.adres) as adres, pr.telefon FROM ksiegowosc.Pracownicy as pr
ORDER BY len(pr.nazwisko) DESC

--d)

--e)
SELECT pr.*,pe.kwota,pre.kwota FROM ksiegowosc.pracownicy as pr
LEFT JOIN ksiegowosc.wynagrodzenie as wy ON pr.id_pracownika=wy.id_pracownika
LEFT JOIN ksiegowosc.pensje as pe ON pe.id_pensji=wy.id_pensji
LEFT JOIN ksiegowosc.premie as pre ON pre.id_premii=wy.id_premii

--f)
ALTER TABLE ksiegowosc.godziny
ADD liczba_nadgodzin INT NULL;
select * from ksiegowosc.godziny

UPDATE  ksiegowosc.godziny
SET liczba_nadgodzin = liczba_godzin - 160
WHERE liczba_godzin > 160;

SELECT CONCAT('Pracownik ',pr.imie,' ', pr.nazwisko,', w dniu ', wy.data, ' otrzyma³ pensjê ca³kowit¹ na kwotê ', (pe.kwota+COALESCE(pre.kwota,0)+(g.liczba_nadgodzin)*12.50),' z³, gdzie wynagrodzenie zasadnicze wynosi³o: ',pe.kwota ,' z³, premia: ',COALESCE(pre.kwota,0), ' z³, nadgodziny: ',(g.liczba_nadgodzin)*12.50,' z³') as Raport FROM ksiegowosc.pracownicy as pr
JOIN ksiegowosc.wynagrodzenie as wy ON pr.id_pracownika=wy.id_pracownika
JOIN ksiegowosc.pensje as pe ON pe.id_pensji=wy.id_pensji
LEFT JOIN ksiegowosc.premie as pre ON pre.id_premii=wy.id_premii
JOIN ksiegowosc.godziny as g ON g.id_godziny=wy.id_godziny

