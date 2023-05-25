create database geochronologia;
create schema geo;

#tworzenie tabel z referencjami
CREATE TABLE geo.GeoEon(
id_eon int PRIMARY KEY,
nazwa_eon VARCHAR(30)
);

CREATE TABLE geo.GeoEra(
id_era int PRIMARY KEY,
id_eon int,
nazwa_era VARCHAR(30),
FOREIGN KEY (id_eon) REFERENCES geo.GeoEon(id_eon)
);

CREATE TABLE geo.GeoOkres(
id_okres int PRIMARY KEY,
id_era int ,
nazwa_okres VARCHAR(30),
FOREIGN KEY (id_era) REFERENCES geo.GeoEra(id_era)

);

CREATE TABLE geo.GeoEpoka(
id_epoka int PRIMARY KEY,
id_okres int,
nazwa_epoka VARCHAR(30),
FOREIGN KEY (id_okres) REFERENCES geo.Geookres(id_okres)

);

CREATE TABLE geo.GeoPietro(
id_pietro int PRIMARY KEY,
id_epoka int ,
nazwa_pietro VARCHAR(30),
FOREIGN KEY (id_epoka) REFERENCES geo.GeoEpoka(id_epoka)
);
#wypelnianie tabel

INSERT INTO geo.GeoEon VALUES('1','FANEROZOIK');
INSERT INTO geo.GeoEra VALUES('1','1','Paleozoik');
INSERT INTO geo.GeoEra VALUES('2','1','Mezozoik');
INSERT INTO geo.GeoEra VALUES('3','1','Kenzoik');

