# 🍽️ TastyCo - Food Ordering Web Application

TastyCo is a full-stack food ordering web application developed using Java Servlets, JSP, MySQL, and Maven. The application allows users to browse menu items, place orders, upload payment receipts, receive food recommendations, and provide feedback.

## 🚀 Features

* User Registration & Login
* Secure Session Management
* Browse Food Menu
* Place Orders
* Payment Receipt Upload
* Order Management
* Feedback System
* Health-Based Food Recommendations
* Random Food Suggestion Feature

## 🛠️ Tech Stack

### Backend

* Java
* Java Servlets
* JSP
* JDBC

### Database

* MySQL

### Build Tool

* Maven

### Frontend

* HTML
* CSS
* JavaScript

## 📂 Project Structure

src/main/java/com/tastyco/
├── DBConnection.java
├── User.java
├── UserDAO.java
├── SignupServlet.java
├── LoginValidate.java
├── LogoutServlet.java
├── Order.java
├── OrderServlet.java
├── TransactionServlet.java
├── Feedback.java
├── FeedbackDAO.java
├── FeedbackServlet.java
├── HealthServlet.java
├── RandomServlet.java
└── PasswordUtil.java


## 🗄️ Database

Import the provided SQL file:
tastycodb.sql
into MySQL before running the application.


## ⚙️ Setup Instructions

1. Clone the repository
git clone https://github.com/AaradhyaPawar/TastyCo.git


2. Import the database
tastycodb.sql


3. Configure database credentials

Create:
db.properties

using the provided:
db.properties.example


4. Build the project
mvn clean install


5. Deploy on Apache Tomcat


6. Open the application in your browser



## 🔮 Future Improvements

* Admin Dashboard
* Order Tracking
* Password Hashing with BCrypt
* REST APIs
* Spring Boot Migration
* Online Payment Gateway Integration

## 👨‍💻 Author

Aaradhya Pawar
Ayushi Patil 

