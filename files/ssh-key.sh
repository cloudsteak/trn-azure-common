# Linux és macOS rendszereken a következő parancsokkal tudsz SSH-val kapcsolódni a virtuális géphez. Ne felejtsd el megadni a kulcs fájl helyét és nevét, valamint a virtuális gép nyilvános IP-címét.
kulcs_fajl="kulcs fájl elértési útja és neve a pem kiterjesztéssel együtt"
chmod 400 "$kulcs_fajl" 2>/dev/null || true
ssh -i "$kulcs_fajl" azureuser@<a virtuális gép nyilvános IP-címe>

# Windows rendszeren a következő parancsot használhatod PowerShell-ben az SSH kapcsolódáshoz. Ne felejtsd el megadni a kulcs fájl helyét és nevét, valamint a virtuális gép nyilvános IP-címét.
$kulcsFajl = "kulcs fájl elértési útja és neve a pem kiterjesztéssel együtt"
ssh -i $kulcsFajl azureuser@<a virtulis gép nyilvános IP-címe>
