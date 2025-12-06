# Vérifier le trust
netdom trust DC300151825-00.local /Domain:DC300153476-00.local /Verify

# Vérifier DNS
Resolve-DnsName DC300153476-00.local

# Vérifier les trusts via NLTEST
nltest /domain_trusts
