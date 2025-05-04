<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products - eGrocery Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/global.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/order.css" />
</head>
<body>
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

    <main class="container" style="padding-top: 2rem">
      <h1 style="margin-bottom: 2rem">Manage Orders</h1>

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
            id="order-search"
            placeholder="Search orders by ID or customer..."
            onkeyup="filterOrders()"
          />
        </div>
        <div class="filter-container">
          <select
            class="filter-select"
            id="status-filter"
            onchange="filterOrders()"
          >
            <option value="all">All Status</option>
            <option value="processing">Processing</option>
            <option value="shipped">Shipped</option>
            <option value="delivered">Delivered</option>
            <option value="cancelled">Cancelled</option>
          </select>
          <select
            class="filter-select"
            id="date-filter"
            onchange="filterOrders()"
          >
            <option value="all">All Time</option>
            <option value="today">Today</option>
            <option value="week">This Week</option>
            <option value="month">This Month</option>
          </select>
        </div>
      </div>

      <div class="card">
        <table class="table" id="orders-table">
          <thead>
            <tr>
              <th>Order ID</th>
              <th>Customer</th>
              <th>Date</th>
              <th>Total</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr data-id="12345">
              <td>#12345</td>
              <td>John Doe</td>
              <td>2024-03-15</td>
              <td>$85.00</td>
              <td>
                <span class="status-badge status-delivered">Delivered</span>
              </td>
              <td>
                <button
                  class="btn btn-view"
                  onclick="toggleOrderDetails(12345)"
                >
                  View Details
                </button>
              </td>
            </tr>
            <!-- Order Details Row -->
            <tr class="details-row" id="details-12345">
              <td colspan="6">
                <div class="order-details">
                  <div class="details-grid">
                    <div class="detail-group">
                      <h4>Order ID</h4>
                      <p>#12345</p>
                    </div>
                    <div class="detail-group">
                      <h4>Order Date</h4>
                      <p>March 15, 2024 - 10:23 AM</p>
                    </div>
                    <div class="detail-group">
                      <h4>Status</h4>
                      <p>
                        <span class="status-badge status-delivered"
                          >Delivered</span
                        >
                      </p>
                    </div>
                    <div class="detail-group">
                      <h4>Payment Method</h4>
                      <p>Credit Card (Visa ending in 4242)</p>
                    </div>
                    <div class="detail-group">
                      <h4>Payment Status</h4>
                      <p>Paid</p>
                    </div>
                    <div class="detail-group">
                      <h4>Delivery Method</h4>
                      <p>Standard Shipping</p>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Customer Information</h3>
                    <div class="details-grid">
                      <div class="detail-group">
                        <h4>Name</h4>
                        <p>John Doe</p>
                      </div>
                      <div class="detail-group">
                        <h4>Email</h4>
                        <p>john@example.com</p>
                      </div>
                      <div class="detail-group">
                        <h4>Phone</h4>
                        <p>(555) 123-4567</p>
                      </div>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Shipping Address</h3>
                    <p>
                      123 Main Street, Apt 4B<br />New York, NY 10001<br />United
                      States
                    </p>
                  </div>

                  <div class="detail-section">
                    <h3>Order Items</h3>
                    <table class="order-items-table">
                      <thead>
                        <tr>
                          <th>Product</th>
                          <th>Price</th>
                          <th>Quantity</th>
                          <th>Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Organic Apples</td>
                          <td>$3.99</td>
                          <td>2</td>
                          <td>$7.98</td>
                        </tr>
                        <tr>
                          <td>Whole Wheat Bread</td>
                          <td>$4.50</td>
                          <td>1</td>
                          <td>$4.50</td>
                        </tr>
                        <tr>
                          <td>Organic Milk (1 Gallon)</td>
                          <td>$5.99</td>
                          <td>2</td>
                          <td>$11.98</td>
                        </tr>
                        <tr>
                          <td>Free Range Eggs (Dozen)</td>
                          <td>$6.99</td>
                          <td>1</td>
                          <td>$6.99</td>
                        </tr>
                        <tr>
                          <td>Avocados</td>
                          <td>$1.25</td>
                          <td>5</td>
                          <td>$6.25</td>
                        </tr>
                      </tbody>
                    </table>

                    <div class="order-summary">
                      <div class="summary-row">
                        <span>Subtotal</span>
                        <span>$37.70</span>
                      </div>
                      <div class="summary-row">
                        <span>Shipping</span>
                        <span>$5.99</span>
                      </div>
                      <div class="summary-row">
                        <span>Tax</span>
                        <span>$3.31</span>
                      </div>
                      <div class="summary-row">
                        <span>Discount</span>
                        <span>-$2.00</span>
                      </div>
                      <div class="summary-row total">
                        <span>Total</span>
                        <span>$45.00</span>
                      </div>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Order Timeline</h3>
                    <div class="order-timeline">
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 15, 2024 - 10:23 AM
                        </div>
                        <div class="timeline-title">Order Placed</div>
                        <div class="timeline-description">
                          Order #12345 was placed by customer
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 15, 2024 - 11:05 AM
                        </div>
                        <div class="timeline-title">Payment Confirmed</div>
                        <div class="timeline-description">
                          Payment of $45.00 was confirmed
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 15, 2024 - 2:30 PM
                        </div>
                        <div class="timeline-title">Order Processed</div>
                        <div class="timeline-description">
                          Order has been processed and packed
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 16, 2024 - 9:15 AM
                        </div>
                        <div class="timeline-title">Order Shipped</div>
                        <div class="timeline-description">
                          Order has been shipped via Standard Shipping
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 18, 2024 - 2:45 PM
                        </div>
                        <div class="timeline-title">Order Delivered</div>
                        <div class="timeline-description">
                          Order was delivered to the customer
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="action-buttons">
                    <button class="btn btn-primary">Print Invoice</button>
                    <button class="btn">Send Email</button>
                  </div>
                </div>
              </td>
            </tr>

            <tr data-id="12344">
              <td>#12344</td>
              <td>Jane Smith</td>
              <td>2024-03-15</td>
              <td>$124.00</td>
              <td>
                <span class="status-badge status-processing">Processing</span>
              </td>
              <td>
                <button
                  class="btn btn-view"
                  onclick="toggleOrderDetails(12344)"
                >
                  View Details
                </button>
              </td>
            </tr>
            <!-- Order Details Row -->
            <tr class="details-row" id="details-12344">
              <td colspan="6">
                <div class="order-details">
                  <div class="details-grid">
                    <div class="detail-group">
                      <h4>Order ID</h4>
                      <p>#12344</p>
                    </div>
                    <div class="detail-group">
                      <h4>Order Date</h4>
                      <p>March 15, 2024 - 3:45 PM</p>
                    </div>
                    <div class="detail-group">
                      <h4>Status</h4>
                      <p>
                        <span class="status-badge status-processing"
                          >Processing</span
                        >
                      </p>
                    </div>
                    <div class="detail-group">
                      <h4>Payment Method</h4>
                      <p>PayPal</p>
                    </div>
                    <div class="detail-group">
                      <h4>Payment Status</h4>
                      <p>Paid</p>
                    </div>
                    <div class="detail-group">
                      <h4>Delivery Method</h4>
                      <p>Express Shipping</p>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Customer Information</h3>
                    <div class="details-grid">
                      <div class="detail-group">
                        <h4>Name</h4>
                        <p>Jane Smith</p>
                      </div>
                      <div class="detail-group">
                        <h4>Email</h4>
                        <p>jane@example.com</p>
                      </div>
                      <div class="detail-group">
                        <h4>Phone</h4>
                        <p>(555) 987-6543</p>
                      </div>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Shipping Address</h3>
                    <p>
                      456 Oak Avenue<br />Chicago, IL 60601<br />United States
                    </p>
                  </div>

                  <div class="detail-section">
                    <h3>Order Items</h3>
                    <table class="order-items-table">
                      <thead>
                        <tr>
                          <th>Product</th>
                          <th>Price</th>
                          <th>Quantity</th>
                          <th>Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Organic Chicken Breast</td>
                          <td>$12.99</td>
                          <td>2</td>
                          <td>$25.98</td>
                        </tr>
                        <tr>
                          <td>Quinoa (2 lb bag)</td>
                          <td>$8.99</td>
                          <td>1</td>
                          <td>$8.99</td>
                        </tr>
                        <tr>
                          <td>Organic Spinach</td>
                          <td>$4.99</td>
                          <td>2</td>
                          <td>$9.98</td>
                        </tr>
                        <tr>
                          <td>Almond Milk</td>
                          <td>$3.99</td>
                          <td>3</td>
                          <td>$11.97</td>
                        </tr>
                        <tr>
                          <td>Organic Blueberries</td>
                          <td>$6.99</td>
                          <td>2</td>
                          <td>$13.98</td>
                        </tr>
                      </tbody>
                    </table>

                    <div class="order-summary">
                      <div class="summary-row">
                        <span>Subtotal</span>
                        <span>$70.90</span>
                      </div>
                      <div class="summary-row">
                        <span>Shipping</span>
                        <span>$12.99</span>
                      </div>
                      <div class="summary-row">
                        <span>Tax</span>
                        <span>$6.11</span>
                      </div>
                      <div class="summary-row">
                        <span>Discount</span>
                        <span>-$6.00</span>
                      </div>
                      <div class="summary-row total">
                        <span>Total</span>
                        <span>$84.00</span>
                      </div>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Order Timeline</h3>
                    <div class="order-timeline">
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 15, 2024 - 3:45 PM
                        </div>
                        <div class="timeline-title">Order Placed</div>
                        <div class="timeline-description">
                          Order #12344 was placed by customer
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 15, 2024 - 3:46 PM
                        </div>
                        <div class="timeline-title">Payment Confirmed</div>
                        <div class="timeline-description">
                          Payment of $84.00 was confirmed via PayPal
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 16, 2024 - 9:30 AM
                        </div>
                        <div class="timeline-title">Order Processing</div>
                        <div class="timeline-description">
                          Order is being processed and packed
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="action-buttons">
                    <button class="btn btn-primary">Update Status</button>
                    <button class="btn">Print Invoice</button>
                    <button class="btn">Send Email</button>
                  </div>
                </div>
              </td>
            </tr>

            <tr data-id="12343">
              <td>#12343</td>
              <td>Mike Johnson</td>
              <td>2024-03-14</td>
              <td>$65.50</td>
              <td>
                <span class="status-badge status-shipped">Shipped</span>
              </td>
              <td>
                <button
                  class="btn btn-view"
                  onclick="toggleOrderDetails(12343)"
                >
                  View Details
                </button>
              </td>
            </tr>
            <!-- Order Details Row -->
            <tr class="details-row" id="details-12343">
              <td colspan="6">
                <div class="order-details">
                  <div class="details-grid">
                    <div class="detail-group">
                      <h4>Order ID</h4>
                      <p>#12343</p>
                    </div>
                    <div class="detail-group">
                      <h4>Order Date</h4>
                      <p>March 14, 2024 - 11:20 AM</p>
                    </div>
                    <div class="detail-group">
                      <h4>Status</h4>
                      <p>
                        <span class="status-badge status-shipped">Shipped</span>
                      </p>
                    </div>
                    <div class="detail-group">
                      <h4>Payment Method</h4>
                      <p>Credit Card (Mastercard ending in 5678)</p>
                    </div>
                    <div class="detail-group">
                      <h4>Payment Status</h4>
                      <p>Paid</p>
                    </div>
                    <div class="detail-group">
                      <h4>Delivery Method</h4>
                      <p>Standard Shipping</p>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Customer Information</h3>
                    <div class="details-grid">
                      <div class="detail-group">
                        <h4>Name</h4>
                        <p>Mike Johnson</p>
                      </div>
                      <div class="detail-group">
                        <h4>Email</h4>
                        <p>mike@example.com</p>
                      </div>
                      <div class="detail-group">
                        <h4>Phone</h4>
                        <p>(555) 456-7890</p>
                      </div>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Shipping Address</h3>
                    <p>
                      789 Pine Street<br />Los Angeles, CA 90001<br />United
                      States
                    </p>
                  </div>

                  <div class="detail-section">
                    <h3>Order Items</h3>
                    <table class="order-items-table">
                      <thead>
                        <tr>
                          <th>Product</th>
                          <th>Price</th>
                          <th>Quantity</th>
                          <th>Total</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>Bananas (Bunch)</td>
                          <td>$1.99</td>
                          <td>2</td>
                          <td>$3.98</td>
                        </tr>
                        <tr>
                          <td>Ground Coffee</td>
                          <td>$12.99</td>
                          <td>1</td>
                          <td>$12.99</td>
                        </tr>
                        <tr>
                          <td>Pasta (16 oz)</td>
                          <td>$2.49</td>
                          <td>3</td>
                          <td>$7.47</td>
                        </tr>
                        <tr>
                          <td>Pasta Sauce</td>
                          <td>$3.99</td>
                          <td>2</td>
                          <td>$7.98</td>
                        </tr>
                      </tbody>
                    </table>

                    <div class="order-summary">
                      <div class="summary-row">
                        <span>Subtotal</span>
                        <span>$32.42</span>
                      </div>
                      <div class="summary-row">
                        <span>Shipping</span>
                        <span>$5.99</span>
                      </div>
                      <div class="summary-row">
                        <span>Tax</span>
                        <span>$2.59</span>
                      </div>
                      <div class="summary-row">
                        <span>Discount</span>
                        <span>$0.00</span>
                      </div>
                      <div class="summary-row total">
                        <span>Total</span>
                        <span>$41.00</span>
                      </div>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Order Timeline</h3>
                    <div class="order-timeline">
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 14, 2024 - 11:20 AM
                        </div>
                        <div class="timeline-title">Order Placed</div>
                        <div class="timeline-description">
                          Order #12343 was placed by customer
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 14, 2024 - 11:22 AM
                        </div>
                        <div class="timeline-title">Payment Confirmed</div>
                        <div class="timeline-description">
                          Payment of $41.00 was confirmed
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 14, 2024 - 3:15 PM
                        </div>
                        <div class="timeline-title">Order Processed</div>
                        <div class="timeline-description">
                          Order has been processed and packed
                        </div>
                      </div>
                      <div class="timeline-item">
                        <div class="timeline-date">
                          March 15, 2024 - 10:30 AM
                        </div>
                        <div class="timeline-title">Order Shipped</div>
                        <div class="timeline-description">
                          Order has been shipped via Standard Shipping
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="action-buttons">
                    <button class="btn btn-primary">Update Status</button>
                    <button class="btn">Print Invoice</button>
                    <button class="btn">Send Email</button>
                  </div>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>

    <script>
      // Toggle order details
      function toggleOrderDetails(orderId) {
        const detailsRow = document.getElementById(`details-${orderId}`);
        const orderRow = document.querySelector(`tr[data-id="${orderId}"]`);
        const detailsElement = detailsRow.querySelector(".order-details");

        // Close all other details
        document.querySelectorAll(".order-details.active").forEach((detail) => {
          if (detail !== detailsElement) {
            detail.classList.remove("active");
          }
        });

        // Remove active class from all rows
        document.querySelectorAll("tr.active").forEach((row) => {
          row.classList.remove("active");
        });

        // Toggle current details
        detailsElement.classList.toggle("active");

        // Add active class to current row if details are shown
        if (detailsElement.classList.contains("active")) {
          orderRow.classList.add("active");
        }
      }

      // Filter orders based on search and filter criteria
      function filterOrders() {
        const searchTerm = document
          .getElementById("order-search")
          .value.toLowerCase();
        const statusFilter = document.getElementById("status-filter").value;
        const dateFilter = document.getElementById("date-filter").value;

        const rows = document.querySelectorAll(
          "#orders-table tbody tr:not(.details-row)"
        );

        rows.forEach((row) => {
          const orderId = row.cells[0].textContent.toLowerCase();
          const customer = row.cells[1].textContent.toLowerCase();
          const date = new Date(row.cells[2].textContent);
          const status = row.cells[4].textContent.trim().toLowerCase();

          // Check if row matches search term
          const matchesSearch =
            orderId.includes(searchTerm) || customer.includes(searchTerm);

          // Check if row matches status filter
          let matchesStatusFilter = true;
          if (statusFilter !== "all") {
            matchesStatusFilter = status.includes(statusFilter);
          }

          // Check if row matches date filter
          let matchesDateFilter = true;
          if (dateFilter !== "all") {
            const today = new Date();
            const dayDiff = Math.floor((today - date) / (1000 * 60 * 60 * 24));

            if (dateFilter === "today") {
              matchesDateFilter = dayDiff < 1;
            } else if (dateFilter === "week") {
              matchesDateFilter = dayDiff < 7;
            } else if (dateFilter === "month") {
              matchesDateFilter = dayDiff < 30;
            }
          }

          // Show or hide row based on all criteria
          const shouldShow =
            matchesSearch && matchesStatusFilter && matchesDateFilter;
          row.style.display = shouldShow ? "" : "none";

          // Also hide details row if parent row is hidden
          const orderId2 = row.getAttribute("data-id");
          const detailsRow = document.getElementById(`details-${orderId2}`);
          if (detailsRow) {
            detailsRow.style.display = shouldShow ? "" : "none";

            // If we're hiding a row, also hide its details
            if (!shouldShow) {
              const detailsElement = detailsRow.querySelector(".order-details");
              detailsElement.classList.remove("active");
              row.classList.remove("active");
            }
          }
        });
      }
    </script>
  </body>
        
    </body>