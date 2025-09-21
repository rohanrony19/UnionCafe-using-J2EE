//document.getElementById('fullname').addEventListener('blur', function() {
//    const fullName = this.value.trim();
//    const errorSpan = document.getElementById('fullname-error');
//
//    // Example: must be at least 3 letters, only letters and spaces allowed
//    if (!/^[A-Za-z ]{3,}$/.test(fullName)) {
//        errorSpan.textContent = "Name must be at least 3 letters and contain only alphabets and spaces";
//    } else {
//        errorSpan.textContent = "";
//    }
//});

function validateName(){
let userName=document.getElementById("fullName").value;
let nameError=document.getElementById("fullName-error");
let pattern=/^[A-Za-z ]+$/
if(userName.length<3 || userName.length>50 && pattern.test(userName)){
nameError.innerText="Name length between 3 and 50 and name should not contain numbers";
}else{
nameError.innerText="";
}
}

function validateEmail(){
    let email = document.getElementById("email").value.trim();
    let emailError = document.getElementById("email-error");
    let pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!pattern.test(email)) {
        emailError.innerText = "Please enter a valid email address";
    } else {
        emailError.innerText = "";
    }
}

function validatePhoneNumber(){
    let phone = document.getElementById("phoneNumber").value.trim();
    let phoneError = document.getElementById("number-error");
    let pattern = /^[6-9]\d{9}$/; // Indian phone numbers starting 6-9, total 10 digits
    if (!pattern.test(phone)) {
        phoneError.innerText = "Enter a valid 10-digit phone number";
    } else {
        phoneError.innerText = "";
    }
}

function validatePassword(){
    let password = document.getElementById("password").value;
    let passwordError = document.getElementById("password-error");
    let pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
    if (!pattern.test(password)) {
        passwordError.innerText = "Password must be 8+ chars, include letter, number & special char";
    } else {
        passwordError.innerText = "";
    }
}

function validateConfirmPassword(){
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirmPassword").value;
    let confirmPasswordError = document.getElementById("confirmPassword-error");
    if (password !== confirmPassword) {
        confirmPasswordError.innerText = "Passwords do not match";
    } else {
        confirmPasswordError.innerText = "";
    }
}

function validateForm(event) {
    validateName();
    validateEmail();
    validatePhoneNumber();
    validatePassword();
    validateConfirmPassword();

    // Check if any error spans have text
    const errors = document.querySelectorAll('span[style*="color:red"]');
    for(let err of errors) {
        if(err.textContent.length > 0) {
            event.preventDefault(); // Stop form submission
            err.scrollIntoView({behavior: "smooth", block: "center"});
            return false;
        }
    }
    return true;
}
