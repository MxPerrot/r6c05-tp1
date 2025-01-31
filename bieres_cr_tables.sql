DROP SCHEMA IF EXISTS bieres CASCADE;

CREATE SCHEMA bieres;
SET SCHEMA 'bieres';

/* Creation de tables */
create table bieres.buveur
(
		idbuveur integer,
		nomb varchar(50) 	NOT NULL,
		prenomb varchar(50)	NOT NULL,
		constraint buveur_pk primary key(idbuveur)
);

create table bieres.biere
(
		idbiere integer,
		nombiere varchar(50) 	NOT NULL,
		degre integer			NOT NULL,
		typebiere varchar(50)	NOT NULL,
		constraint biere_pk	primary key(idbiere)
);

create table bieres.bar
(
		idbar integer,
		nombar varchar(50)		NOT NULL,
		villebar varchar(50)	NOT NULL,
		constraint bar_pk primary key(idbar)
);

create table bieres.frequenter
(
		idbuveur integer,
		idbar integer,
		constraint freq_pk primary key(idbuveur, idbar),
		constraint freq_buveur_key foreign key(idbuveur) references bieres.buveur(idbuveur),
		constraint  freq_bar_key foreign key(idbar) references bieres.bar(idbar)
);

create table bieres.aimer
(
		idbuveur integer,
		idbiere integer,
		constraint aim_pk primary key(idbuveur, idbiere),
		constraint aim_buveur_key foreign key(idbuveur) references bieres.buveur(idbuveur),
		constraint aim_biere_key foreign key(idbiere) references bieres.biere(idbiere)
);

create table bieres.servir
(
		idbar integer,
		idbiere integer,
		constraint serv_ok primary key(idbiere, idbar),
		constraint ser_bar_key foreign key(idbar)  references bieres.bar(idbar),
		constraint ser_biere_key foreign key(idbiere) references bieres.biere(idbiere)
);

/* Remplissage des tables */
insert into buveur(idbuveur, nomb, prenomb) values(1,'Eastwood', 'Clint');
insert into buveur(idbuveur, nomb, prenomb) values(2, 'Abitbol', 'Georges');
insert into buveur(idbuveur, nomb, prenomb) values(3, 'DeNice', 'Brice');
insert into buveur(idbuveur, nomb, prenomb) values(4, 'Bricot', 'Juda');
insert into buveur(idbuveur, nomb, prenomb) values(5, 'Meurdesoif', 'Jean');
insert into buveur(idbuveur, nomb, prenomb) values(6, 'Kollyck', 'Al');
insert into buveur(idbuveur, nomb, prenomb) values(7, 'test', 'maxperrot');

insert into biere(idbiere,nombiere,degre,typebiere) values(1, 'kronembourg', 4, 'pils');
insert into biere(idbiere,nombiere,degre,typebiere) values(2, 'pilsener', 3, 'pils');
insert into biere(idbiere,nombiere,degre,typebiere) values(3, 'heinecken', 4, 'pils');
insert into biere(idbiere,nombiere,degre,typebiere) values(4, 'leffe', 6, 'triple');
insert into biere(idbiere,nombiere,degre,typebiere) values(5, 'smirnoff', 4, 'arromatisee');
insert into biere(idbiere,nombiere,degre,typebiere) values(6, 'dremmwel', 6,' al');


insert into bar(idbar,nombar,villebar) values(2, 'Bar des sports', 'Lannion');
insert into bar(idbar,nombar,villebar) values(3, 'Chez momo', 'Morlaix');
insert into bar(idbar,nombar,villebar) values(4, 'Bar du bon coin', 'Morlaix');
insert into bar(idbar,nombar,villebar) values(1, 'Anti soif', 'Lannion');
insert into bar(idbar,nombar,villebar) values(6, 'Chti canon', 'Tregastel');
insert into bar(idbar,nombar,villebar) values(5, 'Bar Aine', 'Lannion');

insert into frequenter(idbuveur, idbar) values(1, 1); 
insert into frequenter(idbuveur, idbar) values(1, 2); 
insert into frequenter(idbuveur, idbar) values(1, 3);
insert into frequenter(idbuveur, idbar) values(1, 4);
insert into frequenter(idbuveur, idbar) values(1, 5); 
insert into frequenter(idbuveur, idbar) values(1, 6);   
insert into frequenter(idbuveur, idbar) values(2, 2); 
insert into frequenter(idbuveur, idbar) values(4, 1); 
insert into frequenter(idbuveur, idbar) values(4, 4); 
insert into frequenter(idbuveur, idbar) values(5, 1); 
insert into frequenter(idbuveur, idbar) values(5, 2); 
insert into frequenter(idbuveur, idbar) values(5, 3); 
insert into frequenter(idbuveur, idbar) values(5, 4); 
insert into frequenter(idbuveur, idbar) values(5, 5); 
insert into frequenter(idbuveur, idbar) values(6, 2);
insert into frequenter(idbuveur, idbar) values(7, 5); 
insert into frequenter(idbuveur, idbar) values(7, 2);

