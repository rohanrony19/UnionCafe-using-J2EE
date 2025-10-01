<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f1f5f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .payment-container {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .payment-method h4 {
            font-weight: 600;
            margin-bottom: 20px;
            color: #333;
        }
        .form-check-input:checked + .form-check-label {
            font-weight: bold;
            color: #0d6efd;
        }
        .payment-card {
            padding: 20px;
            border-radius: 12px;
            margin-top: 15px;
            background: #f8f9fa;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }
        .payment-card h5 {
            font-weight: 600;
            margin-bottom: 15px;
        }
        .btn-pay {
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            border: none;
            font-weight: 600;
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .btn-pay:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }
        .alert {
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="container payment-container">

    <h2 class="text-center mb-4">Choose Your Payment Method</h2>

    <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger">${errorMsg}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/Home/User/ProcessPayment" method="post">

        <div class="payment-method">
            <h4>Payment Options</h4>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="card" value="card" required>
                <label class="form-check-label" for="card">Credit/Debit Card</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="upi" value="upi">
                <label class="form-check-label" for="upi">UPI</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="wallet" value="wallet">
                <label class="form-check-label" for="wallet">Wallet</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="cod">
                <label class="form-check-label" for="cod">Cash on Delivery (COD)</label>
            </div>
        </div>

        <!-- Card Details -->
        <div id="cardDetails" class="payment-card d-none">
            <h5>Card Details</h5>
            <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" class="form-control" name="cardNumber" id="cardNumber" maxlength="16" placeholder="1234 5678 9012 3456">
            </div>
            <div class="mb-3 row">
                <div class="col">
                    <label for="cardExpiry" class="form-label">Expiry (MM/YY)</label>
                    <input type="text" class="form-control" name="cardExpiry" id="cardExpiry" placeholder="MM/YY">
                </div>
                <div class="col">
                    <label for="cardCvv" class="form-label">CVV</label>
                    <input type="text" class="form-control" name="cardCvv" maxlength="3" id="cardCvv" placeholder="123">
                </div>
            </div>
        </div>

        <!-- UPI Details -->
        <div id="upiDetails" class="payment-card d-none">
            <h5>UPI Payment</h5>
            <div class="mb-3">
                <label for="upiId" class="form-label">UPI ID</label>
                <input type="text" class="form-control" name="upiId" id="upiId" placeholder="example@upi">
            </div>
        </div>

        <!-- Wallet Details -->
        <div id="walletDetails" class="payment-card d-none">
            <h5>Wallet Payment</h5>
            <div class="mb-3">
                <label for="walletId" class="form-label">Wallet ID</label>
                <input type="text" class="form-control" name="walletId" id="walletId" placeholder="Wallet Account ID">
            </div>
        </div>

        <button type="submit" class="btn btn-pay mt-4">Pay Now</button>
    </form>
</div>

<script>
    const paymentRadios = document.querySelectorAll('input[name="paymentMethod"]');
    const cardDetails = document.getElementById('cardDetails');
    const upiDetails = document.getElementById('upiDetails');
    const walletDetails = document.getElementById('walletDetails');

    paymentRadios.forEach(radio => {
        radio.addEventListener('change', () => {
            cardDetails.classList.add('d-none');
            upiDetails.classList.add('d-none');
            walletDetails.classList.add('d-none');

            if (radio.value === 'card') cardDetails.classList.remove('d-none');
            if (radio.value === 'upi') upiDetails.classList.remove('d-none');
            if (radio.value === 'wallet') walletDetails.classList.remove('d-none');
        });
    });
</script>
</body>
</html>
