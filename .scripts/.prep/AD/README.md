

```powershell
$strRemoteForest = "DC300098957.DC300098957-40.local" 
$strRemoteAdmin = "Administrator" 
$strRemoteAdminPassword = "Infra@2024" 
$remoteContext = New-Object `
    -TypeName"System.DirectoryServices.ActiveDirectory.DirectoryContext" `
    -ArgumentList @( "Forest",$strRemoteForest, $strRemoteAdmin, $strRemoteAdminPassword) 
```


```powershell
# Change following parameters 
$strRemoteForest = "forestName1.something" 

$strRemoteAdmin = "adminAccountName" 

$strRemoteAdminPassword = "Heslo@123" 

$remoteContext = New-Object -TypeName"System.DirectoryServices.ActiveDirectory.DirectoryContext" -ArgumentList @( "Forest",$strRemoteForest, $strRemoteAdmin, $strRemoteAdminPassword) 

try { 

$remoteForest =[System.DirectoryServices.ActiveDirectory.Forest]::getForest($remoteContext) 

#Write-Host "GetRemoteForest: Succeeded for domain $($remoteForest)" 

} 

catch { 

Write-Warning "GetRemoteForest: Failed:`n`tError: $($($_.Exception).Message)" 

} 

Write-Host "Connected to Remote forest: $($remoteForest.Name)" 

$localforest=[System.DirectoryServices.ActiveDirectory.Forest]::getCurrentForest() 

Write-Host "Connected to Local forest: $($localforest.Name)" 

try { 

$localForest.CreateTrustRelationship($remoteForest,"Inbound") 

Write-Host "CreateTrustRelationship: Succeeded for domain $($remoteForest)" 

} 

catch { 

Write-Warning "CreateTrustRelationship: Failed for domain$($remoteForest)`n`tError: $($($_.Exception).Message)" 

}
```

# :books: References

- [ ] [Powershell to Create AD Trust](https://www.anujvarma.com/powershell-to-create-ad-trust)
