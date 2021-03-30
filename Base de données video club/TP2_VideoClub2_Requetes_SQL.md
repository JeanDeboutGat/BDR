-----------------------------
| Auteur: Jean Debout Gatari |
-----------------------------



Ici se trouvent les requêtes correspondantes aux questions posées dans le TP2 Video Club 2
-----------------------------------------------------------------------------------------------

Q1.  Numéro des dvd du film ’Taken’
R:   SELECT ndvd FROM dvd JOIN film on dvd.nfilm=film.nfilm where titre = 'Taken';
 
Q2.  Libellé des catégories dont font partie les films présents dans la base.
R:   SELECT DISTINCT libelle FROM categorie JOIN film on categorie.ncat= film.ncat;
 
Q3.  Titres des films classés dans la catégorie’Drame’.colonne contenant le nom et le prénom en majuscule
R:   SELECT titre FROM film JOIN categorie on categorie.ncat= film.ncat WHERE libelle = 'Drame';
 
Q4.  Noms et prénoms des abonnés ayant emprunté ’Pulp Fiction’
R:   SELECT nomab,prenomab FROM (abonne JOIN emprunt on abonne.nab = emprunt.nab) JOIN dvd ON emprunt.ndvd = dvd.ndvd JOIN film ON dvd.nfilm=film.nfilm WHERE  
     titre = 'Pulp Fiction';
 
Q5.   Liste des films des catégories’Drame’et’Action’
R:    SELECT titre FROM film JOIN categorie on categorie.ncat= film.ncat WHERE libelle = 'Drame'  UNION SELECT titre FROM film JOIN categorie on categorie. 
      ncat = film.ncat WHERE libelle = 'Action'; 
 
Q6.  Libellé des catégories des films de ’Steven Spielberg'.
R:   SELECT DISTINCT libelle FROM categorie JOIN film on categorie.ncat=film.ncat WHERE realisateur='Steven Spielberg';
 
Q7.  Liste des films empruntés par Marie Dupont.
R:   SELECT titre FROM (film JOIN dvd ON film.nfilm = dvd.nfilm) JOIN emprunt ON emprunt.ndvd = dvd.ndvd JOIN abonne ON abonne.nab = emprunt.nab WHERE nomab =  
    'Dupont' and prenomab = 'Marie'; 
 
Q8.   Liste des films n’ayant jamais été empruntés
R:    SELECT titre,anneeproduction,realisateur FROM film  WHERE nfilm NOT IN (SELECT film.nfilm FROM (film  JOIN dvd ON film.nfilm = dvd.nfilm) JOIN emprunt ON 
      dvd.ndvd = emprunt.ndvd );

Q9.   Titre des films de Quentin Tarantino de la categorie ’Historique’
R:    SELECT titre FROM film JOIN categorie ON film.ncat=categorie.ncat WHERE categorie.libelle = 'Historique' AND film.realisateur = 'Quentin Tarantino'  

Q10. Liste des films dont au moins un dvd a été acheté en août 2009
R:   SELECT titre FROM film JOIN dvd ON film.nfilm = dvd.nfilm WHERE dvd.moisachat = '8' AND dvd.anneeachat = '2009' ;

Q11.  Noms et prénoms des abonnés ayant emprunté un film de Woody Allen et un film de Clint Eastwood. (On considère que c'est sont
      les abonnées qui ont amprunté les deux Mais pas que un parmis les deux)

R:   SELECT DISTINCT nomab,prenomab FROM (abonne JOIN emprunt on abonne.nab = emprunt.nab) JOIN dvd ON emprunt.ndvd = dvd.ndvd JOIN film ON dvd.nfilm=film.
     nfilm WHERE realisateur = 'Woody Allen' AND realisateur = 'Clint Eastwood';

Q12. Liste des films dont on ne possède pas de dvd 
R:   SELECT nfilm,titre,anneeproduction,realisateur FROM film f1 EXCEPT SELECT f2.nfilm,titre,anneeproduction,realisateur FROM film f2 JOIN dvd ON f2.nfilm = 
     dvd.nfilm;

Q13.  Liste des films dont au moins un dvd a été acheté l’année de sa production.
R:    SELECT DISTINCT f.nfilm,titre,anneeproduction,realisateur FROM film f JOIN dvd d ON d.nfilm = f.nfilm AND f.anneeproduction = d.anneeachat;

Q14. Année d’achat des dvd du film Pulp Fiction
R:   SELECT DISTINCT anneeachat FROM dvd d JOIN film f ON d.nfilm = f.nfilm WHERE f.titre = 'Pulp Fiction';

Q15. Noms et prénoms des abonnés n’ayant jamais emprunté un film de ’Quentin Tarantino’

R:   SELECT nab,nomab,prenomab FROM abonne a1 EXCEPT (SELECT a2.nab,nomab,prenomab FROM (abonne a2 JOIN emprunt e ON a2.nab = e.nab) JOIN dvd d ON d.ndvd = e. 
     ndvd JOIN film f ON d.nfilm = f.nfilm WHERE f.realisateur = 'Quentin Tarantino');

Q16. Noms, prénoms des abonnés ainsi que le nom des films qu’ils ont empruntés (s’ils n’ont rien emprunté, ilsn’apparaissent pas)
R:   SELECT DISTINCT nomab,prenomab,titre FROM (abonne a JOIN emprunt e ON a.nab = e.nab) JOIN dvd d ON d.ndvd = e.ndvd JOIN film f ON d.nfilm = f.nfilm ;    

Q17. Noms, prénoms des abonnés ainsi que le nom des films qu’ils ont empruntés (s’ils n’ont rien emprunté, ilsdoivent apparaitre)
     R:  SELECT prenomab,titre FROM (abonne a LEFT OUTER JOIN emprunt e ON a.nab = e.nab) LEFT OUTER JOIN dvd d ON d.ndvd = e.ndvd LEFT OUTER JOIN film f ON d.nfilm = f.nfilm ;

Q18. Liste des films empruntés par Sophie Durant et par Rébecca Cohen
     (j'ai considéré que c'est  les films qui ont été empruntés par l'une et par l'autre. Mais pas que par une)
R:   SELECT  f1.nfilm,titre,anneeproduction,realisateur FROM (film f1 JOIN dvd d1 ON d1.nfilm = f1.nfilm) JOIN emprunt e ON d1.ndvd = e.ndvd JOIN abonne  
     a1 ON a1.nab = e.nab WHERE a1.nomab = 'Durant' AND a1.prenomab = 'Sophie'
     INTERSECT
     SELECT  f1.nfilm,titre,anneeproduction,realisateur FROM (film f1 JOIN dvd d1 ON d1.nfilm = f1.nfilm) JOIN emprunt e ON d1.ndvd = e.ndvd JOIN abonne a1 ON a1.nab = e.nab WHERE a1.nomab = 'Cohen' AND a1.prenomab = 'Rébecca';

Q19. nom et prénom des abonnés n’ayant jamais emprunté un dvd
R:   SELECT nomab,prenomab FROM abonne  EXCEPT SELECT nomab,prenomab FROM (abonne JOIN emprunt ON abonne.nab = emprunt.nab);


Q20. nom et prénom des abonnés n’ayant jamais emprunté un dvd
R:   SELECT DISTINCT realisateur FROM film f JOIN categorie c ON c.ncat = f.ncat WHERE libelle = 'Dessin Anime';  