insert into servir(idbar, idbiere) values(1, 1);
insert into servir(idbar, idbiere) values(1, 3);
insert into servir(idbar, idbiere) values(1, 4);
insert into servir(idbar, idbiere) values(2, 1);
insert into servir(idbar, idbiere) values(4, 3);
insert into servir(idbar, idbiere) values(5, 4);
insert into servir(idbar, idbiere) values(3, 1);
insert into servir(idbar, idbiere) values(3, 3);
insert into servir(idbar, idbiere) values(3, 5);
insert into servir(idbar, idbiere) values(5, 5);
insert into servir(idbar, idbiere) values(4, 5);
insert into servir(idbar, idbiere) values(6, 5);
insert into servir(idbar, idbiere) values(4, 1);
insert into servir(idbar, idbiere) values(4, 4);
insert into servir(idbar, idbiere) values(4, 6);


insert into aimer(idbuveur, idbiere) values(1, 2);
insert into aimer(idbuveur, idbiere) values(1, 3);
insert into aimer(idbuveur, idbiere) values(2, 3);
insert into aimer(idbuveur, idbiere) values(3, 1);
insert into aimer(idbuveur, idbiere) values(3, 2);
insert into aimer(idbuveur, idbiere) values(3, 3);
insert into aimer(idbuveur, idbiere) values(3, 4);
insert into aimer(idbuveur, idbiere) values(3, 5);
insert into aimer(idbuveur, idbiere) values(3, 6);
insert into aimer(idbuveur, idbiere) values(4, 1);
insert into aimer(idbuveur, idbiere) values(6, 1);
insert into aimer(idbuveur, idbiere) values(6, 3);
insert into aimer(idbuveur, idbiere) values(6, 5);
insert into aimer(idbuveur, idbiere) values(7, 2);
insert into aimer(idbuveur, idbiere) values(7, 4);
insert into aimer(idbuveur, idbiere) values(7, 5);

-- EXERCICE 1 
ALTER TABLE bieres.buveur
ADD COLUMN login VARCHAR(50) UNIQUE;

-- Mettre à jour les login des buveurs avec des valeurs uniques (par exemple, les prénoms)
UPDATE bieres.buveur
SET login = prenomb;

-- Assurer que login est bien une clé candidate
ALTER TABLE bieres.buveur
DROP CONSTRAINT IF EXISTS buveur_login_key;

ALTER TABLE bieres.buveur
ADD CONSTRAINT buveur_login_key UNIQUE (login);

-- Créer vue mes infos
CREATE VIEW bieres.mes_infos AS
SELECT idbuveur, nomb, prenomb, login
FROM bieres.buveur
WHERE login = CURRENT_USER;

-- Créer vue mes bieres
CREATE VIEW bieres.mes_bieres AS
SELECT bieres.biere.idbiere, bieres.biere.nombiere, bieres.biere.degre, bieres.biere.typebiere
FROM bieres.biere
JOIN bieres.aimer ON bieres.biere.idbiere = bieres.aimer.idbiere
JOIN bieres.buveur ON bieres.aimer.idbuveur = bieres.buveur.idbuveur
WHERE bieres.buveur.login = CURRENT_USER;

-- Attribuer droits (test pour public)
-- GRANT SELECT ON bieres.mes_infos TO PUBLIC;
-- GRANT SELECT ON bieres.mes_bieres TO PUBLIC;

SELECT * FROM bieres.mes_infos;
SELECT * FROM bieres.mes_bieres;

-- Nouvelle vue pour remplacer la table fréquenter
CREATE VIEW bieres.new_frequenter AS
SELECT b.idbuveur, bar.idbar
FROM bieres.buveur b
JOIN bieres.aimer aimer ON b.idbuveur = aimer.idbuveur
JOIN bieres.servir servir ON aimer.idbiere = servir.idbiere
JOIN bieres.bar bar ON servir.idbar = bar.idbar;

SELECT * FROM bieres.new_frequenter;

-- EXERCICE 3 Trigger pour modification de degrealcool
CREATE OR REPLACE FUNCTION modifmaxdegrealcool() RETURNS TRIGGER AS $test$
	BEGIN
		EXCEPT 'Vous ne pouvez pas modifier le degré d''alcool d''une bière de plus d''1 degré à la fois.';
	END;
$test$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER degrealcoolmax
BEFORE INSERT OR UPDATE
ON bieres FOR EACH ROW
WHEN (ABS(NEW.degrealcool - OLD.degrealcool) > 1)
EXECUTE maxmodifdegrealcool;

