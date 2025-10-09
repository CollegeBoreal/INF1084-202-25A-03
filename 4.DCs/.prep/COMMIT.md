```mermaid
flowchart TD
    subgraph DepotDistant[Branche principale sur GitHub - main]
        A[main]
    end

    subgraph Etudiant[Workflow etudiant]
        B1[git fetch origin]
        B2[git checkout -b etudiant-<nom>]
        B3[Modifier les fichiers localement]
        B4[git add .]
        B5[git commit -m "Modifications de README par <nom>"]
        B6[git rebase origin/main]
        B7[Resoudre les conflits si necessaire]
        B8[git push origin etudiant-<nom>]
        B9[Ouvrir une Pull Request vers main]
    end

    A -->|Recuperer les dernieres modifications| B1
    B1 --> B2
    B2 --> B3
    B3 --> B4
    B4 --> B5
    B5 --> B6
    B6 --> B7
    B7 --> B8
    B8 --> B9
    B9 -->|Merge de la PR| A
```
