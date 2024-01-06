# Le logiciel Companion

Très utile pour générer un framework sur votre PC et l'utiliser avec Stream Deck

Le Stream Deck est créé pour envoyer des raccourcis clavier.
Il est capable d'envoyer des commandes sur le port du companion.

1. Ouvrir l'appli streamDeck
2. Ajouter le plugin companion
3. ajouter des boutons companion (page de 1 à 100 et bouton de 1 à 32)
4. ouvrir le back office companion
5. déclarer le streamDeck en USB
6. ajouter des fonctions sur les boutons qui ont été sélectionnés dans l'appli stream deck.

Dans Companion, il est possible d'installer un module Grandma3 et de lancer une communication.
Les commandes sont envoyées par l'osc.


preset timecode
<!-- call viewbutton 3.2;call viewbutton 1.4;;call viewbutton 2.1;call viewbutton 4.4 -->

## Bouton pour activer les raccourcis clavier
keyboard
Edit UserProfile 1.15 Property'KeyboardShortcutsActive'/NoOops 

## bouton pour tout stomper
Stomp all
Stomp EncoderPage 2;Stomp EncoderPage 1;Stomp EncoderPage 3;Stomp EncoderPage 4;Stomp EncoderPage 5;Stomp EncoderPage 6;Stomp EncoderPage 7

## Bouton pour tout Off
tout off
off RunningSequence; off runningmacro;off running timecode;off runningpreset;off Runningtimer
