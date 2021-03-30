-----------------------------
| Auteur: Jean Debout Gatari |
-----------------------------


Ici se trouvent les requêtes correspondantes aux questions posées dans le controle continue 2
---------------------------------------------------------------------------------------------

1.  Nom des bateaux qui ont participé à plusieurs compétitions
>   SELECT nombat FROM bateau b JOIN inscription i ON b.nbat = i.nbat JOIN competition c  ON i.ncomp = c.ncomp  GROUP BY b.nombat HAVING count(i.nbat)>1;

2.  Nom du bateau arrivé premier à la competition Louis Vuitton (compétition ’Louis Vuitton Cup’).
>   SELECT bateau.nombat FROM bateau JOIN resultat ON (bateau.nbat = resultat.nbat) JOIN competition ON (resultat.ncomp = competition.ncomp) WHERE rang = 1 AND
    LOWER(competition.nomcomp) = 'louis vuitton cup';

3.  Nom des bateaux qui ont participé à toutes les compétitions.
>   SELECT bateau.nombat FROM bateau WHERE NOT EXISTS(
    SELECT competition.* FROM competition WHERE NOT EXISTS(
    SELECT * FROM inscription WHERE bateau.nbat = inscription.nbat and inscription.ncomp = competition.ncomp)
    );
4.  NNoms des bateaux, sans doublon, qui n’ont jamais fini une compétition (ils sont inscrits à la competition,
    mais n’ont pas de résultat).
>   SELECT DISTINCT bateau.nombat FROM bateau JOIN inscription ON (inscription.nbat = bateau.nbat) WHERE bateau.nbat NOT IN (SELECT bateau.nbat FROM bateau
    INNER JOIN resultat ON (resultat.nbat = bateau.nbat)); 

5.  Nom du bateau arrivé dernier à la solitaire du Figaro (compétition ’Le Figaro’).
>   SELECT nombat FROM resultat JOIN bateau ON resultat.nbat = bateau.nbat JOIN competition ON resultat.ncomp = competition.ncomp AND competition.nomcomp = 'Le
    Figaro' GROUP BY nombat, resultat.rang HAVING resultat.rang = (
    SELECT MAX(r2.rang ) FROM resultat r2, competition c WHERE r2.ncomp = c.ncomp AND c.nomcomp = 'Le Figaro'
);
6.  Nombre de bateaux par catégorie (on affichera le numéro de la catégorie et le nombre de bateaux).
>   SELECT bateau.ncat, count(*) FROM bateau GROUP BY bateau.ncat;

7.  Ensemble des sponsors des bateaux
>   SELECT DISTINCT bateau.sponsor FROM bateau;

8.  Numéros des bateaux qui sont arrivés plusieurs fois premiers (rang =1).
>   SELECT bateau.nbat FROM bateau JOIN resultat ON (bateau.nbat= resultat.nbat) JOIN competition ON (resultat.ncomp = competition.ncomp) WHERE rang = 1 GROUP
    BY bateau.nbat HAVING COUNT (*) > 1;

9.  Liste des bateaux (tous les attributs de bateau) n’ayant jamais participé à une compétition.
>   SELECT bateau.* FROM bateau WHERE bateau.nbat NOT IN (SELECT bateau.nbat FROM bateau JOIN inscription ON (bateau.nbat = inscription.nbat));

10.  Noms des bateaux qui ont participé à au moins une des compétitions auxquelles le bateau ’Ville de Paris’a participé.
>   SELECT DISTINCT b1.nombat FROM bateau b1 JOIN inscription ON (b1.nbat = inscription.nbat) WHERE inscription .ncomp IN(
    SELECT inscription.ncomp FROM bateau b2 JOIN inscription ON (b2.nbat = inscription.nbat) WHERE b2.nombat = 'Ville de Paris' AND b1.nombat != 'Ville de Paris'); 
)
11.  Noms des bateaux qui ont participé à toutes les compétitions auxquelles le bateau ’Ville de Paris’ a parti-cipé.
>   SELECT nombat FROM bateau b WHERE NOT nombat = 'Ville de Paris' AND NOT EXISTS(
    SELECT * FROM competition c JOIN inscription i USING(ncomp) JOIN bateau b2 USING (nbat) WHERE nombat = 'Ville de Paris' AND NOT EXISTS (SELECT * FROM inscription i2 WHERE i2.nbat = b.nbat AND i2.ncomp = c.ncomp));
)
12.  Noms des bateaux qui n’ont participé à aucune des compétitions auxquelles le bateau ’Ville de Paris’ aparticipé.
>   SELECT bateau.nombat FROM bateau WHERE bateau.nbat NOT IN(
        SELECT DISTINCT bateau.nbat FROM bateau JOIN inscription ON(bateau.nbat = inscription.nbat) WHERE inscription.ncomp IN(
            SELECT inscription.ncomp FROM bateau inner JOIN inscription ON (bateau.nbat = inscription.nbat) WHERE bateau.nombat = 'Ville de Paris'
        )
    );
13.  Max du nombre de concurrents pour une compétition.
>   SELECT MAX(tab_nb_concurrent_par_competition col_nb_concurrents) FROM (
        SELECT competition.ncomp, count(*) AS col_nb_concurrents FROM competition JOIN inscription ON (inscription.ncomp = competition.ncomp) GROUP  BY competition.ncomp) tab_nb_concurrent_par_competition;

14.  Nom de la compétition ayant le plus grand nombre de concurrents
>   SELECT nomcomp FROM (SELECT ncomp,count(*) FROM inscription i GROUP BY ncomp ORDER BY count DESC LIMIT 1) AS i2 JOIN competition c ON c.ncomp = i2.ncomp;