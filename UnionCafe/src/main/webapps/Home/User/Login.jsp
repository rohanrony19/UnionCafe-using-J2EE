<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="${pageContext.request.contextPath}/Home/User/JS/index.js"></script>
    <style>
        body, html {
          height: 100%;
          margin: 0;
          background-image: url('https://wallpaper.forfun.com/fetch/5f/5f8ae830d99b656d89656f6dcd071220.jpeg'); /* 🔁 Replace with your image path */
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
        }


        .overlay {
          background-color: rgba(0, 0, 0, 0.6); /* dark overlay */
          height: 100%;
          width: 100%;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          color: black;
          text-align: center;
          padding: 250px;
        }
        .link{
        justify-content:space-between;
        display:flex;
        align-item:center;
        }
.login-switch {
          position: absolute;
          top: 30px;
          left: 50%;
          transform: translateX(-50%);
          display: flex;
          gap: 10px;
        }

        #togglePassword {
  font-size: 18px;
  color: #666;
  user-select: none;
}
    </style>
</head>

<body class="d-flex justify-content-center align-items-center bg-light">
<div class="login-switch">
    <a href="Login.jsp" class="btn btn-outline-primary " id="userBtn">User</a>
    <a href="../Admin/AdminLogin.jsp" class="btn btn-outline-primary" id="adminBtn">Admin</a>
</div>
<!--<c:if test="${not empty error}">-->
<!--    <p style="color:red; text-align:center;">${error}</p>-->
<!--</c:if>-->

<div class="overlay">
<div class="card shadow p-4" style="width: 22rem;">
    <h4 class="text-center mb-3">User Login</h4>
    <form action="Login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email ID:<span style="color:red">*</span></label>
            <input type="email" onchange="validateEmail()" class="form-control" id="email" name="email" required>
            <span id="email-error" style="color:red">
            <span style="color:red">${emailError}</span>
    </span>
        </div>

        <div class="mb-3 password-wrapper" style="position: relative;">
            <label for="password" class="form-label">Password:<span style="color:red">*</span></label>
            <input type="password" oninput="validatePassword()" class="form-control" id="password" name="password" required>
            <span id="password-error" style="color:red">
            <span style="color:red">${passwordError}</span>
    </span>
            <i id="togglePassword" class="fa fa-eye" style="position: absolute; right: 15px; top: 44px; cursor: pointer; font-size: 14px;"></i>
        </div>

        <div class="link">
        <span><a href="ForgotPassword.jsp">Forgot Password</a></span>
        <span><a href="Register.jsp">New User?</a></span>
        </div>
        <br/>
        <button type="submit" class="btn btn-primary w-100">Login</button>
        <p style="color:red">${error}</p>
    </form>
</div>
</div>
<script>
    const togglePassword = document.querySelector('#togglePassword');
    const password = document.querySelector('#password');

    togglePassword.addEventListener('click', function () {
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);

    // Toggle eye / eye-slash icon
    this.classList.toggle('fa-eye');
    this.classList.toggle('fa-eye-slash');
    });

    window.addEventListener("DOMContentLoaded", () => {
        const userBtn = document.getElementById("userBtn");
        const adminBtn = document.getElementById("adminBtn");

        userBtn.classList.add("active");   // highlight User
        adminBtn.classList.remove("active");
    });


</script>
</body>
</html>
