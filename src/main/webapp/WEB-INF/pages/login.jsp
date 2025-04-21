<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Fresh Foods Market - Login</title>
  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css" />
  <link rel="icon" href="favicon.ico" type="image/x-icon">
</head>
<body>
  <div class="modal">
    <div class="modal-content">
      <div class="image-section">
        <img src="pngtree-cartoon-grocery-bag-on-white-background-picture-image_7862587.png" alt="Grocery Illustration" />
      </div>
      <div class="form-section">
        <span class="close">&times;</span>
        <h2>Welcome Back</h2>
        <form id="loginForm">
          <input type="text" id="mobile" placeholder="Mobile Number or Email" required />
          <input type="password" id="password" placeholder="Password" required />
          <div class="forgot">
            <a href="#">Forgot Password?</a>
          </div>
          <button type="submit">Login to Your Account</button>
          <p class="register-text">
            Don't have an account yet? <a href="register.html">Create Account</a>
          </p>
          <p id="errorMsg"></p>
        </form>
      </div>
    </div>
  </div>

  <script src="script.js"></script>
</body>
</html>