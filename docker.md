# Docker megoldások

A modern alkalmazásfejlesztésben egyre nagyobb szerepet kapnak a konténertechnológiák, amelyek lehetővé teszik az alkalmazások gyors, rugalmas és hordozható futtatását. A Docker az egyik legnépszerűbb eszköz ezen a területen, amely egyszerűsíti a fejlesztési, tesztelési és üzemeltetési folyamatokat. Ebben a fejezetben megismerkedhetsz a Docker alapjaival, előnyeivel, valamint gyakorlati példákon keresztül bemutatjuk, hogyan használhatod a Dockert különböző alkalmazási környezetekben.

## Tárolópéldány létrehozása és futtatása

1. Nyisdmeg az Azure Portal-t és jelentkezz be.
2. Kattints az "Erőforrás létrehozása" gombra.
3. A keresőmezőbe írd be, hogy "Tárolópéldány", majd válaszd ki a találatok közül.
4. Kattints a "Létrehozás" gombra.
5. Add meg a szükséges adatokat:
   - Előfizetés: Válaszd ki az előfizetésed
   - Erőforráscsoport: Válassz egy meglévő erőforráscsoportot, vagy hozz létre újat.
   - Tárolópéldány neve: Adj meg egy egyedi nevet a tárolópéldányodnak.
   - Régió: Válaszd ki a kívánt régiót, ahol a tárolópéldány létre lesz hozva.
   - Kép forrása: Válaszd a "Egyéb regisztrációs adatbázis" lehetőséget.
   - Kép: Add meg a Docker Hub-on vagy egyéni regisztrációs adatbázisban található kép nevét (pl. `httpd:latest`).
   - Operációs rendszer típusa: Válaszd a "Linux" lehetőséget.
6. Kattints a "Felülvizsgálat + létrehozás" gombra.
7. Ellenőrizd az összes megadott adatot, majd kattints a "Létrehozás" gombra a tárolópéldány létrehozásához.
8. Várj, amíg a tárolópéldány létrejön. Ez eltarthat néhány percig.
9. Miután a tárolópéldány létrejött, navigálj a tárolópéldány oldalára az Azure Portal-on.
10. másold ki a "Nyilvános IP-cím" értékét, amelyet a tárolópéldány eléréséhez használhatsz.
11. Nyisd meg a böngészőt, és írd be a másolt IP-címet a címsorba. Ha mindent helyesen állítottál be, akkor látnod kell az Apache HTTP Server alapértelmezett üdvözlő oldalát. Fontos, hogy használj **http** protokollt, különben nem fog működni.
