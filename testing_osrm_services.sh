#!/bin/bash

counter=$1

echo -e "====================================== INICIANDO PROCESO =================================================\n"

while [ $counter -gt 0 ]
do
   counter=$(( $counter - 1 ))
   
   echo "Realizando consumo ENPOINT Colombia No. $counter"
   #curl -s -o /dev/null -w "%{http_code}" https://osrm_col.smartquick.com.co/route/v1/driving/-74.120937,4.680123\;-74.053248,4.657673\?overview\=full\&geometries\=geojson
   seq 1 1000 | xargs -n1 -P2 bash -c 'i=$0; url="https://osrm_col.smartquick.com.co/route/v1/driving/-74.120937,4.680123;-74.053248,4.657673?overview=full&geometries=geojson"; curl -O -s $url'
   echo -e "...\n"
   
   echo "Realizando consumo ENPOINT Chile No. $counter"
   #curl -s -o /dev/null -w "%{http_code}" "https://osrm_chi.smartquick.com.co/route/v1/driving/-70.59917449951172,-33.43616876229167;-70.75332641601562,-33.47082868794894;-70.61307907104492,-33.492448315696066;-70.6753921508789,-33.509196237139584?overview=full&geometries=geojson"
   seq 1 1000 | xargs -n1 -P2 bash -c 'i=$0; url="https://osrm_chi.smartquick.com.co/route/v1/driving/-70.59917449951172,-33.43616876229167;-70.75332641601562,-33.47082868794894;-70.61307907104492,-33.492448315696066;-70.6753921508789,-33.509196237139584?overview=full&geometries=geojson"; curl -O -s $url'
   echo -e "...\n"

   echo "Realizando consumo ENPOINT Mexico No. $counter"
   #curl -s -o /dev/null -w "%{http_code}" "https://osrm_mex.smartquick.com.co/route/v1/driving/-99.13032531738281,19.438104390859518;-99.16191101074219,19.37819888333254;-99.16328430175781,19.454938719968595;-99.06200408935547,19.34451259313879?overview=full&geometries=geojson"
   seq 1 1000 | xargs -n1 -P2 bash -c 'i=$0; url="https://osrm_mex.smartquick.com.co/route/v1/driving/-99.13032531738281,19.438104390859518;-99.16191101074219,19.37819888333254;-99.16328430175781,19.454938719968595;-99.06200408935547,19.34451259313879?overview=full&geometries=geojson"; curl -O -s $url'

   echo -e "...\n"

   echo -e "=======================================================================================================\n"
done
echo "Finalizado el proceso"