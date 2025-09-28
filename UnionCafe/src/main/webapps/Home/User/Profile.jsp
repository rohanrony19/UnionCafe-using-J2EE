<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
        }
        .profile-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
        }
        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 4px solid #2575fc;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .profile-header h2 {
            font-weight: bold;
            color: #333;
        }
        .form-label {
            font-weight: 600;
            color: #444;
        }
        .btn-home {
            background-color: white;
            color: black;
            font-weight: 800;
        }
        .btn-home:hover {
            background-color: #6a11cb;
        }
        .btn-logout {
            background-color: #dc3545;
            color: white;
            font-weight: 600;
        }
        .btn-logout:hover {
            background-color: #b52a37;
        }
        .btn-update {
            background-color: #2575fc;
            color: white;
            font-weight: 600;
        }
        .btn-update:hover {
            background-color: #1b5edb;
        }
        .container-fluid{
        margin-top:15px;
        margin-left:15px;
        }
        .container-fluid-order{
        margin-top:15px;
        margin-right:20px;

        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to right, #6a11cb, #2575fc);">
    <div class="container-fluid">
        <a type="submit" class="btn btn-home w-5 me-2" href="${pageContext.request.contextPath}/Home/User/Home.jsp"><< Home</a>
    </div>
    <div class="container-fluid-order">
        <a class="btn btn-warning text-dark w-5 me-2" href="${pageContext.request.contextPath}/Home/User/Order.jsp">My Orders</a>
    </div>
</nav>

<!-- Profile Section -->
<div class="profile-card">
    <div class="profile-header">
        <h2>Profile</h2>
        <!-- Success / Failure Message -->
        <c:if test="${not empty message}">
            <div style="color: ${messageType == 'success' ? 'green' : 'red'};
                font-weight:bold;
                text-align:center;
                margin-bottom:10px;">
                ${message}
            </div>
        </c:if>



        <c:choose>
            <c:when test="${not empty dto.imagePath}">
                <img
                        src="Profile?image=${dto.imagePath}&t=<%= System.currentTimeMillis() %>"
                        class="profile-pic"
                        alt="Profile">
            </c:when>
            <c:otherwise>
                <img
                        src="https://static.vecteezy.com/system/resources/previews/013/042/571/non_2x/default-avatar-profile-icon-social-media-user-photo-in-flat-style-vector.jpg"
                        class="profile-pic"
                        alt="Default Profile">
            </c:otherwise>
        </c:choose>

        <h2>${dto.fullName}</h2>
    </div>

    <form action="Profile" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Name:</label>
            <input type="text" class="form-control" name="fullName" value="${dto.fullName}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Phone Number:</label>
            <input type="text" class="form-control" name="phoneNumber" value="${dto.phoneNumber}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email:</label>
            <input type="email" class="form-control" name="email" value="${dto.email}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Age:</label>
            <input type="number" class="form-control" name="age" value="${dto.age}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Address:</label>
            <textarea class="form-control" name="address" required>${dto.address}</textarea>
        </div>
        <!-- Image Upload -->

        <c:if test="${not empty dto.imagePath}">
            <div class="mb-2">
                <span class="text-success">Current File:</span>
                <span class="fw-bold">${dto.imagePath}</span>
                <!-- Show thumbnail -->
                <!--<img src="${pageContext.request.contextPath}/download?imagePath=${dto.imagePath}"-->
                <!--     alt="Profile image" style="height:50px;margin-left:10px;border-radius:5px;">-->
            </div>
        </c:if>

        <div class="input-group mb-3">
            <input type="file" class="form-control" id="inputGroupFile02" name="profileImage">
            <label class="input-group-text" for="inputGroupFile02">Upload</label>
        </div>

        <div class="d-flex justify-content-between">
            <form action="UpdateProfile" method="post" class="w-50">
            <button type="submit" class="btn btn-update w-50 me-2">Update</button>
                </form>
            <form action="${pageContext.request.contextPath}/Logout" method="post" class="d-flex">
                <button type="submit" class="btn btn-logout">Logout</button>
            </form>
        </div>
    </form>
</div>

</body>
</html>
