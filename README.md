## UnionCafe`-using-J2EE
**UnionCafe** is a full-stack café management web application built using **J2EE technologies** such as Servlets, JSP, and JDBC.  
The project provides a **user-friendly and efficient online platform** for customers to browse menu items, place orders, and book tables — while enabling café admins to manage products, categories, and orders seamlessly.

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-------------|
| Frontend | JSP, HTML, CSS, JavaScript |
| Backend | Java (Servlets, JSP, JDBC) |
| Database | MySQL |
| Build Tool | Maven |
| Server | Apache Tomcat |
| Email Service | JavaMail API |

## 🧩 Architecture

The project follows the **MVC (Model-View-Controller)** design pattern with a clear package structure:

src/<br>
├── controller/ # Servlets – handle requests and responses<br>
├── service/ # Business logic layer<br>
├── repository/ # Database operations (JDBC)<br>
├── entity/ # Database entity classes<br>
├── dto/ # Data Transfer Objects<br>
├── persistence/ # JDBC connection and utility classes<br>
└── webapp/ # JSP views, static files, and assets<br>
## 🚀 Demo

🔗 **Live Demo:** [Click here to view UnionCafe](http://localhost:8080/UnionCafe)

## Home Page
The Home Page welcomes users with a clean and intuitive interface displaying café highlights and featured menu items. It acts as the entry point for both new visitors and returning customers, allowing easy navigation to categories and account sections.

<img width="1815" height="997" alt="Screenshot 2025-10-04 233621" src="https://github.com/user-attachments/assets/4c5c1746-25a2-475e-9bd2-81a8a65ea2eb" /><br>

## Category
This section displays the café’s product categories such as beverages, desserts, and snacks. Users can explore each category to view detailed product listings, add items to the cart, or mark favorites for quick access.

<img width="1902" height="1037" alt="Screenshot 2025-10-04 234008" src="https://github.com/user-attachments/assets/04346158-cb4f-4270-9e83-cf29469067e5" /><br>

## Table Booking
The Table Booking module allows users to reserve tables for dine-in directly through the website. Users can select date, time, and seating preferences — ensuring a smooth dining experience without waiting in line.

<img width="1907" height="998" alt="Screenshot 2025-10-04 233921" src="https://github.com/user-attachments/assets/84ea3ebe-a2aa-4e29-83f5-c7867b484b2c" /><br>

## Login
The Login Page provides a secure authentication gateway for registered users. Integrated with session tracking and form validation, it ensures user data privacy and smooth access to personalized features like the cart and booking system.

<img width="1420" height="846" alt="Screenshot 2025-10-04 233724" src="https://github.com/user-attachments/assets/4655e2b3-f437-464f-8f8d-2ec57fa63f9c" /><br>

## Cart
The Cart Page enables users to review, modify, and confirm their selected items before proceeding to checkout. It dynamically updates totals and supports both takeaway and dine-in order options.

<img width="1919" height="1079" alt="Screenshot 2025-10-04 233805" src="https://github.com/user-attachments/assets/d4c02691-0443-4f79-8da8-f32e491c067f" /><br>

## Payment
The Payment module allows customers to choose their preferred payment method, ensuring flexibility and security during checkout. It validates transaction details and confirms successful order placement.

<img width="1109" height="551" alt="Screenshot 2025-10-04 233846" src="https://github.com/user-attachments/assets/d59f3160-7daf-45ee-993f-dfa194f1e3d4" /><br>

1. **Clone the repository**
   ```bash
   git clone https://github.com/rohanrony19/UnionCafe-using-J2EE.git

2. **Open in IDE**

     -Import the project as a Maven project in Eclipse/IntelliJ.

3. **Database Setup**

     -Create a MySQL database named unioncafe.

     -Import the provided SQL script (unioncafe.sql) if available.

     -Update database credentials in persistence/DBConnection.java.

4. **Run the Application**

     -Deploy the project on Apache Tomcat (v9 or later).

     -Access it at http://localhost:8080/UnionCafe.

5. **Login or Register**

     -Register as a new user or log in with test credentials.

💡 **Learning Outcomes**

     -Deep understanding of Servlet & JSP integration

     -Hands-on experience with JDBC and MVC architecture

     -Improved skills in session handling, validations, and mail integration
 
     -Exposure to full-stack Java application design

🪄 **License**

  This project is licensed under the MIT License – feel free to use and modify it.
