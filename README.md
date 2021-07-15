# challenge_app

### by: José Cruz Malpica

Challenge app fue creada como prueba para entrar al equipo de Fondeadora. Se utilizo una arquitectura limpia y Provider como manejador de estado.
Credenciales para probar:
- email: pepe@yopmail.com
- psw: holaPepe

## Features

- Login screen
- Quote screen
- Dark mode
- Auth with biometrics
- Password hide/show
- Logout

## Folder structure
Se trato de manejar una arquitectura limpia, separando las peticiones a servicios, los features que se pueden reutilizar en toda la app de los que son especificos y escribiendo código limpio, clases especificas para cada tarea. Entre los folder principales estan:
- core
    - contiene clases que comparten la mayoria de las pantallas como providers, widgets, rutas y clases staticas donde almacenamos los strings o colores que utiliza la app. 
- features
    - dentro estan todos los features de la app, en este caso login y frase (quote), internamente estos features estan estructurados por tres capas: data, domain y presentation donde data se encarga de administrar los modelos y comunicaciones a los datos, domain se encarga de definir como deben hacerse estas comunicaciones y presentation se encarga de presentar los datos al usuario.

## Installation

Para instalar el proyecto lo primero es tener instalado flutter en el equipo donde se probará
Se necesita un IDE ya sea Android Studio o VSC
Teniendo estos puntos lo sigiente es clonar el repositorio
```sh
git clone git@github.com:pepeMalpik/challenge_app.git
```
O descargar el proyecto en zip y descomprimirlo desde el siguiente url:
```sh
https://github.com/pepeMalpik/challenge_app
```
Una vez descargado, abrimos la carpeta en IDE y ejecutamos un flutter pub get 
Listo podemos comenzar a trabjar en nuestro proyecto :D

## Tests

A continuación enlisto los tests con los que cuenta el proyecto y su respectivo comando para ejecutarlo, dependiendo del IDE tambien podemos ir a los archivos de tests y correr los tests de manera grafica: 
- validate email test
 ```sh
flutter test test/core/utils/validate_email_test.dart
```
- validate login repository test
 ```sh
flutter test test/features/login/data/repositories/login_repository_impl_test.dart
```
- validate login service test
 ```sh
flutter test test/features/login/data/services/login_service_impl_test.dart 
```
- validate login provider test
 ```sh
flutter test test/features/login/presentation/providers/login_provider_test.dart
```
- validate quote provider test
 ```sh
flutter test test/features/quote/presentation/quote/quote_provider_test.dart
```
