🔑 Gestion de la clé SSH – TP INF1084

Zakaria djellouli 300150433

🅰️ 1. Renommer les fichiers SSH

Je suis allé dans le répertoire SSH :

cd ~/.ssh


Renommage des fichiers :

mv id_ed25519    ma_cle.pk
mv id_ed25519.pub ma_cle.pub


👉 La clé privée s’appelle maintenant ma_cle.pk
👉 La clé publique s’appelle ma_cle.pub

📝 2. Configuration du client SSH

J’ai édité le fichier de configuration SSH :

nano ~/.ssh/config




📌 Cela permet à Git d’utiliser automatiquement ma clé privée pour se connecter à GitHub.

🌐 3. Ajout de la clé publique sur GitHub

J’ai affiché ma clé publique :

cat ~/.ssh/ma_cle.pub


Puis je l’ai ajoutée dans :
GitHub → Settings → SSH and GPG Keys → New SSH key

🔄 4. Mise à jour de l’URL distante du dépôt du cours

Je suis revenu dans le répertoire du cours :

cd ~/Developer/INF1084-202-25A-03/1.SSH


Changement de l’URL distante vers SSH :

git remote set-url origin git@github.com:CollegeBoreal/INF1084-202-25A-03.git


Vérification :

git remote --verbose


Résultat :

origin  git@github.com:CollegeBoreal/INF1084-202-25A-03.git (fetch)
origin  git@github.com:CollegeBoreal/INF1084-202-25A-03.git (push)

📄 5. Création du répertoire et du README associé

Dans le répertoire 1.SSH, j’ai créé un dossier portant mon identifiant Boréal :

mkdir 300150433
cd 300150433


Création du README :

nano README.md


Envoi du fichier vers GitHub :

git add 300150433/README.md
git commit -m "	Ajout du README.md dans 1.SSH pour mon ID Boreal"
git push

✅ Travail complété

Ce TP m’a permis de :

Renommer et organiser mes clés SSH

Configurer SSH pour GitHub

Modifier l’URL du dépôt en mode SSH

Créer et versionner un fichier README
