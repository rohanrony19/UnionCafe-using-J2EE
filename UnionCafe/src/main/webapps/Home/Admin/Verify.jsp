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
          background-image: url('https://plus.unsplash.com/premium_photo-1687153733088-9fc19cbc59bf?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmVvbiUyMGNhcnxlbnwwfHwwfHx8MA%3D%3D'); /* 🔁 Replace with your image path */
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
        }
        .overlay {
          background-color: rgba(0, 0, 0, 0.4); /* dark overlay */
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
            .card {
            background: rgba(255, 255, 255, 0);  /* fully transparent */
            border: none;                        /* remove border */
            box-shadow: none;                    /* optional, remove shadow if you want only blur */
        }
        .form-blur-box {
            background-color: rgba(255, 255, 255, 0.15); /* semi-transparent white */
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
            border-radius: 15px;
            padding: 20px;
        }
        .back-btn {
  position: fixed;
  top: 32px;       /* change from bottom to top */
  left: 32px;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: linear-gradient(135deg, #0d6efd 70%, #6f42c1 100%);
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.4rem;
  box-shadow: 0 8px 20px rgba(13, 110, 253, 0.22);
  text-decoration: none;
  z-index: 99;
  transition: background 0.2s, color 0.2s, box-shadow 0.2s;
}
.back-btn:hover {
  background: linear-gradient(135deg, #6f42c1 80%, #0d6efd 100%);
  color: #fffbe7;
  box-shadow: 0 12px 28px rgba(13, 110, 253, 0.33);
}


    </style>
</head>

<body class="d-flex justify-content-center align-items-center bg-light">
<div class="overlay">
    <a href="javascript:history.back()" class="back-btn" title="Go Back">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="card shadow p-4" style="width: 22rem; background: transparent; border: none; box-shadow: none;">
        <h4 class="text-center mb-3 text-white">Admin Login</h4>
        <form action="Verify" class="form-blur-box" method="Post">
            <div class="mb-3">
                <label for="email" class="form-label text-white">Email ID:<span style="color:red">*</span></label>
                <input type="email" oninput="validateEmail()" class="form-control" id="email" name="email" required>
                <span id="email-error" style="color:red"></span>
            </div>
            <button type="submit" class="btn btn-primary w-100">Verify</button>
        </form>
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
</script>
</body>
</html>
