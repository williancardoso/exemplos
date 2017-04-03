# apache

Provisionamento do Jboss Wildfly

## Build
```
docker build -t willian/wildfly:10.1.0 . 
```

## Executando
```
docker run -d -p 8080:8080 -v "$PWD/logs:/opt/wildfly/standalone/log/" -v "$PWD/deploy:/opt/wildfly/standalone/deployments" willian/wildfly:10.1.0
```
