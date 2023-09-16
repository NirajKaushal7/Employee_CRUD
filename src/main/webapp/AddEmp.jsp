<%--<%! Employee employee1;
<%employee1 = (Employee)request.getSession().getAttribute("employee"); 
if(employee1 != null ){
%>
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="service.EmployeeService" %>
     <%@ page import="entity.Employee" %>
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

<title>Add Employee</title>
</head>
<%--These below headers are often used to ensure that a web page or resource is not cached,
 or if it is cached, it should not be used after its expiration date. 
 use it before body tag
 --%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(session.getAttribute("employee")==null)
{
	response.sendRedirect("Login.jsp?message=Login Firstly");
}	
%> 
<%
EmployeeService employeeService = EmployeeService.getEmployeeService();
List<Employee> empList = employeeService.getList();
int id = empList.get(empList.size()-1).getId()+1;%>

<body>
    <div align="right"><a class="btn btn-danger" href="Operations?operation=Logout">Logout</a></div>
<%--<%= editDetails --%>

<div class="container">

  <form action ="Operations" method = "post">
    <div class="input-group">
      <input id="id" type="number" class="form-control" name="id" id="id1" value = <%= id %> readonly>
      <input  type="text" class="form-control" name="firstName" placeholder="Enter First Name" required>
      <input  type="text" class="form-control" name="lastName" placeholder="Enter Last Name" required>
      <input  type="text" class="form-control" name="userName" placeholder="Enter User Name" required>
      <input  type="password" class="form-control" name="password" placeholder="Enter  Password" required>
           <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>   
      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
</div>
    </div>
    <input type="radio" class="btn-check" name="isAdmin" id="radio" autocomplete="off" value = "Admin" checked>
  <label class="btn btn-outline-primary" for="btnradio1">Admin</label>

  <input type="radio" class="btn-check" name="isAdmin" id="radio" autocomplete="off" value ="User" checked>
  <label class="btn btn-outline-primary" for="btnradio2">User</label>    
  <input  type="submit" class="form-control" name="operation" value = "Add">
  </form>
</div>

</body>
</html>