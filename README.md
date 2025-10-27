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

## Home Page
<img width="1815" height="997" alt="Screenshot 2025-10-04 233621" src="https://github.com/user-attachments/assets/4c5c1746-25a2-475e-9bd2-81a8a65ea2eb" /><br>
## Category
<img width="1902" height="1037" alt="Screenshot 2025-10-04 234008" src="https://github.com/user-attachments/assets/04346158-cb4f-4270-9e83-cf29469067e5" /><br>
## Table Booking
<img width="1907" height="998" alt="Screenshot 2025-10-04 233921" src="https://github.com/user-attachments/assets/84ea3ebe-a2aa-4e29-83f5-c7867b484b2c" /><br>
## Login
<img width="1420" height="846" alt="Screenshot 2025-10-04 233724" src="https://github.com/user-attachments/assets/4655e2b3-f437-464f-8f8d-2ec57fa63f9c" /><br>
## Cart
<img width="1919" height="1079" alt="Screenshot 2025-10-04 233805" src="https://github.com/user-attachments/assets/d4c02691-0443-4f79-8da8-f32e491c067f" /><br>
## Payment
<img width="1109" height="551" alt="Screenshot 2025-10-04 233846" src="https://github.com/user-attachments/assets/d59f3160-7daf-45ee-993f-dfa194f1e3d4" /><br>

1. **Clone the repository**
   ```bash
   git clone https://github.com/rohanrony19/UnionCafe.git

2. **Open in IDE**

Import the project as a Maven project in Eclipse/IntelliJ.

3. **Database Setup**

Create a MySQL database named unioncafe.

Import the provided SQL script (unioncafe.sql) if available.

Update database credentials in persistence/DBConnection.java.

4. **Run the Application**

Deploy the project on Apache Tomcat (v9 or later).

Access it at http://localhost:8080/UnionCafe.

5. **Login or Register**

Register as a new user or log in with test credentials.
