# TastyCo Project Showcase Document

## Major Title

TastyCo - Food Ordering Web Application

## Short Tagline

A Java-based food ordering platform with menu browsing, cart ordering, payment receipt upload, random dish recommendations, and a health meter for food choices.

## Project Description

TastyCo is a full-stack web application designed for online food ordering. The project allows users to sign up, log in, browse food categories, add dishes to a cart, place orders, upload payment receipts, and view a personalized health analysis based on their ordered dishes.

The application is built using Java Servlets and JSP for the backend and dynamic web pages, with MySQL used for storing users, dishes, orders, transactions, health records, and feedback. It also includes interactive frontend behavior using HTML, CSS, JavaScript, and Chart.js.

TastyCo focuses on creating a simple and practical restaurant-style ordering experience while also adding extra features such as a random dish picker and a health meter that classifies food choices as nutritious or indulgent.

## Demo Link

[Add your deployed website link here]

## Project Video

[Add your recorded demo video link here]

## GitHub Repository

[Add your GitHub repository link here]

## Screenshots

Add screenshots of the main pages here:

- Home page
- Login and signup pages
- Menu page
- Order/cart page
- Transaction upload page
- Health meter page
- Thank you page

## Tech Stack

### Frontend

- HTML
- CSS
- JavaScript
- JSP
- Chart.js

### Backend

- Java
- Java Servlets
- JDBC
- Maven

### Database

- MySQL

### Server and Deployment

- Apache Tomcat
- WAR-based Java web application deployment

### Libraries and Dependencies

- MySQL Connector/J
- Java Servlet API
- org.json

## Key Features

### User Authentication

Users can create an account and log in securely. The application uses password hashing for new users and supports migration from older plain-text password records to hashed passwords during login.

### Menu Browsing

The menu is organized into food categories, allowing users to explore different dishes such as main course items, snacks, desserts, and drinks.

### Cart and Order Placement

Users can add dishes to a cart, update quantities, view the total amount, and place orders. The order details are stored in the MySQL database.

### Payment Transaction Upload

After placing an order, users can submit transaction details and upload a payment receipt image. The transaction data is stored for record keeping.

### Health Meter

The health meter analyzes the user's ordered dishes and displays a visual comparison between nutritious and indulgent food choices using a pie chart.

### Random Dish Recommendation

The random dish picker suggests a dish from the database, helping users discover something new when they are unsure what to order.

### Feedback Support

The project includes backend support for collecting user feedback, allowing future improvements based on user input.

## User Flow

1. The user opens the TastyCo website.
2. The user signs up or logs in.
3. The user browses the menu and selects dishes.
4. Selected items are added to the cart.
5. The user places an order.
6. The user submits payment transaction details and uploads a receipt.
7. The order is completed and the user is redirected to a thank you page.
8. The user can view the health meter to understand their food choices.

## Database Modules

The project uses a MySQL database with tables for:

- Users
- Dishes
- Orders
- Transactions
- Health analysis
- Feedback

This structure keeps the main application data organized and supports features such as authentication, ordering, payment tracking, and user-based health insights.

## Project Architecture

TastyCo follows a traditional Java web application structure:

- JSP pages handle the user interface.
- Java Servlets handle requests, business logic, and routing.
- JDBC connects the application to the MySQL database.
- CSS and JavaScript improve styling and interactivity.
- Apache Tomcat runs and deploys the application.

## What Makes This Project Stand Out

- Combines standard food ordering features with a health analysis feature.
- Includes a random dish recommendation system for better user engagement.
- Uses Java Servlets and JSP to demonstrate core Java web development skills.
- Stores real order, user, transaction, and dish data in MySQL.
- Includes receipt upload functionality for payment verification.
- Uses Chart.js to present user food habits visually.

## Challenges Solved

- Built a complete flow from signup to order completion.
- Connected JSP pages with Java Servlets using request and response handling.
- Stored and retrieved data from MySQL using JDBC.
- Managed cart data and order submission from the frontend.
- Added password hashing for safer user authentication.
- Created a health meter by analyzing dish status values from user orders.

## Future Enhancements

- Add an admin dashboard to manage dishes, orders, users, and transactions.
- Add online payment gateway integration.
- Improve order tracking with live order status.
- Add email or SMS notifications.
- Add search and filter options for menu items.
- Improve mobile responsiveness and UI consistency.
- Complete feedback form integration on the frontend.
- Use dish IDs directly in the cart flow for stronger order handling.

## My Role

I designed and developed the TastyCo web application, including the frontend pages, Java Servlet backend, database integration, authentication flow, order handling, transaction upload, and health meter feature.

## Project Status

The project is ready to be presented as a deployed Java web application. Core features such as signup, login, menu browsing, order placement, transaction upload, random dish recommendation, and health analysis are implemented.

## Short Version for Website Card

TastyCo is a Java Servlet and JSP-based food ordering web application with user authentication, menu browsing, cart ordering, receipt upload, random dish recommendations, and a health meter powered by MySQL and Chart.js.

## Long Version for Portfolio Page

TastyCo is a full-stack food ordering web application built with Java Servlets, JSP, MySQL, JDBC, HTML, CSS, and JavaScript. The platform allows users to create an account, log in, explore menu categories, add dishes to a cart, place orders, upload payment receipts, and view a health meter based on their ordered dishes.

The project demonstrates practical Java web development concepts such as servlet-based request handling, database connectivity using JDBC, session management, secure password hashing, JSON-based communication, and WAR deployment on Apache Tomcat. In addition to the standard ordering flow, TastyCo includes user-focused features like a random dish recommendation system and a Chart.js-based health visualization.

## Suggested Website Section Order

1. Project title and tagline
2. Project description
3. Demo link
4. Video demo
5. Screenshots
6. Tech stack
7. Key features
8. User flow
9. Architecture
10. Challenges solved
11. Future enhancements
12. GitHub repository
