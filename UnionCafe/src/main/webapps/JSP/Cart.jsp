<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #9F90CB;
        }
        .container {
            margin-top: 50px;
        }
        .footer {
            background-color: #4a148c;
            color: white;
            padding: 1rem 0;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Your Cart</h2>
    <table class="table">
        <thead>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody id="cartItems">
        <tr>
            <td colspan="4">Your cart is empty.</td>
        </tr>
        </tbody>
    </table>
    <div class="d-flex justify-content-between">
        <h4>Total: $<span id="totalPrice">0.00</span></h4>
        <a href="checkout.html" class="btn btn-success">Proceed to Checkout</a>
    </div>
</div>
