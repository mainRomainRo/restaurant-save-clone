# Projet e-Chatons Team BDX

### Week n°9 - THP by Team BDX
### Site de e-commerce

## Bienvenue à toi, Ô brave correcteur !

Tu vas bientôt pouvoir utiliser en avant-première notre super site de vente de cartes de mimi-chatons. Pour cela, nous te demanderons bien sûr d'être impartial mais indulgent :D.

Le but du travail de la semaine est de re-créer une application rails qui reprend le concept d'un site de e-commerce, avec la vente de carte de petits chatons tout mignons. Le but est de déployer les outils vus lors de la formation, sur une application Rails et le tout en production : le test ULTIME.

Bonne navigation sur notre site, dans tous les cas, il a été fait avec du ❤️, beaucoup de ☕️ et un tout petit peu de 🧠.

## Pré-requis et installation :

1 - Relèves-toi stp de ta PLS, te connecter à ta perfusion de café et souquer les arquebuses.

2 - Voici le lien en production de l'application :
```
  > https://e-chatons.herokuapp.com/
```

3 - Pour le faire fonctionner sur ta machine, voici la marche à suivre :

  3.1 - Cloner le repository :
```
  $ git clone https://github.com/iMassim0/W9_TeamBDX_e-Chatons
```

  3.2 - Effectuer l'initialisation de l'application :
```
  $ bundle install

  $ rails db:create && rails db:migrate && rails db:seed
```

*NOTA : Tu peux, si la gem PG est installée sur ta machine, effectuer un `bundle install` simple.*
*NOTA2 : $ = terminal || > = console rails || @ = internet browser*

  3.3 - Lancer le fonctionnement en local et assurer la reception des mails avec mailcatcher (par exemple) :
```
  $ rails serveur

  $ mailcatcher
```
Puis dans ton navigateur préféré, va aux adresses :
```
@ http://localhost:3000/

@ http://localhost:1080/
```
<a href="https://mailcatcher.me/">ici</a> le lien d'installation de mailcatcher.

## Explications particulières de fonctionnement :

Le site est globalement, assez intuitif dans sa navigation, mais des petits détails sont à connaître, pour pouvoir effectuer tous les tests nécessaires.

**Activer le mode Admin d'un utilisateur :**

Pour activer le mode admin sur un utilisateur déjà créé dans la db, voici les commandes à rentrer :
```
 $ rails console
 > u = User.last (si tu es le dernier à t'être enregistré)
 > u.role = "admin"
 > u.save
```
Le mode Admin est ainsi activé pour le dernier utilisateur enregistré sur le site. Les fonctionnalités Admin sont donc à disposition une fois la reconnexion.

**Lancement d'une task**

Pour permettre la récupération des informations telles que l'argent gagné depuis le début, le nombre de commandes passées et le nombre d'articles vendus, il existe 2 tasks :
```
  $ rake chaton1
  $ rake chaton2
```
Ces deux tasks permettent l'envoi périodique, toutes les semaines, de ces informations aux admins. Elles peuvent être connectées au module Scheduler de Heroku par exemple.

**Rentrer un paiement pour effectuer une commande**

Ne rentrez pas votre carte! Sauf si vous souhaitez nous faire un don, pour cela, on vous donnera avec plaisir nos RIBs :D. Mais sinon, pour aller jusqu'à la concrétisation de la vente, et d'observer les mails envoyés après la commande, le mieux est de :
  - Rentrer le numéro de carte : "4242 4242 4242 4242 ; 02/21 ; 111"
  - Créer un compte avec sa vraie adresse mail pour reçevoir la confirmation ET votre commande !

## Infos complémentaires :

Toutes les fonctionnalités ont été installées dans l'application. Normalement, tout cela doit forcement en local, ou en production. Si ce n'est pas le cas, dis le nous rapidement que l'on voit ce que l'on aurait pu rater ....

## Contributeur :

@bab - Baptiste ROGEON

@massimo - Maxime FLEURY

<p align="center">
  <img src="THP_BDX.png"/>
</p>

## Pour aller plus loin :

Comment on finit cette fin de semaine : https://www.youtube.com/watch?v=9KbREoFax3U&list=PL5kgB8NOCtthifNmLWqGHBhmKJUBFCd-S

🤘🏻 https://www.youtube.com/watch?v=6f7pgA0riU8 🤩
