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
<title>Insert title here</title>
</head>
<body>
<div>
<%! Employee employee;
EmployeeService employeeService = new EmployeeService();%>
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
      
<%
if(employee.isAdmin())
{ 
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
      </tr>
<%	} %>
<% }
else{
	%>
     <tr class="info">
       <td><%= employee.getId() %></td>
       <td><%= employee.getFirstName() %></td>
       <td><%= employee.getLastName() %></td>
       <td><%= employee.getUserName() %></td>
       <td><%= "No" %></td>
     </tr>
<%
}
%>
    </tbody>
  </table>
</div>
</body>
</html>