<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories - eGrocery</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/category.css" />
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
        <h1 style="margin-bottom: 2rem;">Shop by Category</h1>

        <div class="grid grid-cols-2">
            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit; position: relative;">
                <img src="https://images.unsplash.com/photo-1610348725531-843dff563e2c?auto=format&fit=crop&w=400&q=80" 
                     alt="Fruits & Vegetables" 
                     style="width: 100%; height: 300px; object-fit: cover; border-radius: 0.5rem;">
                <div style="position: absolute; inset: 0; background: rgba(0,0,0,0.4); border-radius: 0.5rem; display: flex; align-items: center; justify-content: center;">
                    <h3 style="color: white; font-size: 1.5rem;">Fruits & Vegetables</h3>
                </div>
            </a>
            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit; position: relative;">
                <img src="https://images.unsplash.com/photo-1550583724-b2692b85b150?auto=format&fit=crop&w=400&q=80" 
                     alt="Dairy & Eggs" 
                     style="width: 100%; height: 300px; object-fit: cover; border-radius: 0.5rem;">
                <div style="position: absolute; inset: 0; background: rgba(0,0,0,0.4); border-radius: 0.5rem; display: flex; align-items: center; justify-content: center;">
                    <h3 style="color: white; font-size: 1.5rem;">Dairy & Eggs</h3>
                </div>
            </a>
            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit; position: relative;">
                <img src="https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=400&q=80" 
                     alt="Meat & Fish" 
                     style="width: 100%; height: 300px; object-fit: cover; border-radius: 0.5rem;">
                <div style="position: absolute; inset: 0; background: rgba(0,0,0,0.4); border-radius: 0.5rem; display: flex; align-items: center; justify-content: center;">
                    <h3 style="color: white; font-size: 1.5rem;">Meat & Fish</h3>
                </div>
            </a>
            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit; position: relative;">
                <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80" 
                     alt="Bakery" 
                     style="width: 100%; height: 300px; object-fit: cover; border-radius: 0.5rem;">
                <div style="position: absolute; inset: 0; background: rgba(0,0,0,0.4); border-radius: 0.5rem; display: flex; align-items: center; justify-content: center;">
                    <h3 style="color: white; font-size: 1.5rem;">Bakery</h3>
                </div>
            </a>
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