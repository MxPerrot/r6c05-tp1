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
