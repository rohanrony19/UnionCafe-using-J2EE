<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background: #343a40;
        }
        .navbar-brand, .nav-link {
            color: #fff !important;
        }
        .cart-container {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        h2 {
            font-weight: bold;
            margin-bottom: 20px;
        }
        table th {
            background: #343a40;
            color: #fff;
        }
        .btn-cart {
            background: #28a745;
            border: none;
        }
        .btn-cart:hover {
            background: #218838;
        }
        .total-box {
            background: #f1f1f1;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            font-size: 1.2rem;
        }
        .quantity-input {
            width: 50px;
            border-radius: 50%;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg px-4">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/Home/User/Home.jsp">UnionCafe</a>
    <div class="ms-auto">
        <a href="${pageContext.request.contextPath}/Home/User/Home.jsp" class="btn btn-outline-light">🏠 Home</a>
    </div>
</nav>

<div class="container mt-5">
    <div class="cart-container">
        <h2>🛒 Your Shopping Cart</h2>

        <c:choose>
            <c:when test="${not empty sessionScope.cart}">
                <table class="table table-bordered table-hover mt-3 align-middle text-center">
                    <thead class="table-dark">
                    <tr>
                        <th>Image</th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <tr>
                            <td>
                                <img src="${item.imageUrl}" alt="${item.productName}" style="height:80px; width:auto; object-fit:cover;">
                            </td>
                            <td class="fw-semibold">${item.productName}</td>
                            <td>$${item.price}</td>
                            <td>
                                <div class="d-flex justify-content-center align-items-center gap-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                                    <input type="text" class="form-control form-control-sm quantity-input" value="${item.quantity}" data-price="${item.price}">
                                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                                </div>
                            </td>
                            <td class="fw-bold text-success subtotal">$${item.price * item.quantity}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/RemoveFromCart" method="post">
                                    <input type="hidden" name="productName" value="${item.productName}" />
                                    <button type="submit" class="btn btn-danger btn-sm">❌ Remove</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="total-box d-flex justify-content-between align-items-center">
                    <span class="fw-bold">Total: </span>
                    <span class="fw-bold text-primary">$0.00</span>
                </div>

                <div class="mt-4 d-flex justify-content-between">
                    <a href="javascript:history.back()" class="btn btn-secondary" style="background-color:#0081a3">⬅ Continue Shopping</a>
                    <a href="${pageContext.request.contextPath}/Home/User/Payment.jsp" class="btn btn-cart text-white">✅ Proceed to Checkout</a>
                </div>

            </c:when>
            <c:otherwise>
                <div class="alert alert-warning mt-3 text-center">
                    Your cart is empty! 🛍️ <br>
                    <a href="${pageContext.request.contextPath}/Home/User/Category.jsp" class="btn btn-primary mt-2">Start Shopping</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    function updateTotals() {
        let total = 0;
        document.querySelectorAll('.subtotal').forEach(sub => {
            let val = parseFloat(sub.textContent.replace('$','')) || 0;
            total += val;
        });
        document.querySelector('.total-box span.text-primary').textContent = '$' + total.toFixed(2);
    }

    document.querySelectorAll('.quantity-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const container = btn.closest('tr');
            const input = container.querySelector('.quantity-input');
            let value = parseInt(input.value) || 1;

            if(btn.dataset.action === 'increase') value++;
            else if(btn.dataset.action === 'decrease' && value > 1) value--;

            input.value = value;

            // Update subtotal
            const price = parseFloat(input.dataset.price);
            container.querySelector('.subtotal').textContent = '$' + (price * value).toFixed(2);

            // Update total
            updateTotals();
        });
    });

    // Initialize total on page load
    updateTotals();
</script>

</body>
</html>
