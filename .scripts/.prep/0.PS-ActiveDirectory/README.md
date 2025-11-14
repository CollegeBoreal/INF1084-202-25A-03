

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

# :books: References

- [ ] [MASTERING ACTIVE DIRECTORY
WITH POWERSHELL](https://adsecurity.org/wp-content/uploads/2015/04/NoVaPowerShellUsersGroup2015-ActiveDirectoryPowerShell.pdf)
