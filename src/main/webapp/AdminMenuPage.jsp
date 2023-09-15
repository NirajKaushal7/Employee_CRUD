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
<%! Employee employee1; %>
<%employee1 = (Employee)request.getSession().getAttribute("employee"); 
if(employee1 != null ){
%>	
<body>
<%--<%= employee--%>
<%@include file="Navbar.jsp" %>
</body>
</html>
<%
} 
else
{
response.sendRedirect("Login.jsp?message=Login Firstly");	
}
%>
