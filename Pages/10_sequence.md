# Les séquences

Pour créer un séquence, faire un état lumineux, click gauche long sur une case de la window **Sequence**

![Alt text](images/2023-03-23_06h20_16.png)

Modifier l'état lumineux, et glissé bas sur ce bouton, puis store. Grandma3 va demander s'il créé un second pas.

![Alt text](images/2023-03-23_06h18_25.png)

Sélectionner Creat **second cue** pour créer un second pas

![Alt text](images/2023-03-23_06h21_39.png)

Il est possible aussi de faire edit, cliquer sur le cue, changer une valeur, puis update ok


POur lancer la séquence, il faut lancer la commande sur GO+ à chaque pas, ou modifier le type et time dans le tableau des cue

![Alt text](images/2023-03-23_06h25_56.png)

POur la macro go+, faire execute YES pour lancer le pas suivant à chaque appui de GO

![Alt text](images/2023-03-23_08h10_04.png)

Pour une macro OFF, ne pas faire execute YES

![Alt text](images/2023-03-23_08h11_24.png)

Pour éteindre une séquence à la fin de la lecture :
Dans Cmd au dernier pas, ajouter **off sequence 1** après avoir mis un cmd delay pour décaler le déclenchement de la commande

![Alt text](images/2023-03-23_08h40_53.png)

## MIB
Move in black

![Alt text](images/2023-06-06_22h30_30.png)

Pour préparer le pas suivant, il est possible de mettre sur le pas suivant : MIB early.
ça modifie en avance tous les paramètre sauf le dimmer.

Pour régler les temps de MIB, aller dans les réglages

![Alt text](images/2023-06-06_22h44_38.png)

## Tracking

Les séquences ont un tracking de suivi.
Les pas s'enchainent et conservent les paramètres précédent.

Il est possible de faire une pause sur le tracking, en ajoutant un cue suivant et revenir sur le précedent pour activer CUE Only.

Attention, en cas de modification d'un précédent cue, le tracking va continuer cette modification dans les pas suivants.

Break Filter All permet d'arreter le traking

![Alt text](images/2023-06-06_22h29_28.png)



## avant la séquence et après

Les réglages se font en cue zero et offcue

![Alt text](images/2023-06-06_22h27_55.png)