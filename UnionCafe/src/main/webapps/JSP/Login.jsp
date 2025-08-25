<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
          height: 100%;
          margin: 0;
          background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20230518/pngtree-various-bakery-items-are-displayed-on-a-wooden-table-image_2581267.jpg'); /* 🔁 Replace with your image path */
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

    </style>
</head>

<body class="d-flex justify-content-center align-items-center bg-light">
<div class="overlay">
<div class="card shadow p-4" style="width: 22rem;">
    <h4 class="text-center mb-3">Login</h4>
    <form action="Login" method="Post">
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email">
            <span style="color:red">${emailError}</span>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password">
            <span style="color:red">${PasswordError}</span>
        </div>
        <div class="link">
        <span><a href="ForgotPassword.jsp">Forgot Password</a></span>
        <span><a href="Register.jsp">New User?</a></span>
        </div>
        <br/>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
</div>
</div>
</body>
</html>
