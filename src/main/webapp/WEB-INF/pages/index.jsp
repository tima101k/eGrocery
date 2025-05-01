<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// Initialize necessary objects and variables
	HttpSession userSession = request.getSession(false);
	String email = (String) (userSession != null ? userSession.getAttribute("email") : null);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
</head>

<body>
    <nav class="navbar">
        <div class="container navbar-container">
            <a href="index.html" class="logo">eGrocery</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/categories">Categories</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
            	<li><a href=" ${pageContext.request.contextPath}/cart"">Cart</a></li>
                <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                <c:if test="${not empty sessionScope.email}">
	            	<li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
	        	</c:if>
            </ul>
        </div>
    </nav>

    <header style="background-color: var(--primary); color: white; padding: 4rem 0;">
        <div class="container">
            <div class="grid grid-cols-2" style="align-items: center;">
                <div>
                    <h1 style="font-size: 3rem; margin-bottom: 1rem;">Fresh Groceries Delivered to Your Door</h1>
                    <p style="font-size: 1.25rem; margin-bottom: 2rem;">Get fresh, high-quality groceries delivered
                        straight to your doorstep. Shop from our wide selection of products at great prices.</p>
                    <a href="products.html" class="btn" style="background: white; color: var(--primary);">Shop
                        Now</a>
                </div>
                <div>
                    <img src="https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=800&q=80"
                        alt="Fresh groceries"
                        style="width: 100%; border-radius: 0.5rem; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
                </div>
            </div>
        </div>
    </header>

    <section class="container" style="padding: 4rem 0;">
        <h2 style="text-align: center; margin-bottom: 2rem;">Featured Categories</h2>
        <div class="grid grid-cols-4">
            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit;">
                <img src="https://images.unsplash.com/photo-1610348725531-843dff563e2c?auto=format&fit=crop&w=400&q=80"
                    alt="Fruits & Vegetables"
                    style="width: 100%; height: 200px; object-fit: cover; border-radius: 0.5rem; margin-bottom: 1rem;">
                <h3>Fruits & Vegetables</h3>
            </a>
            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit;">
                <img src="https://images.unsplash.com/photo-1550583724-b2692b85b150?auto=format&fit=crop&w=400&q=80"
                    alt="Dairy & Eggs"
                    style="width: 100%; height: 200px; object-fit: cover; border-radius: 0.5rem; margin-bottom: 1rem;">
                <h3>Dairy & Eggs</h3>
            </a>
            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit;">
                <img src="https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&w=400&q=80"
                    alt="Meat & Fish"
                    style="width: 100%; height: 200px; object-fit: cover; border-radius: 0.5rem; margin-bottom: 1rem;">
                <h3>Meat & Fish</h3>
            </a>
            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit;">
                <img src="https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80"
                    alt="Bakery"
                    style="width: 100%; height: 200px; object-fit: cover; border-radius: 0.5rem; margin-bottom: 1rem;">
                <h3>Bakery</h3>
            </a>
        </div>
    </section>

    <section class="container" style="padding-bottom: 4rem;">
        <h2 style="text-align: center; margin-bottom: 2rem;">Featured Products</h2>
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
        </div>
    </section>

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