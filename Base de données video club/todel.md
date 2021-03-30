CREATE TABLE categorie (
  ncat int not null,
  libelle varchar(40),
  PRIMARY KEY (ncat)
);

CREATE TABLE bateau (
  nbat int NOT NULL,
  nombat varchar(40) NOT NULL default '',
  sponsor varchar(40) NOT NULL default '',
  ncat int references categorie,
  PRIMARY KEY  (nbat)
) ;

CREATE TABLE competition (
  ncomp int NOT NULL,
  nomcomp varchar(40) NOT NULL default '',
  datcomp date NOT NULL ,
  gaincomp int,
  PRIMARY KEY  (ncomp)
) ;


CREATE TABLE resultat (
  nbat int NOT NULL references bateau,
  ncomp int NOT NULL references competition,
  rang int NOT NULL ,
  PRIMARY KEY  (nbat,ncomp)
) ;



CREATE TABLE inscription (
  nbat int NOT NULL default '0',
  ncomp int NOT NULL default '0',
  PRIMARY KEY  (nbat,ncomp)
) ;