FROM python:3-alpine

RUN mkdir -p /opt/react_flask_app && \
    mkdir -p /var/log/react_flask_app

COPY react-flask-app/api/requirements.txt /opt/react_flask_app

WORKDIR /opt/react_flask_app

RUN apk update && \
    apk add postgresql-dev gcc musl-dev libffi-dev && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

COPY react-flask-app/api/api.py /opt/react_flask_app
COPY react-flask-app/api/__init__.py /opt/react_flask_app
COPY uwsgi/main_uwsgi.ini /opt/react_flask_app
COPY uwsgi/startscript.sh /opt/react_flask_app

ENTRYPOINT ["./startscript.sh"]