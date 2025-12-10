📘 Documentation de mon Travail Git & SSH

Ce README présente les étapes que j’ai réalisées pour configurer Git, créer mes fichiers, et mettre en place une connexion SSH sécurisée avec GitHub.

1️⃣ Configuration de mon environnement Git

J’ai ouvert une fenêtre de ligne de commande.

J’ai créé un répertoire de travail nommé Developer.

J’ai ensuite cloné le dépôt du cours avec git clone.

Je suis entré dans le dossier du cours pour commencer à travailler.

2️⃣ Création de mon premier fichier Git

J’ai créé un fichier portant mon ID Boréal au format .md.

J’ai ajouté ce fichier à l’index Git avec git add.

J’ai vérifié son status (git status).

J’ai enregistré mon travail avec un commit.

Puis j’ai envoyé mes modifications vers GitHub (git push).

3️⃣ Configuration de Git (utilisateur + éditeur)

J’ai changé l’éditeur Git par défaut pour nano.

J’ai configuré mon nom et mon courriel GitHub dans ~/.gitconfig.

4️⃣ Génération et configuration de ma clé SSH

J’ai généré une clé SSH avec ssh-keygen -t ed25519.

J’ai renommé les fichiers par défaut :

ma_cle.pk (clé privée)

ma_cle.pub (clé publique)

J’ai configuré Git pour utiliser ma clé via le fichier ~/.ssh/config.

J’ai ajouté ma clé publique à mon compte GitHub (Settings → SSH Keys).

5️⃣ Changement de l’URL du dépôt vers SSH

Je suis revenu dans le répertoire du cours.

J’ai remplacé l’URL HTTPS du dépôt par une URL SSH avec
git remote set-url origin git@github.com:CollegeBoreal/....

J’ai vérifié que la nouvelle URL fonctionnait correctement.

6️⃣ Finalisation du travail dans le dossier 1.SSH

J’ai créé un dossier portant mon ID Boréal.

J’ai ajouté un fichier README.md dans ce dossier.

J’ai envoyé mon travail final sur GitHub (add → commit → push).

🖼️ Ajout d'une image dans mon README
J’ai ajouté mon image dans mon dossier images et l’ai affichée dans mon README avec :
![Ma photo](images/GettyImages-1653679632-2048x1365.jpg)
 avec
J’ai ajouté mon image dans mon dossier images et l’ai affichée dans mon README avec :
