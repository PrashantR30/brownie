# Instructions for creating and monitoring a Wordpress Site on Amazon VPC.

Schematic Diagram:
=====
![Host](https://github.com/PrashantR30/brownie/blob/master/schematic_diagram.png)


Setup for brownie.turbo.mu website
============================

This project demonstrate Infrastructure as a Code on a demo WebSite showing AWS-VPC provisioning using Terraform (https://www.terraform.io/) and Docker provisioning using Docker Compose.

Infrastructure monitoring is setup using with [Prometheus](https://prometheus.io/), [Grafana](http://grafana.org/), [cAdvisor](https://github.com/google/cadvisor), 
[NodeExporter](https://github.com/prometheus/node_exporter)


## Installation:

Using Git, clone the project on a Debian based machine

```bash
git clone https://github.com/PrashantR30/brownie
cd brownie
./1_install.sh # to install Terraform
./2_start_dockers.sh

On a Debian 9 (Stretch) the following will be installed:
```
* Docker version 17.05.0-ce, build 89658be
* docker-compose version 1.8.0
* Terraform v0.11.3

## Containers:
* Website at (http://brownie.turbo.mu)
* Grafana (Dashboards metrics) for Containers and Host Monitoring (http://brownie.turbo.mu:3000)
* Prometheus (Time Series Database) (http://brownie.turbo.mu:9090/targets)
* NodeExporter (host metrics collector) (http://brownie.turbo.mu:9100/metrics)
* cAdvisor (containers metrics collector) (http://brownie.turbo.mu:8080/metrics)

