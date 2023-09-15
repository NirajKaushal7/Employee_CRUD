<%! Employee employee1; %>
<%employee1 = (Employee)request.getSession().getAttribute("employee"); 
if(employee1 != null ){
%>
     <%@ page import="entity.Employee" %>

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

<title>Edit Employee</title>
</head>
<body>


<%--<%= editDetails --%>
<%
//if( editDetails !=null  &&  editDetails.equals("Admin"))
//{
//if(employee.isAdmin())	
//{
%>	
<%@include file="Navbar.jsp" %>
<%
//}
%>
<div class="container">

  <form action ="Operations" method = "post">
    <div class="input-group">
      <input id="id" type="number" class="form-control" name="id" placeholder="Enter id" required>
      <input  type="text" class="form-control" name="firstName" placeholder="Enter First Name" required>
      <input  type="text" class="form-control" name="lastName" placeholder="Enter Last Name" required>
      <input  type="text" class="form-control" name="userName" placeholder="Enter User Name" required>
      <input  type="password" class="form-control" name="password" placeholder="Enter  Password" required>
           <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>   
      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
</div>
    </div>
<%
//if( editDetails !=null  &&  editDetails.equals("Admin"))
//{
//if(employee.isAdmin())	
//{
%>
  <input type="radio" class="btn-check" name="isAdmin" id="radio" autocomplete="off" value = "Admin" >
  <label class="btn btn-outline-primary" for="btnradio1">Admin</label>

  <input type="radio" class="btn-check" name="isAdmin" id="radio" autocomplete="off" value ="User" checked>
  <label class="btn btn-outline-primary" for="btnradio2">User</label> 
 <%//} %>    
  <input  type="submit" class="form-control" name="operation" value = "Edit">
  </form>
</div>

</body>
</html>
<%
} 
else
{
response.sendRedirect("Login.jsp?message=Login Firstly");	
}
%>