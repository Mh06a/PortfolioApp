# 📱 Portfolio App

A full-stack portfolio management application built with **Flutter**, **Spring Boot**, and **MySQL**. The application allows users to manage portfolio projects, technical skills, and professional profile information through a clean, responsive, and user-friendly interface. It also provides quick access to external professional links such as GitHub, LinkedIn, and Email.

---

## 📸 Screenshots


| Home | Projects |
|------|----------|
| <img width="388" height="662" alt="Screenshot 2026-07-16 200307" src="https://github.com/user-attachments/assets/2324c722-4cac-4c1f-afef-3ca4af754d07" />| <img width="392" height="660" alt="Screenshot 2026-07-16 200344" src="https://github.com/user-attachments/assets/754f69a0-1c61-479c-b99a-cfa0ed1bd459" />
|

| Skills | Profile |
|--------|---------|
| <img width="392" height="662" alt="Screenshot 2026-07-16 200325" src="https://github.com/user-attachments/assets/3dd75172-e515-44d4-8b18-9218e521dac0" />| <img width="391" height="658" alt="Screenshot 2026-07-16 200356" src="https://github.com/user-attachments/assets/5c15e260-5944-4b2e-9448-3ee9c1ccb9fe" />
 |

| Settings |  |
|----------|-----------------|
| <img width="388" height="661" alt="Screenshot 2026-07-16 200421" src="https://github.com/user-attachments/assets/dbf4d02c-14c7-4eb8-8bd3-6ea28ed18043" />


---

# ✨ Features

- 📁 Manage portfolio projects
- ➕ Add new projects
- ✏️ Edit existing projects
- 🗑️ Delete projects
- 💻 Manage technical skills
- 🔗 Store GitHub repository links
- 🌐 Quick access to GitHub, LinkedIn, and Email
- 🔄 Full CRUD operations
- 📱 Responsive Flutter UI
- 🌍 RESTful API integration
- 🗄️ MySQL database support

---

# 🛠 Tech Stack

## Frontend

- Flutter
- Dart
- Provider

## Backend

- Spring Boot
- Java
- REST API

## Database

- MySQL

## Development Tools

- Android Studio
- IntelliJ IDEA
- Postman
- Git
- GitHub

---

# 🏗 Architecture

The project follows a **Feature-First Architecture**, making the codebase modular, scalable, and easy to maintain.

Each feature is organized into independent modules containing:

- Controller
- Model
- Provider
- Service
- View

Shared resources are separated into reusable layers to reduce duplication and improve maintainability.

---

# 📂 Folder Structure

```text
lib
│
├── core
│   ├── constants
│   ├── exceptions
│   ├── helpers
│   ├── services
│   └── themes
│
├── features
│   ├── admin
│   ├── auth
│   ├── home
│   ├── profile
│   ├── projects
│   ├── settings
│   └── skills
│       ├── controller
│       ├── model
│       ├── provider
│       ├── service
│       └── view
│
├── models
│
├── shared
│   └── widgets
│
└── main.dart
```

---

# 🔗 Backend Overview

The backend is built using **Spring Boot** and exposes RESTful APIs that communicate with a **MySQL** database.

Current modules include:

- User
- Profile
- Projects
- Skills

The backend provides complete CRUD operations through REST APIs and is designed with a layered architecture for better scalability and maintainability.

---

# 🚀 Getting Started

## Prerequisites

Before running the project, make sure you have installed:

- Flutter SDK
- Java 21+
- MySQL Server
- Android Studio
- IntelliJ IDEA
- Git

---

## Clone the Repository

```bash
git clone https://github.com/your-username/PortfolioApp.git

cd PortfolioApp
```

---

# Backend Setup

### 1. Create a MySQL Database

```sql
CREATE DATABASE portfolio_db;
```

---

### 2. Configure Database Connection

Update your `application.yml` (or `application.properties`) with your MySQL credentials.

Example:

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/portfolio_db
    username: 
    password: 
```

---

### 3. Run the Backend

Run the Spring Boot application from IntelliJ IDEA or execute:

```bash
./mvnw spring-boot:run
```

---

# Frontend Setup

Install Flutter dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

# 🚀 Future Improvements

Planned features for future releases:

- User Authentication
- Image Upload Support
- Dark Mode
- Search & Filtering
- Project Categories
- Better Animations
- Web Deployment

---

# 👨‍💻 Author

**Mansour Hussain**

- GitHub: https://github.com/Mh06a
- LinkedIn: https://www.linkedin.com/in/mansourhussain/
- Email: mansour.06.ab.06@gmail.com

---

## ⭐ Support

If you found this project useful, consider giving it a **Star ⭐** on GitHub.
