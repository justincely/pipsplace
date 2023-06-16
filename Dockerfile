# syntax-docker/dockerfile:1

FROM python:3.11-slim AS builder

# This is neccesary step for psycopg2 to function in slim image
RUN apt-get update && \
    apt-get install -y libpq-dev gcc

# Create virtual environment
RUN python -m venv /opt/venv
# Activate venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt


# Operational stage
FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Get venv from bulider stage
COPY --from=builder /opt/venv /opt/venv

ENV PYTHONDONTWRITEBYTECODE=1\
    PYTHONUNBUFFERED=1\
    PATH="/opt/venv/bin:$PATH"

WORKDIR /app

COPY . /app/

# ---------------------------
# This was previously the working dockerfile:
# FROM python:alpine3.14
# ENV PYTHONUNBUFFERED 1

# WORKDIR /app

# COPY . .
# RUN pip3 install -r requirements.txt
# --------------------------------------

# This CMD is being run in the docker-compose file
# CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]