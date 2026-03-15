kulcs_fajl="kulcs fájl elértési útja és neve a pem kiterjesztéssel együtt"
chmod 400 $kulcs_fajl
ssh -i $kulcs_fajl azureuser@<a virtuális gép nyilvános IP-címe>