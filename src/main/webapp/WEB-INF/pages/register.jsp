<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>EGrocery - Create Account</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" />
  <link rel="icon" href="favicon.ico" type="image/x-icon">
</head>
<body>
  <div class="modal">
    <div class="modal-content">
      <div class="image-section">
        <img src="LOGO.png" alt="Register Illustration" />
      </div>
      <div class="form-section">
        <h2>EGrocery</h2>
        <form 
        	action="${pageContext.request.contextPath}/register" 
        	method="post">
          <div class="name-fields">
            <input type="text" name="firstName" placeholder="First Name" required />
            <input type="text" name="lastName" placeholder="Last Name" required />
          </div>
          <input type="email" name="email" placeholder="Email Address" required />
          <input type="tel" name="phone" placeholder="Mobile Number (Optional)" />
          <input type="password" name="password" placeholder="Create Password" required />
          <input type="password" name="confirmPassword" placeholder="Confirm Password" required />
          <button type="submit">Create Your Account</button>
        </form>
        <p class="register-text">
          Already have an account? <a href="login.html">Login here</a>
        </p>
      </div>
    </div>
  </div>
</body>
</html>