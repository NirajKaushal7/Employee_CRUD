<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="entity.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Edit Your Details</title>
</head>
<body>
<%! Employee employee;%>
<% 
employee = (Employee) session.getAttribute("employee");
if(employee != null)
{
%>

<%--<%= editDetails --%>

<div class="container">

<form action ="Operations?id=<%= employee.getId()%>" method = "post"> 
    <div class="input-group">
      <input  type="text" class="form-control" name="firstName" placeholder="Enter First Name" required>
      <input  type="text" class="form-control" name="lastName" placeholder="Enter Last Name" required>
      <input  type="text" class="form-control" name="userName" placeholder="Enter User Name" required>
      <input  type="password" class="form-control" name="password" placeholder="Enter  Password" required>
           <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>   
      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
</div>
    </div>
  <input  type="submit" class="form-control" name="operation" value = "Edit Details">
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
