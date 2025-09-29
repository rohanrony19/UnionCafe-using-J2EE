<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>Order Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .review-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .table thead {
            background: #0d6efd;
            color: #fff;
        }
        .table tbody tr:hover {
            background: #f0f8ff;
        }
        .total-box {
            text-align: right;
            font-size: 1.2rem;
            font-weight: 600;
            margin-top: 15px;
        }
        .payment-badge {
            font-weight: 500;
            padding: 5px 10px;
            border-radius: 8px;
            color: #fff;
        }
        .payment-card {
            background: #0d6efd;
        }
        .btn-place {
            width: 100%;
            padding: 12px;
            font-weight: 600;
            border-radius: 10px;
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            border: none;
            color: #fff;
            transition: all 0.3s ease;
        }
        .btn-place:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
<div class="container review-container">
    <h2 class="mb-4 text-center">Review Your Order</h2>

    <c:set var="cart" value="${sessionScope.cartForOrder}" />
    <c:set var="total" value="${sessionScope.totalAmount}" />
    <c:set var="paymentMethod" value="${sessionScope.paymentMethod}" />

    <c:choose>
        <c:when test="${empty cart}">
            <p class="text-center">Your cart is empty.</p>
        </c:when>
        <c:otherwise>
            <div class="table-responsive">
                <table class="table table-bordered align-middle text-center">
                    <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Subtotal</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${cart}">
                        <tr>
                            <td>
                                <div class="d-flex align-items-center">
                                    <img src="${item.imageUrl}" alt="${item.productName}" style="width:50px; height:50px; border-radius:5px; margin-right:10px;">
                                    ${item.productName}
                                </div>
                            </td>
                            <td>$${item.price}</td>
                            <td>${item.quantity}</td>
                            <td>$${item.price * item.quantity}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="total-box">
                Total Amount: <strong>$${total}</strong>
            </div>

            <p class="mt-3">
                Payment Method:
                <span class="payment-badge
                    <c:choose>
                        <c:when test='${paymentMethod=="card"}'>bg-primary</c:when>
                <c:when test='${paymentMethod=="upi"}'>bg-success</c:when>
                <c:when test='${paymentMethod=="wallet"}'>bg-warning text-dark</c:when>
                <c:when test='${paymentMethod=="cod"}'>bg-secondary</c:when>
    </c:choose>
    ">${paymentMethod.toUpperCase()}</span>
    </p>

    <form action="${pageContext.request.contextPath}/Home/User/PlaceOrder" method="post" class="mt-4">
        <button type="submit" class="btn btn-place">Place Order</button>
    </form>
    </c:otherwise>
    </c:choose>
</div>
</body>
</html>
