package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Employee;
import service.EmployeeService;

/**
 * Servlet implementation class Init
 */
@WebServlet("/Init")
public class Init extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmployeeService ec = EmployeeService.getEmployeeService();
    /**
     * Default constructor. 
     */
    public Init() {
        // TODO Auto-generated constructor stub
    	System.out.println("Init");
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

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
		// TODO Auto-generated method stub
		//doGet(request, response);
		String userName = request.getParameter("userName");
		String password= request.getParameter("password");
		String operation = request.getParameter("operation");
		if(operation.equals("Login"))
		{
		Employee employee = ec.login(userName,password) ;
			if(employee != null )
				{
				if(employee.isAdmin())
				{
				RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("AdminMenuPage.jsp");
				HttpSession session = request.getSession();
				session.setAttribute("employee", employee); 
				request.setAttribute("employee", employee);
				requestDispatcher.include(request, response);
				}
				else 
				{
					RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("UserMenuPage.jsp");
					HttpSession session = request.getSession();
					session.setAttribute("employee", employee); 
					request.setAttribute("employee", employee);
					requestDispatcher.include(request, response);
				}
				}
			else
				{
				RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("Login.jsp");
				request.setAttribute("message", "Invalid Credentials");
				requestDispatcher.forward(request, response);
				}
		}
	}

}
