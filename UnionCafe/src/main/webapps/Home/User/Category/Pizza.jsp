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
        <h3 class="top">Pizza</h3>
    </div>
</div>

<div class="display-area d-flex flex-wrap justify-content-center">

    <!-- Pizza 1: Margherita -->
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
            <p class="card-text">Classic pizza topped with tomato, mozzarella, and fresh basil for a simple yet flavorful experience.</p>
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

    <!-- Pizza 2: Pepperoni -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFWBPrLToPOsgPJJ7PYp86huneeUVd9RR1LljzBrkonL2VSgbPAOSfWRfJ6I8f7vGMDlY&usqp=CAU"
             class="card-img-top" alt="Pepperoni Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Pepperoni Pizza">
            <input type="hidden" name="price" value="9.50">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFWBPrLToPOsgPJJ7PYp86huneeUVd9RR1LljzBrkonL2VSgbPAOSfWRfJ6I8f7vGMDlY&usqp=CAU">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Pepperoni Pizza</h5>
            <p class="card-text">Loaded with pepperoni slices, mozzarella, and tomato sauce for a classic and savory taste.</p>
            <p class="card-text"><strong>Price: $9.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Pepperoni Pizza">
                <input type="hidden" name="price" value="9.50">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFWBPrLToPOsgPJJ7PYp86huneeUVd9RR1LljzBrkonL2VSgbPAOSfWRfJ6I8f7vGMDlY&usqp=CAU">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 3: BBQ Chicken -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pAWR3zDoh1uakelF6iPgSsBmknyMAQPV4A&s"
             class="card-img-top" alt="BBQ Chicken Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="BBQ Chicken Pizza">
            <input type="hidden" name="price" value="11.00">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pAWR3zDoh1uakelF6iPgSsBmknyMAQPV4A&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">BBQ Chicken Pizza</h5>
            <p class="card-text">Grilled chicken pieces, sweet BBQ sauce, onions, and melted mozzarella cheeses.</p><br>
            <p class="card-text"><strong>Price: $11.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="BBQ Chicken Pizza">
                <input type="hidden" name="price" value="11.00">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pAWR3zDoh1uakelF6iPgSsBmknyMAQPV4A&s">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 4: Veggie Supreme -->
    <div class="card h-50 position-relative">
        <img src="https://www.dominos.co.in/theme2/front/images/menu-images/my-nonveg.webp"
             class="card-img-top" alt="Veggie Supreme Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Veggie Supreme Pizza">
            <input type="hidden" name="price" value="9.00">
            <input type="hidden" name="imageUrl" value="https://www.dominos.co.in/theme2/front/images/menu-images/my-nonveg.webp">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Veggie Supreme Pizza</h5>
            <p class="card-text">Loaded with bell peppers, mushrooms, onions, olives, and fresh tomatoes with mozzarella.</p>
            <p class="card-text"><strong>Price: $9.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Veggie Supreme Pizza">
                <input type="hidden" name="price" value="9.00">
                <input type="hidden" name="imageUrl" value="https://www.dominos.co.in/theme2/front/images/menu-images/my-nonveg.webp">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 5: Hawaiian -->
    <div class="card h-50 position-relative">
        <img src="https://www.dominos.com.sg/ManagedAssets/SG/product/PXVH/SG_PXVH_en_hero_12860.jpg?v-1810547859"
             class="card-img-top" alt="Hawaiian Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Hawaiian Pizza">
            <input type="hidden" name="price" value="10.00">
            <input type="hidden" name="imageUrl" value="https://www.dominos.com.sg/ManagedAssets/SG/product/PXVH/SG_PXVH_en_hero_12860.jpg?v-1810547859">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Hawaiian Pizza</h5>
            <p class="card-text">Topped with ham, pineapple, and mozzarella for a classic tropical flavor.</p><br>
            <p class="card-text"><strong>Price: $10.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Hawaiian Pizza">
                <input type="hidden" name="price" value="10.00">
                <input type="hidden" name="imageUrl" value="https://www.dominos.com.sg/ManagedAssets/SG/product/PXVH/SG_PXVH_en_hero_12860.jpg?v-1810547859">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 6: Four Cheese -->
    <div class="card h-50 position-relative">
        <img src="https://media-cdn.tripadvisor.com/media/photo-s/12/68/de/34/4-cheese-pizaa.jpg"
             class="card-img-top" alt="Four Cheese Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Four Cheese Pizza">
            <input type="hidden" name="price" value="10.00">
            <input type="hidden" name="imageUrl" value="https://media-cdn.tripadvisor.com/media/photo-s/12/68/de/34/4-cheese-pizaa.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Four Cheese Pizza</h5>
            <p class="card-text">Mozzarella, Parmesan, Gorgonzola, and Ricotta cheeses melted for a creamy delight.</p>
            <p class="card-text"><strong>Price: $10.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Four Cheese Pizza">
                <input type="hidden" name="price" value="10.00">
                <input type="hidden" name="imageUrl" value="https://media-cdn.tripadvisor.com/media/photo-s/12/68/de/34/4-cheese-pizaa.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 7: Veggie Delight -->
    <div class="card h-50 position-relative">
        <img src="https://www.dealsshutter.com/blog/wp-content/uploads/2019/06/pizza35.jpg"
             class="card-img-top" alt="Veggie Delight Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Veggie Delight Pizza">
            <input type="hidden" name="price" value="9.00">
            <input type="hidden" name="imageUrl" value="https://www.dealsshutter.com/blog/wp-content/uploads/2019/06/pizza35.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Veggie Delight Pizza</h5>
            <p class="card-text">Topped with fresh bell peppers, onions, mushrooms, and olives for a colorful bite.</p>
            <p class="card-text"><strong>Price: $9.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Veggie Delight Pizza">
                <input type="hidden" name="price" value="9.00">
                <input type="hidden" name="imageUrl" value="https://www.dealsshutter.com/blog/wp-content/uploads/2019/06/pizza35.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 8: Meat Lovers -->
    <div class="card h-50 position-relative">
        <img src="https://images.squarespace-cdn.com/content/v1/5a33517f268b961f10de794c/1698977421366-YIRC4SCTXSELQ6ZL8MRY/Smokehouse+Meatlovers+2.jpg?format=1000w"
             class="card-img-top" alt="Meat Lovers Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Meat Lovers Pizza">
            <input type="hidden" name="price" value="12.00">
            <input type="hidden" name="imageUrl" value="https://images.squarespace-cdn.com/content/v1/5a33517f268b961f10de794c/1698977421366-YIRC4SCTXSELQ6ZL8MRY/Smokehouse+Meatlovers+2.jpg?format=1000w">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Meat Lovers Pizza</h5>
            <p class="card-text">Loaded with pepperoni, sausage, ham, bacon, and mozzarella cheese.</p><br>
            <p class="card-text"><strong>Price: $12.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Meat Lovers Pizza">
                <input type="hidden" name="price" value="12.00">
                <input type="hidden" name="imageUrl" value="https://images.squarespace-cdn.com/content/v1/5a33517f268b961f10de794c/1698977421366-YIRC4SCTXSELQ6ZL8MRY/Smokehouse+Meatlovers+2.jpg?format=1000w">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 9: Four Seasons -->
    <div class="card h-50 position-relative">
        <img src="https://www.shutterstock.com/image-photo/delicious-crispy-italian-pizza-four-260nw-2240087187.jpg"
             class="card-img-top" alt="Four Seasons Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Four Seasons Pizza">
            <input type="hidden" name="price" value="11.00">
            <input type="hidden" name="imageUrl" value="https://www.shutterstock.com/image-photo/delicious-crispy-italian-pizza-four-260nw-2240087187.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Four Seasons Pizza</h5>
            <p class="card-text">Divided into fours with artichokes, mushrooms, ham, and olives in quarters.</p><br>
            <p class="card-text"><strong>Price: $11.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Four Seasons Pizza">
                <input type="hidden" name="price" value="11.00">
                <input type="hidden" name="imageUrl" value="https://www.shutterstock.com/image-photo/delicious-crispy-italian-pizza-four-260nw-2240087187.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 10: Mexican Green Wave -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY3PFC218ftzlPDQYnu43tz0bj4PSrbo3Nsw&s"
             class="card-img-top" alt="Mexican Green Wave Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Mexican Green Wave Pizza">
            <input type="hidden" name="price" value="9.50">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY3PFC218ftzlPDQYnu43tz0bj4PSrbo3Nsw&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Mexican Green Wave Pizza</h5>
            <p class="card-text">Loaded with crunchy onions, capsicum, jalapeno, and Mexican herbs spicy twist.</p>
            <p class="card-text"><strong>Price: $9.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Mexican Green Wave Pizza">
                <input type="hidden" name="price" value="9.50">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY3PFC218ftzlPDQYnu43tz0bj4PSrbo3Nsw&s">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 11: Paneer Tikka -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjK5Hm37qPyjJx4IfviOy_5hdjjN-qTm7X9Q&s"
             class="card-img-top" alt="Paneer Tikka Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Paneer Tikka Pizza">
            <input type="hidden" name="price" value="10.00">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjK5Hm37qPyjJx4IfviOy_5hdjjN-qTm7X9Q&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Paneer Tikka Pizza</h5>
            <p class="card-text">Indian-style pizza topped with marinated paneer tikka, capsicum, and green chili.</p><br><br>
            <p class="card-text"><strong>Price: $10.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Paneer Tikka Pizza">
                <input type="hidden" name="price" value="10.00">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjK5Hm37qPyjJx4IfviOy_5hdjjN-qTm7X9Q&s">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 12: Chicken Tikka -->
    <div class="card h-50 position-relative">
        <img src="https://www.dominos.co.in/files/items/chicken_feast.jpg"
             class="card-img-top" alt="Chicken Tikka Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Chicken Tikka Pizza">
            <input type="hidden" name="price" value="11.50">
            <input type="hidden" name="imageUrl" value="https://www.dominos.co.in/files/items/chicken_feast.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Chicken Tikka Pizza</h5>
            <p class="card-text">Spiced chicken tikka chunks, onions, and capsicum on a classic pizza base.</p><br><br>
            <p class="card-text"><strong>Price: $11.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Chicken Tikka Pizza">
                <input type="hidden" name="price" value="11.50">
                <input type="hidden" name="imageUrl" value="https://www.dominos.co.in/files/items/chicken_feast.jpg">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 13: Veg Extravaganza -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVZzpnZAaTR8F6EHmj5AivTHq1r_u8cGkCEg&s"
             class="card-img-top" alt="Veg Extravaganza Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Veg Extravaganza Pizza">
            <input type="hidden" name="price" value="11.00">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVZzpnZAaTR8F6EHmj5AivTHq1r_u8cGkCEg&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Veg Extravaganza Pizza</h5>
            <p class="card-text">Loaded with olives, capsicum, onion, grilled mushroom, corn, and paneer cubes.</p>
            <p class="card-text"><strong>Price: $11.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Veg Extravaganza Pizza">
                <input type="hidden" name="price" value="11.00">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVZzpnZAaTR8F6EHmj5AivTHq1r_u8cGkCEg&s">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 14: Chicken Dominator -->
    <div class="card h-50 position-relative">
        <img src="https://www.dominos.co.in/files/items/MicrosoftTeams-image_(15).png"
             class="card-img-top" alt="Chicken Dominator Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Chicken Dominator Pizza">
            <input type="hidden" name="price" value="13.00">
            <input type="hidden" name="imageUrl" value="https://www.dominos.co.in/files/items/MicrosoftTeams-image_(15).png">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Chicken Dominator Pizza</h5>
            <p class="card-text">Overflowing with double pepper barbecue chicken, peri-peri chicken, chicken tikka & grilled chicken.</p>
            <p class="card-text"><strong>Price: $13.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Chicken Dominator Pizza">
                <input type="hidden" name="price" value="13.00">
                <input type="hidden" name="imageUrl" value="https://www.dominos.co.in/files/items/MicrosoftTeams-image_(15).png">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="increase">+</button>
                </div>
                <button type="submit" class="btn btn-cart text-white">Add to Cart</button>
            </form>
        </div>
    </div>

    <!-- Pizza 15: Mexican Green Wave -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn_NHW22lBYDa009LAH-Y-S9F6vSY_OKOmvA&s"
             class="card-img-top" alt="Mexican Green Wave Pizza">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1"
                title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Mexican Green Wave Pizza">
            <input type="hidden" name="price" value="9.50">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn_NHW22lBYDa009LAH-Y-S9F6vSY_OKOmvA&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Mexican Green Wave Pizza</h5>
            <p class="card-text">Loaded with crunchy onions, capsicum, jalapeno, and Mexican herbs for a spicy twist.</p>
            <p class="card-text"><strong>Price: $9.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Mexican Green Wave Pizza">
                <input type="hidden" name="price" value="9.50">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn_NHW22lBYDa009LAH-Y-S9F6vSY_OKOmvA&s">
                <input type="hidden" name="quantity" class="quantity-field" value="1">
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-secondary quantity-btn" data-action="decrease">-</button>
                    <input class="form-control form-control-sm mx-1 quantity-input" type="text" value="1" style="width:30px;">
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