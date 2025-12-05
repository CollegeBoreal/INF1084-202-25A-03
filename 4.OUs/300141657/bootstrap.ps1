<<<<<<< HEAD:4.OUs/300148450/bootstrap.ps1
$studentNumber = 300148450
$studentInstance = "00"
=======
# vos informations
$studentNumber = 3000141657
$studentInstance = 00
>>>>>>> 527495765984952f9723a6557b47a9b359ab761b:4.OUs/300141657/bootstrap.ps1

$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

$plain = 'Infra@2024'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
<<<<<<< HEAD:4.OUs/300148450/bootstrap.ps1
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)

=======
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)
>>>>>>> 527495765984952f9723a6557b47a9b359ab761b:4.OUs/300141657/bootstrap.ps1
