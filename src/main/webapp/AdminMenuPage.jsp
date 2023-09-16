<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="entity.Employee" %>
     <%@ page import="service.EmployeeService" %>
     <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<title>Admin Menu Page</title>
</head>
<%--These below headers are often used to ensure that a web page or resource is not cached,
 or if it is cached, it should not be used after its expiration date. 
 use it before body tag
 --%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
Employee employee = (Employee) session.getAttribute("employee");
if(employee == null)
{
	response.sendRedirect("Login.jsp?message=Login Firstly");	
}
%>
<body>
    <div align="right"><a class="btn btn-danger" href="Operations?operation=Logout">Logout</a></div>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li ><a href="AddEmp.jsp">Add Employee</a></li>
    </ul>
</nav>
<form >
<div>

<%! 
EmployeeService employeeService = EmployeeService.getEmployeeService();%>
<table class="table">
    <thead>
      <tr>
        <th>Id</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>User Name</th>
        <th>Admin</th>
      </tr>
    </thead>
    <tbody>
      
<% 
List<Employee> list = employeeService.getList();
for(int i=0 ; i < list.size();i++)
{
%>	
    <tr class="info">
        <td><%= list.get(i).getId() %></td>
        <td><%= list.get(i).getFirstName() %></td>
        <td><%= list.get(i).getLastName() %></td>
        <td><%= list.get(i).getUserName() %></td>
        <% String admin = list.get(i).isAdmin() ? "Yes" : "No"; %>
        <td><%= admin %></td>
        <%if(list.get(i).isAdmin()){%>
         <td><button id="login-button" name="operation" value="add"><a href="EditEmp.jsp?id=<%= list.get(i).getId() %>">Edit</a></button>
        <%}else {%>
            <td><button id="login-button" name="operation" value="add"><a href="EditEmp.jsp?id=<%= list.get(i).getId() %>">Edit</a></button>
        <td><button  id="login-button" name="operation" value="add"><a href="Operations?id=<%= list.get(i).getId()%>&operation=Delete">Delete</a></button>
<%	}} %>
      </tr>
    </tbody>
  </table>
</div>
</form>
</body>
</html>
