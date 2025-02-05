# Proyecto Flutter - Películas Top Rated

Este es un proyecto Flutter que consume una API desarrollada en Node.js para mostrar las películas mejor puntuadas (Top Rated). La aplicación utiliza diferentes herramientas de Flutter como **FutureBuilder**, **Provider**, y **SharedPreferences** para mejorar la experiencia del usuario y la gestión del estado.

## Requisitos

- Flutter 3.x o superior
- Dart 2.x o superior
- Node.js (si deseas levantar la API localmente)

## Características

- Conexión con una API en Node.js para obtener datos de películas.
- Visualización de películas con su imagen de cartelera, título, votos y calificación promedio.
- Gestión del estado utilizando el paquete `provider`.
- Carga asíncrona de datos mediante `FutureBuilder`.
- Uso de variables de entorno a través del paquete `flutter_dotenv`.
- Almacenamiento de preferencias del usuario utilizando `SharedPreferences` (opcional).
  
## Instalación

### 1. Clonar el Repositorio

Primero, clona el repositorio en tu máquina local:

```bash
git clone https://github.com/alenchufacundo/project-flutter.git
cd project-flutter

### 2. Asegurate de cargar las dependencias 
En la consola flutter pub get

### 3. Configuración de variables de entorno
El proyecto utiliza un archivo .env para configurar la URL de la API. Asegúrate de que el archivo .env se encuentre en la carpeta assets/env y contenga la siguiente línea:

API_URL='https://proyecto-labo-iv-2.onrender.com'

### 4. Ejecutar la aplicacion
En la consola flutter run

Estructura del Proyecto

lib/
│
├── models/
│   └── movie.dart           # Modelo de datos de película
│
├── providers/
│   └── movie_provider.dart  # Proveedor que gestiona el estado de las películas
│
├── screens/
│   └── TopRatedMoviesScreen.dart # Pantalla que muestra las películas
│
└── main.dart                # Punto de entrada de la aplicación