#paleozoik
INSERT INTO geo.GeoOkres VALUES('1','1','Kambr');
INSERT INTO geo.GeoOkres VALUES('2','1','ordowik');
INSERT INTO geo.GeoOkres VALUES('3','1','sylur');
INSERT INTO geo.GeoOkres VALUES('4','1','dewon');
INSERT INTO geo.GeoOkres VALUES('5','1','karbon');
INSERT INTO geo.GeoOkres VALUES('6','1','perm');
#mezozoik
INSERT INTO geo.GeoOkres VALUES('7','2','trias');
INSERT INTO geo.GeoOkres VALUES('8','2','jura');
INSERT INTO geo.GeoOkres VALUES('9','2','kreda');
#kenozoik
INSERT INTO geo.GeoOkres VALUES('10','3','paleogen');
INSERT INTO geo.GeoOkres VALUES('11','3','neogen');
INSERT INTO geo.GeoOkres VALUES('12','3','czwartorzęd');
#paleozoik
INSERT INTO geo.GeoEpoka VALUES('1','1','Terenew');
INSERT INTO geo.GeoEpoka VALUES('2','1','oddzial 2');
INSERT INTO geo.GeoEpoka VALUES('3','1','miaoling');
INSERT INTO geo.GeoEpoka VALUES('4','1','furong');
INSERT INTO geo.GeoEpoka VALUES('5','2','ordowik wczesny');
INSERT INTO geo.GeoEpoka VALUES('6','2','ordowik srodkowy');
INSERT INTO geo.GeoEpoka VALUES('7','2','ordowik późny');
INSERT INTO geo.GeoEpoka VALUES('8','3','landower');
INSERT INTO geo.GeoEpoka VALUES('9','3','wenlok');
INSERT INTO geo.GeoEpoka VALUES('10','3','ludlow');
INSERT INTO geo.GeoEpoka VALUES('11','3','przydol');
INSERT INTO geo.GeoEpoka VALUES('12','4','wczesny dewon');
INSERT INTO geo.GeoEpoka VALUES('13','4','srodkowy dewon');
INSERT INTO geo.GeoEpoka VALUES('14','4','pozny dewon');
INSERT INTO geo.GeoEpoka VALUES('15','5','missisip');
INSERT INTO geo.GeoEpoka VALUES('16','5','pensylwan');
INSERT INTO geo.GeoEpoka VALUES('17','6','cisural');
INSERT INTO geo.GeoEpoka VALUES('18','6','gwadalup');
INSERT INTO geo.GeoEpoka VALUES('19','6','loping');
#mezozoik
INSERT INTO geo.GeoEpoka VALUES('20','7','wczesny trias');
INSERT INTO geo.GeoEpoka VALUES('21','7','srodkowy trias');
INSERT INTO geo.GeoEpoka VALUES('22','7','pozny trias');
INSERT INTO geo.GeoEpoka VALUES('23','8','wczesna jura');
INSERT INTO geo.GeoEpoka VALUES('24','8','srodkowa jura');
INSERT INTO geo.GeoEpoka VALUES('25','8','pozna jura');
INSERT INTO geo.GeoEpoka VALUES('26','9','swczesna kreda');
INSERT INTO geo.GeoEpoka VALUES('27','9','pozna kreda');
#kenozoik
INSERT INTO geo.GeoEpoka VALUES('28','10','paleocen');
INSERT INTO geo.GeoEpoka VALUES('29','10','eocen');
INSERT INTO geo.GeoEpoka VALUES('30','10','oligocen');
INSERT INTO geo.GeoEpoka VALUES('31','11','miocen');
INSERT INTO geo.GeoEpoka VALUES('32','11','pliocen');
INSERT INTO geo.GeoEpoka VALUES('33','12','plejstocen');
INSERT INTO geo.GeoEpoka VALUES('34','12','holocen');
#paleozoik
INSERT INTO geo.GeoPietro VALUES ('1','1','fortun');
INSERT INTO geo.GeoPietro VALUES ('2','1','pietro 2');
INSERT INTO geo.GeoPietro VALUES ('3','2','pietro 3');
INSERT INTO geo.GeoPietro VALUES ('4','2','pietro 4');
INSERT INTO geo.GeoPietro VALUES ('5','3','wuliuan');
INSERT INTO geo.GeoPietro VALUES ('6','3','drum');
INSERT INTO geo.GeoPietro VALUES ('7','3','guzang');
INSERT INTO geo.GeoPietro VALUES ('8','4','paib');
INSERT INTO geo.GeoPietro VALUES ('9','4','dziangszan');
INSERT INTO geo.GeoPietro VALUES ('10','4','pietro 10');
INSERT INTO geo.GeoPietro VALUES ('11','5','tremadok');
INSERT INTO geo.GeoPietro VALUES ('12','5','flo');
INSERT INTO geo.GeoPietro VALUES ('13','6','daping');
INSERT INTO geo.GeoPietro VALUES ('14','6','darriwil');
INSERT INTO geo.GeoPietro VALUES ('15','7','sandb');
INSERT INTO geo.GeoPietro VALUES ('16','7','kat');
INSERT INTO geo.GeoPietro VALUES ('17','7','hirnant');
INSERT INTO geo.GeoPietro VALUES ('18','8','ruddan');
INSERT INTO geo.GeoPietro VALUES ('19','8','aeron');
INSERT INTO geo.GeoPietro VALUES ('20','8','telicz');
INSERT INTO geo.GeoPietro VALUES ('21','9','szejnwud');
INSERT INTO geo.GeoPietro VALUES ('22','9','homer');
INSERT INTO geo.GeoPietro VALUES ('23','10','gorst');
INSERT INTO geo.GeoPietro VALUES ('24','10','ludford');
INSERT INTO geo.GeoPietro VALUES ('25','11','');
INSERT INTO geo.GeoPietro VALUES ('26','12','lochkow');
INSERT INTO geo.GeoPietro VALUES ('27','12','prag');
INSERT INTO geo.GeoPietro VALUES ('28','12','ems');
INSERT INTO geo.GeoPietro VALUES ('29','13','eifel');
INSERT INTO geo.GeoPietro VALUES ('30','13','zywet');
INSERT INTO geo.GeoPietro VALUES ('31','14','fran');
INSERT INTO geo.GeoPietro VALUES ('32','14','famen');
INSERT INTO geo.GeoPietro VALUES ('33','15','turnej');
INSERT INTO geo.GeoPietro VALUES ('34','15','wizen');
INSERT INTO geo.GeoPietro VALUES ('35','15','serpuchow');
INSERT INTO geo.GeoPietro VALUES ('36','16','baszkir');
INSERT INTO geo.GeoPietro VALUES ('37','16','moskow');
INSERT INTO geo.GeoPietro VALUES ('38','16','kasimow');
INSERT INTO geo.GeoPietro VALUES ('39','16','gzel');
INSERT INTO geo.GeoPietro VALUES ('40','17','assel');
INSERT INTO geo.GeoPietro VALUES ('41','17','sakmar');
INSERT INTO geo.GeoPietro VALUES ('42','17','artinsk');
INSERT INTO geo.GeoPietro VALUES ('43','17','kungur');
INSERT INTO geo.GeoPietro VALUES ('44','18','road');
INSERT INTO geo.GeoPietro VALUES ('45','18','word');
INSERT INTO geo.GeoPietro VALUES ('46','18','kapitan');
INSERT INTO geo.GeoPietro VALUES ('47','19','wucziaping');
INSERT INTO geo.GeoPietro VALUES ('48','19','czangsing');
#mezozoik
INSERT INTO geo.GeoPietro VALUES ('49','20','ind');
INSERT INTO geo.GeoPietro VALUES ('50','20','olenek');
INSERT INTO geo.GeoPietro VALUES ('51','21','anizyk');
INSERT INTO geo.GeoPietro VALUES ('52','21','ladyn');
INSERT INTO geo.GeoPietro VALUES ('53','22','karnik');
INSERT INTO geo.GeoPietro VALUES ('54','22','noryk');
INSERT INTO geo.GeoPietro VALUES ('55','22','retyk');
INSERT INTO geo.GeoPietro VALUES ('56','23','hettang');
INSERT INTO geo.GeoPietro VALUES ('57','23','synemur');
INSERT INTO geo.GeoPietro VALUES ('58','23','pliensbach');
INSERT INTO geo.GeoPietro VALUES ('59','23','toark');
INSERT INTO geo.GeoPietro VALUES ('60','24','aalen');
INSERT INTO geo.GeoPietro VALUES ('61','24','bajos');
INSERT INTO geo.GeoPietro VALUES ('62','24','baton');
INSERT INTO geo.GeoPietro VALUES ('63','24','kelowej');
INSERT INTO geo.GeoPietro VALUES ('64','25','oksford');
INSERT INTO geo.GeoPietro VALUES ('65','25','kimeryd');
INSERT INTO geo.GeoPietro VALUES ('66','25','tyton');
INSERT INTO geo.GeoPietro VALUES ('67','26','berrias');
INSERT INTO geo.GeoPietro VALUES ('68','26','walanzyn');
INSERT INTO geo.GeoPietro VALUES ('69','26','hoteryw');
INSERT INTO geo.GeoPietro VALUES ('70','26','barrem');
INSERT INTO geo.GeoPietro VALUES ('71','26','apt');
INSERT INTO geo.GeoPietro VALUES ('72','26','alb');
INSERT INTO geo.GeoPietro VALUES ('73','27','cenoman');
INSERT INTO geo.GeoPietro VALUES ('74','27','turon');
INSERT INTO geo.GeoPietro VALUES ('75','27','koniak');
INSERT INTO geo.GeoPietro VALUES ('76','27','santon');
INSERT INTO geo.GeoPietro VALUES ('77','27','kampan');
INSERT INTO geo.GeoPietro VALUES ('78','27','mastrycht');
#kenozoik
INSERT INTO geo.GeoPietro VALUES ('79','28','dan');
INSERT INTO geo.GeoPietro VALUES ('80','28','zeland');
INSERT INTO geo.GeoPietro VALUES ('81','28','tanet');
INSERT INTO geo.GeoPietro VALUES ('82','28','iprez');
INSERT INTO geo.GeoPietro VALUES ('83','29','lutet');
INSERT INTO geo.GeoPietro VALUES ('84','29','barton');
INSERT INTO geo.GeoPietro VALUES ('85','29','priabon');
INSERT INTO geo.GeoPietro VALUES ('86','30','rupel');
INSERT INTO geo.GeoPietro VALUES ('87','30','szat');
INSERT INTO geo.GeoPietro VALUES ('88','31','akwitan');
INSERT INTO geo.GeoPietro VALUES ('89','31','burdygal');
INSERT INTO geo.GeoPietro VALUES ('90','31','lang');
INSERT INTO geo.GeoPietro VALUES ('91','31','serrawal');
INSERT INTO geo.GeoPietro VALUES ('92','31','torton');
INSERT INTO geo.GeoPietro VALUES ('93','31','messyn');
INSERT INTO geo.GeoPietro VALUES ('94','32','zankl');
INSERT INTO geo.GeoPietro VALUES ('95','32','piacent');
INSERT INTO geo.GeoPietro VALUES ('96','33','gelas');
INSERT INTO geo.GeoPietro VALUES ('97','33','kalabr');
INSERT INTO geo.GeoPietro VALUES ('98','33','chiban');
INSERT INTO geo.GeoPietro VALUES ('99','33','pozny');
INSERT INTO geo.GeoPietro VALUES ('100','34','grenland');
INSERT INTO geo.GeoPietro VALUES ('101','34','northgrip');
INSERT INTO geo.GeoPietro VALUES ('102','34','megalaj');

