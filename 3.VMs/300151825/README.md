#300151825 #J'ai renommer le nom de la machine '''powershell Rename-Computer -NewName "DC300151825" -Restart '''

#Installer le rôle AD DS 
'''powershell Install-WindowsFeature AD-Domain-Services -IncludeManagementTools 
'''

#Resultat #Success Restart Needed Exit Code Feature Result

True No Success {Active Directory Domain Services, Group P...

Install-ADDSForest -DomainName "DC300151825.local" -DomainNetbiosName "DC300151825" -InstallDns:$true -SafeModeAdministratorPassword (ConvertTo-SecureString "MotDePasseDSRM123!" -AsPlainText -Force) ` -Force
