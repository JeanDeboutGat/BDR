agence (
  nag integer primary key,
  nomag char (25),
  villeag char (25));

client (
  ncli integer primary key,
  nomcli char (25),
  prenomcli char(25),
  villecli char (25));


compte (
  ncompte integer,
  nag integer references agence,
  solde float,
  primary key (ncompte, nag)
);


compte_client (
  ncompte integer,
  nag integer,
  ncli integer references client,
  primary key (ncompte, nag, ncli) ,
  foreign key (ncompte, nag) references compte (ncompte, nag));


emprunt (
  nemprunt integer,
  ncompte integer,
  nag integer,
  montant float,
  primary key (nemprunt),
  foreign key (ncompte, nag) references compte (ncompte, nag));