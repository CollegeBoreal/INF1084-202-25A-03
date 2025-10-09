
Rename-Computer -NewName "DC300150562" -Restart : renommer 
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools : installer AD-domaine
Install-ADDSForest `
    -DomainName "DC300150562-00.local" `
    -DomainNetbiosName "DC300150562-00" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) `
    -Force : crrer nouvel foret avec mon id 
