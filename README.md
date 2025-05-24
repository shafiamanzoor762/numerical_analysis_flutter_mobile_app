
# 📱 Numerical Analysis Flutter Mobile App (NumericoAnsys)

A powerful and user-friendly cross-platform mobile application that enables users to solve numerical methods problems on the go. Built with a **Flutter** frontend and **Django** backend, it provides real-time solutions, interactive inputs, and visualizations for methods like integration, root finding, linear systems, and more.

---

## 📌 Table of Contents

- [🚀 Features](#-features)
- [🛠️ Tech Stack](#️-tech-stack)
- [📲 App Screenshots](#-app-screenshots)
- [🔧 Setup & Installation](#-setup--installation)
  - [Frontend (Flutter)](#frontend-flutter)
  - [Backend (Django)](#backend-django)
- [🧪 How to Use](#-how-to-use)
- [📚 Sources & Learning Materials](#-sources--learning-materials)
- [🙌 Contributing](#-contributing)
- [📃 License](#-license)
- [💬 Contact](#-contact)

---

## 🚀 Features

- 🔢 Solve various numerical methods:
  - Root Finding (Bisection, Newton-Raphson, etc.)
  - Solving Linear Systems (Gaussian Elimination, LU Decomposition)
  - Numerical Integration (Trapezoidal, Simpson’s Rule)
  - Matrix Operations and more
- 🎯 Real-time calculation and result display
- 📊 Graphical representation of solutions
- 💡 User-friendly, interactive interface for easy input
- 🔁 Supports both Android and iOS platforms

---

## 🛠️ Tech Stack

| Layer     | Technology      |
|-----------|------------------|
| Frontend  | Flutter, Dart     |
| Backend   | Django (Python), Django REST Framework |
| Database  | SQLite / PostgreSQL (Optional) |
| APIs      | RESTful APIs |
| Tools     | Git, GitHub, Postman, VS Code, Android Studio |

---

## 📲 App Screenshots


```

![Home Screen](screenshots/home.png)
![Root Finding Module](screenshots/root_finding.png)

````

---

## 🔧 Setup & Installation

### ✅ Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Python 3.x
- [Django](https://www.djangoproject.com/)
- Git
- Android Studio / Xcode (for mobile testing)

---

### 📦 Frontend Flutter

```bash
# Clone the repository
git clone https://github.com/YourUsername/numerical_analysis_flutter_mobile_app.git
cd numerical_analysis_flutter_mobile_app/flutter_frontend

# Install dependencies
flutter pub get

# Run the app on emulator or device
flutter run
````

---

### 🌐 Backend Django

```bash
# Navigate to the backend directory
cd ../django_backend

# Create virtual environment
python -m venv env
source env/bin/activate  # On Windows: env\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py makemigrations
python manage.py migrate

# Run server
python manage.py runserver
```

> Make sure the Django server is running before using the mobile app.

---

## 🧪 How to Use

1. Open the app and navigate to the desired numerical method module.
2. Input the required parameters or function.
3. Tap on **Calculate** to receive results and visualizations in real-time.
4. Use the graphs and breakdowns to understand the computational process.

---

## 📚 Sources & Learning Materials

This project is inspired by academic and open educational resources:

* **Numerical Methods textbooks** (Burden & Faires, Chapra & Canale)
* [Flutter Documentation](https://flutter.dev/docs)
* [Django Documentation](https://docs.djangoproject.com/)
* [GeeksforGeeks - Numerical Methods](https://www.geeksforgeeks.org/numerical-methods/)
* MIT OpenCourseWare – [Numerical Methods](https://ocw.mit.edu)
* YouTube Channels: The Net Ninja, Academind, Corey Schafer

---

## 🙌 Contributing

We welcome contributions! Here's how you can help:

* Report bugs and suggest features
* Improve code readability or optimization
* Add new numerical methods or enhance UI
* Submit a pull request with detailed explanation

### 🔄 Fork & Contribute

```bash
# Fork the repo, then clone your fork
git clone https://github.com/shafiamanzoor762/numerical_analysis_flutter_mobile_app.git

# Create a new branch
git checkout -b feature/my-feature

# Make your changes and commit
git add .
git commit -m "Add: Your feature description"

# Push and create a PR
git push origin feature/my-feature
```

---

## 📃 License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE) file for details.

---

## 💬 Contact

Made with ❤️ by [Shafia Manzoor](https://github.com/shafiamanzoor762)

For questions or feedback, feel free to reach out:

* 🌐 LinkedIn: [Your Name](https://linkedin.com/in/yourprofile)

---

> “Mathematics is not about numbers, equations, computations, or algorithms: it is about understanding.” – William Paul Thurston
