# Création du trust Realm bidirectionnel
netdom TRUST DC300151825-00.local `
    /Domain:DC300153476-00.local `
    /UserO:Administrator `
    /PasswordO:* `
    /UserD:Administrator `
    /PasswordD:* `
    /Add `
    /Realm `
    /Twoway
