USE Firma

CREATE DATABASE Firma;

CREATE SCHEMA  rozliczenia;

CREATE TABLE rozliczenia.pracownicy (

id_pracownika VARCHAR(5) PRIMARY KEY,
imie	VARCHAR(20) NOT NULL,
nazwisko VARCHAR(20) NOT NULL,
adres	VARCHAR(100) NOT NULL,
telefon VARCHAR(12),

);

CREATE TABLE rozliczenia.godziny (

id_godziny VARCHAR(5) PRIMARY KEY,
data	DATE NOT NULL,
liczba_godzin SMALLINT NOT NULL,
id_pracownika	VARCHAR(5) NOT NULL,

);

CREATE TABLE rozliczenia.pensje (

id_pensji VARCHAR(5) PRIMARY KEY,
stanowisko	VARCHAR(30) NOT NULL,
kwota MONEY NOT NULL,
id_premii	VARCHAR(5) ,

);

CREATE TABLE rozliczenia.premie (

id_premii VARCHAR(5) PRIMARY KEY,
rodzaj	VARCHAR(30),
kwota MONEY NOT NULL,

);

ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

INSERT INTO rozliczenia.pracownicy VALUES ('A01', '£ukasz','Firak', 'Kobierzyn', '777777777');
INSERT INTO rozliczenia.pracownicy VALUES ('A02', 'Bartosz','Turoñ', 'Morze', '111111111');
INSERT INTO rozliczenia.pracownicy VALUES ('A03', 'Piter','Farmazon', 'Jabolowice', '222222222');
INSERT INTO rozliczenia.pracownicy VALUES ('A04', 'Tomasz','Starosta', 'A0', '333333333');
INSERT INTO rozliczenia.pracownicy VALUES ('A05', 'Bartosz','Scoora', 'Bie¿anów', '444444444');
INSERT INTO rozliczenia.pracownicy VALUES ('A06', 'Wiktor','Salvatti', 'ctf_2fort', '555555555');
INSERT INTO rozliczenia.pracownicy VALUES ('A07', 'Wojtek','Zagubiony', 'null', '666666666');
INSERT INTO rozliczenia.pracownicy VALUES ('A08', 'Klaudia','Boniuk', 'Filutek', '888888888');
INSERT INTO rozliczenia.pracownicy VALUES ('A09', 'Brunon','Grzyb', 'Wielka Polska', '999999999');
INSERT INTO rozliczenia.pracownicy VALUES ('A10', 'Mateusz','Witam', 'Góry', '101010101');

INSERT INTO rozliczenia.godziny VALUES ('G01', '2012-12-12',20, 'A01');
INSERT INTO rozliczenia.godziny VALUES ('G02', '2012-12-13',20, 'A02');
INSERT INTO rozliczenia.godziny VALUES ('G03', '2012-12-14',20, 'A03');
INSERT INTO rozliczenia.godziny VALUES ('G04', '2012-12-15',20, 'A04');
INSERT INTO rozliczenia.godziny VALUES ('G05', '2012-12-16',20, 'A05');
INSERT INTO rozliczenia.godziny VALUES ('G06', '2012-12-17',20, 'A06');
INSERT INTO rozliczenia.godziny VALUES ('G07', '2012-12-18',20, 'A07');
INSERT INTO rozliczenia.godziny VALUES ('G08', '2012-12-19',20, 'A08');
INSERT INTO rozliczenia.godziny VALUES ('G09', '2012-12-20',20, 'A09');
INSERT INTO rozliczenia.godziny VALUES ('G10', '2012-12-21',20, 'A10');

INSERT INTO rozliczenia.pensje VALUES ('P01', 'Pacjent',3490 , NULL);
INSERT INTO rozliczenia.pensje VALUES ('P02', 'Profesor',3490 , NULL);
INSERT INTO rozliczenia.pensje VALUES ('P03', 'Z³ota r¹czka',3490 ,NULL);
INSERT INTO rozliczenia.pensje VALUES ('P04', 'Prze³o¿ony',3490 , NULL);
INSERT INTO rozliczenia.pensje VALUES ('P05', 'Ochrona',3490 , NULL);
INSERT INTO rozliczenia.pensje VALUES ('P06', 'Premier',3490 ,NULL);
INSERT INTO rozliczenia.pensje VALUES ('P07', 'Poszukiwacz',3490 , NULL);
INSERT INTO rozliczenia.pensje VALUES ('P08', 'Kucharz',3490 , NULL);
INSERT INTO rozliczenia.pensje VALUES ('P09', 'HR',3490 , NULL);
INSERT INTO rozliczenia.pensje VALUES ('P10', 'Odkopywacz',3490 , NULL);

INSERT INTO rozliczenia.premie VALUES ('PR01', 'Za ³adne oczy',5);
INSERT INTO rozliczenia.premie VALUES ('PR02', 'Nie obijanie siê',2.50);
INSERT INTO rozliczenia.premie VALUES ('PR03',NULL,5.50);
INSERT INTO rozliczenia.premie VALUES ('PR04',NULL,5.51);
INSERT INTO rozliczenia.premie VALUES ('PR05',NULL,5.52);
INSERT INTO rozliczenia.premie VALUES ('PR06',NULL,5.53);
INSERT INTO rozliczenia.premie VALUES ('PR07',NULL,5.54);
INSERT INTO rozliczenia.premie VALUES ('PR08',NULL,5.55);
INSERT INTO rozliczenia.premie VALUES ('PR09',NULL,5.56);
INSERT INTO rozliczenia.premie VALUES ('PR10',NULL,5.57);

SELECT nazwisko, adres FROM rozliczenia.pracownicy;

SELECT DATEPART ( DAY , data ) as 'Dzieñ',
	DATEPART ( MONTH, data ) as 'Miesi¹c'
FROM rozliczenia.godziny;

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje
ADD kwota_netto AS (pensje.kwota_brutto-(pensje.kwota_brutto * 0.23));


SELECT * FROM rozliczenia.pensje

