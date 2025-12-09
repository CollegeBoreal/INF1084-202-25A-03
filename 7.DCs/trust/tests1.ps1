# ==================================================
# Script simplifié de test du Realm Trust (temps réel)
# ==================================================

# Paramètres
$TrustedDomain = "ATHENA"
$DCName = "dc300098957-40.local"

Write-Host "================ Realm Trust Test ================"

# 1️⃣ Vérification DNS
Write-Host "`n[1] Testing DNS resolution..."
try {
    $dns = Resolve-DnsName $DCName -ErrorAction Stop
    Write-Host "DNS resolution for $DCName : OK ($($dns.IPAddress))"
} catch {
    Write-Host "DNS resolution for $DCName : FAIL ($_ )"
}

# 2️⃣ Vérification ports Kerberos et LDAP
$Ports = @{ "Kerberos"=88; "LDAP"=389 }
foreach ($port in $Ports.Keys) {
    Write-Host "`n[2] Testing $port port..."
    try {
        $result = Test-NetConnection -ComputerName $DCName -Port $Ports[$port] -InformationLevel Quiet
        if ($result) {
            Write-Host "$port port connectivity to $DCName : OK"
        } else {
            Write-Host "$port port connectivity to $DCName : FAIL"
        }
    } catch {
        Write-Host "$port port connectivity to $DCName : FAIL ($_ )"
    }
}

# 3️⃣ Vérification du trust
Write-Host "`n[3] Checking trusted domains..."
try {
    $trusts = nltest /trusted_domains
    if ($trusts -match $TrustedDomain) {
        Write-Host "Trusted domain $TrustedDomain exists : OK"
    } else {
        Write-Host "Trusted domain $TrustedDomain exists : FAIL"
    }
} catch {
    Write-Host "Trusted domain $TrustedDomain exists : FAIL ($_ )"
}

Write-Host "`n================ End of Test ================"
