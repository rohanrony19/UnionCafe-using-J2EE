<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>

    <!-- Bootstrap CSS (without integrity to avoid digest error) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            background-image: url('https://png.pngtree.com/thumb_back/fh260/background/20230518/pngtree-various-bakery-items-are-displayed-on-a-wooden-table-image_2581267.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.5);
            height: 100%;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.95);
            width: 26rem;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .error-message {
            color: red;
            font-size: 0.9rem;
        }

        .form-control.is-invalid {
            border-color: red;
        }
    </style>
</head>
<body>
<div class="overlay">
    <div class="card">
        <h3 class="text-center mb-4">Register</h3>

        <form id="registerForm" action="Register" method="post" novalidate>
            <div class="mb-3">
                <label for="fullname" class="form-label">Full Name:<span style="color:red">*</span></label>
                <input type="text" class="form-control" id="fullname" name="fullName">
                <span style="color:red">${nameError}</span>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email Address:<span style="color:red">*</span></label>
                <input type="email" class="form-control" id="email" name="email">
                <span style="color:red">${emailError} </span>
                <span style="color:red">${mailExistError} </span>

            </div>
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Phone Number:<span style="color:red">*</span></label>
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
                <span style="color:red">${NumberError}</span>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password:<span style="color:red">*</span></label>
                <input type="password" class="form-control" id="password" name="password">
                <span style="color:red">${passwordError}</span>
            </div>

            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password:<span style="color:red">*</span></label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword">
                <span style="color:red">${confirmPasswordError}</span>
            </div>

            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS (no integrity) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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
