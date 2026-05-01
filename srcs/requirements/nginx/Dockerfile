FROM alpine:3.21

ARG DOMAIN_NAME

RUN apk update && apk add --no-cache nginx openssl

COPY conf/nginx.conf /etc/nginx/http.d/

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/ssl/${DOMAIN_NAME}.key \
    -x509 -days 365 -out /etc/nginx/ssl/${DOMAIN_NAME}.crt \
    -subj "/C=MA/ST=Casablanca-Settat/L=khouribga/O=1337/CN=${DOMAIN_NAME}"

ENTRYPOINT ["nginx", "-g", "daemon off;"]
