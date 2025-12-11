# Créer une relation de confiance sortante vers un autre domaine
New-ADTrust -Name "DC300098957-40.local" `
            -SourceForest "DC300098957-90.local" `
            -TargetForest "DC300098957-40.local" `
            -TrustType External `
            -Direction Outbound

# Vérifier les trusts existants
Get-ADTrust -Filter *


netdom trust DC300098957-40.local `
      /domain:DC300098957-90.local /add `
      /userd:DC300098957-90\Administrator /passwordd:Infra@2024 `
      /usero:DC300098957-40\Administrator /passwordo:Infra@2024 

netdom trust DC300098957-40.local /domain:DC300098957-90.local `
    /UserD:Administrator /PasswordD:Infra@2024 `
    /UserO:Administrator /PasswordO:Infra@2024 `
    /Add /OneSide:trusting /TrustType:External

