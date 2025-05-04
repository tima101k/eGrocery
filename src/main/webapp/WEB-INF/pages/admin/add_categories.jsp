<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Add Category</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/add_category.css" />
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
<div class="container">
<div class="page-header">
    <h1 class="page-title">Manage Categories</h1>
</div>

<div class="card">
    <h2 style="margin-bottom: 20px; font-size: 18px;">Create Category</h2>
    <form 
    	id="create-category-form"
    	action="${pageContext.request.contextPath}/admin/add_categories" 
       	method="post"
       	enctype="multipart/form-data"
    >
        <div style="display: flex; gap: 20px;">
            <div style="flex: 2;">
                <div class="form-group">
                    <label for="category-name" class="form-label">Category Name</label>
                    <input type="text" name="name" class="form-control" id="category-name" placeholder="Enter category name" required>
                </div>
                
                <div class="form-group">
                    <label for="category-description" class="form-label">Description</label>
                    <textarea class="form-control" name="description"  id="category-description" rows="3" placeholder="Enter category description"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="category-color" class="form-label">Color</label>
                    <div style="display: flex; align-items: center;">
                        <input type="color" name="color" class="form-control" id="category-color" value="#10b981" style="width: 100px; height: 40px;">
                        <div class="color-preview" id="color-preview" style="background-color: #10b981;"></div>
                    </div>
                </div>
            </div>
            
            <div style="flex: 1;">
                <input type="file" id="icon" name="icon" accept="image/*" />
            </div>
        </div>
        
        <div class="form-group">
            <label class="form-label">Display in Menu</label>
            <div>
                <input type="radio" name="is_active" id="display-yes" value="true" checked>
                <label for="display-yes" style="margin-right: 15px;">Yes</label>
                
                <input type="radio" name="is_active" id="display-no" value="false">
                <label for="display-no">No</label>
            </div>
        </div>
        
        <div class="actions">
            <button type="button" class="btn btn-secondary" id="cancel-btn">Cancel</button>
            <button type="submit" class="btn btn-primary">Create Category</button>
        </div>
    </form>
</div>

<div class="card existing-categories">
    <h2 style="margin-bottom: 20px; font-size: 18px;">Existing Categories</h2>
    <table class="categories-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Icon</th>
                <th>Name</th>
                <th>Color</th>
                <th>Display in Menu</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="category" items="${categoryList}" varStatus="status">
		        <tr>
		            <td>${category.id}</td>
		            <td>
		                <div class="category-icon">
		                    <img src="${category.icon}" alt="${category.name} icon">
		                </div>
		            </td>
		            <td>${category.name}</td>
		            <td>
		                <div class="category-color" style="background-color: ${category.color};"></div>
		            </td>
		            <td>
			            ${category.icon}
		                <%-- <c:choose>
		                    <c:when test="${category.is_active == 1}">Yes</c:when>
		                    <c:otherwise>No</c:otherwise>
		                </c:choose> --%>
		            </td>
		            <td>
		                <a href="editCategory?id=${category.id}" class="action-link edit-link">Edit</a>
		                <a href="deleteCategory?id=${category.id}" class="action-link delete-link">Delete</a>
		            </td>
	        	</tr>
    		</c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>