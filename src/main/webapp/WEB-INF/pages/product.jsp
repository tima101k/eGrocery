<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - eGrocery</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="container navbar-container">
            <a href="index.html" class="logo">eGrocery</a>
            <ul class="nav-links">
                <li><a href="categories.html">Categories</a></li>
                <li><a href="products.html">Products</a></li>
                <li><a href="cart.html">Cart</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="register.html">Register</a></li>
            </ul>
        </div>
    </nav>

    <main class="container" style="padding: 4rem 0;">
        <h1 style="margin-bottom: 2rem;">All Products</h1>

        <div class="product-grid">
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1603833665858-e61d17a86224?auto=format&fit=crop&w=400&q=80" 
                     alt="Organic Bananas">
                <div class="product-card-content">
                    <h3>Organic Bananas</h3>
                    <p class="price">$2.99/bunch</p>
                    <button class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=400&q=80" 
                     alt="Fresh Milk">
                <div class="product-card-content">
                    <h3>Fresh Milk</h3>
                    <p class="price">$3.49/gallon</p>
                    <button class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80" 
                     alt="Whole Grain Bread">
                <div class="product-card-content">
                    <h3>Whole Grain Bread</h3>
                    <p class="price">$4.99/loaf</p>
                    <button class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?auto=format&fit=crop&w=400&q=80" 
                     alt="Farm Fresh Eggs">
                <div class="product-card-content">
                    <h3>Farm Fresh Eggs</h3>
                    <p class="price">$5.99/dozen</p>
                    <button class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1598030304671-5aa1d6f21128?auto=format&fit=crop&w=400&q=80" 
                     alt="Fresh Apples">
                <div class="product-card-content">
                    <h3>Fresh Apples</h3>
                    <p class="price">$1.99/lb</p>
                    <button class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1598449356475-b9f71db7d847?auto=format&fit=crop&w=400&q=80" 
                     alt="Organic Carrots">
                <div class="product-card-content">
                    <h3>Organic Carrots</h3>
                    <p class="price">$2.49/bunch</p>
                    <button class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Add to Cart</button>
                </div>
            </div>
        </div>
    </main>

    <footer style="background-color: var(--secondary); color: white; padding: 4rem 0;">
        <div class="container">
            <div class="grid grid-cols-4">
                <div>
                    <h3 style="font-size: 1.5rem; margin-bottom: 1rem;">eGrocery</h3>
                    <p>Your one-stop shop for fresh groceries delivered to your doorstep.</p>
                </div>
                <div>
                    <h4 style="margin-bottom: 1rem;">Quick Links</h4>
                    <ul style="list-style: none;">
                        <li><a href="#" style="color: white; text-decoration: none;">About Us</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;">Contact</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;">FAQs</a></li>
                    </ul>
                </div>
                <div>
                    <h4 style="margin-bottom: 1rem;">Categories</h4>
                    <ul style="list-style: none;">
                        <li><a href="#" style="color: white; text-decoration: none;">Fruits & Vegetables</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;">Dairy & Eggs</a></li>
                        <li><a href="#" style="color: white; text-decoration: none;">Meat & Fish</a></li>
                    </ul>
                </div>
                <div>
                    <h4 style="margin-bottom: 1rem;">Contact Us</h4>
                    <p>Email: support@egrocery.com</p>
                    <p>Phone: (555) 123-4567</p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>