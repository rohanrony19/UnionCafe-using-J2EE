<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>Login | UnionCafe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="${pageContext.request.contextPath}/assets/js/index.js"></script>
    <style>
        body, html {
     height: 100%;
     margin: 0;
     font-family: 'Segoe UI', sans-serif;

     background-image: url("${pageContext.request.contextPath}/assets/images/login-bg.jpg");
     background-size: cover;
     background-position: center;
     background-repeat: no-repeat;
     background-attachment: fixed;
 }


        .overlay{
     width:100%;
     min-height:100vh;
     display:flex;
     justify-content:center;
     align-items:center;
     padding:30px;
 }

        .card{
    width:430px;
    border:none;
    border-radius:18px;
    background:rgba(15,25,35,0.88);
    backdrop-filter:blur(12px);
    box-shadow:0 20px 40px rgba(0,0,0,.45);
}

 .form-control{
     height:48px;
     border-radius:10px;
     border:1px solid #ced4da;
     box-shadow:none;
 }

 .form-control:focus{
     border-color:#0081a3;
     box-shadow:0 0 0 0.2rem rgba(0,129,163,0.20);
     outline:none;
 }

 .form-label{
    color:white;
    font-weight:600;
}

 .btn-primary{
     background:#0081a3;
     border:none;
     height:48px;
     border-radius:10px;
 }

 .btn-primary:hover{
     background:#006b86;
 }

.link a{
    color:white;
    text-decoration:none;
    transition:.3s;
}

.link a:hover{
    color:#00b4d8;
}

.forgot-link{
    color:#00b4d8;
    text-decoration:none;
    font-size:15px;
}

.forgot-link:hover{
    text-decoration:underline;
}
h2{
    color:#ffffff;
    font-family:'Playfair Display',serif;
    font-style:italic;
    font-weight:700;
}

.text-light-subtitle{
    color:#d9d9d9;
    font-size:15px;
}

        .back-btn{
    position:fixed;
    top:25px;
    left:25px;
    color:white;
    text-decoration:none;
    background:rgba(0,0,0,.45);
    padding:10px 18px;
    border-radius:10px;
    transition:.3s;
    z-index:999;
}

.back-btn:hover{
    background:#0081a3;
    color:white;
}

        .password-wrapper{
    position:relative;
}

.password-wrapper .form-control{
    padding-right:50px;
}

.password-toggle{
    position:absolute;
    top:50%;
    right:18px;
    transform:translateY(-50%);
    color:#8d99ae;
    cursor:pointer;
    font-size:18px;
    transition:0.3s;
}

.password-toggle:hover{
    color:#00b4d8;
}


        .create-account{
    text-align:center;
    color:#d6d6d6;
    margin-bottom:25px;
    font-size:16px;
}

.create-account a{
    color:#00b4d8;
    text-decoration:none;
    font-weight:600;
}

.create-account a:hover{
    text-decoration:underline;
}

        .register-section{
    margin-top:30px;
    text-align:center;
}

.register-section p{
    color:#d6d6d6;
    margin-bottom:8px;
    font-size:15px;
}

.register-section a{
    color:#00b4d8;
    text-decoration:none;
    font-size:18px;
    font-weight:600;
}

.register-section a:hover{
    color:#42d4ff;
}

    </style>
</head>

<body >
<a href="${pageContext.request.contextPath}/user/home/home.jsp"
   class="back-btn">
    <i class="fas fa-arrow-left"></i> Back
</a>
<div>
    <c:if test="${not empty logoutMessage}">
        <div class="alert alert-success text-center" style="position: absolute; top: 100px; left: 50%; transform: translateX(-50%); width: 300px; z-index: 10;">
            ${logoutMessage}
        </div>
    </c:if>
</div>

<div class="overlay">
    <div class="card shadow-sm p-5">
        <div class="text-center mb-4">
            <h2 class="fw-bold">Welcome Back</h2>

            <p class="text-light-subtitle">
                Sign in to access your UnionCafe account
            </p>
        </div>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label for="email" class="form-label">Email ID : <span style="color:red">*</span></label>
            <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="Enter your email address"
                    onchange="validateEmail()"
                    required>
            <div id="email-error" class="text-danger small mt-1">
                ${emailError}
            </div>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">
                Password : <span style="color:red">*</span>
            </label>

            <div class="password-wrapper">
                <input
                        type="password"
                        class="form-control"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        oninput="validatePassword()"
                        required>

                <i id="togglePassword" class="fa fa-eye password-toggle"></i>
            </div>

            <div id="password-error" class="text-danger small mt-1">
                ${passwordError}
            </div>
        </div>

        <div class="text-start mb-3">
            <a href="../forgot-password/forgotPassword.jsp"
               class="forgot-link">
                Forgot Password?
            </a>
        </div>

        <button type="submit" class="btn btn-primary w-100">
            Sign In
        </button>
        <div class="register-section">

            <p>Don't have an account?</p>

            <a href="../register/register.jsp">
                Create Account
            </a>

        </div>
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center mt-3">
                ${error}
            </div>
        </c:if>
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


</script>
</body>
</html>
