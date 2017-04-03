#!/bin/bash

### Pre-Requisito - InfluxDB
mkdir -p ./influxdb/{data,log}
chown -R 999.999 ./influxdb

### Pre-Requisito - Grafana
mkdir -p ./grafana/{data,log}
chown -R 104.107 ./grafana
