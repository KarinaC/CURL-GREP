#!/bin/bash

###############################################################
# Creador: Karina Cost
# Fecha creación: Diciembre 10 - 2018
# Curl simple para obtener respuesta de endpoints de MODZILLA
###############################################################

#######################
# LISTA DE PARAMETROS #
#######################

BASEURL="http://radio.api.mobzilla.com/"
ENDPOINT=
TAGS=


##################################################################################################
# De acuerdo al valor de $1 (endpoint) se setearan el "ENDPOINT" y sus "TAGS" según corresponda. #
##################################################################################################

case "$1" in
'DARSTATIONS')
EPNAME="DARSTATIONS"
ENDPOINT="darstations.php?country=MX&city=Acapulco&state=GR&exact=1&partner_token=6415943370"
TAGS="dial|band|city|state|country|ubergenre|bitrate|encoding"
;;
'RECO')
EPNAME="RECO"
ENDPOINT="reco.php?songartist=METALLICA"
TAGS="callsign|dial|band|city|state|zipcode|phone|email|language|status"
;;
'PLAYLIST')
EPNAME="PLAYLIST"
ENDPOINT="playlist.php?q=U2"
TAGS="callsing|genre|band|artist|songstamp|seconds|station_id"
;;
'RECO-v2')
EPNAME="RECO-v2"
ENDPOINT="reco2.php?artist=jamiroquai&partner_token=6415943370"
TAGS="songartist|songtitle|currently_playing|station_id|band|title|websiteurl"
;;
'TOPSONGS')
EPNAME="TOPSONGS"
ENDPOINT="topsongs.php?q=Music&page_size=10"
TAGS="songtitle|songartist|currently_playing|callsign|station_id"
;;
'UBERGUIDE')
EPNAME="UBERGUIDE"
ENDPOINT="uberguide.php?partner_token=6415943370&callback=?"
TAGS="showgenre|showname|showid|imageurl"
;;
'UBERURL')
EPNAME="UBERURL"
ENDPOINT="uberurl.php?showinfo_id=RSS_8660&partner_token=6415943370"
TAGS="url|encoding|callsign|websiteurl"
;;
'')
echo "El script requiere de 1 variable, favor de agregarla"
exit
;;
*)
echo "Solo se aceptan los valores: 'DARSTATIONS, PLAYLIST, RECO, RECO-v2, TOPSONGS, UBERGUIDE, UBERURL'" 
exit
;;
esac


##############
### SCRIPT ###
##############

QUERY=`curl --silent "$BASEURL$ENDPOINT"`


if [[ -n $( echo $QUERY | egrep "$TAGS" )  ]]; then
     echo "Tags for $EPNAME found OK"
   else
     echo "Tags for $EPNAME not found, NOTOK"
fi

