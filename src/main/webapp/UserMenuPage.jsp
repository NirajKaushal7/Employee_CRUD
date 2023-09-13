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
  
<title>User Menu Page</title>
</head>
<body>
<div>
<%! Employee employee;
%>
<%
employee = (Employee) request.getAttribute("employee");
%>
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
      
    <tr class="info">
       <td><%= employee.getId() %></td>
       <td><%= employee.getFirstName() %></td>
       <td><%= employee.getLastName() %></td>
       <td><%= employee.getUserName() %></td>
       <td><%= "No" %></td>
     </tr>
    </tbody>
  </table>
</div>
</body>
</html>

<%--
incremental form me id ana chaiye
admin cant be able to delete to admin
radio button for isadmin in addEmployee
user can edit the details except id
user can't be able to check  when logout
 --%>