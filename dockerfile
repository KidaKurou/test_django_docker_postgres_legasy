#FROM --platform=$BUILDPLATFORM python:3.7-alpine AS builder
#EXPOSE 8000
#COPY service /service
#WORKDIR /service
#COPY requirements.txt /temp/requirements.txt
#RUN apk add postgresql-client build-base postgresql-dev
#RUN pip3 install -r /temp/requirements.txt --no-cache-dir
#RUN adduser --disabled-password service-user
#USER service-user
#COPY service /service
#ENTRYPOINT ["python3"]
#CMD ["manage.py", "runserver", "0.0.0.0:8000"]

FROM python:3.9.17-alpine3.17

COPY requirements.txt /temp/requirements.txt

RUN apk add postgresql-client build-base postgresql-dev
RUN pip install -r /temp/requirements.txt --no-cache-dir
RUN adduser --disabled-password service-user
USER service-user

COPY service /service
WORKDIR /service
EXPOSE 8080