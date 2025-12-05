Set-Content -Path .\script.ps1 -Value @"
Import-Module ActiveDirectory

$studentNumber = 300152260
$studentInstance = "00"
$partnerStudentNumber = 300148094
$partnerInstance = "00"

$LocalDomainShort = "DC$studentNumber-$studentInstance"
$LocalForestDNS = "$LocalDomainShort.local"
$LocalDCName = "DC$studentNumber"
$LocalDCFQDN = "$LocalDCName.$LocalForestDNS"

$RemoteDomainShort = "DC$partnerStudentNumber-$partnerInstance"
$RemoteForestDNS = "$RemoteDomainShort.local"
$RemoteDCName = "DC$partnerStudentNumber"
$RemoteDCFQDN = "$RemoteDCName.$RemoteForestDNS"

$credLocal = Get-Credential -Message "Compte Admin de la forêt locale"
$credAD2 = Get-Credential -Message "Compte Admin de AD2"

Test-Connection -ComputerName $RemoteDCFQDN -Count 2
Resolve-DnsName $RemoteForestDNS -ErrorAction SilentlyContinue

Get-ADDomain -Server $RemoteDCFQDN -Credential $credAD2
Get-ADUser -Filter * -Server $RemoteDCFQDN -Credential $credAD2 -ResultSetSize 5

New-PSDrive -Name AD2 -PSProvider ActiveDirectory -Root "" -Server $RemoteDCFQDN -Credential $credAD2
Set-Location AD2:\
Get-ChildItem
Set-Location C:\

New-ADTrust -Name $RemoteForestDNS -SourceForest $LocalForestDNS -TargetForest $RemoteForestDNS -Forest -Direction Bidirectional -TrustType Forest -Authentication ForestWide -Credential $credLocal -Confirm:$false

Get-ADTrust -Server $LocalDCFQDN
Test-ADTrustRelationship -Source $LocalForestDNS -Target $RemoteForestDNS
nltest /domain_trusts
"@
