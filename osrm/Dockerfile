FROM osrm/osrm-backend

LABEL maintainer="Sergio Santacruz <sergio.santacruz@smartquick.com.co>"

COPY ./running_osrm.sh /temp/running_osrm.sh
WORKDIR /data

RUN apt-get update && \
    apt-get install curl -y

# Environment Variables
ARG ARG_MAP_FOR_COUNTRY=true
ENV MAP_FOR_COUNTRY=${ARG_MAP_FOR_COUNTRY}

ARG ARG_REGIONAL_NAME=south-america
ENV REGIONAL_NAME=${ARG_REGIONAL_NAME}

ARG ARG_COUNTRY_NAME=colombia-latest
ENV COUNTRY_NAME=${ARG_COUNTRY_NAME}

RUN printenv

# Change settings for country
RUN if [ ${MAP_FOR_COUNTRY} = true ]; then \    
    curl -o ${COUNTRY_NAME}.osm.pbf http://download.geofabrik.de/${REGIONAL_NAME}/${COUNTRY_NAME}.osm.pbf && \
        osrm-extract -p /opt/car.lua /data/${COUNTRY_NAME}.osm.pbf && \
        osrm-contract /data/${COUNTRY_NAME}.osrm \ 
;fi

# Change settings for regional
RUN if [ ${MAP_FOR_COUNTRY} = false ]; then \
    curl -o ${REGIONAL_NAME}.osm.pbf http://download.geofabrik.de/${REGIONAL_NAME}.osm.pbf && \
        osrm-extract -p /opt/car.lua /data/${REGIONAL_NAME}.osm.pbf && \
        osrm-contract /data/${REGIONAL_NAME}.osrm \
;fi


EXPOSE 5000