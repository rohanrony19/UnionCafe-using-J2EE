<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body, html {
          height: 100%;
          margin: 0;
          background-image: url('https://t3.ftcdn.net/jpg/08/68/51/04/360_F_868510427_vsvN67LV1zSmLMyXMOFG05tRCmTAj1xL.jpg'); /* 🔁 Replace with your image path */
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
        .link {
    display: flex;
    justify-content: flex-end;  /* move to right */
    align-items: center;        /* vertical alignment */
    gap: 10px;                  /* spacing between links */
}

.login-switch {
          position: absolute;
          top: 30px;
          left: 50%;
          transform: translateX(-50%);
          display: flex;
          gap: 10px;
        }

    </style>
</head>

<body class="d-flex justify-content-center align-items-center bg-light">
<div class="login-switch">
    <a href="../User/Login.jsp" class="btn btn-outline-primary " id="userBtn">User</a>
    <a href="AdminLogin.jsp" class="btn btn-outline-primary" id="adminBtn">Admin</a>
</div>
<div class="overlay">
    <div class="card shadow p-4" style="width: 22rem;">
        <h4 class="text-center mb-3">Admin Login</h4>


        <form action="adminLogin" method="Post">
            <div class="mb-3">
                <label for="email" class="form-label">Email ID:<span style="color:red">*</span></label>
                <input type="email" oninput="validateEmail()" class="form-control" id="email" name="email" required>
                <span id="email-error" style="color:red"></span>
            </div>
                <div class="mb-3 password-wrapper" style="position: relative;">
                    <label for="password" class="form-label">Password:<span style="color:red">*</span></label>
                    <input type="password" onchange="validatePassword()" class="form-control" id="password" name="password" required>
                    <span id="password-error" style="color:red"></span>
                    <i id="togglePassword" class="fa fa-eye" style="position: absolute; right: 15px; top: 44px; cursor: pointer; font-size: 14px;"></i>
                    <!--<span style="color:red">${PasswordError}</span>-->
                </div>



            <div class="link">
                <span><a href="Verify.jsp">Login via OTP</a></span>
                <!--<span><a href="Register.jsp">New User?</a></span>-->
            </div>
            <br/>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <c:if test="${not empty msg}">
            <div class="alert alert-danger">${msg}</div>
        </c:if>
    </div>
</div>
<script>
    function validateEmail(){
    let email = document.getElementById("email").value.trim();
    let emailError = document.getElementById("email-error");
    let pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!pattern.test(email)) {
        emailError.innerText = "Please enter a valid email address";
    } else {
        emailError.innerText = "";
    }
}

function validatePassword(){
    let password = document.getElementById("password").value;
    let passwordError = document.getElementById("password-error");
    let pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
    if (!pattern.test(password)) {
        passwordError.innerText = "Password must be 8+ chars, include letter, number & special char";
    } else {
        passwordError.innerText = "";
    }
}
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

        adminBtn.classList.add("active");  // highlight Admin
        userBtn.classList.remove("active");
    });
</script>

</body>
</html>