#tworzenie tabeli zdenormalizowanej
CREATE TABLE geo.GeoTabela AS (SELECT * FROM geo.GeoPietro NATURAL JOIN geo.GeoEpoka NATURAL
JOIN geo.GeoOkres NATURAL JOIN geo.GeoEra NATURAL JOIN geo.GeoEon );
#ustawienie ID_pietro jako PK
ALTER TABLE geo.GeoTabela ADD PRIMARY KEY(ID_pietro);

CREATE TABLE geo.dziesiec(
	liczba INT NOT NULL
);
#stworzenie tabeli wypelnionej 0-9
INSERT INTO geo.dziesiec(liczba) VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);
Select * from geo.dziesiec;

CREATE TABLE geo.Milion(liczba int);

INSERT INTO geo.Milion SELECT
    a1.liczba +10 * a2.liczba + 100 * a3.liczba + 1000 *a4.liczba + 10000 * a5.liczba + 10000 *a6.liczba  AS liczba
FROM geo.dziesiec a1, geo.dziesiec a2, geo.dziesiec a3, geo.dziesiec a4, geo.dziesiec a5, geo.dziesiec a6;


#1 ZL
SELECT COUNT(*) FROM geo.Milion
INNER JOIN geo.GeoTabela
ON (mod(geo.Milion.liczba,102)=(geo.GeoTabela.id_pietro));

