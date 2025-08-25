<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pastries</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css" integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* copy all CSS from Cakes page */
        .navbar-brand { display: flex; align-items: center; }
        .logo-img { height: 60px; margin-right: 10px; }
        .wide-search-form { width: 100%; max-width: 600px; }
        .wide-search-form .form-control { flex-grow: 1; }
        @media (min-width: 768px) { .wide-search-form { min-width: 400px; } }
        .nav-alter { background-color: #4a148c; position:sticky; top:0; z-index:1000; }
        .nav-link { color: white; font-family: 'Playfair Display', serif; font-style: italic; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3); padding-top: 2px; height:20px; font-size:30px; margin-left:6px; padding-bottom:30px; }
        .nav-link:hover{ color:#9f90cb; }
        .nav-item{ padding-top: 2px; height:20px; font-size:30px; margin-left:8px; padding-bottom:40px; }
        .category { margin-top:2px; color: #4a148c; font-family: 'Playfair Display', serif; font-style: italic; display: flex; align-items: center; justify-content: space-evenly; font-weight: bold; font-size: 1.8rem; letter-spacing: 2px; text-transform: uppercase; text-align: center; font-weight: 900; font-size: 1.8rem; margin-bottom:10px; }
        .top-products{ margin-top:20px; color: #4a148c; font-family: 'Playfair Display', serif; font-style: italic; display: flex; align-items: center; justify-content: space-evenly; font-weight: bold; font-size: 1.8rem; letter-spacing: 2px; text-transform: uppercase; text-align: center; font-weight: 900; font-size: 1.8rem; }
        body, html { height: 100%; margin: 0; background-color: #9F90CB; }
        .display-area { padding: 2rem 0; }
        .card { margin-bottom: 1.5rem; box-shadow: 0 4px 8px rgba(0,0,0,0.1); transition: transform 0.3s ease; width: 250px; height: 400px; margin: 10px; }
        .category-image:hover { transform: translateY(-6px); box-shadow: 0 6px 12px rgba(0,0,0,0.15); }
        .card-body { margin-left: 10px; }
        .card-img-top { height: 180px; object-fit: cover; }
        .btn-cart { background-color: #4a148c; border-color: #4a148c; }
        .btn-cart:hover { background-color: #4a148c; border-color: #4a148c; }
        .quantity-control { display: flex; align-items: center; gap: 0.5rem; }
        .footer { background-color: #4a148c; color: white; padding: 1rem 0; text-align: center; }
        .pagination { justify-content: center; }
        .fa-circle-user{ margin-top:20px; margin-left:5px; background-color: #4a148c; color: white; }
        .fa-circle-user:hover{ color:#9F90CB; }
        .top-image{ align-item:center; display:flex; }
        .account{ margin-bottom:10px; display:flex; justify-content:space-between; }
    </style>
</head>
<body>
<div class="remaining-body">
    <div class="nav-alter">
        <nav class="navbar">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
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
                                <li class="nav-item">
                                    <a class="nav-link" href="Cart.jsp"><i class="fa-solid fa-cart-shopping fa-xs"></i></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="favorite.jsp"><i class="fa-regular fa-heart fa-sm"></i></a>
                                </li>
                                <li>
                                    <a class="nav-link" href="Login.jsp"><i class="fa-regular fa-circle-user fa-sm"></i></a>
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
            <h3>Burger</h3>
        </div>
    </div>

    <div class="display-area d-flex flex-wrap justify-content-center">
        <!-- Pastry 1 -->
        <div class="card h-100">
            <img src="https://cdn.uengage.io/uploads/6670/image-919341-1677051044.jpeg" class="card-img-top" alt="Chocolate Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Classic Cheese Burst</h5>
                <p class="card-text">Juicy beef patty with double cheddar, lettuce, tomatoes, and house special sauce</p>
                <p class="card-text"><strong>Price: $8.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Chocolate%20Pastry&price=4.00" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 2 -->
        <div class="card h-100">
            <img src="https://smokeygoodness.com/wp-content/uploads/2022/01/Smashburger-header.jpg" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Smoky BBQ Crunch</h5>
                <p class="card-text">Grilled chicken breast topped with crispy fried onions, smoky barbecue sauce, and fresh greens</p>
                <p class="card-text"><strong>Price: $9.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 3 -->
        <div class="card h-100">
            <img src="https://dam.mediacorp.sg/image/upload/s--2haEz2nQ--/f_auto,q_auto/c_fill,g_auto,h_622,w_830/v1/one-cms/core/peri-peri-flavoured-mcshaker-fries-and-mcspicy--credit-mcdonald-s-singapore--data.png?itok=vZgvGJJX" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Spicy Peri-Peri Zinger</h5>
                <p class="card-text">Crispy fried chicken fillet coated in peri-peri spices with spicy mayo and lettuce</p>
                <p class="card-text"><strong>Price: $8.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 4 -->
        <div class="card h-100">
            <img src="https://static.vecteezy.com/system/resources/thumbnails/062/880/301/small/vibrant-veggie-burger-set-in-the-cheerful-corner-on-a-soft-lavender-background-photo.jpg" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Loaded Veggie Supreme</h5>
                <p class="card-text">Grilled vegetable patty packed with bell peppers, mushrooms, and cheese with a tangy herb mayo</p>
                <p class="card-text"><strong>Price: $7.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 5 -->
        <div class="card h-100">
            <img src="https://thumbs.dreamstime.com/b/double-decker-burger-wooden-background-space-to-menu-old-table-41044890.jpg" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Double Decker Delight</h5>
                <p class="card-text">Two juicy beef patties stacked with American cheese, caramelized onions, and secret burger sauce</p>
                <p class="card-text"><strong>Price: $10.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 6 -->
        <div class="card h-100">
            <img src="PASTRY_IMAGE_URL2" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Crispy Fish Fillet Burger </h5>
                <p class="card-text">Golden fried fish fillet with tartar sauce, lettuce, and a hint of lemon zest.</p>
                <p class="card-text"><strong>Price: $8.00</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 7 -->
        <div class="card h-100">
            <img src="PASTRY_IMAGE_URL2" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Strawberry Pastry</h5>
                <p class="card-text">Soft strawberry pastry with fresh cream</p>
                <p class="card-text"><strong>Price: $3.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 8 -->
        <div class="card h-100">
            <img src="PASTRY_IMAGE_URL2" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Strawberry Pastry</h5>
                <p class="card-text">Soft strawberry pastry with fresh cream</p>
                <p class="card-text"><strong>Price: $3.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 9 -->
        <div class="card h-100">
            <img src="PASTRY_IMAGE_URL2" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Strawberry Pastry</h5>
                <p class="card-text">Soft strawberry pastry with fresh cream</p>
                <p class="card-text"><strong>Price: $3.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pastry 10 -->
        <div class="card h-100">
            <img src="PASTRY_IMAGE_URL2" class="card-img-top" alt="Strawberry Pastry">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Strawberry Pastry</h5>
                <p class="card-text">Soft strawberry pastry with fresh cream</p>
                <p class="card-text"><strong>Price: $3.50</strong></p>
                <div class="mt-auto">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="cart.jsp?product=Strawberry%20Pastry&price=3.50" class="btn btn-cart text-white">Add to Cart</a>
                        <div class="quantity-control">
                            <button class="btn btn-sm btn-outline-secondary">-</button>
                            <span>1</span>
                            <button class="btn btn-sm btn-outline-secondary">+</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Add more pastry items as needed in same format -->
    </div>

    <!-- Footer with Pagination -->
    <div class="footer">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
            </ul>
        </nav>
        <p>&copy; 2023 Cake Shop. All rights reserved.</p>
    </div>
</div>
</body>
</html>
