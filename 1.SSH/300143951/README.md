# Mon projet
mon premier commit ssh

## Auteur
- Nom: frank17art
- Identifiant:300143951

  # SSH GitHub - Guide Rapide

## 🔑 Générer la Clé SSH

```powershell
ssh-keygen -t ed25519 -C "votre.email@example.com"
```

Appuyez sur Entrée 2 fois (chemin par défaut + pas de passphrase)

---

## 📋 Copier la Clé Publique

```powershell
cat $env:USERPROFILE\.ssh\id_ed25519.pub | clip
```

---

## 🌐 Ajouter à GitHub

1. **Profil** → **Settings** → **SSH and GPG keys**
2. **New SSH key** → Coller la clé → **Add SSH key**

---

## ✅ Vérifier

```powershell
ssh -T git@github.com
```

**Résultat attendu:**
```
Hi YourUsername! You've successfully authenticated...
```

---

## 🚀 Utiliser SSH

```powershell
# Cloner
git clone git@github.com:user/repo.git

# Configurer Git
git config --global user.name "Nom"
git config --global user.email "email@example.com"

# Push
git add .
git commit -m "Message"
git push origin main
```

---
