# test_logrant

Prueba Tecnica Logrant

## Getting Started

Aplicación creada con Flutter version 3.27.1
Link repositorio: https://github.com/canchola1091/prueba_practica_logrant.git
Despues de clonar el repositorio, posicionarse en la rama develop, para compilar correr el comando
flutter pub get
flutter run o Start Debugging (Click derecho del mouse estando posicionado en el archivo main.dart)


Instrucciones

Desarrolla una pequeña app Flutter que consuma una API externa y almacene datos localmente. Puedes usar cualquier herramienta de backend, pero debe estar bien documentada.

Requisitos

1. Pantalla de login y registro (con validación)


2. Pantalla principal que consuma una API externa (por ejemplo, una lista de productos, usuarios o posts)


3. Interacción: permitir guardar favoritos o marcar items


4. Persistencia local (puede ser SQLite o SharedPreferences)


5. Documentación clara (cómo correr el proyecto, estructura, dependencias)


Descripción

El login y regsitro de la aplicación se realiza por medio de Firebase Authentication, para poder ingresar a la aplicación, el usuario primero debe realizar su registro y porteriormente realizar el inicio de sesión.

Los datos del usuario se guardan en el storge local del dispositivo con la librería SharedPrefrences.

Una vez dentro el usuario visualizara una lista de personas, la cual se consume de la API https://reqres.in/api/users?page=1&per_page=12

En esta lista de personas al ser seleccionados se guardan en una lista de favoritos, asi tambien al dar clic sobre una persona se pueden vers su detalles.

Se maneja un icono para cerrar la sesión.

NOTA: ESTÁ APLICACIÓN ACTUALMENTE SOLO FUNCIONA PARA ANDROID.


Estructura de la Aplicación
CARPETAS
- controllers: Contiene archivos donde se maneja la lógica de las vistas.
- data: Se manejan las sharedpreferences de manera global.
- models: Contiene archivos para modelar la respuesta de los servicios.
- routes: Manejo de las rutas de la aplicación.
- services: Se manejan los consumos de los servicios y API REST.
- utils: Contiene archivos con funciones reutilizables
- validations: Manejo de validaciones para los campos de texto (formularios)
- views : Contiene archivos donde se muestra toda la UI.
- widgets: Contiene archivos donde se manejan widget reutilizables para evitar repetir codigo.



Librerias utilizadas

- animate_do: Animaciones
- get: Gestor de estado
- shared_preferences: Guardar información en el storage del dispositivo
- http: Peticiones http
- firebase_core: Conexión con Firebase
- firebase_auth: Autenticación con Firebase
- cloud_firestore: Base de datos no relacional de Firebase