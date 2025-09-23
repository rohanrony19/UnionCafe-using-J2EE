<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>

    <!-- Bootstrap CSS (without integrity to avoid digest error) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="JS/index.js"></script>
    <style>
        body, html {
            margin: 0;
            padding:0;
            min-height:100vh;
            background-image: url('https://wallpaper.forfun.com/fetch/5f/5f8ae830d99b656d89656f6dcd071220.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment:fixed;
        }

        .overlay {
    background-color: rgba(0, 0, 0, 0.5);
    min-height: 100vh;  /* full viewport height */
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 0;  /* add space top and bottom */
    box-sizing: border-box;
}

        .card {
            background-color: white;
            width: 26rem;
            padding: 1.5rem 2rem;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            max-height: 90vh; /* prevent overflow */
    overflow-y: auto;
        }

        .error-message {
            color: red;
            font-size: 0.9rem;
        }

        .form-control.is-invalid {
            border-color: red;
        }

        /* Adjust eye icon size and color */
#togglePassword {
  font-size: 18px;
  color: #666;
  user-select: none;
}

        #toggleConfirmPassword {
  font-size: 18px;
  color: #666;
  user-select: none;
}

    </style>
</head>
<body>
<div class="overlay">
    <div class="card">
        <h3 class="text-center mb-4">Register</h3>

        <form id="registerForm" action="Register" method="post" novalidate>
            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name:<span style="color:red">*</span></label>
                <input type="text" oninput="validateName()" onclick="" class="form-control" id="fullName" name="fullName" required minlength="3" maxlength="50">
                <span id="fullName-error" style="color:red"></span>
                <span style="color:red">${fullNameError}</span>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email Address:<span style="color:red">*</span></label>
                <input type="email" oninput="validateEmail()" class="form-control" id="email" name="email" value="${param.email}" required >
                <span id="email-error" style="color:red"></span>
                <span style="color:red">${emailError}</span>
                <span style="color:red">${mailExistError}</span>

            </div>
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Phone Number:<span style="color:red">*</span></label>
                <input type="text" onchange="validatePhoneNumber()" class="form-control" id="phoneNumber" name="phoneNumber" maxlength="10" required>
                <span id="number-error" style="color:red"></span>
                <span style="color:red">${phoneError}</span>
            </div>

            <div class="mb-3">
                <label class="form-label">Address <span style="color:red">*</span></label>
                <textarea name="address" class="form-control" rows="3">${dto.address}</textarea>
                <span id="addressError" class="text-danger"></span>
            </div>

            <div class="mb-3 password-wrapper" style="position: relative;">
                <label for="password" class="form-label">Password:<span style="color:red">*</span></label>
                <input type="password" class="form-control" id="password" name="password" oninput="validatePassword()" required>
                <span id="password-error" style="color:red"></span>
                <i id="togglePassword" class="fa fa-eye" style="position: absolute; right: 15px; top: 44px; cursor: pointer; font-size: 14px;"></i>
                <span style="color:red">${passwordError}</span>
            </div>



            <div class="mb-3 password-wrapper" style="position: relative;">
                <label for="confirmPassword" class="form-label">Confirm Password:<span style="color:red">*</span></label>
                <input type="password" oninput="validateConfirmPassword()" class="form-control" id="confirmPassword" name="confirmPassword" required>
                <span id="confirmPassword-error" style="color:red"></span>
                <i id="toggleConfirmPassword" class="fa fa-eye" style="position: absolute; right: 15px; top: 44px; cursor: pointer; font-size: 14px;"></i>
                <span style="color:red">${confirmPasswordError}</span>
            </div>

            <button type="submit" onsubmit="return validateForm(event)" class="btn btn-primary w-100">Register</button>
            <span>Already have an account? <a href="Login.jsp">Login</a></span>
            <p style="color:green">${success}</p>
            <p style="color:red">${error}</p>
        </form>
    </div>
</div>

<!-- Bootstrap JS (no integrity) -->

<script>
    const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password');

togglePassword.addEventListener('click', function () {
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);

    // Toggle eye / eye-slash icon
    this.classList.toggle('fa-eye');
    this.classList.toggle('fa-eye-slash');
});

    const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
const confirmPassword = document.querySelector('#confirmPassword');

toggleConfirmPassword.addEventListener('click', function () {
    const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
    confirmPassword.setAttribute('type', type);

    this.classList.toggle('fa-eye');
    this.classList.toggle('fa-eye-slash');
});

</script>
<!-- JavaScript validation-->
<!--<script>-->
<!--    document.getElementById('registerForm').addEventListener('submit', function (event) {-->
<!--        let valid = true;-->
<!--        clearErrors();-->

<!--        const fullName = document.getElementById('fullname').value.trim();-->
<!--        const email = document.getElementById('email').value.trim();-->
<!--        const password = document.getElementById('password').value;-->
<!--        const confirmPassword = document.getElementById('confirmPassword').value;-->

<!--        if (fullName === "") {-->
<!--            showError('fullname', 'Full name is required');-->
<!--            valid = false;-->
<!--        }-->

<!--        if (email === "") {-->
<!--            showError('email', 'Email is required');-->
<!--            valid = false;-->
<!--        } else if (!isValidEmail(email)) {-->
<!--            showError('email', 'Invalid email format');-->
<!--            valid = false;-->
<!--        }-->

<!--        if (password === "") {-->
<!--            showError('password', 'Password is required');-->
<!--            valid = false;-->
<!--        } else if (password.length < 8) {-->
<!--            showError('password', 'Password must be at least 8 characters');-->
<!--            valid = false;-->
<!--        }-->

<!--        if (confirmPassword === "") {-->
<!--            showError('confirmPassword', 'Please confirm your password');-->
<!--            valid = false;-->
<!--        } else if (confirmPassword !== password) {-->
<!--            showError('confirmPassword', 'Passwords do not match');-->
<!--            valid = false;-->
<!--        }-->

<!--        if (!valid) {-->
<!--            event.preventDefault();-->
<!--        }-->
<!--    });-->

<!--    function showError(id, message) {-->
<!--        const input = document.getElementById(id);-->
<!--        input.insertAdjacentHTML('afterend', `<span class="error-message">${message}</span>`);-->
<!--    }-->

<!--    function clearErrors() {-->
<!--        document.querySelectorAll('.error-message').forEach(span => span.remove());-->
<!--    }-->

<!--    function isValidEmail(email) {-->
<!--        const regex = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;-->
<!--        return regex.test(email);-->
<!--    }-->
<!--</script>-->
</body>
</html>
