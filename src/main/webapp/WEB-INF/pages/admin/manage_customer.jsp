<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manage Customers - eGrocery Admin</title>
    <link rel="stylesheet" href="../css/style.css" />
    <style>
      /* Search and Filter Styles */
      .search-filter-container {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        margin-bottom: 1.5rem;
      }

      .search-container {
        flex: 1;
        min-width: 250px;
        position: relative;
      }

      .search-container input {
        width: 100%;
        padding: 0.5rem 0.75rem 0.5rem 2.5rem;
        border: 1px solid #d1d5db;
        border-radius: 0.375rem;
      }

      .search-icon {
        position: absolute;
        left: 0.75rem;
        top: 50%;
        transform: translateY(-50%);
        color: var(--gray);
      }

      .filter-container {
        display: flex;
        gap: 0.75rem;
      }

      .filter-select {
        padding: 0.5rem;
        border: 1px solid #d1d5db;
        border-radius: 0.375rem;
        background-color: white;
      }

      /* Customer Details Styles */
      .customer-details {
        background-color: #f9fafb;
        padding: 1.5rem;
        border-radius: 0.375rem;
        margin-top: 1rem;
        margin-bottom: 1rem;
        border: 1px solid #e5e7eb;
        display: none;
      }

      .customer-details.active {
        display: block;
      }

      .details-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1.5rem;
      }

      .detail-group h4 {
        font-size: 0.875rem;
        color: var(--gray);
        margin-bottom: 0.25rem;
      }

      .detail-group p {
        font-weight: 500;
      }

      .detail-section {
        margin-top: 1.5rem;
      }

      .detail-section h3 {
        font-size: 1rem;
        margin-bottom: 0.75rem;
        padding-bottom: 0.5rem;
        border-bottom: 1px solid #e5e7eb;
      }

      .recent-orders {
        margin-top: 0.75rem;
      }

      .order-item {
        display: flex;
        justify-content: space-between;
        padding: 0.75rem 0;
        border-bottom: 1px solid #e5e7eb;
      }

      .order-item:last-child {
        border-bottom: none;
      }

      .btn-view {
        background-color: #f3f4f6;
        border: 1px solid #d1d5db;
      }

      .btn-view:hover {
        background-color: #e5e7eb;
      }

      .btn-delete {
        background-color: #fee2e2;
        border: 1px solid #fecaca;
        color: #dc2626;
      }

      .btn-delete:hover {
        background-color: #fecaca;
      }

      /* Highlight active row */
      tr.active {
        background-color: #f0fdf4;
      }

      /* SVG Icons */
      .icon {
        display: inline-block;
        width: 1rem;
        height: 1rem;
      }
    </style>
  </head>
  <body>
    <nav class="navbar">
      <div class="container navbar-container">
        <a href="${pageContext.request.contextPath}/admin" class="logo">eGrocery Admin</a>
        <ul class="nav-links">
          <li><a href="${pageContext.request.contextPath}/admin/products">Products</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/order">Orders</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/customers">Customers</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/add_categories">Categories</a></li>
          <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
        </ul>
      </div>
    </nav>

    <main class="container" style="padding-top: 2rem">
      <h1 style="margin-bottom: 2rem">Manage Customers</h1>

      <!-- Search and Filter Section -->
      <div class="search-filter-container">
        <div class="search-container">
          <span class="search-icon">
            <svg
              class="icon"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              ></path>
            </svg>
          </span>
          <input
            type="text"
            id="customer-search"
            placeholder="Search customers..."
            onkeyup="filterCustomers()"
          />
        </div>
        <div class="filter-container">
          <select
            class="filter-select"
            id="order-filter"
            onchange="filterCustomers()"
          >
            <option value="all">All Orders</option>
            <option value="high">High (5+)</option>
            <option value="medium">Medium (2-4)</option>
            <option value="low">Low (0-1)</option>
          </select>
          <select
            class="filter-select"
            id="spent-filter"
            onchange="filterCustomers()"
          >
            <option value="all">All Spending</option>
            <option value="high">High ($200+)</option>
            <option value="medium">Medium ($100-$199)</option>
            <option value="low">Low ($0-$99)</option>
          </select>
        </div>
      </div>

      <div class="card">
        <table class="table" id="customers-table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Email</th>
              <th>Orders</th>
              <th>Total Spent</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
           <c:forEach var="user" items="${userList}" varStatus="status">
            <tr data-id="1">
              	  <td>${user.id}</td>
	              <td>${user.firstName} ${user.lastName}</td>
	              <td>${user.email}</td>
	              <td>5</td>
	              <td>$245.50</td>
	              <td>
	                <button class="btn btn-view" onclick="toggleCustomerDetails(1)">
	                  View Details
	                </button>
	                <button class="btn btn-delete">Delete</button>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>
  
  </body>
</html>