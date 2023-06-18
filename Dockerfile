# syntax-docker/dockerfile:1

FROM python:3.11-slim AS builder

# This is neccesary step for psycopg2 to function in slim image
RUN apt-get update && \
    apt-get install -y libpq-dev gcc

# Create virtual environment
RUN python -m venv /opt/venv
# Activate venv
ENV PYTHONDONTWRITEBYTECODE=1\
    PYTHONUNBUFFERED=1\
    PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app

COPY . /app/

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]