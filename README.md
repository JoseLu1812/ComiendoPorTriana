
# Comiendo Por Triana

ApiRest realizada en Spring Boot, cuenta con base de datos en H2 y PostgreSql(se explica en el siguiente apartado). tambien cuenta con documentacion con Swagger-ui. A su vez cuenta con unas versiones de Front desarrollas en FLutter/Dart para la versión Móvil, y con Angular/typeScript para la versión Web.

El tema principal de la App es la gestión de Bares y Restaurantes de Triana.

## Perfiles

Dispone de 2 perfiles:

 - Developer (dev): cuenta con una base de datos en H2.
 - Production (prod): base de datos administrada en PostgreSql, implementada mediante un "DockerCompose", creando un contenedor para esta.


Para cambiar en perfil, entrando en el application.properties, basta con poner en el apartado: "spring.profiles.active=", justo después del igual, "dev" o "prod". Con el perfil "prod", ejecutar antes de arrancar la API, "docker compose up" en la terminal. 


## Entidades

Cuenta con 2 entidades:

### Bar

Aquí se gestionan todos los bares, restaurantes... Es la entidad principal, y en las que las demás se basan. Todo el mundo puede ver uno varios bares, pero solo los usuarior propietarios (BARMAN), pueden crearlos y administrarlos. 


## User

Aqui se encuentra la gestión de usuarios de la aplicación. La aplicación cuenta con tres tipos de usuarios: ADMIN, BARMAN y CLIENT.

A continuación algunos usuarios de ejemplo:


#### Propietarios
- Username: "LuismiDam"             Contraseña: "Debugear_123"
- Username: "SalesianosTriana"      Contraseña: "SanPedro_123"
- Username: "JoseluHN"              Contraseña: "Usuario_123"

#### Propietarios
- Username: "CjEirene"      Contraseña: "Master_1812"
- Username: "CSainz55"      Contraseña: "Ferrari_55"
- Username: "MariaAuxi"     Contraseña: "Salesianos_123"

#### Clientes
- Username: "DonBosco"      Contraseña: "Salesianos_2023"
- Username: "ConchiHV"      Contraseña: "Cordoba_123"
- Username: "PdelaRosa"     Contraseña: "Bahrein_2005"



## + INFO
El repositorio también cuenta con la documentación del propio, el archivo para la libreria de postman y el archivo apk de flutter.

Cuenta además con la entidad Comment, la cuál no está operativa. 


### Agradecimientos
Me gustaría agradecer la ayuda a mis compañeros y mis profesores, que siempre que lo he pedido, he tenido la suerte de tenerlos ahí para que me echen una mano.
Y añadira  mis padres y hermano, que me han sufrido durante todo este tiempo de tensión, disgustos e insatisfacción, combinado con otras situaciones y aspectos del día a día que tampoco eran de buenas maneras.

# CON GUSTO, JOSÉ LUIS HIDALGO NAVAS


