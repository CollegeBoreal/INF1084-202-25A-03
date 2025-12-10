# vos informations
$studentNumber = 300141716
$studentInstance = 00

# les noms respectifs
$domainName = "DC$studentNumber-$studentInstance.local"
$netbiosName = "DC$studentNumber-$studentInstance"

# CORRECTION ICI - utilisez Maroc@2025
$plain = 'Maroc@2025'
$secure = ConvertTo-SecureString $plain -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)
