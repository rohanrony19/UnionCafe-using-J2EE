<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
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
                 padding-left:65px;
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
                 background-color: #0081a3;
                 border-radius: 50px;
                 transition: all 0.3s ease-in-out;
                 <!--font-size:20px;-->
                 border-radius: 15px;
                 <!--padding-left:65px;-->
                 color: #333;   /* dark gray for visibility */
                 text-shadow: none;
                 font-size:22px;
                 box-shadow: 0 2px 6px rgba(0,0,0,0.1);
                 padding: 2px 10px;
             }

             /* On scroll - slim variant */
             <!--.nav-alter.scrolled {-->
             <!--    background-color: white;-->
             <!--    box-shadow: 0 2px 6px rgba(0,0,0,0.1);-->
             <!--    padding: 2px 10px;              /* reduced padding = smaller height */-->
             <!--    border-radius: 50px;-->
             <!--    padding-left:65px;-->
             <!--    font-size:30px;/* sharper corners when scrolled */-->
             <!--}-->

             <!--/* Text color when scrolled */-->
             <!--.nav-alter.scrolled .navbar-brand .nav-link,-->
             <!--.nav-alter.scrolled .navbar-nav .nav-link {-->
             <!--    color: #333;   /* dark gray for visibility */-->
             <!--    text-shadow: none;-->
             <!--    font-size:22px;-->
             <!--}-->

             <!--/* Hover accent */-->
             <!--.navbar-nav .nav-link:hover,-->
             <!--.navbar-brand .nav-link:hover,-->
             <!--.nav-alter.scrolled .navbar-nav .nav-link:hover,-->
             <!--.nav-alter.scrolled .navbar-brand .nav-link:hover {-->
             <!--    color: #0081a3;-->
             <!--}-->

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

             /* category */
             .heading{
                 margin-top: 2px; /* image height (800px) + navbar height (60px) gives 860px*/

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
             .top-products{
                         margin-top:35px;
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
                         margin-bottom: 2rem;
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
        .footer {
        background-color:#0081a3;
  width: 100%;
  position: relative; /* change to fixed for sticky footer */
  bottom: 0;
  left: 0;
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
                                       data-bs-placement="bottom" title="Home" href="../Home.jsp">
                                        <i class="fa-regular fa-house fa-sm"></i>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" data-bs-toggle="tooltip"
                                       data-bs-placement="bottom" title="Category" href="../Category.jsp">
                                        <i class="fa-solid fa-layer-group fa-sm"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" data-bs-toggle="tooltip"
                                       data-bs-placement="bottom" title="Booking" href="../Booking.jsp">
                                        <i class="fa-solid fa-utensils fa-sm"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Cart"
                                       href="../Cart.jsp">
                                        <i class="fa-solid fa-cart-shopping fa-xs"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Favorite" href="../favorite.jsp">
                                        <i class="fa-regular fa-heart fa-sm "></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Contact" href="../Home.jsp">
                                        <i class="fa-regular fa-comment-dots fa-sm"></i>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Profile" href="../Login.jsp ">
                                        <i class="fa-regular fa-circle-user fa-sm"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </nav>
    </div>
    <!--    <script>-->
    <!--        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))-->
    <!--        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {-->
    <!--            return new bootstrap.Tooltip(tooltipTriggerEl, {-->
    <!--        trigger: 'hover'  // show tooltip only on hover-->
    <!--            })-->
    <!--        })-->

    <!--    // Hide tooltip on click-->
    <!--    tooltipTriggerList.forEach(function (el) {-->
    <!--      el.addEventListener('click', function () {-->
    <!--        var tooltip = bootstrap.Tooltip.getInstance(el)-->
    <!--        if (tooltip) {-->
    <!--          tooltip.hide()-->
    <!--        }-->
    <!--      })-->
    <!--    });-->
    <!--window.addEventListener("scroll", function() {-->
    <!--    const navbar = document.querySelector(".nav-alter");-->
    <!--    if (window.scrollY > 50) {-->
    <!--        navbar.classList.add("scrolled");-->
    <!--    } else {-->
    <!--        navbar.classList.remove("scrolled");-->
    <!--    }-->
    <!--});-->

    <!--         const favBtn = document.getElementById('favoriteBtn');-->

    <!--favBtn.addEventListener('click', function() {-->
    <!--this.classList.toggle('active');-->
    <!--// TODO: Add logic here to add/remove from favorites section if needed-->
    <!--});-->
    <!--    </script>-->
    <!--<div class="hero-body">-->
    <!--    <div style="display: flex; justify-content: center; align-items: center; padding: 20px; margin-top:0">-->
    <!--        <div class="card-body text-center">-->
    <!--            <img src="$%7BpageContext.request.contextPath%7D/Images/bg_1.jpg"-->
    <!--                 alt="Bakery Items" class="hero-banner" style="background-color: rgba(0,0,0,0.6)">-->
    <!--        </div>-->
    <!--    </div>-->
    <!--</div>-->
    <!--<div class="hero-overlay">-->
    <!--    <div style="position: absolute; top: 50%; left:50%; transform: translate(-50%, -50%); color: white; text-align: center;">-->
    <!--        <h1 class="welcome">Welcome to UnionCafe`</h1>-->
    <!--        <p>Savor every moment and flavor at UnionCafe`, where warmth, freshly baked delights, and friendly smiles-->
    <!--            await you</p>-->
    <!--        <button class="btn btn-primary me-2" onclick="window.location.href='DineIn.jsp'">Dine-In</button>-->
    <!--        <button class="btn btn-primary me-2">Take-Away</button>-->
    <!--    </div>-->
    <!--</div>-->
    <!--</div>-->


    <div class="heading" id="category-section">
        <br/>
        <div class="category">
            <a href="../Category.jsp" style="text-decoration: none; color: inherit;">
                <h3>Category</h3>
            </a>
        </div>

        <div class="category-row d-flex justify-content-center flex-wrap">

            <!-- Card 1 -->
            <div class="category-card1">
                <a href="Coffee.jsp"
                   style="text-decoration: none; color: inherit;">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/031/958/727/small/a-cup-of-tea-and-a-teapot-on-a-wooden-table-ai-generated-photo.jpg"
                         class="card-img-top category-image"
                         alt="Black Forest Cake">
                    <h5 class="category-card-title">Tea/Coffee</h5>
                </a>
            </div>

            <!-- Card 2 -->
            <div class="category-card1">
                <a href="Starters.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://thumbs.dreamstime.com/b/indian-starter-tandoori-chicken-tikka-indian-chicken-tikka-tandoori-snack-prepared-chicken-served-mint-chutney-158573913.jpg"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Starters</h5>
                </a>
            </div>
            <div class="category-card1">
                <a href="Breakfast.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFa3L5Wr39RXjD4kFyJABtC40WvXZbPLj0sg&s"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Breakfast</h5>
                </a>
            </div>
            <div class="category-card1">
                <a href="Salad.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://i0.wp.com/kristineskitchenblog.com/wp-content/uploads/2024/03/fruit-salad-2391-3.jpg?resize=1400%2C2100&ssl=1"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Salad</h5>
                </a>
            </div>
            <div class="category-card1">
                <a href="Dessert.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://wallpapercave.com/wp/wp3064856.jpg"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Desserts</h5>
                </a>
            </div>

            <div class="category-card1">
                <a href="Cake.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/026/349/563/small_2x/indulgent-chocolate-cake-slice-on-wooden-plate-generated-by-ai-free-photo.jpg"
                         class="card-img-top category-image"
                         alt="Black Forest Cake">
                    <h5 class="category-card-title">Cake</h5>
                </a>
            </div>

            <!-- Card 2 -->


            <div class="category-card1">
                <a href="Pizza.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://t3.ftcdn.net/jpg/05/60/70/82/360_F_560708240_pMZPOuSfvblWGRoaiZFLT4wiFTzQPwQe.jpg"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Pizza</h5>
                </a>
            </div>
            <div class="category-card1">
                <a href="Burger.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://img.freepik.com/free-photo/double-cheeseburger_23-2151950841.jpg?semt=ais_hybrid&w=740"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Burger</h5>
                </a>
            </div>
            <div class="category-card1">
                <a href="Dinner.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://t4.ftcdn.net/jpg/03/61/86/91/360_F_361869194_7JGmIOSj2iUNi0AYoVhVyhKvaN6PkOah.jpg"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Dinner</h5>
                </a>
            </div>
            <div class="category-card1">
                <a href="Mocktails.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://images.unsplash.com/photo-1654074518423-750767f571a9?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29ja3RhaWxzJTIwYW5kJTIwbW9ja3RhaWxzfGVufDB8fDB8fHww"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Mocktails</h5>
                </a>
            </div>
            <div class="category-card1">
                <a href="Drinks.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz2td7otmRRE-6ezW6AcmQHunaqAFY09CwdA&s"
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">Drinks</h5>
                </a>
            </div>

            <div class="category-card1">
                <a href="IceCream.jsp" style="text-decoration: none; color: inherit;">
                    <img src="https://media.istockphoto.com/id/936205852/photo/chocolate-ice-cream-in-a-glass-cup.jpg?s=612x612&w=0&k=20&c=gcPTroDVPNSlCS45BkqEG-6-REnKFEzboBpuX8O3lY4="
                         class="card-img-top category-image"
                         alt="Chocolate Cake">
                    <h5 class="category-card-title">IceCreams</h5>
                </a>
            </div>


        </div>

    </div>
