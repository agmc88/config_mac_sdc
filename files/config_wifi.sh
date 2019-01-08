#!/bin/bash

#########################################################
#                                                       #
#   Le script permet de vérrouiller les accès au wifi   #
#                                                       #
#########################################################


# On vérifie que la commande airport existe dans le $PATH sinon on créé le lien symbolique
if [ !$(which airport) ];then
    sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/bin/airport 2> /dev/null
    if [ $? -ne 0 ];then
        cd /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/
        # echo "Change directory"
    else
        echo "Link created."
    fi
else
    exit 2
fi

# Modification des preferences systemes
sudo ./airport prefs RememberRecentNetworks=YES         # Enregistrer les reseaux
echo "RememberRecentNetworks modifié"
sudo ./airport prefs RequireAdminPowerToggle=YES        # Active ou désactive le wifi
echo "RequireAdminPowerToggle modifié"
sudo ./airport prefs RequireAdminNetworkChange=YES      # Demande le mot de passe Admin pour changer le réseau wifi
echo "RequireAdminNetworkChange modifié"
sudo ./airport prefs RequireAdminIBSS=YES               # Creation de nouveaux réseaux
echo "RequireAdminIBSS modifié"
