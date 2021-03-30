-----------------------------
| Auteur: Jean Debout Gatari |
-----------------------------



Ici se trouvent les requêtes correspondantes aux questions posées dans le TP4 Video Club 3
-------------------------------------------------------------------------------------------


1.  nombre d’emprunt par abonné
#   SELECT count(*) AS nombre_d’emprunt_par_abonné FROM (abonne JOIN emprunt on abonne.nab = emprunt.nab) GROUP BY abonne.nab;

2.  Nom et prénom des abonnés avec le nombre d’emprunts qu’il a effectués
#   SELECT nomab,prenomab, count(*) FROM (abonne JOIN emprunt on abonne.nab = emprunt.nab) GROUP BY abonne.nab;

3.  Nombre moyen d’emprunts par abonné
#   SELECT avg (nb_moyen) FROM  (SELECT count(*) AS nb_moyen FROM (abonne JOIN emprunt on abonne.nab = emprunt.nab) GROUP BY abonne.nab) as table_emprunt_par_abonne;

4.  Numéros des films de Woody Allen avec pour chaque film, le nombre de dvds correspondant.
#   SELECT fi.nfilm, count(d.ndvd) FROM film fi  JOIN dvd d ON d.nfilm = fi.nfilm GROUP BY fi.nfilm HAVING fi.realisateur = 'Woody Allen';

5.  Numéros des films dont on possède plusieurs dvds dans la base (numéro de film et nombre de dvds pour ce film)
#   select f.nfilm, count( DISTINCT ndvd) as nb_dvd from film f, dvd d where d.nfilm = f.nfilm group by f.nfilm having count (ndvd) > 1 ;

6.  Liste des films ayant été empruntés par tous les abonnés.
#   SELECT f.*
    FROM film f 
    WHERE
    NOT EXISTS (SELECT *
        FROM  abonne a 
        WHERE
        NOT EXISTS(SELECT *
            FROM emprunt e JOIN dvd d ON e.ndvd = d.ndvd
            WHERE d.nfilm = f.nfilm AND e.nab = a.nab));

7.  Liste des films ayant été empruntés par tous les abonnés ayant emprunté au moins un film.
#   SELECT f1.*
    SELECT f.*
    FROM film f 
    WHERE
    NOT EXISTS (SELECT *
        FROM  abonne a JOIN emprunt e ON a.nab = e.nab 
        WHERE 
        NOT EXISTS(SELECT *
            FROM emprunt e JOIN dvd d ON e.ndvd = d.ndvd
            WHERE d.nfilm = f.nfilm AND e.nab = a.nab));


8.  Liste des films produit avant le plus vieux film de Tim Burton qu’on possède dans la base

# SELECT f.* FROM film f WHERE f.anneeproduction < ((SELECT f2.* FROM film f2) f2  ON f2.nfilm = f.nfilm WHERE f.realisateur = 'Tim Burton' AND  f2.realisateur = 'Tim Burton' AND f.anneeproduction < f2.anneeproduction); 


9.  Liste des abonnés ayant empruntés tous les films réalisés par Quentin Tarantino
#   SELECT a.*
    FROM abonne a 
    WHERE
    NOT EXISTS (SELECT *
        FROM  film f 
        WHERE f.realisateur = 'Quentin Tarantino' AND
        NOT EXISTS(SELECT *
            FROM emprunt e JOIN dvd d ON e.ndvd = d.ndvd
            WHERE d.nfilm = f.nfilm AND e.nab = a.nab));


10.  Nombre de films par catégorie
#    SELECT ncat as categorie, count(*) FROM film GROUP BY ncat;

11.  nombre de films différents empruntés par chaque abonné
#    SELECT e.nab as abonne, count (DISTINCT f.nfilm) as nombre_film_emprunte FROM (emprunt e JOIN dvd d on d.ndvd = e.ndvd) JOIN film f ON d.nfilm = f.nfilm GROUP BY e.nab;   

12.  titre des films qui ont été emprunté 3 fois ou plus.
#    SELECT titre as films, count (f.nfilm) as nb_fois_emprunte FROM (emprunt e JOIN dvd d on d.ndvd = e.ndvd) JOIN film f ON d.nfilm = f.nfilm GROUP BY titre HAVING count (f.nfilm) > 2 ; 

13.  nom et prénom des abonnés n’ayant jamais emprunté de film de Tarantino
#    SELECT nomab, prenomab  FROM abonne WHERE abonne.nab NOT IN (SELECT DISTINCT e.nab FROM (emprunt e JOIN dvd d on d.ndvd = e.ndvd) JOIN film f ON d.nfilm = f.nfilm WHERE f.realisateur LIKE '%Tarantino%');

14.  libellé des catégories comptant plus de 3 films strict. On affichera également le nombre de films
#    SELECT libelle,count(*) AS nb_film FROM categorie c JOIN film f ON f.ncat = c.ncat GROUP BY c.ncat HAVING count(*) > 3; 

15.  titre et année de production des films les plus anciens disponibles dans la base
#    SELECT f1.titre,f1.anneeproduction FROM film f1 WHERE f1.anneeproduction = (SELECT MAX(f2.anneeproduction) FROM film f2);


