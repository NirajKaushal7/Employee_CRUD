<%! Employee employee1; %>
<%employee1 = (Employee)request.getSession().getAttribute("employee"); 
if(employee1 != null ){
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
<%@include file="Navbar.jsp" %>
<div class="container">


  <form action ="Operations" method = "post">
    <div class="input-group">
      <input id="id" type="number" class="form-control" name="id" placeholder="Enter id" required>
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>   
    </div>
      <input  type="submit" class="form-control" name="operation" value = "Delete">
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
