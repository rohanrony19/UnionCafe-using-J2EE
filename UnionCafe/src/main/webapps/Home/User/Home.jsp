<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
          integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600;700&family=Playfair+Display:wght@700;800;900&display=swap" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        <!--body-->
        body, html {
            background-color: #ffffff;
            display: flex;
            width:100%;
            min-width:100vh;
            flex-direction:column;
            scroll-behavior:smooth;
        }


        /* navbar wrapper */
        .nav-alter {
            background-color: transparent;
            position: fixed;
            top: 10px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            display: flex;
            align-items: center;             /* vertical alignment */
            justify-content: space-between;
            width: 90%;
            max-width: 1200px;
            padding: 10px 20px;
            border-radius: 100px;
            backdrop-filter: blur(6px);

        }

        .nav-alter .container-fluid {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            gap: 20px;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            left:20px;
            color: white;
            text-decoration: none;
        }

        .navbar-brand .nav-link {
            font-family: 'Playfair Display', serif;
            font-style: italic;
            font-size:1.5rem;
            font-weight: bold;
            color: white;
            margin: 0;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
        }

        .navbar-brand .nav-link:hover {
            color: #0081a3;
        }

        .navbar-nav .nav-link {
            color: white;
            font-size: 20px;
        }

        .navbar-nav .nav-link:hover {
            color: #0081a3;
        }

        .navbar-brand .nav-link,
        .navbar-nav .nav-link {
            color: white;
            transition: color 0.3s, background-color 0.3s, padding 0.3s, font-size 0.3s;
        }

        .nav-alter {
            background-color: transparent;
            border-radius: 50px;
            transition: all 0.3s ease-in-out;
            font-size:20px;
            border-radius: 15px;
            padding-left:65px;
        }

        /* On scroll - slim variant */
        .nav-alter.scrolled {
            background-color: white;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            padding: 2px 10px;              /* reduced padding = smaller height */
            border-radius: 50px;
            padding-left:65px;
            font-size:30px;/* sharper corners when scrolled */
        }

        /* Text color when scrolled */
        .nav-alter.scrolled .navbar-brand .nav-link,
        .nav-alter.scrolled .navbar-nav .nav-link {
            color: #333;   /* dark gray for visibility */
            text-shadow: none;
            font-size:22px;
        }

        /* Hover accent */
        .navbar-nav .nav-link:hover,
        .navbar-brand .nav-link:hover,
        .nav-alter.scrolled .navbar-nav .nav-link:hover,
        .nav-alter.scrolled .navbar-brand .nav-link:hover {
            color: #0081a3;
        }

        .wide-search-form {
            flex-grow: 1;              /* takes available space */
            max-width: 600px;
            margin: 0 20px;
        }

        .wide-search-form .form-control {
            flex-grow: 1;
            max-width:400px;
            display:flex;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            background-color: white;
        }

        .btn-outline-success {
            color: #0081a3;
            border-color: #0081a3;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            background-color: white;
        }
        .btn-outline-success:hover {
            background-color: #0081a3 !important;
            color: white !important;
            border-color: #0081a3 !important;
        }

        @media (min-width: 768px) {
            .wide-search-form {
                min-width: 500px;
            }
        }

        /* hero */
        .hero-banner {
            position: absolute;         /* position image at very top */
            top: 0;
            left: 0;
            width: 100%;
            min-width:100vh;
            height: 800px;
            object-fit: cover;
            z-index: 0;                 /* behind navbar */
            filter:brightness(50%);
        }
        .hero-body {
            margin-top: 80px;           /* create space for fixed navbar */
        }
        .hero-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-align: center;
            background: rgba(0, 0, 0, 0); /* subtle dark overlay behind text */
            padding: 20px;
            border-radius: 10px;
            width:100%;
            max-width:90%;
        }
        @media (max-width: 768px) {
            .welcome {
                font-size: 2rem;        /* smaller text on mobile */
                white-space: normal;    /* allow wrapping */
                line-height: 1.2;
            }
        }
        .welcome {
            font-size: 4rem; /* Makes it big (adjust as needed) */
            font-family: 'Playfair Display', serif; /* Example elegant font */
            font-style: italic;
            font-weight: 700;
            color: white;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
            margin-bottom: 10px;
            white-space: nowrap;  /* Prevent text from wrapping to next line */
            overflow: hidden;
            min-width:100vh;
        }


        /* category */
        .heading{
            margin-top: 600px; /* image height (800px) + navbar height (60px) gives 860px*/

            font-weight:bold;
            <!--padding: 20px;-->
            <!--padding-bottom:10px;-->
            <!--flex:1;-->
        }
        .category h3 {
            margin-top: 0;
            margin-bottom: 0.5rem;
            font-weight: bold;
            line-height: 1.2;
            color: var(--bs-heading-color);
        }
        .category {
            margin-top:4px;
            color: #0081a3; /* Deep purple */
            font-family: 'Playfair Display', serif; /* Elegant font */
            font-style: italic;
            display: flex;
            align-items: center; /* Corrected */
            justify-content: space-evenly;
            font-weight: bold; /* Extra bold */
            font-size: 1.8rem; /* Slightly bigger for visibility */
            letter-spacing: 2px; /* Spacing for stylish feel */
            text-transform: uppercase; /* Optional: make it all caps */
            text-align: center;
            margin-top:80px;
            padding:20px;
        }
        .category-image:hover {
            transform: translateY(-6px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }

        /* top products */
        .top-products{
            margin-top:20px;
            color: #0081a3; /* Deep purple */
            font-family: 'Playfair Display', serif; /* Elegant font */
            font-style: italic;
            display: flex;
            align-items: center; /* Corrected */
            justify-content: space-evenly;
            font-weight: bold; /* Extra bold */
            font-size: 1.8rem; /* Slightly bigger for visibility */
            letter-spacing: 2px; /* Spacing for stylish feel */
            text-transform: uppercase; /* Optional: make it all caps */
            text-align: center;
            font-weight: 900;
            font-size: 1.8rem;
        }
        .top{
            margin-top: 0;
            margin-bottom: 3rem;
            font-weight: bold;
            line-height: 1.2;
            color: var(--bs-heading-color);
        }
        .card {
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            width: 250px;
            height: 400px;
            margin: 10px;
        }
        .card-body {
            margin-left: 10px;
        }
        .card-img-top {
            height: 180px;
            object-fit: cover;
        }
        .btn-cart {
            background-color: #0081a3;
            border-color: #4a148c;
        }
        .btn-cart:hover {
            background-color: #004051;
            border-color: #004051;
        }
        .quantity-control {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* category*/
        .category-row {
            display: flex;
            gap: 5px;
            flex-wrap: wrap;
            justify-content:center;
        }
        .category-card1{
             background-color: null;
             flex: 0 0 calc(16.66% - 40px); /* 100% / 6 = 16.66% */
             max-width: calc(16.66% - 20px);
             text-align:center;
        }
        .category-card {
            width: 200px;
            padding: 15px;
        }
        .category-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 10px auto;
            display: block;
            border:3px solid #0081a3;
        }
        .category-card-title {
            font-weight: bold;
            font-size: 1.1rem;
            color: #5a3e2b;
        }


        /* Table Booking*/
        .book{
            margin-top:2px;
            color: #0081a3; /* Deep purple */
            font-family: 'Playfair Display', serif; /* Elegant font */
            font-style: italic;
            display: flex;
            align-items: center; /* Corrected */
            justify-content: space-evenly;
            font-weight: bold; /* Extra bold */
            font-size: 1.8rem; /* Slightly bigger for visibility */
            letter-spacing: 2px; /* Spacing for stylish feel */
            text-transform: uppercase; /* Optional: make it all caps */
            text-align: center;
            font-weight: 900;
            font-size: 1.8rem;
            margin-bottom:1px;
        }
        @media (max-width: 768px) {
            .book {
                font-size: 1.4rem;            /* reduce size */
                text-align: center;
                margin: 20px 0;
                line-height: 1.2;
            }
        }

        .coffee-text{
            color: white;
            font-family: 'Playfair Display', serif; /* Elegant font */
            font-style: italic;
            display: flex;
            align-items: center;
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            <!--margin-bottom: 20px;-->
            <!--z-index: 1;-->
        }
        .btn-primary {
            margin-top:20px;
            background-color: transparent;
            border-color: #0081a3;
        }
        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active,
        .btn-primary.active {
            background-color: #0081a3 !important;
            border-color: white !important;
        }
        .table{
            margin-top:16px;
            height:470px;
            width:650px;
        }

        /* Images */
        .second-img {
            width: 100%;
            min-height: 40vh;
            background-image: url("https://t3.ftcdn.net/jpg/07/02/26/64/360_F_702266461_qmlHqbzTrbSMnDvV9sgRjd60ie8QnbSd.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display:flex;
            align-item:center;
            justify-content:center;
            color:white;
            position:relative;
            text-align:center;
            margin-top:40px;
        }
        .third-img {
            width: 100%;
            min-height: 40vh;
            background-image: url("https://images.pexels.com/photos/1283219/pexels-photo-1283219.jpeg?cs=srgb&dl=pexels-chris-f-38966-1283219.jpg&fm=jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display:flex;
            align-items:center;
            justify-content:center;
            color:white;
            position:relative;
            text-align:center;
        }

        /* Dark overlay only on background sections */
        .second-img::before,
        .third-img::before {
            content: "";
            position: absolute;
            inset: 0;
            z-index: 0;
            background:rgba(0,0,0,0.5);
        }
        .second-img > *,
        .third-img > * {
            position: relative;
            z-index: 1;
        }

        /* Blog */
        .blog-heading {
            color: white;
            font-family: 'Playfair Display', serif; /* Elegant font */
            font-style: italic;
            display: flex;
            align-items: center;
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 40px;
            z-index: 1;
        }
        .blog-section {
            background: #f9f9f9; /* light background */
        }
        .section-title h5 {
            font-size: 1.2rem;
            font-weight: bold;
            color: #ff4d4d;
            margin-bottom: 10px;
        }
        .section-title h2 {
            font-size: 2rem;
            font-weight: 700;
        }
        .row-blog {
            margin-top: 3rem;
            margin-bottom: 3rem;
            padding-left:80px;
        }
        .blog-card {
            border-radius: 8px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            height:100%;
        }
        .blog-card:hover {
            transform: translateY(-5px);
        }
        .blog-card img {
            height: 220px;
            object-fit: cover;
        }
        .blog-card .card-body {
            padding: 20px;
            text-align: center; /* centers text only */
        }
        .blog-card h5 {
            font-size: 1.1rem;
            font-weight: 600;
        }
        .blog-card .btn {
            border-radius: 0;
        }
        @media (max-width: 768px) {
            .heading-section .subheading {
                font-size: 1.4rem;            /* smaller script font */
                top: -0.8em;                  /* adjust vertical alignment */
            }
            .heading-section .recent-blog {
                font-size: 1.8rem;
            }
            .heading-section .row-blog {
                font-size: 1.8rem;
            }
        }

        .heading-section {
            padding-left:40px;
            position: relative;
            text-align: center; /* centers the text */
        }

        /* small script “Blog” */
        .heading-section .subhead {
            font-family: "Dancing Script", cursive;
            font-style:italic;
            font-size: 40px;
            padding-left:40px;
            font-weight: normal;
            color: #e57373; /* soft red */
            position: absolute;        /* overlay above h2 */
            top: -25px;                /* adjust vertical placement */
            left: 48%;
            transform: translateX(-50%);
            z-index: 1;
        }

        /* main bold heading */
        .heading-section .recent-blog {
            color: #333;
            font-family: 'Playfair Display', serif;
            font-size: 2.5em;
            font-weight: bold;
            position: relative;
            z-index: 2; /* above background, below subhead */
            margin: 0;
            margin-top:60px;
            align-items:center;
            margin-right:80px;
        }

        .contact-section {
            background: #0081a3;
            padding: 60px 20px;
        }
        .contact-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 40px;
            max-width: 1100px;
            margin: 0 auto;
            flex-wrap: wrap; /* makes it responsive */
        }
        .contact-form {
            flex: 1;
            min-width: 300px;
        }

        .contact-form h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .btn-submit {
            background: #1e3a8a;
            color: #fff;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-submit:hover {
            background: #14407d;
        }

        .contact-image {
            flex: 1;
            min-width: 300px;
            text-align: center;
        }

        .contact-image img {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

    /* Newsletter Section */
    .newsletter-section {
    background: url('https://static.vecteezy.com/system/resources/thumbnails/033/481/991/small/cool-pub-or-bar-interior-generative-ai-photo.jpeg') no-repeat center center/cover;
    background-attachment:fixed;
    padding: 40px 20px;
    justify-content:center;
    min-height:50vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    color: white;
    position: relative;

    }

    .newsletter-section::before {
    content: '';
    position: absolute;
    inset: 0;
    background-color: rgba(0, 0, 0, 0.55);
    z-index: 0;
    }

    .newsletter-content {
    position: relative;
    z-index: 1;
    max-width: 600px;
    width: 100%;
    }

    .newsletter-heading {
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 0.2rem;
    line-height: 1.1;
    }

    .newsletter-heading strong {
    font-weight: 900;
    font-size: 3rem;
    color: #ffffff;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.7);
    -webkit-text-stroke: 1px black;
    }

    .newsletter-subtext {
    font-size: 0.92rem;
    margin-bottom: 1.5rem;
    color: #eee;
    max-width: 500px;
    margin-left: auto;
    margin-right: auto;
    line-height: 1.4;
    }

    .newsletter-form {
    display: flex;
    gap: 10px;
    justify-content: center;
    }

    .newsletter-form input[type="email"] {
    flex-grow: 1;
    padding: 10px 15px;
    font-size: 1rem;
    border: none;
    border-radius: 3px;
    outline: none;
    }

    .newsletter-form button {
    background-color: #1e3a8a; /* dark blue */
    border: none;
    color: white;
    padding: 11px 25px;
    font-size: 1rem;
    cursor: pointer;
    border-radius: 3px;
    transition: background-color 0.3s ease;
    }

    .newsletter-form button:hover {
    background-color: #14407d;
    }

    /* Footer */

    footer {
    position:relative;
    background-color: #1e3a8a;
    padding: 40px 20px 30px;
    color: white;
    font-size: 0.9rem;
    margin-bottom:0;
    }

    .footer-container {
    max-width: 1100px;
    margin: 0 auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 40px;
    }

    .footer-logo-contact,
    .footer-links,
    .footer-social {
    flex: 1 1 250px;
    }

    .footer-logo-contact img {
    width: 120px;
    margin-bottom: 12px;
    }

    .footer-logo-contact p {
    font-size: 0.85rem;
    line-height: 1.3;
    max-width: 250px;
    margin-bottom: 1rem;
    font-weight: 600;
    }

    .contact-info {
    font-size: 0.85rem;
    margin-top: 10px;
    line-height: 1.3;
    }

    .contact-info div {
    margin-bottom: 6px;
    display: flex;
    align-items: center;
    gap: 8px;
    }

    .contact-info svg {
    fill: white;
    min-width: 18px;
    min-height: 18px;
    }

    .footer-links h4 {
    font-weight: 600;
    margin-bottom: 12px;
    }

    .footer-links a {
    display: block;
    color: #bcd0f7;
    text-decoration: none;
    margin-bottom: 6px;
    transition: color 0.3s ease;
    }

    .footer-links a:hover {
    color: white;
    }

    .footer-social h4 {
    font-weight: 600;
    margin-bottom: 12px;
    }

    .social-icons {
    display: flex;
    gap: 15px;
    align-items: center;
    }

    .social-icons a {
    color: white;
    font-size: 1.3rem;
    transition: color 0.3s ease;
    text-decoration: none;
    }

    .social-icons a:hover {
    color: #d0d0d0;
    }

    .copyright {
    text-align: center;
    font-size: 0.8rem;
    margin-top: 30px;
    color: #aac6ff;
    }

    /* Responsive */
    @media (max-width: 768px) {
    .newsletter-content {
    padding: 0 10px;
    }
    .newsletter-form {
    flex-direction: column;
    }
    .newsletter-form input,
    .newsletter-form button {
    width: 100%;
    }
    .footer-container {
    flex-direction: column;
    gap: 20px;
    }
    .footer-logo-contact,
    .footer-links,
    .footer-social {
    flex: none;
    width: 100%;
    }
    }

.btn-favorite {
    background-color: transparent;
    border: 2px solid white;
    font-size: 1.2rem;
    <!--color: gray;-->
    cursor: pointer;
}

        .btn-favorite.active {
    color: red;
    border: 2px solid white;
    border-radius: 50%;
}
    </style>
</head>

<body>
<div class="body">
    <div class="nav-alter">
        <nav class="navbar">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <h1 class="nav-link">UnionCafe`</h1>
                </a>

                <form class="d-flex wide-search-form" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                    <button class="btn btn-outline-success" type="submit" style="color:#0081a3">Search</button>
                </form>

                <div>
                    <nav id="navbar" class="navbar navbar-expand-lg">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav d-flex flex-row gap-3">
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" data-bs-toggle="tooltip"
                                       data-bs-placement="bottom" title="Home" href="${pageContext.request.contextPath}/Home/User/Home.jsp">
                                        <i class="fa-regular fa-house fa-sm"></i>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" data-bs-toggle="tooltip"
                                       data-bs-placement="bottom" title="Category" href="${pageContext.request.contextPath}/Home/User/Category.jsp">
                                        <i class="fa-solid fa-layer-group fa-sm"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" data-bs-toggle="tooltip"
                                       data-bs-placement="bottom" title="Booking" href="${pageContext.request.contextPath}/Home/User/Booking.jsp">
                                        <i class="fa-solid fa-utensils fa-sm"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Cart"
                                       href="${pageContext.request.contextPath}/Home/User/Cart.jsp">
                                        <i class="fa-solid fa-cart-shopping fa-xs"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Favorite" href="${pageContext.request.contextPath}/Home/User/favorite.jsp">
                                        <i class="fa-regular fa-heart fa-sm "></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Contact" href="#contact-section">
                                        <i class="fa-regular fa-comment-dots fa-sm"></i>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.userProfile}">
                                            <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                               title="Profile" href="${pageContext.request.contextPath}/Profile">
                                                <i class="fa-regular fa-circle-user fa-sm"></i>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                               title="Login" href="${pageContext.request.contextPath}/Home/User/Login.jsp">
                                                <i class="fa-regular fa-circle-user fa-sm"></i>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </nav>
    </div>
    <div class="hero-body">
        <div style="display: flex; justify-content: center; align-items: center; padding: 20px; margin-top:0">
            <div class="card-body text-center">
                <img src="${pageContext.request.contextPath}/Home/User/Images/bg_1.jpg"
                     alt="Bakery Items" class="hero-banner" style="background-color: rgba(0,0,0,0.6)">
            </div>
        </div>
    </div>
    <div class="hero-overlay">
        <div style="position: absolute; top: 50%; left:50%; transform: translate(-50%, -50%); color: white; text-align: center;">
            <h1 class="welcome">Welcome to UnionCafe`</h1>
            <p>Savor every moment and flavor at UnionCafe`, where warmth, freshly baked delights, and friendly smiles
                await you</p>
            <button type="button" class="btn btn-primary me-2"
                    onclick="window.location.href='${pageContext.request.contextPath}/Home/User/Booking.jsp'">
                Dine-In
            </button>

            <button type="button" class="btn btn-primary me-2"
                    onclick="window.location.href='${pageContext.request.contextPath}/Home/User/Category.jsp'">
                Take-Away
            </button>


        </div>
    </div>
</div>


<div class="heading" id="category-section">
    <br/>
    <div class="category">
        <a href="Category.jsp" style="text-decoration: none; color: inherit;">
            <h3>Category</h3>
        </a>
    </div>

    <div class="category-row d-flex justify-content-center flex-wrap">

        <!-- Card 1 -->
        <div class="category-card1">
            <a href="Category/Coffee.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://static.vecteezy.com/system/resources/thumbnails/031/958/727/small/a-cup-of-tea-and-a-teapot-on-a-wooden-table-ai-generated-photo.jpg"
                     class="card-img-top category-image"
                     alt="Black Forest Cake">
                <h5 class="category-card-title">Tea/Coffee</h5>
            </a>
        </div>

        <!-- Card 2 -->
        <div class="category-card1">
            <a href="Category/Starters.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://thumbs.dreamstime.com/b/indian-starter-tandoori-chicken-tikka-indian-chicken-tikka-tandoori-snack-prepared-chicken-served-mint-chutney-158573913.jpg"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Starters</h5>
            </a>
        </div>
        <div class="category-card1">
            <a href="Category/Breakfast.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFa3L5Wr39RXjD4kFyJABtC40WvXZbPLj0sg&s"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Breakfast</h5>
            </a>
        </div>
        <div class="category-card1">
            <a href="Category/Salad.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://i0.wp.com/kristineskitchenblog.com/wp-content/uploads/2024/03/fruit-salad-2391-3.jpg?resize=1400%2C2100&ssl=1"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Salad</h5>
            </a>
        </div>
        <div class="category-card1">
            <a href="Category/Dessert.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://wallpapercave.com/wp/wp3064856.jpg"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Desserts</h5>
            </a>
        </div>

        <div class="category-card1">
            <a href="Category/Cake.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://static.vecteezy.com/system/resources/thumbnails/026/349/563/small_2x/indulgent-chocolate-cake-slice-on-wooden-plate-generated-by-ai-free-photo.jpg"
                     class="card-img-top category-image"
                     alt="Black Forest Cake">
                <h5 class="category-card-title">Cake</h5>
            </a>
        </div>

        <div class="category-card1">
            <a href="Category/Pizza.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://t3.ftcdn.net/jpg/05/60/70/82/360_F_560708240_pMZPOuSfvblWGRoaiZFLT4wiFTzQPwQe.jpg"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Pizza</h5>
            </a>
        </div>
        <div class="category-card1">
            <a href="Category/Burger.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://img.freepik.com/free-photo/double-cheeseburger_23-2151950841.jpg?semt=ais_hybrid&w=740"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Burger</h5>
            </a>
        </div>
        <div class="category-card1">
            <a href="Category/Dinner.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://t4.ftcdn.net/jpg/03/61/86/91/360_F_361869194_7JGmIOSj2iUNi0AYoVhVyhKvaN6PkOah.jpg"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Dinner</h5>
            </a>
        </div>
        <div class="category-card1">
            <a href="Category/Mocktails.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://images.unsplash.com/photo-1654074518423-750767f571a9?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29ja3RhaWxzJTIwYW5kJTIwbW9ja3RhaWxzfGVufDB8fDB8fHww"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Mocktails</h5>
            </a>
        </div>
        <div class="category-card1">
            <a href="Category/Drinks.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz2td7otmRRE-6ezW6AcmQHunaqAFY09CwdA&s"
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">Drinks</h5>
            </a>
        </div>

        <div class="category-card1">
            <a href="Category/IceCream.jsp" style="text-decoration: none; color: inherit;">
                <img src="https://media.istockphoto.com/id/936205852/photo/chocolate-ice-cream-in-a-glass-cup.jpg?s=612x612&w=0&k=20&c=gcPTroDVPNSlCS45BkqEG-6-REnKFEzboBpuX8O3lY4="
                     class="card-img-top category-image"
                     alt="Chocolate Cake">
                <h5 class="category-card-title">IceCreams</h5>
            </a>
        </div>


    </div>

</div>

<div class="second-img mb-5 py-5 mb-2 mt-5 " >
    <h1 class="coffee-text" >Have a Coffee</h1>
</div>
<h1 class="book" style="font-size:bold" id="booking-section">Book A Table Now</h1>

<div class="Booking" >
    <div class="container my-5">
        <div class="row align-items-center">
            <!-- Form Column -->
            <div class="col-md-6">
                <form action="${pageContext.request.contextPath}/Home/User/booking" method="post" class="p-4 border rounded"
                      style="background-color: #0081a3; color: white;">
                    <h3 class="mb-4 text-center" style="color: white;">Book Your Table</h3>
                    <c:if test="${not empty success}">
                        <div style="color:green">${success}</div>
                    </c:if>
                    <c:if test="${not empty error}">
                        <div style="color:red">${error}</div>
                    </c:if>
                    <div class="row mb-3 align-items-center">
                        <label for="name" class="col-sm-4 col-form-label">Name:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Name" required value="${param.name}">
                            <span class="text-danger">${nameError}</span>
                            <span class="text-danger" id="name-error-js"></span>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="email" class="col-sm-4 col-form-label">Email *</label>
                        <div class="col-sm-8">
                            <input type="email" readonly class="form-control" id="email" name="email" placeholder="Email" required value="${sessionScope.userProfile}">
                            <span class="text-danger">${emailError}</span>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="phone" class="col-sm-4 col-form-label">Phone Number *</label>
                        <div class="col-sm-8">
                            <input type="tel" class="form-control" id="phone" name="phoneNumber" placeholder="Phone" minlength="10" maxlength="10" required value="${param.phoneNumber}">
                            <span class="text-danger">${phoneError}</span>
                            <span class="text-danger" id="phone-error-js"></span>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="checkin-date" class="col-sm-4 col-form-label">Check-in Date *</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="checkin-date" name="checkInDate" required value="${param.checkInDate}" min="<%= java.time.LocalDate.now() %>">
                            <span class="text-danger">${dateError}</span>
                            <span class="text-danger" id="date-error-js"></span>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="time" class="col-sm-4 col-form-label">Time *</label>
                        <div class="col-sm-8">
                            <input type="time" class="form-control" id="time" name="checkInTime" value="10:00" min="10:00" max="22:00" required>
                            <span class="text-danger">${timeError}</span>
                            <span class="text-danger" id="time-error-js"></span>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="guests" class="col-sm-4 col-form-label">Number of Guests *</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="guests" name="numberOfGuests" min="1" max="20" value="1" required >
                            <span class="text-danger">${guestsError}</span>
                            <span class="text-danger" id="guests-error-js"></span>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-light w-100">Book Now</button>
                </form>
            </div>

            <!-- Image Column -->
            <div class="table col-md-6 d-flex justify-content-center">
                <img src="${pageContext.request.contextPath}/Home/User/Images/img.png" alt="Booking Table"
                     class="img-fluid rounded"/>
            </div>
        </div>
    </div>

</div>

<div>
    <div class="top-products mb-8">
        <h3 class="top">Top Products</h3>
    </div>
</div>

<div class="display-area d-flex flex-wrap justify-content-center">
    <!-- Product 1 -->
    <div class="card h-50">
        <img src="https://t4.ftcdn.net/jpg/06/85/03/65/360_F_685036582_QOdhu9QUVJQ2JdJJz9rhPbVLtPZ7KNNQ.jpg"
             class="card-img-top" alt="Mocha">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Mocha">
            <input type="hidden" name="price" value="4.50">
            <input type="hidden" name="imageUrl" value="https://t4.ftcdn.net/jpg/06/85/03/65/360_F_685036582_QOdhu9QUVJQ2JdJJz9rhPbVLtPZ7KNNQ.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Mocha</h5>
            <p class="card-text">Espresso mixed with chocolate syrup, steamed milk, and topped with whipped cream.</p>
            <p class="card-text"><strong>Price: $4.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Mocha">
                <input type="hidden" name="price" value="4.50">
                <input type="hidden" name="imageUrl" value="https://t4.ftcdn.net/jpg/06/85/03/65/360_F_685036582_QOdhu9QUVJQ2JdJJz9rhPbVLtPZ7KNNQ.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">

                <!-- Quantity controls -->
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>

                <!-- Add to Cart button -->
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Product 2 -->
    <div class="card h-50">
        <img src="https://www.mygingergarlickitchen.com/wp-content/uploads/2024/02/paneer-tikka-recipe-12.jpg"
             class="card-img-top" alt="Paneer Tikka">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Paneer Tikka">
            <input type="hidden" name="price" value="6.00">
            <input type="hidden" name="imageUrl" value="https://www.mygingergarlickitchen.com/wp-content/uploads/2024/02/paneer-tikka-recipe-12.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Paneer Tikka</h5>
            <p class="card-text">Cottage cheese cubes marinated and grilled with peppers and onions.</p><br>
            <p class="card-text"><strong>Price: $6.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Paneer Tikka">
                <input type="hidden" name="price" value="6.00">
                <input type="hidden" name="imageUrl" value="https://www.mygingergarlickitchen.com/wp-content/uploads/2024/02/paneer-tikka-recipe-12.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">

                <!-- Quantity controls -->
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>

                <!-- Add to Cart button -->
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Product 3 -->
    <div class="card h-50 position-relative">
        <img src="https://vismaifood.com/storage/app/uploads/public/8b4/19e/427/thumb__700_0_0_0_auto.jpg"
             class="card-img-top" alt="Masala Dosa">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Masala Dosa">
            <input type="hidden" name="price" value="4.50">
            <input type="hidden" name="imageUrl" value="https://vismaifood.com/storage/app/uploads/public/8b4/19e/427/thumb__700_0_0_0_auto.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Masala Dosa</h5>
            <p class="card-text">Crispy dosa filled with spiced potato mixture, served with sambar and chutneys.</p><br>
            <p class="card-text"><strong>Price: $4.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Masala Dosa">
                <input type="hidden" name="price" value="4.50">
                <input type="hidden" name="imageUrl" value="https://vismaifood.com/storage/app/uploads/public/8b4/19e/427/thumb__700_0_0_0_auto.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">

                <!-- Quantity controls -->
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>

                <!-- Add to Cart button -->
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>


    <!-- Product 4 -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdmO4JADXCOtgTEI_3-L-aEiBOHEKgqfWcbw&s"
             class="card-img-top" alt="Fruit Salad">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Fruit Salad">
            <input type="hidden" name="price" value="6.50">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdmO4JADXCOtgTEI_3-L-aEiBOHEKgqfWcbw&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Fruit Salad</h5>
            <p class="card-text">Fresh seasonal fruits chopped and mixed with a light honey-lime dressing.</p><br>
            <p class="card-text"><strong>Price: $6.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Fruit Salad">
                <input type="hidden" name="price" value="6.50">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdmO4JADXCOtgTEI_3-L-aEiBOHEKgqfWcbw&s">
                <input type="hidden" name="quantity" class="quantity-field" value="1">

                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>
    <!-- Product 5 -->
    <div class="card h-50 position-relative">
        <img src="https://spicesnflavors.com/wp-content/uploads/2020/10/rasmalai-1.jpg"
             class="card-img-top" alt="Ras Malai">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Ras Malai">
            <input type="hidden" name="price" value="6.00">
            <input type="hidden" name="imageUrl" value="https://spicesnflavors.com/wp-content/uploads/2020/10/rasmalai-1.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Ras Malai</h5>
            <p class="card-text">Soft cheese patties soaked in sweet saffron-flavored milk with nuts.</p><br>
            <p class="card-text"><strong>Price: $6.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Ras Malai">
                <input type="hidden" name="price" value="6.00">
                <input type="hidden" name="imageUrl" value="https://spicesnflavors.com/wp-content/uploads/2020/10/rasmalai-1.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">

                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>

                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Product 6 -->
    <div class="card h-50 position-relative">
        <img src="https://www.foodandwine.com/thmb/H9NS3GaVp-2XHt6wbPtrhwh0bws=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Black-Forest-Cake-FT-RECIPE0623-29bb291902e845bab17a7fc1d65e4ebb.jpg"
             class="card-img-top" alt="Black Forest Cake">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Black Forest Cake">
            <input type="hidden" name="price" value="10.00">
            <input type="hidden" name="imageUrl" value="https://www.foodandwine.com/thmb/H9NS3GaVp-2XHt6wbPtrhwh0bws=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Black-Forest-Cake-FT-RECIPE0623-29bb291902e845bab17a7fc1d65e4ebb.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Black Forest Cake</h5>
            <p class="card-text">Chocolate creamy dark forest cake with fresh fruits.</p><br><br><br>
            <p class="card-text"><strong>Price: $10.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2 mt-auto">
                <input type="hidden" name="productName" value="Black Forest Cake">
                <input type="hidden" name="price" value="10.00">
                <input type="hidden" name="imageUrl" value="https://www.foodandwine.com/thmb/H9NS3GaVp-2XHt6wbPtrhwh0bws=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Black-Forest-Cake-FT-RECIPE0623-29bb291902e845bab17a7fc1d65e4ebb.jpg">
                <input type="hidden" name="quantity" value="1" class="quantity-field">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width: 30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Product 7 -->
    <div class="card h-50 position-relative">
        <img src="https://spicethefood.com/wp-content/uploads/2022/05/How-Long-Does-Dominos-Pizza-Last-e1652281636518.jpg"
             class="card-img-top" alt="Margherita Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Margherita Pizza">
            <input type="hidden" name="price" value="7.00">
            <input type="hidden" name="imageUrl" value="hhttps://spicethefood.com/wp-content/uploads/2022/05/How-Long-Does-Dominos-Pizza-Last-e1652281636518.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Margherita Pizza</h5>
            <p class="card-text">Classic pizza topped with tomato, mozzarella, and fresh basil for a simple yet flavorful experience.</p><br>
            <p class="card-text"><strong>Price: $7.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Margherita Pizza">
                <input type="hidden" name="price" value="7.00">
                <input type="hidden" name="imageUrl" value="https://spicethefood.com/wp-content/uploads/2022/05/How-Long-Does-Dominos-Pizza-Last-e1652281636518.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Product 8 -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR49Qk7Q5s5q0VkvVZf1E7_w3fDzPfBD_aD-g&s" class="card-img-top" alt="BBQ Chicken Burger">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="BBQ Chicken Burger" />
            <input type="hidden" name="price" value="7.75" />
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR49Qk7Q5s5q0VkvVZf1E7_w3fDzPfBD_aD-g&s" />
            <input type="hidden" name="action" value="add" />
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">BBQ Chicken Burger</h5>
            <p class="card-text">Grilled chicken breast topped with smoky BBQ sauce, lettuce, and cheddar cheese.</p>
            <br>
            <p class="card-text"><strong>Price: $7.75</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="BBQ Chicken Burger" />
                <input type="hidden" name="price" value="7.75" />
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR49Qk7Q5s5q0VkvVZf1E7_w3fDzPfBD_aD-g&s" />
                <input type="hidden" name="quantity" class="quantity-field" value="1" />
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" style="width:30px;" value="1" />
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>
    <!-- Product 9 -->
    <div class="card h-50 position-relative">
        <img src="https://www.licious.in/blog/wp-content/uploads/2022/06/chicken-hyderabadi-biryani-01-750x750.jpg" class="card-img-top" alt="Chicken Biryani" />
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Chicken Biryani" />
            <input type="hidden" name="price" value="12.00" />
            <input type="hidden" name="imageUrl" value="https://www.licious.in/blog/wp-content/uploads/2022/06/chicken-hyderabadi-biryani-01-750x750.jpg" />
            <input type="hidden" name="action" value="add" />
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Chicken Biryani</h5>
            <p class="card-text">Aromatic basmati rice cooked with tender chicken and traditional spices.</p><br><br>
            <p class="card-text"><strong>Price: $12.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Chicken Biryani" />
                <input type="hidden" name="price" value="12.00" />
                <input type="hidden" name="imageUrl" value="https://www.licious.in/blog/wp-content/uploads/2022/06/chicken-hyderabadi-biryani-01-750x750.jpg" />
                <input type="hidden" name="quantity" class="quantity-field" value="1" />
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;" />
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>
    <!-- Product 10 -->
    <div class="card h-50 position-relative">
        <img src="https://www.cubesnjuliennes.com/wp-content/uploads/2022/12/Tandoori-Chicken-Recipe.jpg" class="card-img-top" alt="Tandoori Chicken" />
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Tandoori Chicken" />
            <input type="hidden" name="price" value="12.00" />
            <input type="hidden" name="imageUrl" value="https://www.cubesnjuliennes.com/wp-content/uploads/2022/12/Tandoori-Chicken-Recipe.jpg" />
            <input type="hidden" name="action" value="add" />
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Tandoori Chicken</h5>
            <p class="card-text">Juicy chicken marinated in yogurt and spices, cooked in a traditional tandoor oven.</p><br><br>
            <p class="card-text"><strong>Price: $12.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Tandoori Chicken" />
                <input type="hidden" name="price" value="12.00" />
                <input type="hidden" name="imageUrl" value="https://www.cubesnjuliennes.com/wp-content/uploads/2022/12/Tandoori-Chicken-Recipe.jpg" />
                <input type="hidden" name="quantity" class="quantity-field" value="1" />
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;" />
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <div class="card h-50 position-relative">
        <img src="https://recipes.clubandresortchef.com/wp-content/uploads/2022/03/Eco-Mojito-Cocktail_recipe_JW-Marriott-San-Antonio-Hill-Country-Resort-Spa.jpg" alt="Mojito" class="card-img-top">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Mojito" />
            <input type="hidden" name="price" value="7.50" />
            <input type="hidden" name="imageUrl" value="https://recipes.clubandresortchef.com/wp-content/uploads/2022/03/Eco-Mojito-Cocktail_recipe_JW-Marriott-San-Antonio-Hill-Country-Resort-Spa.jpg" />
            <input type="hidden" name="action" value="add" />
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Mojito</h5>
            <p class="card-text">White rum, fresh lime juice, sugar, soda water, and mint leaves for a refreshing taste.</p><br><br><br>
            <p class="card-text"><strong>Price: $7.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Mojito" />
                <input type="hidden" name="price" value="7.50" />
                <input type="hidden" name="imageUrl" value="https://recipes.clubandresortchef.com/wp-content/uploads/2022/03/Eco-Mojito-Cocktail_recipe_JW-Marriott-San-Antonio-Hill-Country-Resort-Spa.jpg" />
                <input type="hidden" name="quantity" class="quantity-field" value="1" />
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" style="width:30px;" value="1" />
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>


    <!-- Product 7 -->
    <div class="card h-50 position-relative">
        <img src="https://thumbs.dreamstime.com/b/bottles-famous-global-beer-brands-poznan-pol-mar-including-heineken-becks-bud-miller-corona-stella-artois-san-miguel-143170440.jpg" class="card-img-top" alt="Glenfiddich 12 Year Old" />
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Glenfiddich 12 Year Old" />
            <input type="hidden" name="price" value="50.00" />
            <input type="hidden" name="imageUrl" value="https://thumbs.dreamstime.com/b/bottles-famous-global-beer-brands-poznan-pol-mar-including-heineken-becks-bud-miller-corona-stella-artois-san-miguel-143170440.jpg" />
            <input type="hidden" name="action" value="add" />
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Combo Beer 10</h5>
            <p class="card-text">Combo comes with 10 Beers like, Tuborg, Budweiser, Stella Artois, Becks, Heineken, Corona, Brocode, Kingfisher, Royal Challengers, Bud Light</p>
            <p class="card-text"><strong>Price: $1000.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Glenfiddich 12 Year Old" />
                <input type="hidden" name="price" value="50.00" />
                <input type="hidden" name="imageUrl" value="https://thumbs.dreamstime.com/b/bottles-famous-global-beer-brands-poznan-pol-mar-including-heineken-becks-bud-miller-corona-stella-artois-san-miguel-143170440.jpg" />
                <input type="hidden" name="quantity" class="quantity-field" value="1" />
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;" />
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Product 8 -->
    <div class="card h-50 position-relative">
        <img src="https://cdn.luxe.digital/media/20220215094327/johnnie-walker-luxury-whiskey-luxe-digital.jpg" class="card-img-top" alt="Johnnie Walker Label" />
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Johnnie Walker Label" />
            <input type="hidden" name="price" value="30.00" />
            <input type="hidden" name="imageUrl" value="https://cdn.luxe.digital/media/20220215094327/johnnie-walker-luxury-whiskey-luxe-digital.jpg" />
            <input type="hidden" name="action" value="add" />
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Johnnie Walker Label</h5>
            <p class="card-text">Classic blended Scotch whisky with vibrant and smoky flavors. Red, Black, Double Black, Gold, Platinum, Blue</p><br>
            <p class="card-text"><strong>Price: $30.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Johnnie Walker Label" />
                <input type="hidden" name="price" value="30.00" />
                <input type="hidden" name="imageUrl" value="https://cdn.luxe.digital/media/20220215094327/johnnie-walker-luxury-whiskey-luxe-digital.jpg" />
                <input type="hidden" name="quantity" class="quantity-field" value="1" />
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;" />
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Product 9 -->
    <div class="card h-50 position-relative">
        <img src="https://media.istockphoto.com/id/936205772/photo/chocolate-ice-cream-in-a-glass-cup.jpg?s=612x612&w=0&k=20&c=xBDPxGzIgWcE8tFZ4azKm1P_OoxP8H22XkyHguZlVhw=" class="card-img-top" alt="Chocolate Ice Cream" />
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Chocolate Ice Cream" />
            <input type="hidden" name="price" value="4.50" />
            <input type="hidden" name="imageUrl" value="https://media.istockphoto.com/id/936205772/photo/chocolate-ice-cream-in-a-glass-cup.jpg?s=612x612&w=0&k=20&c=xBDPxGzIgWcE8tFZ4azKm1P_OoxP8H22XkyHguZlVhw=" />
            <input type="hidden" name="action" value="add" />
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Chocolate Ice Cream</h5>
            <p class="card-text">Rich and creamy chocolate ice cream made with real cocoa.</p><br><br><br>
            <p class="card-text"><strong>Price: $4.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Chocolate Ice Cream" />
                <input type="hidden" name="price" value="4.50" />
                <input type="hidden" name="imageUrl" value="https://media.istockphoto.com/id/936205772/photo/chocolate-ice-cream-in-a-glass-cup.jpg?s=612x612&w=0&k=20&c=xBDPxGzIgWcE8tFZ4azKm1P_OoxP8H22XkyHguZlVhw=" />
                <input type="hidden" name="quantity" class="quantity-field" value="1" />
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" style="width: 30px;" value="1" />
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>
    <div class="card h-50">
        <img src="https://www.dessertfortwo.com/wp-content/uploads/2018/08/brioche-french-toast-9-735x1103.jpg"
             class="card-img-top" alt="French Toast">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="French Toast">
            <input type="hidden" name="price" value="7.00">
            <input type="hidden" name="imageUrl" value="https://www.dessertfortwo.com/wp-content/uploads/2018/08/brioche-french-toast-9-735x1103.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">French Toast</h5>
            <p class="card-text">Brioche bread dipped in egg, griddled, dusted with powdered sugar.</p><br><br><br>
            <p class="card-text"><strong>Price: $7.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="French Toast">
                <input type="hidden" name="price" value="7.00">
                <input type="hidden" name="imageUrl" value="https://www.dessertfortwo.com/wp-content/uploads/2018/08/brioche-french-toast-9-735x1103.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">

                <!-- Quantity controls -->
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input type="text" class="form-control form-control-sm mx-1 quantity-input" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>

                <!-- Add to Cart button -->
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>
</div>

<div class="third-img py-5 mb-2 mt-5">
    <!--<img src="" alt="table-img" />-->
    <h1 class="blog-heading">Toasting to the simple joys of life</h1>
</div>
<div class="container">
    <div class=" text-center heading-section">
        <span class="subhead">Blog</span>
        <h2 class="recent-blog mb-4">Recent Blog</h2>

    </div>
    <div class="row row-blog justify-content-center">
        <!-- Blog Card 1 -->
        <div class="col-md-4">
            <div class="card blog-card h-100 shadow-sm border-0">
                <img src="${pageContext.request.contextPath}/Home/User/Images/image_3.jpg"
                     class="card-img-top" alt="Blog 1">
                <div class="card-body">
                    <small class="text-muted">August 3, 2025 | Admin</small>
                    <h5 class="card-title mt-2">Finding solace in the quiet moments with a good drink.</h5>
                    <a href="#" class="btn mt-3" style="background-color:#0081a3; color:white">Read more</a>
                </div>
            </div>
        </div>

        <!-- Blog Card 2 -->
        <div class="col-md-4">
            <div class="card blog-card h-100 shadow-sm border-0">
                <img src="${pageContext.request.contextPath}/Home/User/Images/bg_4.jpg" class="card-img-top"
                     alt="Blog 2">
                <div class="card-body">
                    <small class="text-muted">August 10, 2025 | Admin</small>
                    <h5 class="card-title mt-2">A perfect place to dine, relax, and enjoy.</h5>
                    <a href="#" class="btn mt-3" style="background-color:#0081a3; color:white">Read more</a>
                </div>
            </div>
        </div>

        <!-- Blog Card 3 -->
        <div class="col-md-4">
            <div class="card blog-card h-100 shadow-sm border-0">
                <img src="${pageContext.request.contextPath}/Home/User/Images/image_2.jpg"
                     class="card-img-top" alt="Blog 3">
                <div class="card-body">
                    <small class="text-muted">August 17, 2025 | Admin</small>
                    <h5 class="card-title mt-2">Drink because you are happy, but never because you are miserable.</h5>
                    <a href="#" class="btn mt-3 " style="background-color:#0081a3; color:white">Read more</a>
                </div>
            </div>
        </div>
    </div>
</div>


<section class="newsletter-section " aria-label="Newsletter subscription">
    <div class="newsletter-content" >
        <h2 class="newsletter-heading">
            Subscribe to our <strong>Newsletter!</strong>
        </h2>
        <p class="newsletter-subtext" >
            Get exclusive updates, special discounts, promotions, and free content delivered right to your inbox.
        </p>
        <form class="newsletter-form" action="#" method="post">
            <input
                    type="email"
                    name="email"
                    placeholder="Email"
                    aria-label="Email address"
                    required
            />
            <button type="submit" id="contact-section">Subscribe</button>
        </form>
    </div>
</section>

<section class="contact-section py-5" >
    <div class="container contact-container">
        <!-- Left: Contact Form -->
        <div class="contact-form">
            <h2 class="mb-4">Get in Touch</h2>
            <form action="#" method="post">
                <div class="form-group">
                    <label for="fullName">Name</label>
                    <input type="text" id="fullName" name="name" required>
                </div>

                <div class="form-group">
                    <label for="emailId">Email</label>
                    <input type="email" id="emailId" name="email" required>
                </div>

                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" rows="5" required></textarea>
                </div>

                <button type="submit" class="btn-submit">Send Message</button>
            </form>
        </div>

        <!-- Right: Image -->
        <div class="contact-image">
            <img src="https://www.spoton.com/blog/content/images/2024/06/restaurant-customer-feedback.jpeg"
                 alt="Cake Shop"/>
        </div>
    </div>
</section>


<footer class="mt-5">
    <div class="footer-container">
        <div class="footer-logo-contact">
            <!-- Replace with actual logo if available -->
            <img src="${pageContext.request.contextPath}/Home/User/Images/UnionCafe%60.png" alt="Company Logo"/>
            <p>Your trusted café, serving delicious treats and warm memories.</p>
            <div class="contact-info">
                <div><i class="fas fa-envelope"></i> support@unioncafe.com</div>
                <div><i class="fas fa-phone-alt"></i> +91 935371-5968</div>
                <div><i class="fas fa-map-marker-alt"></i>MG Road, Bangalore, India</div>
            </div>
        </div>

        <div class="footer-links">
            <h4>Useful Links</h4>
            <a href="#">Order Online</a>
            <a href="#">Terms & Conditions</a>
            <a href="#">Refund & Return Policy</a>
            <a href="#">Privacy Policy</a>
        </div>

        <div class="footer-social">
            <h4>Connect with us</h4>
            <div class="social-icons">
                <a href="#" aria-label="Facebook"><i class="fab fa-facebook"></i></a>
                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    <p class="copyright">&copy; 2025 UnionCafe`. All rights reserved</p>
    <div class="mt-1" style="position:relative;">
        <div id="footer-clock" style="position:absolute; top:5px; right:20px; color:white; font-size:0.95em;"></div>
        <script>
            function updateTime() {
                const now = new Date();
                const options = { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit',second:'2-digit', hour12: true };
                document.getElementById('footer-clock').textContent = now.toLocaleString('en-IN', options);
            }
            updateTime();
            setInterval(updateTime, 1000);

            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl, {
                trigger: 'hover'  // show tooltip only on hover
                })
            })

            // Hide tooltip on click
            tooltipTriggerList.forEach(function (el) {
            el.addEventListener('click', function () {
            var tooltip = bootstrap.Tooltip.getInstance(el)
            if (tooltip) {
                tooltip.hide()
                }
            })
        });
            window.addEventListener("scroll", function() {
                const navbar = document.querySelector(".nav-alter");
                if (window.scrollY > 50) {
                    navbar.classList.add("scrolled");
                } else {
                    navbar.classList.remove("scrolled");
                }
            });

            document.querySelectorAll('.quantity-btn').forEach(btn => {
                    btn.addEventListener('click', function(e) {
                        e.preventDefault(); // prevent form submit when clicking + or -

                        // find the form of this button
                        const form = btn.closest('form');

                        const displayInput = form.querySelector('.quantity-input');
                        const hiddenInput = form.querySelector('.quantity-field');

                        let value = parseInt(displayInput.value) || 1;

                        if (btn.dataset.action === 'increase') value++;
                        if (btn.dataset.action === 'decrease' && value > 1) value--;

                        displayInput.value = value;
                        hiddenInput.value = value;
                    });
                });

            document.querySelectorAll('.btn-favorite').forEach(btn => {
            const icon = btn.querySelector('i');

            // Initialize color based on active class
            icon.style.color = btn.classList.contains('active') ? 'red' : 'gray';

            btn.addEventListener('click', function() {
                const form = btn.closest('.card').querySelector('.favorite-form');
                const productName = form.querySelector('input[name="productName"]').value;
                const price = form.querySelector('input[name="price"]').value;

                if(btn.classList.contains('active')) {
                    // Unselect
                    btn.classList.remove('active');
                    icon.style.color = 'gray';
                    form.querySelector('input[name="action"]').value = 'remove';
                } else {
                    // Select
                    btn.classList.add('active');
                    icon.style.color = 'red';
                    form.querySelector('input[name="action"]').value = 'add';
                }

                // Submit the hidden form to servlet to update session
                form.submit();
            });
        });

            function clearJsErrors() {
        ['name-error-js', 'phone-error-js', 'date-error-js', 'time-error-js', 'guests-error-js'].forEach(id => {
            document.getElementById(id).textContent = '';
        });
    }
    function validateBookingFormJS() {
        clearJsErrors();
        let valid = true;
        const name = document.getElementById("name").value.trim();
        if (name === "") {
            document.getElementById("name-error-js").textContent = "Name is required.";
            valid = false;
        }
        const phone = document.getElementById("phone").value.trim();
        const phoneRegex = /^[0-9]{10}$/;
        if (!phoneRegex.test(phone)) {
            document.getElementById("phone-error-js").textContent = "Enter a valid 10-digit phone number.";
            valid = false;
        }
        const checkInDate = document.getElementById("checkin-date").value;
        if (!checkInDate) {
            document.getElementById("date-error-js").textContent = "Select a check-in date.";
            valid = false;
        } else {
            const today = new Date(); today.setHours(0,0,0,0);
            const selected = new Date(checkInDate);
            if (selected < today) {
                document.getElementById("date-error-js").textContent = "Check-in date cannot be in the past.";
                valid = false;
            }
        }
        const checkInTime = document.getElementById("time").value;
        if (!checkInTime || checkInTime < "10:00" || checkInTime > "22:00") {
            document.getElementById("time-error-js").textContent = "Check-in time must be between 10:00 and 22:00.";
            valid = false;
        }
        const guests = document.getElementById("guests").value;
        if (guests < 1 || guests > 20) {
            document.getElementById("guests-error-js").textContent = "Number of guests must be between 1 and 20.";
            valid = false;
        }
        return valid;
    }
    document.getElementById('bookingForm').addEventListener('submit', function(e) {
        if (!validateBookingFormJS()) {
            e.preventDefault();
        }
    });
        </script>
    </div>

</footer>

</body>
</html>