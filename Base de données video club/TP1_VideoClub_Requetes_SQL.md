-----------------------------
| Auteur: Jean Debout Gatari |
-----------------------------



Ici se trouvent les requêtes correspondantes aux questions posées dans le TP1 Video Club Simple
-----------------------------------------------------------------------------------------------


Q1.  Afficher tous les films
R:   SELECT * FROM film;
 
Q2.  Afficher les nom et Prénom des abonnés par ordre alphabétique
R:   SELECT nomab, prenomab FROM abonne ORDER BY nomab ASC;
 
Q3.  Affiche Nom et Prénom des abonnés au même colonne contenant le nom et le prénom en majuscule
R:   SELECT UPPER(nomab || ' '|| prenomab) as "NOM COMPLET" FROM abonne;
 
Q4.  Titres des film antérieurs à 2005.
R:   SELECT titre FROM film WHERE anneeProduction < 2005;
 
Q5.  Titres des film parus entre 2005 et 2010, triés par ordre alphabétique.
R:   SELECT titre FROM film WHERE  anneeProduction between 2005 AND 2010 ORDER BY titre ASC; 
 
 
 
Q6.  Film dont le titre commence par 'p'.
R:    SELECT * FROM film WHERE lower(titre) LIKE 'p%';
 
Q7.  Film dont le titre contient’se’ 
R:   SELECT * FROM film WHERE lower(titre) LIKE '%se%';
 
Q8.  Numéros des catégories dont font partie les films présents dans la base. (Eviter les doublons)
R:   SELECT DISTINCT ncat FROM film;
 
Q9.  Nombre de catégories différentes dont font partie les films présents dans la base. On donnera un libellé correct au résultat 
R:   SELECT COUNT(DISTINCT ncat) AS "Nombre des catègories associé au filmes" FROM film 

Q10. Afficher le nombre de films pour lesquels on a des dvd 
R:   SELECT COUNT(DISTINCT nfilm) FROM dvd;

Q11. nombre de films de Woody Allen. 
R:   SELECT COUNT(nfilm) FROM film WHERE lower(realisateur) = 'woody allen';

Q12. trouver le nombre d’abonné dont le nom commence par ’C’. 
R:   SELECT nfilm,titre,anneeproduction,realisateur FROM film f1 EXCEPT SELECT f2.nfilm,titre,anneeproduction,realisateur FROM film f2 JOIN dvd ON f2.nfilm = dvd.nfilm;

Q13. Titres et années des films de Tim Burton. 
R:   SELECT titre, anneeProduction FROM film WHERE lower(realisateur) = 'tim burton';

Q14. Titre des films produits en 2008 ou 2009 
R:   SELECT titre FROM film WHERE  anneeProduction IN (2008, 2009);

Q15. Titre des films réalisés ni en 2007, ni en 2008, ni en 2009 
R:   SELECT * FROM film WHERE  anneeProduction NOT IN (2007,2008, 2009); 

Q16. quelle est l’année de production du dernier film de Clint Eastwood 
R:   SELECT MAX(anneeProduction) AS "l'année du dernier filme de EastWood" FROM film WHERE lower(realisateur) = 'clint eastwood';

Q17. quelle est la durée max des emprunts. 
R:   SELECT MAX(dateFin - dateDeb) AS "Durée max d'emprunt" FROM emprunt;   

Q18. trouver le nombre de films pour lesquels on possède au moins un dvd 
R:   SELECT COUNT(DISTINCT nfilm) FROM dvd

Q19. Afficher les titres de films de Quentin Tarantino produit au 21 ème siècle 
R:   SELECT titre FROM film  WHERE lower(realisateur) = 'quentin tarantino' AND anneeProduction >= 2001;


Q20. Afficher le nombre de dvd qui ont été empruntés. Bien évidemment si un dvd a été plusieurs fois, il necompte que pour 1.
R:   SELECT COUNT(DISTINCT (ndvd)) AS "Nombre des DVD disctints empruntés" FROM emprunt ;