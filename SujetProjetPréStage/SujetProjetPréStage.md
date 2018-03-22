# Sujet de Projet de Pré-Stage

## Introduction

Ce document a pour objet la définition du sujet de projet de près-stage de Sébastien Hervieu, en vue de la préparation du Stage intitulé "Etude et développement d'outils mathématiques pour estimer, en temps réel, le tassage et le volume d'un silo de maïs à partir de capteurs embarqués". Ce stage a été proposé et sera suivi par Tellus Environment, et se déroulera dans leurs locaux du 4 avril au 30 septembre 2018.

## Présentation du projet pré-stage

Le cursus du Master 2 Calcul Scientifique et Modélisation se conclut par un stage en entreprise de 6 mois. En vue de préparer ce stage, il est prévu un projet de pré-stage dont l'objet est de détecter les différents sujets qui seront abordés durant le stage, d'en expliciter les motivations. Ceci permet d'anticiper les questions et les points durs, afin de mettre en place les outils - notions, méthodes, outils informatiques, bibliographie - qui permettront de négocier correctement le stage.

Il doit de plus inclure une application numérique en lien avec le projet.

## Plan du projet de préstage

Le rapport du projet de préstage de Sébastien Hervieu sera structuré de la manière suivante

1. Introduction

   1.1 Présentation de Tellus-Environment

   1.2 Présentation du Stage

   1.3 Présentation du projet de pré-stage

2. Notions d'agriculture

   Cette partie s'attachera à présenter l'environnement dans lequel le produit final évoluera, en introduisant les termes et concepts qui seront constamment utilisés dans le contexte du stage: élevage, silos, tracteurs, etc..

3. Notions de détection et de détecteurs

   Différents types de capteurs (range only, range and direction, etc…), leurs particularités, leur mise en oeuvre.

4. Solution Actuelle à améliorer

   Description de la solution de mesure de tassage de silo déjà existante, les points forts potentiellement réutilisables, les points d'améliorations motivant le sujet de stage.

5. Outils importants 

   5.1 Détecteurs (Lidar, ultrason,...)

   5.2 Plateforme ROS

   5.3 Positionnement, Cartographie, SLAM

   5.4 Prototypage

   ​	5.4.1 Prototypage Scientifique des Algorithmes

   ​		• Matlab

   ​		• Python

   ​	5.4.2 Prototypage de mise en oeuvre

   ​		• Plateforme ROS

   ​		• Mise en oeuvre en C et/ou C++

6. Application Numérique:

   L'objectif de cette partie est de concevoir et mettre en oeuvre un algorithme de détection de forme à partir d'un nuage de points, pouvant être issu d'un capteur de type "portée et direction".

   1. Produire des données de référence à partir de modèle de structure 3D connus.
   2. Introduire bruit gaussien sur les points, de manière à produire un nuage de points bruité
   3. Développer un technique d'inversion permettant de détecter la forme et les dimensions des structures à partir des nuages de points bruités
   4. Evaluer les marges d'erreur des modèles inversés
   5. Dégager les axes de progression en terme de performance de calcul: l'objectif est d'obtenir des outils qui produisent des résultats en quelques secondes.

7. Objectifs SMART du stage

   ​	SMART: **S**pécifique, **M**esurable, **A**cceptable, **R**éaliste, **T**emporellement défini

8. Conclusions

9. Annexes

   9.1 Sujet de stage

10. Bibliographie