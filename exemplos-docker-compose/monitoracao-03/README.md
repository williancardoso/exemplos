# Monitoração de Containers (cadvisor + influxdb + grafana)

## Docker-compose
Provisionar via docker-compose.
Necessário criar os folders para persistir dos dados do influxdb e grafana.

```
git clone https://github.com/williancardoso/compose-docker-monitoracao.git
cd compose-docker-monitoracao

chmod +x ./folders.sh
./folders.sh

docker-compose up -d
```

## Separadamente
- Criar os folders para persitir os dados do Grafana e do InfluxDB
```
### Pre-Requisito - InfluxDB
mkdir -p ./influxdb/{data,log}
chown -R 999.999 ./influxdb

### Pre-Requisito - Grafana
mkdir -p ./grafana/{data,log}
chown -R 104.107 ./grafana
```
- Provisionar o influxdb
```
docker run \
  -e PRE_CREATE_DB=cadvisor \
  -p 8083:8083 \
  -p 8086:8086 \
  --expose 8090 \
  --expose 8099 \
  --name influxsrv \
  -d tutum/influxdb
```
- Provisionar o cadvisor
```
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --link influxsrv:influxsrv \
  --name=cadvisor \
  google/cadvisor:latest \
  -storage_driver_db=cadvisor \
  -storage_driver_host=influxsrv:8086 \
  -storage_driver=influxdb
```
- Provisionar o grafana
```
docker run -d \
  -p 3000:3000 \
  -e INFLUXDB_HOST=localhost \
  -e INFLUXDB_PORT=8086 \
  -e INFLUXDB_NAME=cadvisor \
  -e INFLUXDB_USER=root \
  -e INFLUXDB_PASS='12qw' \
  --link influxsrv:influxsrv \
  --name grafana \
  grafana/grafana
  ```
- Criar user para conexão do grafana ao influxdb (linha de comando)
```
CREATE DATABASE cadvisor
CREATE USER root WITH PASSWORD '12qw';
GRANT ALL ON cadvisor TO root;
influx -username root -password '12qw';
```
