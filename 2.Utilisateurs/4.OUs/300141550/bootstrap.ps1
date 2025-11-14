 # vos informations
>> $studentNumber = 300141550
>> $studentInstance = 00
>>
>> # les noms respectifs
>> $domainName = "DC$300141550-$0.local"
>> $netbiosName = "DC$300141550-$0"
>>
>> # les informations de sécurité
>> $plain = 'Infra@2024'
>> $secure = ConvertTo-SecureString $plain -AsPlainText -Force
>> $cred = New-Object System.Management.Automation.PSCredential("Administrator@$domainName", $secure)
