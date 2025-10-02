Rename-Computer -NewName "DC300133071" -Restart

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Install-ADDSForest `
    -DomainName "DC300133071_1.local" `
    -DomainNetbiosName "DC300133071_1" `
    -InstallDns:$true `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Cameroon2024&" -AsPlainText -Force) `
    -Force
