FROM nginx

LABEL maintainer="Sergio Santacruz <sisantacruzm@gmail.com>"

RUN apt-get update \
    && apt-get install curl -y

ADD /nginx.conf /etc/nginx/nginx.conf
ADD /fastcgi_params /etc/nginx/fastcgi_params
ADD /mime.types /etc/nginx/mime.types
ADD /h5bp /etc/nginx/h5bp

RUN mkdir /etc/nginx/logs
RUN touch /etc/nginx/logs/static.log

RUN mkdir /tmp/nginx && mkdir /tmp/nginx/osrm

RUN rm -f /etc/nginx/conf.d/*
ADD /*.site.conf /etc/nginx/conf.d/
EXPOSE 80 443