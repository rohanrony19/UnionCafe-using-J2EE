<!DOCTYPE html>
<html>
<head>
    <title>OTP Verification</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .otp-container {
            max-width: 420px;
            margin: 80px auto;
            background: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgb(0 0 0 / 0.1);
            text-align: center;
        }
        .otp-header {
            margin-bottom: 25px;
            font-weight: 600;
            color: #212529;
        }
        .form-label {
            font-weight: 500;
        }
        .otp-input {
            font-size: 20px;
            padding: 12px 14px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ced4da;
            text-align: center;
            letter-spacing: 0.2em;
            font-family: monospace;
            margin-bottom: 20px;
        }
        .error-message {
            color: #dc3545;
            font-weight: 500;
            min-height: 24px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="otp-container">
    <h2 class="otp-header">Enter OTP sent to your email</h2>
    <form action="ValidateOtp" method="post" novalidate>
        <!-- Optional hidden input for email if needed -->
        <input type="hidden" name="email" value="${email != null ? email : ''}">
        <p>OTP has been sent to your registered email.</p>

        <label for="otp" class="form-label">Enter OTP:</label>
        <input type="text" id="otp"
               name="otp"
               class="otp-input"
               placeholder="Enter your OTP"
               maxlength="6"
               pattern="\d{6}"
               title="Enter 6-digit OTP"
               required>

        <button type="submit" class="btn btn-primary w-100">Verify OTP</button>
        <div class="error-message">${message}</div>
    </form>
</div>
</body>
</html>
