# Projet my-new-restautaurant

## Pré-requis et installation :

1 - Voici le lien en production de l'application :
```
 > https://my-new-restaurant.herokuapp.com/
 ```

2 - Pour le faire fonctionner sur ta machine, voici la marche à suivre :

  3.1 - Cloner le repository :
```
  $ git clone https://github.com/mainRomainRo/restaurant
```

  3.2 - Effectuer l'initialisation de l'application :
```
  $ bundle install

  $ rails db:create && rails db:migrate && rails db:seed
```

*NOTA : Tu peux, si la gem PG est installée sur ta machine, effectuer un `bundle install` simple. sinon `bindle install --without production`*

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

