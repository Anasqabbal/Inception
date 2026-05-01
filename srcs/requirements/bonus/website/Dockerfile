FROM alpine:3.21

RUN apk update && apk upgrade

RUN apk add nginx --no-cache

COPY nginx.conf /etc/nginx/http.d/

COPY images/ fonts/ index.html style.css /var/www/html/

CMD ["nginx", "-g", "daemon off;"]
