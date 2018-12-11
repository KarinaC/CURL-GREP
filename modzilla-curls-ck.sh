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


for tag in $TAGS;
do
  #if echo $QUERY | grep -e $tag;

  if [[ $( echo $QUERY | grep 'artist' ) = *artist* ]]; then
     echo "Found a Tomcat!"
  fi

    #  then
    #     echo "tag not present"
    #  else
    #     echo "ok response"
  #fi
done
						             
