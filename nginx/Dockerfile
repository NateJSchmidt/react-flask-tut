FROM nginx:alpine

COPY certs/cert.pem /certs/cert.pem
COPY certs/key.pem /certs/key.pem

COPY react-flask-app/build /opt/react/build

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.ORIG

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf