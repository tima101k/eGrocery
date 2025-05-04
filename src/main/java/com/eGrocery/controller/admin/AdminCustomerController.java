package com.eGrocery.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.eGrocery.service.RegisterService;

/**
 * Servlet implementation class AdminCustomerController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/customers" })
public class AdminCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final RegisterService registerService = new RegisterService();
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/pages/admin/manage_customer.jsp").forward(request, response);
		// Initialize necessary objects and variables
		HttpSession userSession = request.getSession(false);
		String email = (String) (userSession != null ? userSession.getAttribute("email") : null);
		if(email == null) {
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		} else {
			request.setAttribute("userList", registerService.getAllUsers());
			request.getRequestDispatcher("/WEB-INF/pages/admin/manage_customer.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
