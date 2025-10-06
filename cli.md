# Azure Cli

Az Azure CLI (Command-Line Interface) egy hatékony eszköz, amely lehetővé teszi az Azure felhőszolgáltatások kezelését közvetlenül parancssorból. Segítségével automatizálhatók a feladatok, gyorsan elvégezhetők az erőforrásokkal kapcsolatos műveletek, és egyszerűen integrálható más fejlesztői folyamatokba. Ez a dokumentáció bemutatja az Azure CLI telepítését és alapvető használatát.

## Telepítés

Az Azure CLI egy parancssori eszköz, amely lehetővé teszi az Azure erőforrások kezelését közvetlenül a terminálból. A telepítési lépések operációs rendszerenként eltérőek, az alábbiakban részletesen bemutatjuk a Windows, Linux és MacOS rendszerekre vonatkozó telepítési folyamatot.

### Windows

1. Nyisd meg a böngészőt és látogass el az [Azure CLI letöltési oldalára](https://learn.microsoft.com/hu-hu/cli/azure/install-azure-cli-windows).
2. Kattints a "Download" gombra, majd futtasd a letöltött `AzureCLI.msi` telepítőfájlt.
3. Kövesd a telepítő utasításait, majd a telepítés végén indítsd újra a parancssort.
4. Ellenőrizd a telepítést a következő paranccsal:
    ```powershell
    az --version
    ```

### Linux

1. Nyisd meg a terminált.
2. Futtasd az alábbi parancsokat a telepítéshez (Ubuntu/Debian esetén):
    ```bash
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    ```
    Más disztribúciókhoz lásd az [Azure CLI Linux telepítési útmutatót](https://learn.microsoft.com/hu-hu/cli/azure/install-azure-cli-linux).
3. Ellenőrizd a telepítést:
    ```bash
    az --version
    ```

### MacOS

1. Nyisd meg a Terminal alkalmazást.
2. Telepítsd az Azure CLI-t Homebrew segítségével:
    ```bash
    brew update && brew install azure-cli
    ```
3. Ellenőrizd a telepítést:
    ```bash
    az --version
    ```
