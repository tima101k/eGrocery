<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - eGrocery</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/global.css" />
</head>
<body>
    <nav class="navbar">
        <div class="container navbar-container">
            <a href="${pageContext.request.contextPath}/admin" class="logo">eGrocery Admin</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/admin/products">Products</a></li>
                <li><a href="orders.html">Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/customers">Customers</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/add_categories">Categories</a></li>
                <li><a href="${pageContext.request.contextPath}/admin">Logout</a></li>
            </ul>
        </div>
    </nav>

    <main class="container" style="padding-top: 2rem;">
        <h1 style="margin-bottom: 2rem;">Dashboard</h1>

        <div class="dashboard-stats">
            <div class="stat-card">
                <h3>Total Orders</h3>
                <div class="value">156</div>
            </div>
            <div class="stat-card">
                <h3>Total Revenue</h3>
                <div class="value">$4,285</div>
            </div>
            <div class="stat-card">
                <h3>Active Customers</h3>
                <div class="value">342</div>
            </div>
            <div class="stat-card">
                <h3>Products</h3>
                <div class="value">89</div>
            </div>
        </div>

        <div class="grid grid-cols-2" style="margin-bottom: 2rem;">
            <div class="card">
                <h2 style="margin-bottom: 1rem;">Recent Orders</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#12345</td>
                            <td>John Doe</td>
                            <td>$85.00</td>
                            <td>Delivered</td>
                        </tr>
                        <tr>
                            <td>#12344</td>
                            <td>Jane Smith</td>
                            <td>$124.00</td>
                            <td>Processing</td>
                        </tr>
                        <tr>
                            <td>#12343</td>
                            <td>Mike Johnson</td>
                            <td>$65.50</td>
                            <td>Shipped</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="card">
                <h2 style="margin-bottom: 1rem;">Low Stock Products</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Category</th>
                            <th>Stock</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Organic Bananas</td>
                            <td>Fruits</td>
                            <td>5 bunches</td>
                        </tr>
                        <tr>
                            <td>Fresh Milk</td>
                            <td>Dairy</td>
                            <td>8 gallons</td>
                        </tr>
                        <tr>
                            <td>Whole Wheat Bread</td>
                            <td>Bakery</td>
                            <td>3 loaves</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</body>
</html>