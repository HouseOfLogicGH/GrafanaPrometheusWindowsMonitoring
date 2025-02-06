# Windows Server Monitoring using Grafana, Prometheus and Windows Exporter

Basic Monitoring of a Windows Server using dedicated exporter

## Instructions
These instructions accompany the [YouTube instructional video by House of Logic](https://youtu.be/wS_X77aNQMk).

The Windows Exporter can be found [here.](https://github.com/prometheus-community/windows_exporter)

It should be installed on each host you want to monitor - these may be best achieved using a scripted installation or distribution via Active Directory if you need to do so at scale.

### Clone Repo

Clone this repo and edit the files in the prometheus directory as appropriate with the correct host and port details.

### Install docker on a host of your choice

sudo apt-get update

sudo apt-get install docker.io

## Start Prometheus container using Docker

cd ../prometheus

sudo docker volume create prometheus-data

sudo docker run --name prometheus \
    -p 9090:9090 \
    -d \
    -v /home/ubuntu/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    -v prometheus-data:/prometheus \
    prom/prometheus

### Setup Grafana using docker

Create persistent volume for your data

sudo docker volume create grafana-storage

sudo docker run -d -p 3000:3000 --name=grafana \
  --volume grafana-storage:/var/lib/grafana \
  grafana/grafana-enterprise

Login to grafana using browser to connect to Grafana port 3000, eg http://192.168.2.11:3000

Default credentials

username = admin

password = admin 

### Create dashboard in grafana using UI

Custom label:

{{job}}


## Useful links

[Windows Exporter](https://github.com/prometheus-community/windows_exporter)

[Installing Prometheus using Docker](https://prometheus.io/docs/prometheus/latest/installation/#using-docker)

[Installing Grafana using Docker](https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker/#run-grafana-docker-image)
