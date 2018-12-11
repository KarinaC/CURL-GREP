#!/bin/bash 
###############################################################
# Creador: Karina Cost
# Fecha creación: Diciembre 10 - 2018
# Curl simple para obtener respuesta de endpoints de MODZILLA
###############################################################

BASEURL="http://radio.api.mobzilla.com/"
ENDPOINT=$1
TAGS=$2


##############
### SCRIPT ###
##############

QUERY=`curl --silent "$BASEURL$ENDPOINT"`


if [[ -n $( echo $QUERY | egrep "$TAGS" )  ]]; then
     echo "Tags found OK"
  else
     echo "Tags not found, NOTOK"
fi

