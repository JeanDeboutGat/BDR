----------------------------
@Author: Jean Debout GATARI
---------------------------

Requêtes SQL du TP-Banque
---------------------------- 



1.  Donner le nom des agences à Lille.
#   SELECT nomag FROM agence WHERE villeag = 'Lille' 

2.  Donner le nom et prénom des clients qui n’ont pas de compte.
#   SELECT nomcli, prenomcli FROM client c WHERE c.ncli NOT IN (SELECT cc.ncli FROM compte_client cc);

3.  Donner la liste des comptes de ’Marie Blanc’.
#   SELECT cc.* FROM compte_client cc JOIN client c ON c.ncli = cc.ncli and nomcli = 'Blanc' AND prenomcli = 'Marie';

4.  Donner la liste des clients qui n’ont pas d’emprunt (sur aucun de leur compte).
#   SELECT c.* FROM client c WHERE c.ncli NOT IN (SELECT cc.ncli FROM (compte_client cc JOIN emprunt e ON e.ncompte = cc.ncompte));

5.  Donner la liste des clients qui ont des comptes dans des villes différentes de là où ils habitent.
#   SELECT DISTINCT c.* FROM client c JOIN compte_client cc ON cc.ncli = c.ncli JOIN agence a ON cc.nag = a.nag  WHERE c.villecli != a.villeag ;

6.  Donner le nom des clients qui ont un total d’emprunt supérieur à 90 000.
#   SELECT  c.nomcli, c.prenomcli, SUM(e.montant) FROM (client c JOIN compte_client cc ON cc.ncli = c.ncli) JOIN  emprunt e ON e.ncompte = cc.ncompte  GROUP BY c.ncli HAVING SUM(e.montant)  >  90000;



7.  Donner le nom et le prénom des clients qui partagent un compte avec ’Marie Blanc’.
#   SELECT c1.nomcli,c1.prenomcli,cc1.ncompte FROM (client c2 JOIN compte_client cc1 ON cc1.ncli = c2.ncli) JOIN compte_client cc2 ON cc1.ncompte = cc2.ncompte JOIN client c1 ON c1.ncli = cc2.ncli WHERE c2.nomcli = 'Blanc' and c2.prenomcli = 'Marie' and c1.ncli != c2.ncli;

8.  Donner à Jean Pasquale le montant total d’argent détenu sur ses comptes. (On ne prendra pas en compte le faitque certains comptes   
    peuvent éventuellement être partagés ou qu’il a des emprunts).

#   SELECT SUM(co.solde) AS somme_totale_de_Jean_Pasquale FROM (compte co JOIN compte_client cc ON cc.ncompte = co.ncompte) JOIN client cl ON cc.ncli = cl.ncli WHERE UPPER (cl.nomcli || ' ' || cl.prenomcli) = 'PASQUALE JEAN' GROUP BY cc.ncli;

9.  Donner le nom, le prénom et les numéros de compte et agence des clients qui possèdent le    compte le plus fourni.
#   SELECT client,ncli, client.prenomcli,client.nomcli FROM compte_client, client (SELECT compte_client.ncompte,compte_client.na, (solde + montant) AS total FROM (max(total)) )


10.  Donner le nom des agences qui n’ont pas de client
#   SELECT a1.* FROM agence a1 WHERE a1.nag NOT IN (SELECT a2.nag FROM agence a2 JOIN compte_client cc ON cc.nag = a2.nag);

Bonjour Monsieur,
Désole de vous déranger mais je viens de me rendre compte qu'en TDM2 je me suis trompé au niveau de longueur de mot à affiché sur exo1.3 . J'ai mis 4 en argument au lieu de 5 et ça affiche les mots de mauvaise longueur . Puisque c'est trop tard de modifier, Je me demandais si je peux changer maintenant ou si  vous pourriez l'en prendre en compte pendant la correction. Merci.
