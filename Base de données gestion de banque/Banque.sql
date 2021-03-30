create table agence (
  nag integer primary key,
  nomag char (25),
  villeag char (25));

insert into agence values (1, 'LCL nationale', 'Lille');
insert into agence values (2, 'Credit agricole', 'Lille');
insert into agence values (3, 'Credit Mutuel', 'Marcq');
insert into agence values (4, 'BNPP', 'Marcq');
insert into agence values (5, 'BNPP', 'Marseille');
insert into agence values (6, 'CASDEN', 'Lille');
create table client (
  ncli integer primary key,
  nomcli char (25),
  prenomcli char(25),
  villecli char (25));

insert into client values (1, 'Dupont', 'Pierre', 'Lille');
insert into client values (2, 'Cohen', 'Sarah', 'Lille');
insert into client values (3, 'Blanc', 'Marie', 'Lille');
insert into client values (4, 'Cohen', 'David', 'Marcq');
insert into client values (5, 'Pasquale', 'Jean', 'Marseille');
insert into client values (6, 'Nguyen', 'Theo', 'Arras');
insert into client values (7, 'BenMati', 'Yazid', 'Marseille');
insert into client values (8, 'Delalune', 'Jean', 'Marcq');
insert into client values (9, 'BenMati', 'Ines', 'Marseille');
insert into client values (10, 'Dupont', 'Pierre', 'Marseille');
insert into client values (11, 'Cohen', 'Sarah', 'Lille');
create table compte (
  ncompte integer,
  nag integer references agence,
  solde float,
  primary key (ncompte, nag)
);

insert into compte values (1, 1, 11251);
insert into compte values (2, 1, 1251);
insert into compte values (3, 1, 3250);
insert into compte values (1, 2, 51251);
insert into compte values (2, 2, 1310);
insert into compte values (3, 2, 820);
insert into compte values (4, 2, 2517);
insert into compte values (1, 3, 2510);
insert into compte values (2, 3, 1251);
insert into compte values (3, 3, 2290);
insert into compte values (1, 4, 51251);
insert into compte values (2, 4, 1031);
insert into compte values (1, 5, 82520);
insert into compte values (2, 5, 131);
insert into compte values (3, 5, 3820);
insert into compte values (4, 5, 26501);
insert into compte values (5, 5, 2570);
insert into compte values (4, 1, 8252);
insert into compte values (5, 2, 1310);
insert into compte values (6, 2, 3820);
insert into compte values (4, 3, 26501);
insert into compte values (3, 4, 2570);
create table compte_client (
  ncompte integer,
  nag integer,
  ncli integer references client,
  primary key (ncompte, nag, ncli) ,
  foreign key (ncompte, nag) references compte (ncompte, nag));

insert into compte_client values (1, 1, 1);
insert into compte_client values (1, 1, 3);
insert into compte_client values (2, 1, 2);
insert into compte_client values (3, 1, 2);
insert into compte_client values (1, 2, 1);
insert into compte_client values (1, 2, 3);
insert into compte_client values (2, 2, 2);
insert into compte_client values (3, 2, 5);
insert into compte_client values (4, 2, 8);
insert into compte_client values (1, 3, 7);
insert into compte_client values (2, 3, 5);
insert into compte_client values (3, 3, 7);
insert into compte_client values (3, 3, 9);
insert into compte_client values (1, 4, 4);
insert into compte_client values (2, 4, 5);
insert into compte_client values (1, 5, 2);
insert into compte_client values (2, 5, 7);
insert into compte_client values (3, 5, 8);
insert into compte_client values (4, 5, 5);
insert into compte_client values (5, 5, 1);
insert into compte_client values (4, 1, 10);
insert into compte_client values (4, 1, 9);
insert into compte_client values (1, 5, 3);
insert into compte_client values (5, 2, 7);
insert into compte_client values (6, 2, 10);
insert into compte_client values (4, 3, 5);
insert into compte_client values (3, 4, 1);
create table emprunt (
  nemprunt integer,
  ncompte integer,
  nag integer,
  montant float,
  primary key (nemprunt),
  foreign key (ncompte, nag) references compte (ncompte, nag));

insert into emprunt values (1, 1, 1, 112500);
insert into emprunt values (2, 2, 1, 1251);
insert into emprunt values (3, 2, 2, 1300);
insert into emprunt values (4, 3, 2, 82000);
insert into emprunt values (5, 4, 2, 251);
insert into emprunt values (6, 2, 4, 13100);
insert into emprunt values (7, 1, 5, 80250);
insert into emprunt values (8, 5, 5, 131);
insert into emprunt values (9, 6, 2, 1765);