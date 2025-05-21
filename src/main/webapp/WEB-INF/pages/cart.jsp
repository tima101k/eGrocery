<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart - eGrocery</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css" />
</head>
<body>
        <nav class="navbar">
        <div class="container navbar-container">
            <a href="${pageContext.request.contextPath}" class="logo">eGrocery</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/categories">Categories</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
            	<li><a href=" ${pageContext.request.contextPath}/cart"">Cart</a></li>
            	<c:if test="${empty sessionScope.email}">
	                <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
	                <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.email}">
	            	<li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
	            	<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
	        	</c:if>
            </ul>
        </div>
    </nav>
    
    <main class="main">
        <div class="container">
            <h1 class="page-title">Shopping Cart (3 items)</h1>
            
            <div class="cart-container">
                <div class="cart-items">
                    <div class="cart-item">
                        <div class="item-image">
                            <img src="/api/placeholder/100/100" alt="Organic Bananas">
                        </div>
                        <div class="item-details">
                            <h3 class="item-name">Organic Bananas</h3>
                            <p class="item-price">$11.00 / bunch</p>
                            <div class="item-metadata">
                                <span>Organic</span>
                                <span>Fresh</span>
                                <span>Fruits & Vegetables</span>
                            </div>
                            <div class="item-actions">
                                <div class="quantity-control">
                                    <button class="quantity-btn">-</button>
                                    <input type="number" class="quantity-input" value="1" min="1">
                                    <button class="quantity-btn">+</button>
                                </div>
                                <button class="remove-btn">Remove</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="cart-item">
                        <div class="item-image">
                            <img src="/api/placeholder/100/100" alt="Organic Avocados">
                        </div>
                        <div class="item-details">
                            <h3 class="item-name">Organic Avocados</h3>
                            <p class="item-price">$8.99 / pack of 3</p>
                            <div class="item-metadata">
                                <span>Organic</span>
                                <span>Fresh</span>
                                <span>Fruits & Vegetables</span>
                            </div>
                            <div class="item-actions">
                                <div class="quantity-control">
                                    <button class="quantity-btn">-</button>
                                    <input type="number" class="quantity-input" value="1" min="1">
                                    <button class="quantity-btn">+</button>
                                </div>
                                <button class="remove-btn">Remove</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="cart-item">
                        <div class="item-image">
                            <img src="/api/placeholder/100/100" alt="Organic Orange Juice">
                        </div>
                        <div class="item-details">
                            <h3 class="item-name">Organic Orange Juice</h3>
                            <p class="item-price">$5.49 / bottle</p>
                            <div class="item-metadata">
                                <span>Organic</span>
                                <span>Beverages</span>
                            </div>
                            <div class="item-actions">
                                <div class="quantity-control">
                                    <button class="quantity-btn">-</button>
                                    <input type="number" class="quantity-input" value="1" min="1">
                                    <button class="quantity-btn">+</button>
                                </div>
                                <button class="remove-btn">Remove</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="cart-summary">
                    <h2 class="summary-title">Order Summary</h2>
                    
                    <div class="summary-row">
                        <span>Subtotal (3 items):</span>
                        <span>$25.48</span>
                    </div>
                    
                    <div class="summary-row">
                        <span>Shipping:</span>
                        <span>$3.99</span>
                    </div>
                    
                    <div class="summary-row">
                        <span>Estimated Tax:</span>
                        <span>$2.43</span>
                    </div>
                    
                    <div class="promo-code">
                        <label for="promo">Promo Code:</label>
                        <div class="promo-input">
                            <input type="text" id="promo" placeholder="Enter promo code">
                            <button>Apply</button>
                        </div>
                    </div>
                    
                    <div class="summary-row total">
                        <span>Total:</span>
                        <span>$31.90</span>
                    </div>
                    <a href="${pageContext.request.contextPath}/checkout">
                    	<button class="checkout-btn">
                    		<p> Proceed to Checkout </p>
                    	</button>
                    </a>
                    
                    <div class="continue-shopping">
                        <a href="${pageContext.request.contextPath}/products">Continue Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>