

### 🪗 [Gathering AD Data with the Active Directory PowerShell Module](https://adsecurity.org/?p=3719)

```powershell
import-module ActiveDirectory
```

```powershell
dir ad:
```
<details>

```lua
Name                 ObjectClass          DistinguishedName
----                 -----------          -----------------
LABINFO              domainDNS            DC=LABINFO,DC=LOCAL
Configuration        configuration        CN=Configuration,DC=LABINFO,DC=LOCAL
Schema               dMD                  CN=Schema,CN=Configuration,DC=LABINFO,DC=LOCAL
DomainDnsZones       domainDNS            DC=DomainDnsZones,DC=LABINFO,DC=LOCAL
ForestDnsZones       domainDNS            DC=ForestDnsZones,DC=LABINFO,DC=LOCAL
```

</details>


```powershell
set-location ad: # ou cd ad:
```

> PS AD:\> 

set-location "DC=LABINFO,DC=LOCAL"
PS AD:\DC=LABINFO,DC=LOCAL> set-location $HOME
PS C:\Users\300098957> get-ADDomain

# :books: References

- [ ] [MASTERING ACTIVE DIRECTORY
WITH POWERSHELL](https://adsecurity.org/wp-content/uploads/2015/04/NoVaPowerShellUsersGroup2015-ActiveDirectoryPowerShell.pdf)
