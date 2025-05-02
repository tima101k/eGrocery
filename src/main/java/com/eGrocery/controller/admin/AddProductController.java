package com.eGrocery.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.eGrocery.service.CategoryService;
import com.eGrocery.service.ProductService;

/**
 * Servlet implementation class AddProductController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/add_products" })
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final CategoryService categoryService = new CategoryService();
	private final ProductService productService = new ProductService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("categoryList", categoryService.getAllCategories());
		request.getRequestDispatcher("/WEB-INF/pages/admin/add_product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
