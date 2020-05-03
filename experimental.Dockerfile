# syntax = docker/dockerfile:experimental
FROM jupyter/minimal-notebook
COPY requirements.txt requirements.txt
USER root
RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt --cache-dir /root/.cache/pip
COPY . .
RUN pip install -e .
WORKDIR /notebooks
RUN chown 1000:100 .
USER 1000