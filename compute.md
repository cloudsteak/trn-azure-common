# Virtuális gépek és compute szolgáltatások

Ebben a fejezetben áttekintjük az Azure virtuális gépeit és compute szolgáltatásait. Megismerheted, hogyan hozhatsz létre, kezelhetsz és méretezhetsz virtuális gépeket, valamint milyen lehetőségek állnak rendelkezésre számítási feladatok futtatására az Azure környezetben. A leírás segít eligazodni az alapvető fogalmakban és a legfontosabb szolgáltatásokban.

## Egyszerű Linux VM létrehozása Azure Portálon keresztül

1. Jelentkezz be az [Azure Portal](https://portal.azure.com) felületére.
2. Keresd meg az "Erőforrás létrehozása" opciót a kezdőlapon.
3. Keress rá a "Virtuális gép" szolgáltatásra, majd kattints a "Létrehozás" gombra.
4. Válaszd ki a kívánt előfizetést és erőforráscsoportot, vagy hozz létre újat.
5. Add meg a virtuális gép nevét, régióját, és válaszd ki a "Linux" operációs rendszert.
6. Válaszd ki a kívánt méretet (pl. Standard B1s).
7. Állítsd be a hitelesítési típust (SSH kulcs vagy jelszó). - javasolt az SSH kulcs használata.
8. Felhasználói név megadása.
9. Lemez konfiguráció (alapértelmezett beállítások általában megfelelőek).
10. Hálózati beállítások ellenőrzése (alapértelmezett beállítások általában megfelelőek).
11. Kattints a "Felülvizsgálat + létrehozás" gombra, majd a "Létrehozás" gombra a folyamat befejezéséhez.
12. Várj, amíg a virtuális gép létrejön, majd csatlakozz hozzá SSH-val a megadott felhasználónév és IP cím segítségével.

Példa ssh parancsra:

- Egyszerűen:

```bash
ssh -i "nyilvanoskulcs.pem" felhasznalonev@ip-cim
```

- Ha a kulcs fájl helye és neve változóban van tárolva:

```bash
# Linux és macOS rendszereken a következő parancsokkal tudsz SSH-val kapcsolódni a virtuális géphez. Ne felejtsd el megadni a kulcs fájl helyét és nevét, valamint a virtuális gép nyilvános IP-címét.
kulcs_fajl="kulcs fájl elértési útja és neve a pem kiterjesztéssel együtt"
chmod 400 "$kulcs_fajl" 2>/dev/null || true
ssh -i "$kulcs_fajl" azureuser@<a virtuális gép nyilvános IP-címe>
```

```powershell
# Windows rendszeren a következő parancsot használhatod PowerShell-ben az SSH kapcsolódáshoz. Ne felejtsd el megadni a kulcs fájl helyét és nevét, valamint a virtuális gép nyilvános IP-címét.
$kulcsFajl = "kulcs fájl elértési útja és neve a pem kiterjesztéssel együtt"
ssh -i $kulcsFajl azureuser@<a virtulis gép nyilvános IP-címe>
```

## Egyéni adatok (Cloud-Init) használata Linux VM létrehozásakor

Az egyéni adatok (custom data) segítségével automatizálhatod a virtuális gép inicializálását és konfigurálását a létrehozás során. Az Azure Linux VM-ek esetében a Cloud-Init egy népszerű eszköz, amely lehetővé teszi, hogy szkripteket és konfigurációs fájlokat adj meg, amelyek a VM első indításakor futnak le.

1. Nginx webszerver

```yaml
#cloud-config
package_update: true
package_upgrade: true
packages:
  - nginx
runcmd:
  - systemctl start nginx
  - systemctl enable nginx
```

Külön fájlban itt is eléred: [cloud-config-nginx-webapp.yaml](./files/cloud-config-nginx-webapp.yaml).

2. Apache webszerver egyedi index.html fájllal

```yaml
#cloud-config
package_update: true
package_upgrade: true
packages:
  - apache2

write_files:
  - path: /tmp/index.html.tpl
    permissions: "0644"
    content: |
      <html><head><style>body{font-family:Verdana,Geneva,Tahoma,sans-serif;margin:0;min-height:100vh;background:radial-gradient(circle at 20% 20%,#4cc9f0,#4361ee 35%,#3a0ca3 70%,#10002b);color:#fff;text-align:center;display:grid;place-items:center}</style></head><body><h1>Web:<br />__HOSTNAME__</h1></body></html>

runcmd:
  - systemctl disable --now nginx || true
  - systemctl enable --now apache2
  - bash -lc 'HOST=$(hostname); sed "s/__HOSTNAME__/$HOST/" /tmp/index.html.tpl > /var/www/html/index.html'
  - chown www-data:www-data /var/www/html/index.html || true
  - chmod 0644 /var/www/html/index.html
```

Külön fájlban itt is eléred: [cloud-config-apache-index-html.yaml](./files/cloud-config-apache-index-html.yaml).
