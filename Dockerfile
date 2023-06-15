# syntax-docker/dockerfile:1
FROM python:alpine3.14
WORKDIR /app

COPY . .
RUN pip3 install -r requirements.txt

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]