</div>
<hr/>
<div>
    <div class="top-products mb-10">
        <h3 class="top">Starters</h3>
    </div>
</div>

<div class="display-area d-flex flex-wrap justify-content-center">

    <!-- Example Product Card -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScyKeedlAn0oGGVd0m5cXyhDweBt95hWUeRw&s"
             class="card-img-top" alt="Veg Manchurian">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Veg Manchurian">
            <input type="hidden" name="price" value="6.00">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScyKeedlAn0oGGVd0m5cXyhDweBt95hWUeRw&s">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Veg Manchurian</h5>
            <p class="card-text">Finely chopped mixed vegetables (cabbage, carrot, beans, peppers) are spiced, rolled into balls, deep-fried until golden, and tossed in a sweet-spicy garlic soy sauce.</p><br>
            <p class="card-text"><strong>Price: $6.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Veg Manchurian">
                <input type="hidden" name="price" value="6.00">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScyKeedlAn0oGGVd0m5cXyhDweBt95hWUeRw&s">
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

    <!-- Duplicate this block for other products -->
    <div class="card h-50 position-relative">
        <img src="https://pupswithchopsticks.com/wp-content/uploads/chicken-manchurian-tnnew.webp"
             class="card-img-top" alt="Chicken Manchurian">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Chicken Manchurian">
            <input type="hidden" name="price" value="7.50">
            <input type="hidden" name="imageUrl" value="https://pupswithchopsticks.com/wp-content/uploads/chicken-manchurian-tnnew.webp">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Chicken Manchurian</h5>
            <p class="card-text">Boneless chicken pieces marinated with spices, coated with deep-fried, and tossed with onions, peppers, ginger, garlic, soy sauce, ketchup, and chili for an umami-rich, succulent dish.</p>
            <p class="card-text"><strong>Price: $7.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Chicken Manchurian">
                <input type="hidden" name="price" value="7.50">
                <input type="hidden" name="imageUrl" value="https://pupswithchopsticks.com/wp-content/uploads/chicken-manchurian-tnnew.webp">
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

    <!-- Add all remaining products similarly -->



    <!-- Product 4 -->
    <div class="card h-50">
        <img src="https://www.indianveggiedelight.com/wp-content/uploads/2017/06/gobi-manchurian-featured.jpg"
             class="card-img-top" alt="Mushroom Manchurian">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Mushroom Manchurian">
            <input type="hidden" name="price" value="7.00">
            <input type="hidden" name="imageUrl" value="https://www.indianveggiedelight.com/wp-content/uploads/2017/06/gobi-manchurian-featured.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Mushroom Manchurian</h5>
            <p class="card-text">Fresh mushrooms battered, fried, and served in a zesty Manchurian sauce with green onions and peppers. A vegetarian version with a bold flavor profile.</p>
            <p class="card-text"><strong>Price: $7.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Mushroom Manchurian">
                <input type="hidden" name="price" value="7.00">
                <input type="hidden" name="imageUrl" value="https://www.indianveggiedelight.com/wp-content/uploads/2017/06/gobi-manchurian-featured.jpg">
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

    <!-- Product 5 -->
    <div class="card h-50">
        <img src="https://www.spicebangla.com/wp-content/uploads/2024/06/Spring-Roll-Recipe.jpg"
             class="card-img-top" alt="Veg Spring Rolls">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Veg Spring Rolls">
            <input type="hidden" name="price" value="4.00">
            <input type="hidden" name="imageUrl" value="https://www.spicebangla.com/wp-content/uploads/2024/06/Spring-Roll-Recipe.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Veg Spring Rolls</h5>
            <p class="card-text">	Crispy rolls filled with mixed vegetables and served with sweet chili sauce.</p><br><br><br><br>
            <p class="card-text"><strong>Price: $4.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Veg Spring Rolls">
                <input type="hidden" name="price" value="4.00">
                <input type="hidden" name="imageUrl" value="https://www.spicebangla.com/wp-content/uploads/2024/06/Spring-Roll-Recipe.jpg">
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

    <!-- Product 6 -->
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
            <p class="card-text">Cottage cheese cubes marinated and grilled with peppers and onions.</p><br><br><br><br>
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

    <!-- Product 7 -->
    <div class="card h-50">
        <img src="https://signatureconcoctions.com/wp-content/uploads/2024/05/Chicken-Tikka-1-scaled.jpg"
             class="card-img-top" alt="Chicken Tikka">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Chicken Tikka">
            <input type="hidden" name="price" value="7.00">
            <input type="hidden" name="imageUrl" value="https://signatureconcoctions.com/wp-content/uploads/2024/05/Chicken-Tikka-1-scaled.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Chicken Tikka</h5>
            <p class="card-text">Grilled cubes of chicken marinated in spiced yogurt, cooked in a tandoor.</p>
            <p class="card-text"><strong>Price: $7.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Chicken Tikka">
                <input type="hidden" name="price" value="7.00">
                <input type="hidden" name="imageUrl" value="https://signatureconcoctions.com/wp-content/uploads/2024/05/Chicken-Tikka-1-scaled.jpg">
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

    <div class="card h-50">
        <img src="https://www.vegrecipesofindia.com/wp-content/uploads/2015/08/cheese-balls-recipe-1.jpg"
             class="card-img-top" alt="Cheese Balls">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Cheese Balls">
            <input type="hidden" name="price" value="5.00">
            <input type="hidden" name="imageUrl" value="https://www.vegrecipesofindia.com/wp-content/uploads/2015/08/cheese-balls-recipe-1.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Cheese Balls</h5>
            <p class="card-text">Deep-fried balls of melty cheese, seasoned with herbs and spices.</p>
            <p class="card-text"><strong>Price: $5.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Cheese Balls">
                <input type="hidden" name="price" value="5.00">
                <input type="hidden" name="imageUrl" value="https://www.vegrecipesofindia.com/wp-content/uploads/2015/08/cheese-balls-recipe-1.jpg">
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

    <!-- Product 8 -->
    <div class="card h-50">
        <img src="https://www.kitchensanctuary.com/wp-content/uploads/2023/10/Samosa-square-FS.jpg"
             class="card-img-top" alt="Vegetable Samosa">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Vegetable Samosa">
            <input type="hidden" name="price" value="4.00">
            <input type="hidden" name="imageUrl" value="https://www.kitchensanctuary.com/wp-content/uploads/2023/10/Samosa-square-FS.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Vegetable Samosa</h5>
            <p class="card-text">Fried pastry triangles filled with spiced peas and potatoes.</p>
            <p class="card-text"><strong>Price: $4.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Vegetable Samosa">
                <input type="hidden" name="price" value="4.00">
                <input type="hidden" name="imageUrl" value="https://www.kitchensanctuary.com/wp-content/uploads/2023/10/Samosa-square-FS.jpg">
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

    <!-- Product 9 -->
    <div class="card h-50">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMfgBp68wGmwPX9tR_0NrZroq9c4d7kkdYgg1YenbiWnUCMJUeQGQdoh7YWV_FLXFN9WI&usqp=CAU"
             class="card-img-top" alt="Garlic Bread">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Garlic Bread">
            <input type="hidden" name="price" value="3.50">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMfgBp68wGmwPX9tR_0NrZroq9c4d7kkdYgg1YenbiWnUCMJUeQGQdoh7YWV_FLXFN9WI&usqp=CAU">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Garlic Bread</h5>
            <p class="card-text">Freshly baked bread topped with garlic butter and herbs.</p><br>
            <p class="card-text"><strong>Price: $3.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Garlic Bread">
                <input type="hidden" name="price" value="3.50">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMfgBp68wGmwPX9tR_0NrZroq9c4d7kkdYgg1YenbiWnUCMJUeQGQdoh7YWV_FLXFN9WI&usqp=CAU">
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

    <!-- Product 10 -->
    <div class="card h-50">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOMhI3bzMuVwYk24Cf3-fMSpizyRMSmFab5Q&s"
             class="card-img-top" alt="Nachos Supreme">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Nachos Supreme">
            <input type="hidden" name="price" value="6.50">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOMhI3bzMuVwYk24Cf3-fMSpizyRMSmFab5Q&s">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Nachos Supreme</h5>
            <p class="card-text">Tortilla chips loaded with cheese, salsa, beans, and jalapenos.</p>
            <p class="card-text"><strong>Price: $6.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Nachos Supreme">
                <input type="hidden" name="price" value="6.50">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOMhI3bzMuVwYk24Cf3-fMSpizyRMSmFab5Q&s">
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
    <div class="card h-50">
        <img src="https://kirbiecravings.com/wp-content/uploads/2019/09/easy-french-fries-1.jpg"
             class="card-img-top" alt="French Fries">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="French Fries">
            <input type="hidden" name="price" value="4.00">
            <input type="hidden" name="imageUrl" value="https://kirbiecravings.com/wp-content/uploads/2019/09/easy-french-fries-1.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">French Fries</h5>
            <p class="card-text">Fresh potatoes are cut into strips, soaked, and Fries are typically seasoned with salt and served hot, either with ketchup or mayonnaise.</p>
            <p class="card-text"><strong>Price: $4.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="French Fries">
                <input type="hidden" name="price" value="4.00">
                <input type="hidden" name="imageUrl" value="https://kirbiecravings.com/wp-content/uploads/2019/09/easy-french-fries-1.jpg">
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

    <!-- Product 7 -->
    <div class="card h-50">
        <img src="https://www.kannammacooks.com/wp-content/uploads/finger-fish-fry-recipe-24.jpg"
             class="card-img-top" alt="Fish Fingers">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Fish Fingers">
            <input type="hidden" name="price" value="7.50">
            <input type="hidden" name="imageUrl" value="https://www.kannammacooks.com/wp-content/uploads/finger-fish-fry-recipe-24.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Fish Fingers</h5>
            <p class="card-text">	Breaded fish strips fried until crisp, served with tartar sauce.</p><br><br>
            <p class="card-text"><strong>Price: $7.50</strong></p>


            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Fish Fingers">
                <input type="hidden" name="price" value="7.50">
                <input type="hidden" name="imageUrl" value="https://www.kannammacooks.com/wp-content/uploads/finger-fish-fry-recipe-24.jpg">
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

    <!-- Product 8 -->
    <div class="card h-50">
        <img src="https://www.koreanbapsang.com/wp-content/uploads/2019/05/DSC_4165-1.jpg"
             class="card-img-top" alt="BBQ Shrimp Skewers">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="BBQ Shrimp Skewers">
            <input type="hidden" name="price" value="8.50">
            <input type="hidden" name="imageUrl" value="https://www.koreanbapsang.com/wp-content/uploads/2019/05/DSC_4165-1.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">BBQ Shrimp Skewers</h5>
            <p class="card-text">	Juicy shrimp marinated in BBQ sauce, grilled and served on skewers.</p><br><br>
            <p class="card-text"><strong>Price: $8.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="BBQ Shrimp Skewers">
                <input type="hidden" name="price" value="8.50">
                <input type="hidden" name="imageUrl" value="https://www.koreanbapsang.com/wp-content/uploads/2019/05/DSC_4165-1.jpg">
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

    <!-- Product 9 -->
    <div class="card h-50">
        <img src="https://www.twospoons.ca/wp-content/uploads/2021/02/vegan-tomato-basil-soup-recipe-creamy-twospoons-8.jpg"
             class="card-img-top" alt="Tomato Basil Soup">

        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Tomato Basil Soup">
            <input type="hidden" name="price" value="4.00">
            <input type="hidden" name="imageUrl" value="https://www.twospoons.ca/wp-content/uploads/2021/02/vegan-tomato-basil-soup-recipe-creamy-twospoons-8.jpg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Tomato Basil Soup</h5>
            <p class="card-text">Creamy soup made from ripe tomatoes and fresh basil, finished with cream.</p><br><br>
            <p class="card-text"><strong>Price: $4.00</strong></p>

            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <!-- Hidden fields for product details -->
                <input type="hidden" name="productName" value="Tomato Basil Soup">
                <input type="hidden" name="price" value="4.00">
                <input type="hidden" name="imageUrl" value="https://www.twospoons.ca/wp-content/uploads/2021/02/vegan-tomato-basil-soup-recipe-creamy-twospoons-8.jpg">
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

    <!-- Product 10 -->
    <div class="card h-50 position-relative">
        <img src="https://img.taste.com.au/CCnkLB1G/taste/2016/11/chicken-and-sweet-corn-soup-3787-1.jpeg"
             class="card-img-top" alt="Chicken Sweet Corn">

        <!-- Favorite button -->
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>

        <!-- Hidden favorite form (outside AddToCart form) -->
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Chicken Sweet Corn">
            <input type="hidden" name="price" value="5.00">
            <input type="hidden" name="imageUrl" value="https://img.taste.com.au/CCnkLB1G/taste/2016/11/chicken-and-sweet-corn-soup-3787-1.jpeg">
            <input type="hidden" name="action" value="add">
        </form>

        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Chicken Sweet Corn</h5>
            <p class="card-text">Clear chicken broth with sweet corn, shredded chicken, and egg ribbons.</p><br><br>
            <p class="card-text"><strong>Price: $5.00</strong></p>

            <!-- Add to Cart form -->
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Chicken Sweet Corn">
                <input type="hidden" name="price" value="5.00">
                <input type="hidden" name="imageUrl" value="https://img.taste.com.au/CCnkLB1G/taste/2016/11/chicken-and-sweet-corn-soup-3787-1.jpeg">
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


</div>

<footer class="footer text-white text-center py-3 mt-2">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center mb-0">
            <li class="page-item">
                <a class="page-link text-black bg-light" href="page1.html" aria-label="Previous">
                    &laquo;
                </a>
            </li>
            <li class="page-item"><a class="page-link text-black bg-light" href="page1.html">1</a></li>
            <li class="page-item"><a class="page-link text-black bg-light" href="page2.html">2</a></li>
            <li class="page-item"><a class="page-link text-black bg-light" href="page3.html">3</a></li>
            <li class="page-item">
                <a class="page-link text-black bg-light" href="page2.html" aria-label="Next">
                    &raquo;
                </a>
            </li>
        </ul>
    </nav>
    <p class="py-1 mt-4">&copy; 2025 UnionCafe. All rights reserved</p>
</footer>
<script>
    // Initialize Bootstrap tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl, { trigger: 'hover' });
    });

    tooltipTriggerList.forEach(function (el) {
        el.addEventListener('click', function () {
            var tooltip = bootstrap.Tooltip.getInstance(el);
            if (tooltip) tooltip.hide();
        });
    });

    // Scroll effect for navbar
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

</script>




</body>
</html>