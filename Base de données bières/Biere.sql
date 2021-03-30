drop table BiereServie ;
drop table Aime ;
drop table Biere ;
drop table Amateur ;
drop table Bar ;

create table Bar (
  code integer primary key,
  nom varchar(30) not null,
  adresse varchar(100) not null
) ;

create table Amateur (
  code integer primary key,
  prenom varchar(30) not null,
  nom varchar(30) not null,
  barFavori integer not null references Bar
) ;

create table Biere (
  numero integer primary key,
  designation varchar(30) unique not null
) ;

create table Aime (
  amateur integer references Amateur,
  biere integer references Biere,
  note integer check (note >=1 and note <=10),
  primary key(amateur, biere)
) ;

create table BiereServie (
  bar integer references Bar,
  biere integer references Biere,
  prix  float not null,
  primary key(bar,biere)
) ;

insert into Bar(code, nom, adresse) values
  (1,'Bar des anges', '3 rue des poissons'),
  (2, 'Baratin' , '6 rue des lilas'),
  (3, 'Bar parallele', '5 rue corot'),
  (4 , 'Bar a mine', '3 avenue Foch') ;

insert into Amateur(code,prenom, nom,barFavori) values
  (1, 'Paul', 'Simon', 1);
insert into Amateur  values (2, 'Bruce', 'Springsteen', 4);
insert into Amateur values (3, 'Johnny', 'Cash', 2);
insert into Amateur values (4, 'Harvey', 'Keitel', 4);
insert into Amateur values (5, 'Matt', 'Damon', 1) ;
insert into Amateur values (6, 'Harper', 'Simon', 2);
insert into Amateur values (7, 'Ben', 'Simon', 3);

insert into Biere (numero, designation) values
  (1, 'Troll');
insert into Biere values (2,'Hommelbier');
insert into Biere values (3, 'Chti');
insert into Biere values (4, 'Maredsous');
insert into Biere values (5, 'Grimbergen') ;
insert into Biere values (6, 'Karmeliet');
insert into Biere values (7, 'Choulette');
insert into Biere values (8, 'Rince Cochon');

insert into Aime values (1, 3, 6);
insert into Aime values (1, 4, 5);
insert into Aime values (2, 1, 8);
insert into Aime values (2, 4, 9);
insert into Aime values (2, 2, 4);
insert into Aime values (3, 1, 5);
insert into Aime values (3, 2, 7);
insert into Aime values (3, 3, 6);
insert into Aime values (3, 4, 8);
insert into Aime values (3, 5, 2);
insert into Aime values (4, 3, 6);
insert into Aime values (4, 4, 7);
insert into Aime values (6, 3, 6);
insert into Aime values (6, 5, 7);
insert into Aime values (7, 1, 10);
insert into aime values (7, 4, 8);

insert into BiereServie(bar,biere, prix) values (1, 2, 4.5);
insert into BiereServie values (1, 3, 6);
insert into BiereServie values (1, 5, 3.7);
insert into BiereServie values (2, 1, 4.5);
insert into BiereServie values (2, 2, 3.5);
insert into BiereServie values (3, 4, 5);
insert into BiereServie values (3, 1, 4.5);
insert into BiereServie values (3, 3, 3.7);
insert into BiereServie values (2, 5, 3);
insert into BiereServie values (4, 1, 3.8);
insert into BiereServie values (4, 3, 3.9);
insert into BiereServie values (4, 2, 3.9);
insert into BiereServie values (4, 4, 5.5);
insert into biereservie values (3, 2, 4.0);
insert into BiereServie values (4, 5, 3.8) ;
insert into BiereServie values (2, 7, 4.75);
insert into BiereServie values (3, 7, 4.5);
  

