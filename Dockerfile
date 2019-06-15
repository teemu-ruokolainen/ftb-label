# Use an official Python runtime as a parent image
FROM python:3.6-slim

# Run apt-get
RUN apt-get update -y && apt-get install -y \
    build-essential \
    clang \
    wget \
    git

# Copy files to /app/ in container
COPY requirements.txt /app/
COPY src /app/src

# Change working dir
WORKDIR /app

# Install packages in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Install ftb-label
RUN git clone https://github.com/mpsilfve/FinnPos
WORKDIR /app/FinnPos
RUN make && make install
RUN wget https://github.com/mpsilfve/FinnPos/releases/download/v0.1-alpha/morphology.omor.hfst.gz && gunzip morphology.omor.hfst.gz && mv morphology.omor.hfst ./share/finnpos/omorfi/
RUN make && make ftb-omorfi-tagger && make install && make install-models

# Change working dir again
WORKDIR /app

COPY entrypoint.sh /app/

# Entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
CMD []
