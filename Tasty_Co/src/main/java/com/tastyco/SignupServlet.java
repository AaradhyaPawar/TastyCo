package com.tastyco;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddStudentController
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if (name == null || username == null || email == null || password == null || 
			name.isBlank() || username.isBlank() || email.isBlank() || password.isBlank()) {
			response.sendRedirect("signup.jsp");
			return;
		}
		
		User u1 = new User(name, username, email, password);
		
		try (Connection conn = DBConnection.connect()) {
			if (conn == null) {
				response.sendRedirect("signup.jsp");
				return;
			}
			UserDAO udao = new UserDAO(conn);
			boolean status = udao.addUser(u1);
			if (status) {
				response.sendRedirect("login.jsp");
			} else {
				response.sendRedirect("signup.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("signup.jsp");
		}
	}

}
