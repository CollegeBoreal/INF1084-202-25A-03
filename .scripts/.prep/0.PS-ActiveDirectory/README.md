

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

Le prompt `PowerShell` changera à 
> PS AD:\> 

set-location "DC=LABINFO,DC=LOCAL"
PS AD:\DC=LABINFO,DC=LOCAL> set-location $HOME
PS C:\Users\300098957> get-ADDomain


```bash
ls ad:
```
<details>

```lua
Name                 ObjectClass          DistinguishedName
----                 -----------          -----------------
Infrastructure       infrastructureUpdate CN=Infrastructure,DC=ForestDnsZones,DC=LABINFO,DC=LOCAL
LostAndFound         lostAndFound         CN=LostAndFound,DC=ForestDnsZones,DC=LABINFO,DC=LOCAL
MicrosoftDNS         container            CN=MicrosoftDNS,DC=ForestDnsZones,DC=LABINFO,DC=LOCAL
NTDS Quotas          msDS-QuotaContainer  CN=NTDS Quotas,DC=ForestDnsZones,DC=LABINFO,DC=LOCAL
```

</details>

# :books: References

- [ ] [MASTERING ACTIVE DIRECTORY
WITH POWERSHELL](https://adsecurity.org/wp-content/uploads/2015/04/NoVaPowerShellUsersGroup2015-ActiveDirectoryPowerShell.pdf)
- [ ] [How to Install and Import Active Directory PowerShell Module](https://www.varonis.com/blog/powershell-active-directory-module)
