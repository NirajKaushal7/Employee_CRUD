<%! Employee employee; %>
<%employee = (Employee)request.getSession().getAttribute("employee"); 
if(employee != null ){
%>
     <%@ page import="entity.Employee" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <ul class="nav navbar-nav">
    <li><a href="AddEmp.jsp">Add Employee</a></li>
    <li><a href="DeleteEmp.jsp">Delete Employee</a></li>
    <li><a href="EditEmp.jsp">Edit Employee</a></li>
    <li><a href="ShowAllEmp.jsp">ShowAll Employee</a></li>
 	<li><a href="Operations?operation=Logout">Logout</a></li>
  </ul>
</nav>
</body>
</html>
<%
} 
else
{
response.sendRedirect("Login.jsp?message=Login Firstly");	
}
%>