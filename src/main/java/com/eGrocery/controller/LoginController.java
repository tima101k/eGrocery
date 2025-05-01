package com.eGrocery.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.eGrocery.model.UserModel;
import com.eGrocery.service.LoginService;
import com.eGrocery.utils.CookieUtil;
import com.eGrocery.utils.SessionUtil;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final LoginService loginService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
    	this.loginService = new LoginService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserModel userModel = new UserModel(email, password);
		Boolean loginStatus = loginService.loginUser(userModel);
		
		if (loginStatus != null && loginStatus) {
			SessionUtil.setAttribute(request, "email", email);
			if (email.equals("admin@egrocery.com")) {
				 CookieUtil.addCookie(response, "role", "admin", 5 * 30);
				response.sendRedirect(request.getContextPath() + "/dashboard"); // Redirect to /admin dashborad
			} else {
				CookieUtil.addCookie(response, "role", "user", 5 * 30);
				response.sendRedirect(request.getContextPath() + "/"); // Redirect to /home
			}
		} else {
			handleLoginFailure(request, response, loginStatus);
		}
	}
	
	/**
	 * Handles login failures by setting attributes and forwarding to the login
	 * page.
	 *
	 * @param req         HttpServletRequest object
	 * @param resp        HttpServletResponse object
	 * @param loginStatus Boolean indicating the login status
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "User credential mismatch. Please try again!";
		}
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
	}

}
