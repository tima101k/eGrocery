package com.eGrocery.controller;

import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.eGrocery.service.RegisterService;
import com.eGrocery.model.RegisterModel;


/**
 * Servlet implementation class eGrocery
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final RegisterService registerService = new RegisterService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try {
			System.out.println("1");
			RegisterModel registerModel = extractUserModel(request);
			System.out.println("2");
			Boolean isAdded = registerService.addUser(registerModel);
		} catch (Exception e){
			System.out.println("Something went wrong here");

		}
		
	}
	
	private RegisterModel extractUserModel(HttpServletRequest req) throws Exception {
		String firstName = req.getParameter("firstName");
		// String middleName = req.getParameter("middleName");
		String lastName = req.getParameter("lastName");
		// LocalDate dob = LocalDate.parse(req.getParameter("dob"));
		String email = req.getParameter("email");
		String number = req.getParameter("phone");

		String password = req.getParameter("password");
		String password2 = req.getParameter("confirmPassword");
		// int roleId = Integer.parseInt(req.getParameter("roleId"));

		// Assuming password validation is already done in validateRegistrationForm
		// TODO
		// password = PasswordUtil.encrypt(username, password);
		
		return new RegisterModel(1, firstName, lastName, email, number, password);
		
	}

}
