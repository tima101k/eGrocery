<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products - eGrocery Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/product.css" />
</head>
<body>
    <nav class="navbar">
        <div class="container navbar-container">
            <a href="index.html" class="logo">eGrocery Admin</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/admin/products">Products</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/order">Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/customers">Customers</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/add_categories">Categories</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </div>
    </nav>

    <main class="container" style="padding-top: 2rem;">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1>Manage Products</h1>
            <a href="${pageContext.request.contextPath}/admin/add_products">
            	<button class="btn btn-primary">Add New Product</button>
            </a>
        </div>

        <div class="card">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${productList}" varStatus="status">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name }</td>
                        <td>${product.categoryName}</td>
                        <td>${product.stockQuantity}</td>
                        <td>${product.categoryName}</td>
                        <td>
                            <button class="btn" style="margin-right: 0.5rem;">Edit</button>
                            <button class="btn" style="color: red;">Delete</button>
                        </td>
                    </tr>
                  </c:forEach>  
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>