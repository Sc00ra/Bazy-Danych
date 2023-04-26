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

--dodanie komentarzy
EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "pracownicy"',
@value = N'Informacja o danych osobowych pracowników.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pracownicy';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "godziny"',
@value = N'Informacja o godzinach pracy pracowników.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'godziny';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "pensje"',
@value = N'Informacja pensjach pracowników.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'pensje';
GO

EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "premie"',
@value = N'Informacja premiach pracowników.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'premie';
GO
EXEC sys.sp_addextendedproperty
@name = N'Opis tabeli "wynagrodzenie"',
@value = N'Informacja o wynagrodzeniu (pensja+premia) pracowników.',
@level0type = N'SCHEMA', @level0name = 'ksiegowosc',
@level1type = N'TABLE', @level1name = 'wynagrodzenie';
GO

--a)
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--b)
SELECT pracownicy.id_pracownika FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji=pensje.id_pensji
WHERE kwota>1000;

--c)
SELECT pracownicy.id_pracownika FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji
LEFT JOIN ksiegowosc.premie ON premie.id_premii=wynagrodzenie.id_premii
WHERE pensje.kwota>2000  AND wynagrodzenie.id_premii IS NULL;


--d)
SELECT * FROM ksiegowosc.pracownicy
WHERE pracownicy.imie LIKE 'J%'

--e)
SELECT * FROM ksiegowosc.pracownicy
WHERE pracownicy.imie LIKE '%a' AND pracownicy.nazwisko LIKE '%n%'

--f)
SELECT imie,nazwisko,godziny.liczba_godzin-160 FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.godziny ON godziny.id_godziny=wynagrodzenie.id_godziny

--g)

SELECT imie,nazwisko FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji
WHERE pensje.kwota BETWEEN	1500 and 3000;

--h) 

SELECT imie,nazwisko FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.premie ON premie.id_premii=wynagrodzenie.id_premii
LEFT JOIN ksiegowosc.godziny ON godziny.id_godziny=wynagrodzenie.id_godziny 
WHERE liczba_godzin > 160 AND wynagrodzenie.id_premii Is NULL;

--i)

SELECT pracownicy.*,pensje.kwota AS pensja FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji
ORDER BY pensje.kwota;

--j)
SELECT pracownicy.*,pensje.kwota AS pensja,premie.kwota AS premia FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji
LEFT JOIN ksiegowosc.premie ON premie.id_premii=wynagrodzenie.id_premii
ORDER BY pensje.kwota,premie.kwota DESC;

--k)

SELECT COUNT(pracownicy.id_pracownika) AS zatrudnionych,pensje.stanowisko AS premia FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji
GROUP BY pensje.stanowisko

--l)

SELECT pensje.stanowisko ,AVG(pensje.kwota) AS AVG, MIN(pensje.kwota) AS MIN, MAX(pensje.kwota) AS MAX FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji
GROUP BY pensje.stanowisko
HAVING pensje.stanowisko='odkopywacz';

--m)

SELECT SUM(pensje.kwota) AS suma FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji

--n)

SELECT pensje.stanowisko, SUM(pensje.kwota) AS suma FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji
GROUP BY pensje.stanowisko

--o)

SELECT pensje.stanowisko, COUNT(premie.id_premii) AS ilosc_premii FROM ksiegowosc.pracownicy 
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika=wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji=wynagrodzenie.id_pensji
LEFT JOIN ksiegowosc.premie ON premie.id_premii=wynagrodzenie.id_premii
GROUP BY pensje.stanowisko

--p)
SELECT * FROM ksiegowosc.pracownicy

EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
GO
DELETE ksiegowosc.pracownicy
FROM ksiegowosc.pracownicy 
LEFT OUTER JOIN ksiegowosc.wynagrodzenie  ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
LEFT OUTER JOIN ksiegowosc.pensje  ON pensje.id_pensji=wynagrodzenie.id_pensji
WHERE pensje.kwota < 1200;
GO

