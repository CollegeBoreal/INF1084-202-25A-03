 Install-WindowsFeature RSAT-AD-PowerShell

 Install-WindowsFeature AD-Domain-Services

 Install-WindowsFeature RSAT-ADDS

 Install-WindowsFeature RSAT-AD-Tools

 Import-Module ActiveDirectory

netdom trust DC300142072-50.local /Domain:DC300144176-01.local `
    /UserD:administrator /PasswordD:* /Add /Realm /TwoWay

domain.msc

Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("10.7.236.201","10.7.236.203")

Get-ADDomain -Server DC300144176-01.local -Credential $cred
