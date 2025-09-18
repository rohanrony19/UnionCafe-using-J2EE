<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa; /* Light background for better contrast */
        }
        .container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .welcome-message {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }
        .logout-btn {
            background-color: #dc3545; /* Bootstrap danger color */
            color: white;
            float: right;
        }
        .logout-btn:hover {
            background-color: #c82333; /* Darker red on hover */
        }
        .profile-pic-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            cursor: pointer; /* Change cursor to pointer */
        }
        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #4a148c; /* Border color */
        }
        input[type="file"] {
            display: none; /* Hide the file input */
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="Home.jsp">CakeX</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="Home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Profile.jsp">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Cart.jsp">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="favorite.jsp">Favorites</a>
                </li>
            </ul>
            <form action="Logout" method="post" class="d-flex">
                <button type="submit" class="btn logout-btn">Logout</button>
            </form>
        </div>
    </div>
</nav>

<div class="container">
    <div class="d-flex justify-content-between align-items-center">
        <h1 class="welcome-message">User Profile</h1>
    </div>

    <form action="Profile" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Profile Picture:</label>
            <div class="profile-pic-container" onclick="document.getElementById('profilePictureInput').click();">
                <img src="${profilePictureUrl}" alt="Profile Picture" class="profile-pic" onerror="this.src='https://via.placeholder.com/150';">
            </div>
            <input type="file" id="profilePictureInput" name="profilePicture" accept="image/*" onchange="this.form.submit();">
        </div>

        <div class="mb-3">
            <label class="form-label">Name:</label>
            <p class="form-control-plaintext">${fullName}</p>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone Number:</label>
            <p class="form-control-plaintext">${phoneNumber}</p>
        </div>

        <div class="mb-3">
            <label class="form-label">Email Address:</label>
            <p class="form-control-plaintext">${email}</p>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

</body>
</html>
