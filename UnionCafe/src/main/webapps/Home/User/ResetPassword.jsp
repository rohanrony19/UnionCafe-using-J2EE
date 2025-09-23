<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
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
<!--        #togglePassword {-->
<!--  font-size: 18px;-->
<!--  color: #666;-->
<!--  user-select: none;-->
<!--}-->

<!--        #toggleConfirmPassword {-->
<!--  font-size: 18px;-->
<!--  color: #666;-->
<!--  user-select: none;-->
<!--}-->


    </style>
</head>

<body class="d-flex justify-content-center align-items-center bg-light">
<div class="overlay">
    <div class="card shadow p-4" style="width: 22rem;">
        <h4 class="text-center mb-3">Forgot Password</h4>
        <form action="ResetPassword" method="post">

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

            <!--    <label>New Password:<span style="color:red">*</span></label>-->
            <!--    <input type="password" name="password" class="form-control" required />-->
            <!--<i id="togglePassword" class="fa fa-eye" style="position: absolute; right: 15px; top: 44px; cursor: pointer; font-size: 14px;"></i>-->

            <!--<label>Confirm Password:<span style="color:red">*</span></label>-->
            <!--<i id="toggleConfirmPassword" class="fa fa-eye" style="position: absolute; right: 15px; top: 44px; cursor: pointer; font-size: 14px;"></i>-->

            <!--<input type="password" name="confPassword" class="form-control" required />-->
            <!--    <span style="color:red">${errorMsg}</span>-->
            <!--    <span style="color:green">${message}</span>-->
            <div class="mb-3 position-relative">
                <label>New Password:<span style="color:red">*</span></label>
                <input type="password" name="password" id="password" class="form-control" required />
                <i id="togglePassword" class="fa fa-eye"
                   style="position: absolute; right: 15px; top: 70%; transform: translateY(-50%);
              cursor: pointer; font-size: 15px; color: #666;"></i>
            </div>

            <div class="mb-3 position-relative">
                <label>Confirm Password:<span style="color:red">*</span></label>
                <input type="password" name="confPassword" id="confirmPassword" class="form-control" required />
                <i id="toggleConfirmPassword" class="fa fa-eye"
                   style="position: absolute; right: 15px; top: 70%; transform: translateY(-50%);
              cursor: pointer; font-size: 15px; color: #666;"></i>
            </div>

            <span style="color:red">${errorMsg}</span>
            <span style="color:green">${message}</span>

            <br/>
            <div>
                <span>Don't have an Account? <a href="Register.jsp"> Register Now!</a></span>
            </div><br/>
            <button type="submit" class="btn btn-primary w-100">Reset Password</button>
        </form>
        <script>
            const togglePassword = document.querySelector('#togglePassword');
 const password = document.querySelector('#password');
 togglePassword.addEventListener('click', function () {
     const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
     password.setAttribute('type', type);
     this.classList.toggle('fa-eye');
     this.classList.toggle('fa-eye-slash');
 });

 const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
 const confirmPassword = document.querySelector('#confirmPassword');
 toggleConfirmPassword.addEventListener('click', function () {
     const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
     confirmPassword.setAttribute('type', type);
     this.classList.toggle('fa-eye');
     this.classList.toggle('fa-eye-slash');
 });

        </script>
    </div>
</div>
</body>
</html>
