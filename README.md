# 🌐 portfolio_web

Portafolio personal desarrollado en **Flutter Web**, donde presento mi perfil como desarrollador, experiencia profesional y proyectos.

El proyecto cuenta con **despliegue automático** usando **GitHub Actions** y se publica en **GitHub Pages** cada vez que se realizan cambios en la rama `main`.

🔗 **Demo en vivo:**  
👉 [Aquí](https://jhoncke2.github.io/portfolio_web/)

---

## 🛠️ Tecnologías

- Flutter (Web)
- Dart
- GitHub Actions (CI/CD)
- GitHub Pages

---

## 📂 Estructura del proyecto

```text
portfolio_web/
├── lib/               # Código fuente Flutter
├── web/               # Archivos específicos para Flutter Web
├── .github/
│   └── workflows/
│       └── flutter_web.yaml  # Pipeline de CI/CD
├── pubspec.yaml
└── README.md
```

---

## 🚀 Flujo de despliegue (CI/CD)

El proyecto utiliza GitHub Actions para automatizar la compilación y publicación del sitio web.

🔄 ¿Cómo funciona?

- Push a la rama main

- GitHub Actions ejecuta el workflow flutter_web.yaml

- Se compila el proyecto con flutter build web

- Los archivos generados se publican en la rama gh-pages

- GitHub Pages sirve el sitio web públicamente

---

## ⚙️ Workflow de GitHub Actions

El workflow se encuentra en:

```text
.github/workflows/flutter_web.yaml
```

Resumen del proceso:

1. Checkout del repositorio

2. Setup de Flutter (canal beta)

3. Habilitación de Flutter Web

4. Instalación de dependencias

5. Build del proyecto web

6. Deploy a GitHub Pages

El build se ejecuta con:

```bash
flutter build web --base-href="/portfolio_web/"
```

Esto es necesario para que la aplicación funcione correctamente bajo el subdirectorio de GitHub Pages.

---

## 🌍 Publicación

Rama principal: main

Rama de despliegue: gh-pages

URL pública:

```text
https://jhoncke2.github.io/portfolio_web/
```

Cada actualización en main se refleja automáticamente en el sitio web.

---

## 🧑‍💻 Ejecución local

Clonar el repositorio:

```bash
git clone https://github.com/jhoncke2/portfolio_web.git
cd portfolio_web
```

1. Instalar dependencias:

    ```bash
    flutter pub get
    ```

2. Habilitar Flutter Web (si no está habilitado):

    ```bash
    flutter config --enable-web
    ```

3. Ejecutar en local:

    ```bash
    flutter run -d chrome
    ```

---

## 📌 Autor

Jhonatan Andrés Amórtegui García
Desarrollador Flutter
