<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
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
          color: white;
          text-align: center;
          padding: 250px;
        }

        h1 {
          font-size: 3rem;
          margin-bottom: 20px;
          color: white;
            font-family: 'Playfair Display', serif;
            font-style: italic;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
            padding-top: 7px;
            color:skyblue;
        }

        .btn-custom {
          width: 200px;
          margin: 10px;
        }
        .index{
        display:flex;
        justify-content:space-between;
        align-item:center;
        }
    </style>
</head>
<body>

<div class="overlay">
    <h1>Welcome to CakeX</h1>
    <div class="d-grid gap-2 col-6 mx-auto">
<!--        <a href="Register" class="btn btn-success btn-custom text-white text-decoration-none">Register</a>-->
<!--        <a href="Login" class="btn btn-primary btn-custom text-white text-decoration-none">Login</a>-->
        <div class="index">
            <span><a href="Register.jsp">Register</a></span>
            <span><a href="Home.jsp">Enter as Guest?</a></span>
        </div>
    </div>
</div>

</body>
</html>
