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
        <h3 class="top">Desserts</h3>
    </div>
</div>

<div class="display-area d-flex flex-wrap justify-content-center">

    <!-- Dessert 1 -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF_O9f0aZURN1Ribxf9_UudM4SCVBM_ob8DA&s"
             class="card-img-top" alt="Panna Cotta">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Panna Cotta">
            <input type="hidden" name="price" value="7.00">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF_O9f0aZURN1Ribxf9_UudM4SCVBM_ob8DA&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Panna Cotta</h5>
            <p class="card-text">Smooth creamy Italian dessert made with sweetened cream and gelatin, served with berries.</p>
            <p class="card-text"><strong>Price: $7.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Panna Cotta">
                <input type="hidden" name="price" value="7.00">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF_O9f0aZURN1Ribxf9_UudM4SCVBM_ob8DA&s">
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

    <!-- Dessert 2 -->
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

    <!-- Dessert 3 -->
    <div class="card h-50 position-relative">
        <img src="https://thumbs.dreamstime.com/b/delicious-kulfi-dessert-creamy-indian-frozen-treat-pistachios-rose-petals-close-up-shot-garnished-chopped-354272680.jpg"
             class="card-img-top" alt="Kulfi">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Kulfi">
            <input type="hidden" name="price" value="5.00">
            <input type="hidden" name="imageUrl" value="https://thumbs.dreamstime.com/b/delicious-kulfi-dessert-creamy-indian-frozen-treat-pistachios-rose-petals-close-up-shot-garnished-chopped-354272680.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Kulfi</h5>
            <p class="card-text">Traditional Indian ice cream made from thickened milk and flavored with cardamom and nuts.</p>
            <p class="card-text"><strong>Price: $5.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Kulfi">
                <input type="hidden" name="price" value="5.00">
                <input type="hidden" name="imageUrl" value="https://thumbs.dreamstime.com/b/delicious-kulfi-dessert-creamy-indian-frozen-treat-pistachios-rose-petals-close-up-shot-garnished-chopped-354272680.jpg">
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

    <!-- Dessert 4 -->
    <div class="card h-50 position-relative">
        <img src="https://prashantcorner.com/cdn/shop/files/DakGulabJamunSR-2.jpg?v=1718083866"
             class="card-img-top" alt="Gulab Jamun">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Gulab Jamun">
            <input type="hidden" name="price" value="4.00">
            <input type="hidden" name="imageUrl" value="https://prashantcorner.com/cdn/shop/files/DakGulabJamunSR-2.jpg?v=1718083866">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Gulab Jamun</h5>
            <p class="card-text">Soft deep-fried milk-solid dumplings soaked in rose flavored sugar syrup.</p><br>
            <p class="card-text"><strong>Price: $4.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Gulab Jamun">
                <input type="hidden" name="price" value="4.00">
                <input type="hidden" name="imageUrl" value="https://prashantcorner.com/cdn/shop/files/DakGulabJamunSR-2.jpg?v=1718083866">
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

    <!-- Dessert 5 -->
    <div class="card h-50 position-relative">
        <img src="https://greedyeats.com/wp-content/uploads/2023/08/Carrot-Halwa.jpg"
             class="card-img-top" alt="Carrot Halwa">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Carrot Halwa">
            <input type="hidden" name="price" value="5.50">
            <input type="hidden" name="imageUrl" value="https://greedyeats.com/wp-content/uploads/2023/08/Carrot-Halwa.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Carrot Halwa</h5>
            <p class="card-text">Sweet Indian dessert made by slow-cooking grated carrots in milk, sugar, and ghee.</p>
            <p class="card-text"><strong>Price: $5.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Carrot Halwa">
                <input type="hidden" name="price" value="5.50">
                <input type="hidden" name="imageUrl" value="https://greedyeats.com/wp-content/uploads/2023/08/Carrot-Halwa.jpg">
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

    <!-- Dessert 6 -->
    <div class="card h-50 position-relative">
        <img src="https://www.cookwithkushi.com/wp-content/uploads/2016/09/best_malpua_Indian_sweet_recipe.jpg"
             class="card-img-top" alt="Malpua">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Malpua">
            <input type="hidden" name="price" value="5.00">
            <input type="hidden" name="imageUrl" value="https://www.cookwithkushi.com/wp-content/uploads/2016/09/best_malpua_Indian_sweet_recipe.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Malpua</h5>
            <p class="card-text">Sweet Indian pancake soaked in sugar syrup, flavored with cardamom and saffron.</p>
            <p class="card-text"><strong>Price: $5.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Malpua">
                <input type="hidden" name="price" value="5.00">
                <input type="hidden" name="imageUrl" value="https://www.cookwithkushi.com/wp-content/uploads/2016/09/best_malpua_Indian_sweet_recipe.jpg">
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

    <!-- Dessert 7 -->
    <div class="card h-50 position-relative">
        <img src="https://www.whiskaffair.com/wp-content/uploads/2020/11/Custard-Apple-Basundi-2-3.jpg"
             class="card-img-top" alt="Basundi">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Basundi">
            <input type="hidden" name="price" value="6.50">
            <input type="hidden" name="imageUrl" value="https://www.whiskaffair.com/wp-content/uploads/2020/11/Custard-Apple-Basundi-2-3.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Basundi</h5>
            <p class="card-text">Creamy sweetened condensed milk flavored with cardamom and garnished with almonds.</p>
            <p class="card-text"><strong>Price: $6.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Basundi">
                <input type="hidden" name="price" value="6.50">
                <input type="hidden" name="imageUrl" value="https://www.whiskaffair.com/wp-content/uploads/2020/11/Custard-Apple-Basundi-2-3.jpg">
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

    <!-- Dessert 8 -->
    <div class="card h-50 position-relative">
        <img src="https://prashantcorner.com/cdn/shop/products/RASGULLA_2457ea2c-400a-4130-b540-b77966e63d07.jpg?v=1673073151&width=1946"
             class="card-img-top" alt="Rasgulla">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Rasgulla">
            <input type="hidden" name="price" value="4.50">
            <input type="hidden" name="imageUrl" value="https://prashantcorner.com/cdn/shop/products/RASGULLA_2457ea2c-400a-4130-b540-b77966e63d07.jpg?v=1673073151&width=1946">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Rasgulla</h5>
            <p class="card-text">Soft, spongy, ball-shaped cottage cheese dumplings soaked in sugar syrup.</p><br>
            <p class="card-text"><strong>Price: $4.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Rasgulla">
                <input type="hidden" name="price" value="4.50">
                <input type="hidden" name="imageUrl" value="https://prashantcorner.com/cdn/shop/products/RASGULLA_2457ea2c-400a-4130-b540-b77966e63d07.jpg?v=1673073151&width=1946">
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

    <!-- Dessert 9 -->
    <div class="card h-50 position-relative">
        <img src="https://californiaavocado.com/wp-content/uploads/2020/07/Chocolate-Avocado-Pudding-with-Coconut-Milk.jpeg"
             class="card-img-top" alt="Avocado Pudding">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Avocado Pudding">
            <input type="hidden" name="price" value="6.50">
            <input type="hidden" name="imageUrl" value="https://californiaavocado.com/wp-content/uploads/2020/07/Chocolate-Avocado-Pudding-with-Coconut-Milk.jpeg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Avocado Pudding</h5>
            <p class="card-text">Creamy avocado blended into a smooth pudding with tropical flavors.</p><br>
            <p class="card-text"><strong>Price: $6.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Avocado Pudding">
                <input type="hidden" name="price" value="6.50">
                <input type="hidden" name="imageUrl" value="https://californiaavocado.com/wp-content/uploads/2020/07/Chocolate-Avocado-Pudding-with-Coconut-Milk.jpeg">
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

    <!-- Dessert 10 -->
    <div class="card h-50 position-relative">
        <img src="https://www.cookwithmanali.com/wp-content/uploads/2021/06/Lassi-Recipe.jpg"
             class="card-img-top" alt="Sweet Lassi">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites"><i class="fa fa-heart"></i></button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Sweet Lassi">
            <input type="hidden" name="price" value="4.00">
            <input type="hidden" name="imageUrl" value="https://www.cookwithmanali.com/wp-content/uploads/2021/06/Lassi-Recipe.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Sweet Lassi</h5>
            <p class="card-text">Refreshing traditional yogurt-based sweet drink flavored with cardamom and rose water.</p>
            <p class="card-text"><strong>Price: $4.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Sweet Lassi">
                <input type="hidden" name="price" value="4.00">
                <input type="hidden" name="imageUrl" value="https://www.cookwithmanali.com/wp-content/uploads/2021/06/Lassi-Recipe.jpg">
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
    <!-- Dessert 11 -->
    <div class="card h-50 position-relative">
        <img src="https://weikfield.com/wp-content/uploads/2024/08/Phirni-Custard.jpg"
             class="card-img-top" alt="Phirni">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Phirni">
            <input type="hidden" name="price" value="6.00">
            <input type="hidden" name="imageUrl" value="https://weikfield.com/wp-content/uploads/2024/08/Phirni-Custard.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Phirni</h5>
            <p class="card-text">Creamy rice flour-based dessert flavored with saffron and cardamom, served chilled.</p><br>
            <p class="card-text"><strong>Price: $6.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Phirni">
                <input type="hidden" name="price" value="6.00">
                <input type="hidden" name="imageUrl" value="https://weikfield.com/wp-content/uploads/2024/08/Phirni-Custard.jpg">
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

    <!-- Dessert 12 -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAXvruFhbMUpf-NGfYkfKct0jWCnQjSGpG0w&s"
             class="card-img-top" alt="Rabri">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Rabri">
            <input type="hidden" name="price" value="5.50">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAXvruFhbMUpf-NGfYkfKct0jWCnQjSGpG0w&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Rabri</h5>
            <p class="card-text">Thickened sweetened milk infused with saffron and cardamom, garnished with nuts.</p><br>
            <p class="card-text"><strong>Price: $5.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Rabri">
                <input type="hidden" name="price" value="5.50">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAXvruFhbMUpf-NGfYkfKct0jWCnQjSGpG0w&s">
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

    <!-- Dessert 13 -->
    <div class="card h-50 position-relative">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg-_80owaVQOBDeEENGQ0EvplbpUhe-jlZ5g&s"
             class="card-img-top" alt="Phool Makhana Kheer">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Phool Makhana Kheer">
            <input type="hidden" name="price" value="6.00">
            <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg-_80owaVQOBDeEENGQ0EvplbpUhe-jlZ5g&s">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Phool Makhana Kheer</h5>
            <p class="card-text">Delicious pudding made with fox nuts, milk, sugar, and flavored with cardamom.</p><br><br>
            <p class="card-text"><strong>Price: $6.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Phool Makhana Kheer">
                <input type="hidden" name="price" value="6.00">
                <input type="hidden" name="imageUrl" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg-_80owaVQOBDeEENGQ0EvplbpUhe-jlZ5g&s">
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

    <!-- Dessert 14 -->
    <div class="card h-50 position-relative">
        <img src="https://cookandsee.in/wp-content/uploads/2018/05/kesari-750x515.jpg"
             class="card-img-top" alt="Kesari">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Kesari">
            <input type="hidden" name="price" value="5.00">
            <input type="hidden" name="imageUrl" value="https://cookandsee.in/wp-content/uploads/2018/05/kesari-750x515.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Kesari</h5>
            <p class="card-text">Sweet Indian semolina pudding flavored with saffron, ghee, and garnished with nuts.</p><br>
            <p class="card-text"><strong>Price: $5.00</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Kesari">
                <input type="hidden" name="price" value="5.00">
                <input type="hidden" name="imageUrl" value="https://cookandsee.in/wp-content/uploads/2018/05/kesari-750x515.jpg">
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

    <!-- Dessert 15 -->
    <div class="card h-50 position-relative">
        <img src="https://www.cookwithmanali.com/wp-content/uploads/2018/06/Sheer-Khurma.jpg"
             class="card-img-top" alt="Sheer Korma">
        <button type="button" class="btn btn-favorite position-absolute top-0 end-0 m-1 p-1" title="Add to Favorites">
            <i class="fa fa-heart"></i>
        </button>
        <form action="${pageContext.request.contextPath}/AddToFavorites" method="post" class="favorite-form d-none">
            <input type="hidden" name="productName" value="Sheer Korma">
            <input type="hidden" name="price" value="6.50">
            <input type="hidden" name="imageUrl" value="https://www.cookwithmanali.com/wp-content/uploads/2018/06/Sheer-Khurma.jpg">
            <input type="hidden" name="action" value="add">
        </form>
        <div class="card-body d-flex flex-column">
            <h5 class="card-title">Sheer Korma</h5>
            <p class="card-text">Festive vermicelli kheer cooked with milk, dates, nuts, and flavored with cardamom.</p><br>
            <p class="card-text"><strong>Price: $6.50</strong></p>
            <form action="${pageContext.request.contextPath}/AddToCart" method="post" class="d-flex align-items-center gap-2">
                <input type="hidden" name="productName" value="Sheer Korma">
                <input type="hidden" name="price" value="6.50">
                <input type="hidden" name="imageUrl" value="https://www.cookwithmanali.com/wp-content/uploads/2018/06/Sheer-Khurma.jpg">
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


    <!-- Add more desserts similarly... -->

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