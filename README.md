# api message
API para mostrar los mensajes que son recibidos


Para ejecutar el proceso atraves de Docker:

```dockerfile
docker build -t apimess .  

docker run -p 80:8000 apimess
```

Para probar la llamada GET:
 
[http://localhost/api_message](http://localhost/api_message)

Para probar la llamada POST:


```json
POST: localhost/api_message/app/serv/CO
BODY: { "name":"martin", "lastname":"taco", "age":26 }

```