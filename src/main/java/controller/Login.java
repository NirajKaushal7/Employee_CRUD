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
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmployeeService employeeService = EmployeeService.getEmployeeService();
    /**
     * Default constructor. 
     */
    public Login() {
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
		//doPost(request, response);
		//RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("Login.jsp");
		//request.setAttribute("message", "Login Firstly");
		//requestDispatcher.forward(request, response);
		String operation =(String)request.getParameter("operation");
		if(operation != null)
		{
		if( operation.equals("Logout")) 
		{
		HttpSession session = request.getSession(false);	
		if(session != null)
		{
		session.invalidate();
		}
		}
		}
		else
		{
		response.sendRedirect("Login.jsp?message=Login Firstly");
		}
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
	
		if(operation != null && operation.equals("Login"))
		{
		Employee employee = employeeService .login(userName,password) ;
			if(employee != null )
				{
				if(employee.isAdmin())
				{
				HttpSession session = request.getSession(true);
				session.setAttribute("employee", employee); 
				session.setAttribute("isAdmin", true);
				response.sendRedirect("AdminMenuPage.jsp");
				//RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("AdminMenuPage.jsp");
				//requestDispatcher.forward(request, response);
				}
				else 
				{
					HttpSession session = request.getSession(true);
					session.setAttribute("employee", employee); 
					session.setAttribute("isAdmin", false);
					response.sendRedirect("UserMenuPage.jsp");
					//RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("UserMenuPage.jsp");
					//requestDispatcher.forward(request, response);
				}
				}
			else
				{
				RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("Login.jsp");
				request.setAttribute("message", "Invalid Credentials ");
				requestDispatcher.forward(request, response);
				//response.sendRedirect("Login.jsp?message=Invalid Credentials");
				}
		}
		
	}

}
