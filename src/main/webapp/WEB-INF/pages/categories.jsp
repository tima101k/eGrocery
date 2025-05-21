<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Categories - eGrocery</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>
    <nav class="navbar">
        <div class="container navbar-container">
            <a href="index.html" class="logo">eGrocery</a>
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

    <main class="container" style="padding: 4rem 0;">
        <h1 style="margin-bottom: 2rem;">Shop by Category</h1>

        <div class="grid grid-cols-2">
           <c:forEach var="category" items="${categoryList}" varStatus="status">
	            <a href="#" class="card" style="text-align: center; text-decoration: none; color: inherit; position: relative;">
	                <img src="${pageContext.request.contextPath}/resources/images/category/${category.icon}" 
	                     alt="Fruits & Vegetables" 
	                     style="width: 100%; height: 300px; object-fit: cover; border-radius: 0.5rem;">
	                <div style="position: absolute; inset: 0; background: rgba(0,0,0,0.4); border-radius: 0.5rem; display: flex; align-items: center; justify-content: center;">
	                    <h3 style="color: white; font-size: 1.5rem;">${category.name}</h3>
	                </div>
	            </a>
            </c:forEach> 
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