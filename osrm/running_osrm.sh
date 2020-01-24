#!/bin/bash
#
# Activación OSRM de acuerdo con variable de entorno creada
#

echo "Varialbes Entorno del Sistema"
printenv

if [ $MAP_FOR_COUNTRY = true ]; then
    SELECT_MAP=${COUNTRY_NAME}
    echo "Se habilita OSRM par \$SELECT_MAP"
fi

if [ $MAP_FOR_COUNTRY = false ]; then
    SELECT_MAP=${REGIONAL_NAME}
    echo "Se habilita OSRM par \$SELECT_MAP"
fi

echo "Inicia el servicio del OSRM para \$SELECT_MAP"
bash -c "osrm-routed --algorithm ch --max-table-size=100000 --max-viaroute-size=1000 --max-matching-size 1000 /data/\$SELECT_MAP.osrm"