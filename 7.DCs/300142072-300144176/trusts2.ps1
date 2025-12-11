Install-WindowsFeature RSAT-AD-PowerShell

 Install-WindowsFeature AD-Domain-Services

 Install-WindowsFeature RSAT-ADDS

 Install-WindowsFeature RSAT-AD-Tools

 Import-Module ActiveDirectory

netdom trust DC300144175-01.local /Domain:DC300142072-50.local `
    /UserD:administrator /PasswordD:* /Add /Realm /TwoWay

domain.msc

Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("10.7.236.203","10.7.236.201")

Get-ADDomain -Server DC300142072-50.local -Credential $cred
