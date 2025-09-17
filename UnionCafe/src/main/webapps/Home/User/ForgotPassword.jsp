<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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

    </style>
</head>

<body class="d-flex justify-content-center align-items-center bg-light">
<div class="overlay">
    <div class="card shadow p-4" style="width: 22rem;">
        <h4 class="text-center mb-3">Forgot Password</h4>
        <form action="ForgotPassword" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email ID:<span style="color:red">*</span></label>
                <!--<input type="email" class="form-control" id="email" name="email" onchange="validateEmail()" required>-->
                <input type="email" name="email" placeholder="Enter your registered email" onchange="validateEmail()" class="form-control"
                       value="${email != null ? email : ''}" id="email" required />
                <span style="color:red">${emailError}</span>
                <span style="color:red">${errorMessage}</span>
                <span id="email-error" style="color:red"></span>
                <span>${message}</span>
            </div>
            <!--<div class="mb-3">-->
            <!--    <label for="password" class="form-label">New Password:<span style="color:red">*</span></label>-->
            <!--    <input type="password" class="form-control" id="password" name="password">-->
            <!--    <span style="color:red">${passwordError}</span>-->
            <!--</div>-->
            <!--<div class="mb-3">-->
            <!--    <label for="confirmPassword" class="form-label">Confirm Password:<span style="color:red">*</span></label>-->
            <!--    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">-->
            <!--    <span style="color:red">${confirmPasswordError}</span>-->
            <!--</div>-->
            <div>
                <span><a href="Login.jsp">Login Back</a></span>
            </div><br/>
            <button type="submit" class="btn btn-primary w-100">Send OTP</button>
        </form>
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
        </script>
    </div>
</div>
</body>
</html>
