
<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>-->
<!--<%@ page isELIgnored="false" %>-->
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css" integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .navbar-brand {
            display: flex;
            align-items: center;
        }
        .logo-img {
            height: 60px;
            margin-right: 10px;
        }

        .wide-search-form {
            width: 100%;
            max-width: 600px;
        }

        .wide-search-form .form-control {
            flex-grow: 1;
        }

        @media (min-width: 768px) {
            .wide-search-form {
                min-width: 400px;
            }
        }

        .nav-alter {
            background-color: #4a148c;
            position:sticky;
            top:0;
            z-index:1000;
        }

        .nav-link {
            color: white;
            font-family: 'Playfair Display', serif;
            font-style: italic;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
            padding-top: 2px;
            height:20px;
            font-size:30px;
            margin-left:6px;
            padding-bottom:30px;

        }

        .nav-link:hover{
            color:#9f90cb;
        }

        .nav-item{
            padding-top: 2px;
            height:20px;
            font-size:30px;
            margin-left:8px;
            padding-bottom:40px;

        }

        .category {
            margin-top:2px;
            color: #4a148c; /* Deep purple */
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
            margin-bottom:10px;
        }
        .top-products{
            margin-top:20px;
            color: #4a148c; /* Deep purple */
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

        body, html {
            height: 100%;
            margin: 0;
            background-color: #9F90CB;
        }

        .display-area {
            padding: 2rem 0;
        }

        .card {
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            width: 250px;
            height: 400px;
            margin: 10px;
        }

        .category-image:hover {
            transform: translateY(-6px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }

        .card-body {
            margin-left: 10px;
        }

        .card-img-top {
            height: 180px;
            object-fit: cover;
        }

        .btn-cart {
            background-color: #4a148c;
            border-color: #4a148c;
        }

        .btn-cart:hover {
            background-color: #4a148c;
            border-color: #4a148c;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer {
            background-color: #4a148c;
            color: white;
            padding: 1rem 0;
            text-align: center;
        }

        .pagination {
            justify-content: center;
        }
        .fa-circle-user{
            margin-top:20px;
            margin-left:5px;
            background-color: #4a148c;
            color: white;
        }

        .fa-circle-user:hover{
            color:#9F90CB;
        }

        .top-image{
            align-item:center;
            display:flex;
        }

        .account{
            margin-bottom:10px;
            display:flex;
            justify-content:space-between;
        }



    </style>
</head>

<body>
<div class="remaining-body">
    <div class="nav-alter">
        <nav class="navbar">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <!--                    <img src="https://png.pngtree.com/png-vector/20220224/ourmid/pngtree-cake-logo-for-cafe-and-sweets-business-png-image_4461904.png" alt="Logo" class="logo-img">-->
                    <h1 class="nav-link">CakeX</h1>
                </a>

                <form class="d-flex wide-search-form" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <div>
                    <nav id="navbar" class="navbar navbar-expand-lg">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="color:white">
                                <!--                            <li class="nav-item">-->
                                <!--                                <a class="nav-link" aria-current="page" href="#">Category</a>-->
                                <!--                            </li>-->
                                <li class="nav-item">
                                    <a class="nav-link" href="Cart.jsp">
                                        <i class="fa-solid fa-cart-shopping fa-xs"></i>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="favorite.jsp">
                                        <i class="fa-regular fa-heart fa-sm " ></i>
                                    </a>
                                </li>
                                <li>

                                    <a class="nav-link" href="Login.jsp ">
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
    <div>
        <div class="top-products">
            <h3>Cakes</h3>
        </div>
    </div>

    <div class="display-area d-flex flex-wrap justify-content-center">
        <!-- Product 1 -->
        <div class="card h-100">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkPHN7XscGo6sNbVVKgNkV6sDO7LTYj6Nklw&s" class="card-img-top" alt="Black Forest Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Black Forest</h5>
                <p class="card-text">Chocolate creamy dark forest cake with fresh fruits</p>
                <p class="card-text"><strong>Price: $10.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Black%20Forest&price=10.00" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 2 -->
        <div class="card h-100">
            <img src="https://thumbs.dreamstime.com/b/creamy-mascarpone-cheese-cake-strawberry-winter-berries-new-york-cheesecake-close-up-christmas-dessert-healthy-78995578.jpg" class="card-img-top" alt="Cheesecake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Cheese Cake</h5>
                <p class="card-text">Creamy cheesecake with a graham cracker crust</p>
                <p class="card-text"><strong>Price: $8.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Cheese%20Cake&price=8.00" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 3 -->
        <div class="card h-100">
            <img src="https://media.istockphoto.com/id/1466673520/photo/no-baked-blueberry-layered-cheesecake.jpg?s=612x612&w=0&k=20&c=_zzCUASpR6yBQYV-mR0AU1vcICHxlBonnj59f0qX3mk=" class="card-img-top" alt="Blueberry Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Blueberry Cake</h5>
                <p class="card-text">Delicious blueberry cake with fruit crush</p>
                <p class="card-text"><strong>Price: $9.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Blueberry%20Cake&price=9.00" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 4 -->
        <div class="card h-100">
            <img src="https://images.squarespace-cdn.com/content/v1/50b9b13ee4b012760adc9e24/1561532567665-ZS2OTEJW9HZ2SLM82IC0/carrot-cake.jpg" class="card-img-top" alt="Carrot Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Carrot Cake</h5>
                <p class="card-text">Moist carrot cake topped with cream cheese frosting</p>
                <p class="card-text"><strong>Price: $10.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Carrot%20Cake&price=10.00" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 5 -->
        <div class="card h-100">
            <img src="https://thumbs.dreamstime.com/b/closeup-tangy-lemon-cake-round-creation-hd-k-wallpaper-stock-photographic-image-generated-ai-342636719.jpg" class="card-img-top" alt="Lemon Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Lemon Cake</h5>
                <p class="card-text">Zesty lemon cake with a light lemon glaze</p>
                <p class="card-text"><strong>Price: $8.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Lemon%20Cake&price=8.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 6 -->
        <div class="card h-100">
            <img src="https://www.rainbownourishments.com/wp-content/uploads/2022/02/vegan-strawberry-cake-1-1.jpg" class="card-img-top" alt="Strawberry Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Strawberry Cake</h5>
                <p class="card-text">Delicious strawberry cake with fresh strawberries</p>
                <p class="card-text"><strong>Price: $9.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Cake&price=9.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 7 -->
        <div class="card h-100">
            <img src="https://bakerbynature.com/wp-content/uploads/2022/04/Golden-Vanilla-Cake-with-Vanilla-Frosting0-19-500x500.jpg" class="card-img-top" alt="Vanilla Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Vanilla Cake</h5>
                <p class="card-text">Classic vanilla cake with buttercream frosting</p>
                <p class="card-text"><strong>Price: $7.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Vanilla%20Cake&price=7.00" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 8 -->
        <div class="card h-100">
            <img src="https://t4.ftcdn.net/jpg/03/08/40/43/360_F_308404381_LqyMIXDPOR6Ut1TqE2cJRQdxomGsQegc.jpg" class="card-img-top" alt="Chocolate Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Chocolate Cake</h5>
                <p class="card-text">Rich chocolate cake with chocolate ganache</p>
                <p class="card-text"><strong>Price: $11.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Chocolate%20Cake&price=11.00" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 9 -->
        <div class="card h-100">
            <img src="https://i0.wp.com/binjalsvegkitchen.com/wp-content/uploads/2015/11/Red-Velvet-Cake-H2.jpg?ssl=1" class="card-img-top" alt="Red Velvet Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Red Velvet Cake</h5>
                <p class="card-text">Delicious red velvet cake with cream cheese frosting</p>
                <p class="card-text"><strong>Price: $12.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Red%20Velvet%20Cake&price=12.00" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product 10 -->
        <div class="card h-100">
            <img src="https://static.vecteezy.com/system/resources/thumbnails/028/140/156/small_2x/whole-coconut-cake-on-tplate-photo.jpg" class="card-img-top" alt="Coconut Cake">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Coconut Cake</h5>
                <p class="card-text">Moist coconut cake topped with coconut cream frosting</p>
                <p class="card-text"><strong>Price: $10.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Coconut%20Cake&price=10.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer with Pagination -->
    <div class="footer">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
            </ul>
        </nav>
        <p>&copy; 2023 Cake Shop. All rights reserved.</p>
    </div>
</div>
</body>
</html>