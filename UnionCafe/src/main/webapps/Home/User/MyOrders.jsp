<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f2f3f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .order-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            padding: 20px;
            transition: transform 0.2s;
        }
        .order-card:hover {
            transform: translateY(-5px);
        }
        .order-header {
            font-weight: 600;
            font-size: 18px;
            color: #333;
        }
        .order-subtitle {
            font-size: 14px;
            color: #555;
        }
        .order-total {
            font-weight: bold;
            font-size: 16px;
            color: #222;
        }
        .order-info {
            font-size: 14px;
            color: #666;
        }
        .product-img {
            width: 100%;
            max-width: 120px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4 text-primary">My Orders</h2>

    <c:if test="${empty orders}">
        <div class="alert alert-info">You have no orders yet.</div>
    </c:if>

    <c:forEach var="order" items="${orders}">
        <div class="order-card">
            <div class="row align-items-center">
                <div class="col-md-2">
                    <img src="${order.imageUrl}" alt="${order.productName}" class="product-img" />
                </div>
                <div class="col-md-5">
                    <div class="order-header">${order.productName}</div>
                    <div class="order-subtitle">Quantity: ${order.quantity}</div>
                    <div class="order-subtitle">Price per item: $${order.price}</div>
                    <div class="order-info">Payment Method:
                        <c:choose>
                            <c:when test="${order.paymentMethod == 'card'}">
                                <span class="badge bg-primary">CARD</span>
                            </c:when>
                            <c:when test="${order.paymentMethod == 'upi'}">
                                <span class="badge bg-success">UPI</span>
                            </c:when>
                            <c:when test="${order.paymentMethod == 'wallet'}">
                                <span class="badge bg-warning text-dark">WALLET</span>
                            </c:when>
                            <c:when test="${order.paymentMethod == 'cod'}">
                                <span class="badge bg-secondary">COD</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-dark">OTHER</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="col-md-3 text-end">
                    <div class="order-total">
                        Subtotal: $${order.price * order.quantity}
                    </div>
                    <div class="order-info">
                        Ordered on: <c:out value="${order.orderDate}" />
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/Home/User/Home.jsp" class="btn btn-primary">Continue Shopping</a>
    </div>
</div>
</body>
</html>
