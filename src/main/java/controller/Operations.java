package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmployeeService;

/**
 * Servlet implementation class AddEmployee
 */
@WebServlet("/Operations")
public class Operations extends HttpServlet {
	private static final long serialVersionUID = 1L;
    EmployeeService employeeService = EmployeeService.getEmployeeService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Operations() {
        super();
        // TODO Auto-generated constructor stub
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
		int id = 0;
		String firstName = null;
		String lastName = null;
		String userName = null;
		String password = null;
		String admin = null;
		boolean isAdmin = false;
		String  operation= (String) request.getParameter("operation");
		
		if(operation != null && (operation.equals("Add") || operation.equals("Edit")))
		{
		id = Integer.parseInt((String) request.getParameter("id"));
		firstName = (String) request.getParameter("firstName");
		lastName = (String) request.getParameter("lastName");
		userName = (String) request.getParameter("userName");
		password = (String) request.getParameter("password");
		admin= (String) request.getParameter("isAdmin");
		isAdmin = admin.equals("y") ? true : false;
		}
		
		if(operation != null && operation.equals("Add") ) 
		{	
		employeeService.addEmployee(id, firstName, lastName, userName, password, isAdmin);
		request.getRequestDispatcher("ShowAllEmp.jsp").include(request, response);
		}	
		
		if( operation != null && operation.equals("Edit")) 
		{
		employeeService.editEmployee(id, firstName, lastName, userName, password, isAdmin);
		request.getRequestDispatcher("ShowAllEmp.jsp").include(request, response);
		}	
		
		if( operation != null && operation.equals("Delete")) 
		{
		id = Integer.parseInt((String) request.getParameter("id"));
		employeeService.deleteEmployee(id);
		request.getRequestDispatcher("ShowAllEmp.jsp").include(request, response);
		}
	}
	
}
