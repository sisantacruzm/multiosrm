FROM osrm/osrm-backend

LABEL maintainer="Sergio Santacruz <sisantacruzm@gmail.com>"

WORKDIR /data

ARG REGIONAL_NAME=south-america

ARG COUNTRY_NAME=colombia-latest

RUN apt-get update && apt-get install curl -y

RUN curl -o ${COUNTRY_NAME}.osm.pbf http://download.geofabrik.de/${REGIONAL_NAME}/${COUNTRY_NAME}.osm.pbf

RUN osrm-extract -p /opt/car.lua /data/${COUNTRY_NAME}.osm.pbf

RUN osrm-contract /data/${COUNTRY_NAME}.osrm

EXPOSE 5000