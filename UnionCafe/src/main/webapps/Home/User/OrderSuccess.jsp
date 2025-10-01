<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .success-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .order-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            background: #fdfdfd;
            margin-bottom: 15px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .order-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        .order-header {
            font-weight: 600;
            font-size: 1.1rem;
            color: #333;
        }
        .subtotal {
            font-weight: 500;
        }
        .order-total {
            font-size: 1.3rem;
            font-weight: 700;
            text-align: right;
            margin-top: 20px;
            color: #0d6efd;
        }
        .btn-home {
            width: 100%;
            padding: 12px;
            font-weight: 600;
            border-radius: 10px;
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            border: none;
            color: #fff;
            transition: all 0.3s ease;
        }
        .btn-home:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
<div class="container success-container">
    <h2 class="text-center mb-4 text-success">Order Placed Successfully!</h2>

    <p class="text-center mb-4">
        Payment Method:
        <span class="badge
            <c:choose>
                <c:when test='${paymentMethod=="card"}'>bg-primary</c:when>
        <c:when test='${paymentMethod=="upi"}'>bg-success</c:when>
        <c:when test='${paymentMethod=="wallet"}'>bg-warning text-dark</c:when>
        <c:when test='${paymentMethod=="cod"}'>bg-secondary</c:when>
        </c:choose>
        ">${paymentMethod.toUpperCase()}</span>
    </p>

    <c:if test="${not empty cart}">
        <c:set var="totalAmount" value="0"/>
        <c:forEach var="item" items="${cart}">
            <div class="order-card row align-items-center">
                <div class="col-md-2">
                    <img src="${item.imageUrl}" alt="${item.productName}" class="img-fluid rounded">
                </div>
                <div class="col-md-7">
                    <div class="order-header">${item.productName}</div>
                    <p>Quantity: ${item.quantity}</p>
                    <p>Price per item: $ ${item.price}</p>
                </div>
                <div class="col-md-3 text-end subtotal">
                    <c:set var="subtotal" value="${item.price * item.quantity}"/>
                    Subtotal: $ <c:out value="${subtotal}"/>
                    <c:set var="totalAmount" value="${totalAmount + subtotal}"/>
                </div>
            </div>
        </c:forEach>

        <div class="order-total">
            Total Amount: $ <c:out value="${totalAmount}"/>
        </div>
    </c:if>

    <div class="mt-4">
        <a href="${pageContext.request.contextPath}/Home/User/Home.jsp" class="btn btn-home">Continue Shopping</a>
    </div>
</div>
</body>
</html>
