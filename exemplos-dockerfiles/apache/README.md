# apache

Provisionamento de Apache

## Build
```
docker build -t willian/apache .
```

## Executando
```
docker run -t -p 80:80 -p 443:443 -v "$PWD"/logs:/var/logs/httpd:ro willian/apache
```


## Dicas

### Gerando um certificado
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout apache.key -out apache.crt -subj "/C=BR/ST=Brasil/L=Brasilia/O=Global Security/OU=IT Department/CN=teste.hacklab.localdomain"
```

### Validando o certificado
```
openssl x509 -noout -modulus -in server.crt | openssl md5
openssl rsa -noout -modulus -in server.key | openssl md5
```
