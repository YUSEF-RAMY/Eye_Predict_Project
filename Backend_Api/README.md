# Backend - Eye Recognition Project 👁️

This folder contains the **Laravel Backend** for the Eye Recognition project.  
It provides:
- **RESTful API** for communication with the AI service and mobile/web apps.  
- **Admin Dashboard** to manage users and view statistics.  

---

## 🚀 Features

---

## 🛠️ Tech Stack
- **Laravel 12**
- **Blade Templates**
- **Api**
- **sanctum Auth Api**
- **MySQL Database**
- **TailwindCSS**
- **Bootstrap**
- **Flowbite**
- **Laravel Breeze** (for authentication)

---

## ✨ Author

This backend API was developed by:

**Yusef Ramy Saber** – Backend Developer (Laravel)  

---

## ⚡ Installation & Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/YUSEF-RAMY/Eye_Predict_Project.git
   cd Backend_Api
   ```

2. Install Dependencies
    ```bash
    composer install
    npm install
    npm run dev
    composer require laravel/breeze --dev
    php artisan breeze:install
    php artisan breeze:install blade
    ```

3. Setup Environment File
    ```bash
    cp .env.example .env
    php artisan key:generate
    ```

4. Create The Database , Migrations And Admin Account
    ```bash
    php artisan migrate --seed
    ```

5. Create The Storage Link For Images
    ```bash
    php artisan storage:link
    ```

6. Start The Server
    ```bash
    composer run dev
    ```

---

## 🙏 Final Words

Thanks for checking out this project!  

— *Yusef Ramy Saber*

* * *