#2 ZL
SELECT COUNT(*) FROM geo.Milion
INNER JOIN geo.GeoPietro ON (mod(Milion.liczba,102)=geo.GeoPietro.id_pietro)
NATURAL JOIN geo.GeoEpoka
NATURAL JOIN geo.GeoOkres
NATURAL JOIN geo.GeoEra
NATURAL JOIN geo.GeoEon;
#3 ZL
SELECT COUNT(*) FROM geo.Milion WHERE mod(geo.Milion.liczba,102)=
(SELECT id_pietro FROM geo.GeoTabela WHERE mod(Milion.liczba,102)=(id_pietro));

#4 zl
SELECT COUNT(*) FROM geo.Milion WHERE mod(geo.Milion.liczba,102) IN
(SELECT GeoPietro.id_pietro FROM geo.GeoPietro
NATURAL JOIN geo.GeoEpoka
NATURAL JOIN geo.GeoOkres
NATURAL JOIN geo.GeoEra
NATURAL JOIN geo.GeoEon);
#dodawanie indexow
CREATE INDEX ind_geoeon_eon ON geo.GeoEon(id_eon);
CREATE INDEX ind_geoera_era ON geo.GeoEra(id_era);
CREATE INDEX ind_geoera_eon ON geo.GeoEra(id_eon);
CREATE INDEX ind_geookres_okres ON geo.GeoOkres(id_okres);
CREATE INDEX ind_geookres_era ON geo.GeoOkres(id_era);
CREATE INDEX ind_geoepoka_epoka ON geo.GeoEpoka(id_epoka);
CREATE INDEX ind_geoepoka_okres ON geo.GeoEpoka(id_okres);
CREATE INDEX ind_geopietro_pietro ON geo.GeoPietro(id_pietro);
CREATE INDEX ind_geopietro_epoka ON geo.GeoPietro(id_epoka);
CREATE INDEX ind_tabelastr_pietro ON geo.GeoTabela(id_pietro);
CREATE INDEX ind_tabelastr_epoka ON geo.GeoTabela(id_epoka);
CREATE INDEX ind_tabelastr_okres ON geo.GeoTabela(id_okres);
CREATE INDEX indtabelastr_era ON geo.GeoTabela(id_era);
CREATE INDEX ind_tabelastr_eon ON geo.GeoTabela(id_eon);
CREATE INDEX ind_milion_liczba ON geo.milion(liczba);

