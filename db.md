# Adatbázisok és tárolás

Ebben a fejezetben áttekintjük az adatbázisok és tárolási megoldások alapjait, bemutatjuk a legfontosabb típusokat, valamint ismertetjük, hogyan választhatjuk ki a megfelelő technológiát különböző alkalmazási területekre. Megismerkedünk a relációs és nem relációs adatbázisokkal, valamint a felhőalapú tárolási lehetőségekkel is.

## Azure Database for MySQL Flexible Server

Az Azure Database for MySQL Flexible Server egy felügyelt adatbázis-szolgáltatás, amely lehetővé teszi a MySQL adatbázisok egyszerű létrehozását, kezelését és méretezését az Azure felhőben. A Flexible Server rugalmasságot kínál a konfigurációban és a skálázásban, miközben biztosítja a magas rendelkezésre állást és az automatikus biztonsági mentéseket.

1. Jelentkezz be az [Azure Portal](https://portal.azure.com) felületére.
2. Kattints az "Erőforrás létrehozása" gombra a kezdőlapon.
3. A keresőmezőbe írd be, hogy "Azure Database for MySQL Flexible Server", majd válaszd ki a találatok közül.
4. Kattints a "Létrehozás" gombra.
5. Majd válaszd a "Gyors létrehozás" lehetőséget.
6. Add meg a szükséges adatokat:
   - Előfizetés: Válaszd ki az előfizetésed
   - Erőforráscsoport: Válassz egy meglévő erőforráscsoportot, vagy hozz létre újat.
   - Szerver név: Adj meg egy egyedi nevet a szerverednek.
   - Régió: Válaszd ki a kívánt régiót, ahol a szerver létre lesz hozva.
   - Hitelesítési típus:
     - Admin bejelentkezés: Adj meg egy admin felhasználónevet. (pl. dbadmin)
     - Jelszó: Adj meg egy erős jelszót, amely megfelel a biztonsági követelményeknek. (pl. Jelszó: `V7r!pQz#2sLmX9wT`)
   - Számítási feladat típusa: Válaszd ki a kívánt számítási feladat típust (pl. Dev/Test, Standard, Nagyvállalati).
   - Tűzfalszabály hozzáadása a. jelenlegi IP-címhez: Jelöld be ezt a lehetőséget, ha szeretnéd, hogy a jelenlegi IP-címed hozzá legyen adva a tűzfalszabályokhoz.
7. Kattints a "Felülvizsgálat + létrehozás" gombra.
8. Ellenőrizd az összes megadott adatot, majd kattints a "Létrehozás" gombra a szerver létrehozásához.
9. Várj, amíg a szerver létrejön. Ez eltarthat néhány percig.
10. Tölts le a kapcsolódáshoz a tanúsítványt a Beállítások > Hálózatkezelés > SSL-tanúsítvány letöltése menüpont alatt. (https://dl.cacerts.digicert.com/DigiCertGlobalRootG2.crt.pem)

## Csatlakozás DBeaver segítségével

1. Nyisd meg a DBeaver alkalmazást.
2. Kattints a "Database" menüre, majd válaszd a "New Database Connection" lehetőséget.
3. A megjelenő ablakban válaszd ki a "MySQL" adatbázis típust, majd kattints a "Next" gombra.
4. Töltsd ki a következő mezőket:
   - Host: Add meg az Azure Database for MySQL Flexible Server szerver nevét (pl. `szervernev.mysql.database.azure.com`).
   - Port: Hagyd az alapértelmezett 3306 értéken.
   - Database: Hagyd üresn, vagy add meg a használni kívánt adatbázis nevét.
   - Username: Add meg az admin felhasználónevet, amit a szerver létrehozásakor megadtál
   - Password: Add meg a jelszót, amit a szerver létrehozásakor megadtál.
   - A + SSL gombra kattintva állítsd be az SSL kapcsolatot:
     - CA Certificate: Tallózd be a korábban letöltött tanúsítvány fájlt (pl. `DigiCertGlobalRootG2.crt.pem`).
     - A "Client Certificate" és "Client Key" mezőt hagyd üresen, ha nincs szükség kliens tanúsítványra.
5. Kattints a "Test Connection" gombra, hogy ellenőrizd a kapcsolatot.
6. Ha a kapcsolat sikeres, kattints a "Finish" gombra a kapcsolat létrehozásához.
7. Most már böngészheted és kezelheted az adatbázisokat a DBeaver felületén keresztül.

Hozz létre egy új adatbázist a DBeaver-ben:

```sql
CREATE DATABASE elso_adatbazis;
```

Hozz létre egy új táblát az adatbázisban:

```sql
CREATE TABLE felhasznalok (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nev VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    letrehozas_datuma TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Adatok beszúrása a táblába:

```sql
INSERT INTO felhasznalok (nev, email) VALUES ('Kovács János', 'janos.kovacs@example.com');
INSERT INTO felhasznalok (nev, email) VALUES ('Nagy Éva', 'eva.nagy@example.com');
```

Adatok lekérdezése a táblából:

```sql
SELECT * FROM felhasznalok;
```
