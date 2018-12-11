#!/bin/bash 
###############################################################
# Creador: Karina Cost
# Fecha creación: Diciembre 10 - 2018
# Curl simple para obtener respuesta de endpoints de MODZILLA
###############################################################

BASEURL="http://radio.api.mobzilla.com/"
ENDPOINT=$1
TAGS="callsing genre band artist songstamp seconds station_id"


##############
### SCRIPT ###
##############

QUERY=`curl --silent "$BASEURL$ENDPOINT"`


if [[ -n $( echo $QUERY | egrep "callsing|genre|band|artist|songstamp|seconds|station_id" )  ]]; then
     echo "Tags found OK"
  else
     echo "Tags not found, NOTOK"
fi

