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

-- Attribuer tous les droits à tous les utilisateurs
GRANT USAGE, CREATE ON SCHEMA bieres TO PUBLIC;
ALTER DEFAULT PRIVILEGES IN SCHEMA bieres GRANT ALL ON TABLES TO PUBLIC;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA bieres TO PUBLIC;

-- EXERCICE 1: Vues et confidentialité des données

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


SELECT * FROM bieres.mes_infos;
SELECT * FROM bieres.mes_bieres;

-- EXERCICE 2: Indépendance logique grâce aux vues

-- Nouvelle vue pour remplacer la table fréquenter
CREATE VIEW bieres.new_frequenter AS
SELECT b.idbuveur, bar.idbar
FROM bieres.buveur b
JOIN bieres.aimer aimer ON b.idbuveur = aimer.idbuveur
JOIN bieres.servir servir ON aimer.idbiere = servir.idbiere
JOIN bieres.bar bar ON servir.idbar = bar.idbar;

SELECT * FROM bieres.new_frequenter;

-- EXERCICE 3: Trigger pour modification de degrealcool

-- Création de la fonction pour le trigger
CREATE OR REPLACE FUNCTION update_degre_alcool()
RETURNS TRIGGER AS $$
DECLARE
    user_id INTEGER;
BEGIN
    -- Récupérer l'id du buveur correspondant à l'utilisateur actuel
    SELECT idbuveur INTO user_id FROM bieres.buveur WHERE login = CURRENT_USER;
    
    -- Vérifier si l'utilisateur existe dans la table buveur
    IF user_id IS NULL THEN
        RAISE EXCEPTION 'L''utilisateur n''est pas enregistré dans la table buveur.';
    END IF;

    -- Vérifier que l'utilisateur aime la bière qu'il essaie de modifier
    IF NOT EXISTS (
        SELECT 1 FROM bieres.aimer
        WHERE idbuveur = user_id AND idbiere = NEW.idbiere
    ) THEN
        RAISE EXCEPTION 'Vous ne pouvez modifier le degré d''alcool que des bières que vous aimez.';
    END IF;

    -- Vérifier que la modification du degré d'alcool ne dépasse pas ±1°
    IF ABS(NEW.degre - OLD.degre) > 1 THEN
        RAISE EXCEPTION 'Vous ne pouvez modifier le degré d''alcool que de ±1° à la fois.';
    END IF;

    -- Vérifier que le nouveau degré d'alcool n'est pas inférieur à 0
    IF NEW.degre < 0 THEN
        RAISE EXCEPTION 'Le degré d''alcool ne peut pas être inférieur à 0.';
    END IF;

    -- Si toutes les conditions sont respectées, accepter la modification
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Création d’un trigger pour appeler cette fonction en cas d’update sur bieres.biere
CREATE TRIGGER update_degre_alcool_restriction
BEFORE UPDATE ON bieres.biere
FOR EACH ROW
WHEN (OLD.degre IS DISTINCT FROM NEW.degre)
EXECUTE FUNCTION update_degre_alcool();

-- Exercice 4

-- Partie 1 création des tables
CREATE TABLE buveurs_amateurs (
    idbuveur numeric(3) PRIMARY KEY,
    login varchar(20) NOT NULL,
    nomb varchar(30) NOT NULL,
    prenomb varchar(30) NOT NULL
);

CREATE TABLE buveurs_pros (
    idbuveur numeric(3) PRIMARY KEY,
    login varchar(20) NOT NULL,
    nomb varchar(30) NOT NULL,
    prenomb varchar(30) NOT NULL,
    idbar_prefere numeric(3) NOT NULL
);

CREATE VIEW toutbuveur (idbuveur, login, nomb, prenomb, idbar_prefere, nature)
AS 
SELECT idbuveur, login, nomb, prenomb, idbar_prefere, 'P'
FROM buveurs_pros
UNION
SELECT idbuveur, login, nomb, prenomb, NULL, 'A'
FROM buveurs_amateurs;

