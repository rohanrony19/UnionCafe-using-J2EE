<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>My Favorites</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
            background-color: #9F90CB;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background: #4a148c;
        }
        .navbar-brand, .nav-link {
            color: #fff !important;
        }
        .row.g-4 {
           margin-top: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .btn-cart {
            background-color: #4a148c;
            color: #fff !important;
        }
        .btn-cart:hover,
        .btn-cart:focus {
            background-color: #380a63 !important; /* darker purple on hover */
            color: #fff !important;
        }
        .container.mt-4 {
            padding-bottom: 100px; /* leave space for fixed footer */
        }
        .favorites-footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            padding: 10px;
            background-color: #9F90CB;
            text-align: center;
            z-index: 1000; /* make sure it's on top */
        }
        .back-btn {
            margin-bottom: 20px;
        }
        img.card-img-top {
            height: 200px; object-fit: cover;
        }
    </style>
</head>
<body>
<div class="container mt-4">

    <!-- Back Button -->
    <nav class="navbar navbar-expand-lg px-4">
        <!-- Brand -->
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/Home/User/Home.jsp">
            UnionCafe
        </a>

        <!-- Right side buttons -->
        <div class="ms-auto d-flex gap-2">
            <a href="javascript:history.back()" class="btn btn-outline-light">Back</a>
            <a href="${pageContext.request.contextPath}/Home/User/Home.jsp" class="btn btn-outline-light">Home</a>
        </div>
    </nav>


    <h2>My Favorites</h2>

    <c:choose>
        <c:when test="${empty sessionScope.favorites}">
            <p>No favorite products added yet.</p>
        </c:when>
        <c:otherwise>
            <div class="row g-4">
                <c:forEach var="product" items="${sessionScope.favorites}">
                    <div class="col-md-4 col-sm-6">
                        <div class="card h-100">
                            <!-- Product Image -->
                            <img src="${product[2]}" class="card-img-top" alt="${product[0]}">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${product[0]}</h5>
                                <p class="card-text"><strong>Price: $${product[1]}</strong></p>

                                <!-- Add to Cart Form -->
                                <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex gap-2 align-items-center">
                                    <input type="hidden" name="productName" value="${product[0]}">
                                    <input type="hidden" name="price" value="${product[1]}">
                                    <input type="hidden" name="quantity" class="quantity-field" value="1">

                                    <div class="d-flex align-items-center">
                                        <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                                        <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;">
                                        <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                                    </div>

                                    <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Add All to Cart Button -->
<div class="favorites-footer d-flex justify-content-center gap-3">
    <!-- Add All to Cart -->
    <form action="${pageContext.request.contextPath}/AddAllToCart" method="post">
        <button type="submit" class="btn btn-success btn-lg">Add All to Cart</button>
    </form>

    <!-- Remove All Favorites -->
    <form action="${pageContext.request.contextPath}/AddToFavorites" method="post"
          onsubmit="return confirm('Are you sure you want to remove all favorites?');">
        <input type="hidden" name="action" value="removeAll">
        <button type="submit" class="btn btn-danger btn-lg">Remove All</button>
    </form>
</div>




<script>
    // Quantity buttons
    document.querySelectorAll('.quantity-btn').forEach(btn => {
        btn.addEventListener('click', function(e){
            e.preventDefault();
            const form = btn.closest('form');
            const displayInput = form.querySelector('.quantity-input');
            const hiddenInput = form.querySelector('.quantity-field');
            let value = parseInt(displayInput.value) || 1;
            if(btn.dataset.action === 'increase') value++;
            if(btn.dataset.action === 'decrease' && value > 1) value--;
            displayInput.value = value;
            hiddenInput.value = value;
        });
    });
</script>
</body>
</html>
