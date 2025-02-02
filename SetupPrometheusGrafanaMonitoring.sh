#!/bin/bash
# run these commands from the after cloning and editing the files - same commands in README.md.

sudo apt-get update
sudo apt-get install docker.io
cd ../prometheus
sudo docker volume create prometheus-data
sudo docker run --name prometheus \
    -p 9090:9090 \
    -d \
    -v /home/ubuntu/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    -v prometheus-data:/prometheus \
    prom/prometheus

sudo docker volume create grafana-storage

sudo docker run -d -p 3000:3000 --name=grafana \
  --volume grafana-storage:/var/lib/grafana \
  grafana/grafana-enterprise

