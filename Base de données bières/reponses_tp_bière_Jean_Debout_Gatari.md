----------------------------
@Author: Jean Debout GATARI
---------------------------

Requêtes SQL du TP Bière
----------------------------


1.  Nom, prénom et nom du bar favori des amateurs par ordre alphabétique des amateurs.
#   SELECT a.nom, a.prenom, b.nom FROM Amateur a JOIN bar b ON a.barFavori = b.code ORDER BY a.nom, a.prenom;

2.  Pour chaque amateur (on affiche son nom), le nombre de bières qu’il aime.
#   SELECT a.nom, count (*) AS nbre_biere_il_aime FROM aime JOIN amateur a ON  aime.amateur = a.code;

3.  Les noms de bars qui servent une bi`ere que ’Paul Simon’ aime.
#   SELECT a.nom, count (*) AS nbre_biere_il_aime FROM aime JOIN amateur a ON  aime.amateur = a.code GROUP BY a.nom;

4.  Le prix le plus ́elevé auquel la bière ’Maredsous’ est proposé.
#   SELECT max AS prix_biere_éléve FROM (SELECT b.numero, MAX (bs.prix) FROM biereServie bs JOIN biere b ON bs.biere = b.numero GROUP BY b.numero HAVING b.
    designation = 'Maredsous') T; 

5.  Le nom des bières servies dans tous les bars.
#   SELECT bi.designation
    FROM biere bi
    WHERE 
    NOT EXISTS (SELECT * 
            FROM bar ba 
            WHERE
            NOT EXISTS (SELECT *
                FROM biereServie bs2
                WHERE bs2.biere = bi.numero AND bs2.bar = ba.code
                
            ));

6.  nom des bars qui ne servent pas de la ’Maredsous’
#   SELECT ba.nom From bar ba WHERE ba.code NOT IN (SELECT ba2.code FROM (bar ba2 JOIN biereServie bs ON ba2.code = bs.bar) JOIN biere bi ON bs.biere = bi.     
    numero WHERE bi.designation = 'Maredsous');

7.  Les codes des bars qui servent au moins 4 bières différentes.
#   SELECT bs.bar FROM biereServie bs GROUP BY bs.bar HAVING COUNT (bs.biere) > 3;

8.  Le nom des bars qui ne servent pas de bière avec une note inférieure strictement à 5.
#    SELECT DISTINCT ba2.code FROM (bar ba2 JOIN biereServie bs ON ba2.code = bs.bar) JOIN aime ai ON bs.biere = ai.biere WHERE ai.note < 5;

9.  Pour chaque désignation de bière, la moyenne de leurs notes.
#   SELECT bi.designation, AVG(ai.note) FROM biere bi JOIN aime ai ON bi.numero = ai.biere GROUP BY bi.designation;  

10.  Les désignations des bières servies par le bar ”Baratin”.
#    SELECT bi.designation FROM (biere bi JOIN biereServie bs ON bi.numero = bs.biere) JOIN bar ba ON ba.code = bs.bar WHERE ba.nom = 'Baratin'; 

11.  La désignation des bières qui ne sont servies dans aucun bar.
#   SELECT bi.designation FROM biere bi WHERE bi.numero NOT IN (SELECT bi2.numero FROM biere bi2 JOIN  biereServie bs ON bi.numero = bs.biere);

12.  nom et prénom des amateurs qui aiment les mêmes bières que ’Ben Simon’ (on prenda en compte toutes les bières que Ben Simon aiment)

#   SELECT DISTINCT a.nom, a.prenom FROM amateur a JOIN aime  ai ON a.code = ai.amateur WHERE ai.biere  IN (SELECT ai2.biere FROM aime ai2 JOIN amateur a2 ON   
    a2.code = ai2.amateur WHERE UPPER(a2.nom ||' '||a2.prenom) = 'SIMON BEN') AND UPPER(a.nom ||' '||a.prenom) != 'SIMON BEN' ; 
