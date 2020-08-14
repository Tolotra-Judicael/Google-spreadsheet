Projet en solo : Google Spreadsheet
auteur : Andrianasolo Tolotra Judicaël
lien github : https://github.com/Tolotra-Judicael

Pour lancer le programme il suffit de faire ruby app.rb dans le terminal

Ce programme se décompose comme suit :

Google_spreadsheet

          ├── .gitignore

          ├── README.md

          ├── Gemfile

          ├── Gemfile.lock

          ├── app.rb

          ├── db

           │       └── emails.JSON

           └── lib    

                     └── scrapper.rb

Ce projet consiste à regrouper les emails de la mairie du val d'Oise.
 Dans ce sens, on a utilisé le programme scrappeur issu du précédent exercice.

Le projet se repartie en trois parties: 
La première partie consiste à enregistrer tous les emails dans un fichier email.JSON 
POur ce faire, il suffit d'utiliser le code adéquat pour effectuer cela

En seconde partie, on doit enregistrer les emails dans Google spreadsheet.
Dans ce cadre, le fichier Google spreadsheet contient deux colonnes A et B. Dans la colonne A est listée les noms des villes et dans la colonne B les emails respectifs de ces dernières.

POur finir, on doit enregistrer les emails dans un fichier csv
