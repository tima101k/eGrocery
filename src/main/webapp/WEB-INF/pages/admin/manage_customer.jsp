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
            <tr data-id="1">
              <td>#1</td>
              <td>John Doe</td>
              <td>john@example.com</td>
              <td>5</td>
              <td>$245.50</td>
              <td>
                <button class="btn btn-view" onclick="toggleCustomerDetails(1)">
                  View Details
                </button>
                <button class="btn btn-delete">Delete</button>
              </td>
            </tr>
            <!-- Customer Details Row -->
            <tr class="details-row" id="details-1">
              <td colspan="6">
                <div class="customer-details">
                  <div class="details-grid">
                    <div class="detail-group">
                      <h4>Customer ID</h4>
                      <p>#1</p>
                    </div>
                    <div class="detail-group">
                      <h4>Full Name</h4>
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
                    <div class="detail-group">
                      <h4>Registration Date</h4>
                      <p>Jan 15, 2023</p>
                    </div>
                    <div class="detail-group">
                      <h4>Last Order</h4>
                      <p>May 3, 2023</p>
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
                    <h3>Recent Orders</h3>
                    <div class="recent-orders">
                      <div class="order-item">
                        <div>
                          <strong>Order #10045</strong>
                          <div>May 3, 2023</div>
                        </div>
                        <div>$52.75</div>
                        <div>Delivered</div>
                      </div>
                      <div class="order-item">
                        <div>
                          <strong>Order #10032</strong>
                          <div>Apr 18, 2023</div>
                        </div>
                        <div>$67.25</div>
                        <div>Delivered</div>
                      </div>
                      <div class="order-item">
                        <div>
                          <strong>Order #10021</strong>
                          <div>Mar 27, 2023</div>
                        </div>
                        <div>$45.50</div>
                        <div>Delivered</div>
                      </div>
                    </div>
                  </div>
                </div>
              </td>
            </tr>

            <tr data-id="2">
              <td>#2</td>
              <td>Jane Smith</td>
              <td>jane@example.com</td>
              <td>3</td>
              <td>$124.00</td>
              <td>
                <button class="btn btn-view" onclick="toggleCustomerDetails(2)">
                  View Details
                </button>
                <button class="btn btn-delete">Delete</button>
              </td>
            </tr>
            <!-- Customer Details Row -->
            <tr class="details-row" id="details-2">
              <td colspan="6">
                <div class="customer-details">
                  <div class="details-grid">
                    <div class="detail-group">
                      <h4>Customer ID</h4>
                      <p>#2</p>
                    </div>
                    <div class="detail-group">
                      <h4>Full Name</h4>
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
                    <div class="detail-group">
                      <h4>Registration Date</h4>
                      <p>Feb 22, 2023</p>
                    </div>
                    <div class="detail-group">
                      <h4>Last Order</h4>
                      <p>Apr 12, 2023</p>
                    </div>
                  </div>

                  <div class="detail-section">
                    <h3>Shipping Address</h3>
                    <p>
                      456 Oak Avenue<br />Chicago, IL 60601<br />United States
                    </p>
                  </div>

                  <div class="detail-section">
                    <h3>Recent Orders</h3>
                    <div class="recent-orders">
                      <div class="order-item">
                        <div>
                          <strong>Order #10039</strong>
                          <div>Apr 12, 2023</div>
                        </div>
                        <div>$48.50</div>
                        <div>Delivered</div>
                      </div>
                      <div class="order-item">
                        <div>
                          <strong>Order #10025</strong>
                          <div>Mar 30, 2023</div>
                        </div>
                        <div>$35.75</div>
                        <div>Delivered</div>
                      </div>
                      <div class="order-item">
                        <div>
                          <strong>Order #10018</strong>
                          <div>Mar 15, 2023</div>
                        </div>
                        <div>$39.75</div>
                        <div>Delivered</div>
                      </div>
                    </div>
                  </div>
                </div>
              </td>
            </tr>

            <tr data-id="3">
              <td>#3</td>
              <td>Mike Johnson</td>
              <td>mike@example.com</td>
              <td>2</td>
              <td>$85.50</td>
              <td>
                <button class="btn btn-view" onclick="toggleCustomerDetails(3)">
                  View Details
                </button>
                <button class="btn btn-delete">Delete</button>
              </td>
            </tr>
            <!-- Customer Details Row -->
            <tr class="details-row" id="details-3">
              <td colspan="6">
                <div class="customer-details">
                  <div class="details-grid">
                    <div class="detail-group">
                      <h4>Customer ID</h4>
                      <p>#3</p>
                    </div>
                    <div class="detail-group">
                      <h4>Full Name</h4>
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
                    <div class="detail-group">
                      <h4>Registration Date</h4>
                      <p>Mar 10, 2023</p>
                    </div>
                    <div class="detail-group">
                      <h4>Last Order</h4>
                      <p>Apr 5, 2023</p>
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
                    <h3>Recent Orders</h3>
                    <div class="recent-orders">
                      <div class="order-item">
                        <div>
                          <strong>Order #10035</strong>
                          <div>Apr 5, 2023</div>
                        </div>
                        <div>$42.25</div>
                        <div>Delivered</div>
                      </div>
                      <div class="order-item">
                        <div>
                          <strong>Order #10022</strong>
                          <div>Mar 28, 2023</div>
                        </div>
                        <div>$43.25</div>
                        <div>Delivered</div>
                      </div>
                    </div>
                  </div>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>

    <script>
      // Toggle customer details
      function toggleCustomerDetails(customerId) {
        const detailsRow = document.getElementById(`details-${customerId}`);
        const customerRow = document.querySelector(
          `tr[data-id="${customerId}"]`
        );
        const detailsElement = detailsRow.querySelector(".customer-details");

        // Close all other details
        document
          .querySelectorAll(".customer-details.active")
          .forEach((detail) => {
            if (detail !== detailsElement) {
              detail.classList.remove("active");
            }
          });

        // Remove active class from all rows
        document.querySelectorAll("tr.active").forEach((row) => {
          row.classList.remove("active");
        });

        // toggle current details
        detailsElement.classList.toggle("active");

        // add active class to current row if details are shown
        if (detailsElement.classList.contains("active")) {
          customerRow.classList.add("active");
        }
      }

      // filter customers based on search and filter criteria
      function filterCustomers() {
        const searchTerm = document
          .getElementById("customer-search")
          .value.toLowerCase();
        const orderFilter = document.getElementById("order-filter").value;
        const spentFilter = document.getElementById("spent-filter").value;

        const rows = document.querySelectorAll(
          "#customers-table tbody tr:not(.details-row)"
        );

        rows.forEach((row) => {
          const name = row.cells[1].textContent.toLowerCase();
          const email = row.cells[2].textContent.toLowerCase();
          const orders = parseInt(row.cells[3].textContent);
          const spent = parseFloat(row.cells[4].textContent.replace("$", ""));

          // check if row matches search term
          const matchesSearch =
            name.includes(searchTerm) || email.includes(searchTerm);

          // check if row matches order filter
          let matchesOrderFilter = true;
          if (orderFilter === "high") {
            matchesOrderFilter = orders >= 5;
          } else if (orderFilter === "medium") {
            matchesOrderFilter = orders >= 2 && orders <= 4;
          } else if (orderFilter === "low") {
            matchesOrderFilter = orders <= 1;
          }

          // check if row matches spent filter
          let matchesSpentFilter = true;
          if (spentFilter === "high") {
            matchesSpentFilter = spent >= 200;
          } else if (spentFilter === "medium") {
            matchesSpentFilter = spent >= 100 && spent < 200;
          } else if (spentFilter === "low") {
            matchesSpentFilter = spent < 100;
          }

          // show or hide row based on all criteria
          const shouldShow =
            matchesSearch && matchesOrderFilter && matchesSpentFilter;
          row.style.display = shouldShow ? "" : "none";

          // hide details row if parent row is hidden
          const detailsId = row.getAttribute("data-id");
          const detailsRow = document.getElementById(`details-${detailsId}`);
          if (detailsRow) {
            detailsRow.style.display = shouldShow ? "" : "none";

            // if we're hiding a row, also hide its details
            if (!shouldShow) {
              const detailsElement =
                detailsRow.querySelector(".customer-details");
              detailsElement.classList.remove("active");
              row.classList.remove("active");
            }
          }
        });
      }
    </script>
  </body>
</html>