-- Partie 2 Implémentation du Trigger INSTEAD OF INSERT
CREATE OR REPLACE FUNCTION insert_toutbuveur()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.nature NOT IN ('P', 'A') THEN
        RAISE EXCEPTION 'Valeur incorrecte pour nature. Utiliser ''P'' pour professionnel ou ''A'' pour amateur.';
    END IF;
        IF NEW.nature = 'P' THEN
        IF NEW.idbar_prefere IS NULL THEN
            RAISE EXCEPTION 'Les buveurs professionnels doivent avoir un bar préféré (idbar_prefere non NULL).';
        END IF;
        
        INSERT INTO buveurs_pros (idbuveur, login, nomb, prenomb, idbar_prefere)
        VALUES (NEW.idbuveur, NEW.login, NEW.nomb, NEW.prenomb, NEW.idbar_prefere);
        
    ELSIF NEW.nature = 'A' THEN
        IF NEW.idbar_prefere IS NOT NULL THEN
            RAISE EXCEPTION 'Les buveurs amateurs ne doivent pas avoir de bar préféré (idbar_prefere doit être NULL).';
        END IF;
        
        INSERT INTO buveurs_amateurs (idbuveur, login, nomb, prenomb)
        VALUES (NEW.idbuveur, NEW.login, NEW.nomb, NEW.prenomb);
    END IF;

	INSERT INTO buveur (idbuveur, login, nomb, prenomb)
	VALUES (NEW.idbuveur, NEW.login, NEW.nomb, NEW.prenomb);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_insert_toutbuveur
INSTEAD OF INSERT ON toutbuveur
FOR EACH ROW
EXECUTE FUNCTION insert_toutbuveur();

-- INSERT INTO toutbuveur VALUES(100, 'xxx', 'Ture', 'Tobby', 1, 'P'); -- Fonctionne
-- INSERT INTO toutbuveur VALUES(101, 'yyy', 'Dupond', 'Dédé', null, 'A'); -- Fonctionne
-- INSERT INTO toutbuveur VALUES(102, 'xxx', 'Ture', 'Tobby', 1, 'P'); -- Renvoit une erreur : login 'xxx' existe déjà
-- INSERT INTO toutbuveur VALUES(102, 'xxx', 'Ture', 'Tobby', 1, 'X'); -- Renvoit une erreur : 'X' n'est pas une valeur valable 
-- INSERT INTO toutbuveur VALUES(103, 'xxx', 'Ture', 'Tobby', null, 'P'); -- Renvoit une erreur : ne peut pas avoir null
-- INSERT INTO toutbuveur VALUES(104, 'yyy', 'Dupond', 'Dédé', 1, 'A'); -- Renvoit une erreur : doit avoir null, pas 1


CREATE TABLE audit_biere (
    idbiere VARCHAR(10), -- Peut être 'ABS' si l'id est absent
    action VARCHAR(3) NOT NULL, -- 'INS', 'DES', 'AUG', 'DIM'
    utilisateur VARCHAR(50) NOT NULL,
    date_action TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION log_biere_modifications()
RETURNS TRIGGER AS $$
DECLARE
    ancienne_valeur INTEGER;
    nouvelle_valeur INTEGER;
BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO audit_biere (idbiere, action, utilisateur, date_action)
        VALUES (OLD.idbiere, 'DES', CURRENT_USER, CURRENT_TIMESTAMP);
    
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO audit_biere (idbiere, action, utilisateur, date_action)
        VALUES (COALESCE(NEW.idbiere::TEXT, 'ABS'), 'INS', CURRENT_USER, CURRENT_TIMESTAMP);
    
    ELSIF TG_OP = 'UPDATE' THEN
        IF OLD.degre <> NEW.degre THEN
            ancienne_valeur := OLD.degre;
            nouvelle_valeur := NEW.degre;
            
            INSERT INTO audit_biere (idbiere, action, utilisateur, date_action)
            VALUES (
                OLD.idbiere,
                CASE 
                    WHEN nouvelle_valeur > ancienne_valeur THEN 'AUG'
                    ELSE 'DIM'
                END,
                CURRENT_USER,
                CURRENT_TIMESTAMP
            );
        END IF;
    END IF;

    RETURN NULL; 
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_log_biere
AFTER INSERT OR DELETE OR UPDATE ON biere
FOR EACH ROW
EXECUTE FUNCTION log_biere_modifications();

-- TEST

-- Ajout d'une bière
INSERT INTO biere (idbiere, nombiere, degre, typebiere) 
VALUES (10, 'Guinness', 5, 'Stout');

-- Ajout d'une bière sans id --> ERREUR
INSERT INTO biere (idbiere, nombiere, degre, typebiere) 
VALUES (NULL, 'Bière Mystère', 6, 'Blonde');

-- Augmentation du degré d'alcool de la bière 2 (aimée par utilisateur 'maxperrot')
UPDATE biere SET degre = 7 WHERE idbiere = 2; 

-- Diminution  du degré d'alcool de la bière 10 
UPDATE biere SET degre = 6 WHERE idbiere = 2;

DELETE FROM biere WHERE idbiere = 10;
SELECT * FROM audit_biere;