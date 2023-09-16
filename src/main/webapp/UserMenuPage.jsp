
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
<%! Employee employee;
%>

<%--These below headers are often used to ensure that a web page or resource is not cached,
 or if it is cached, it should not be used after its expiration date. 
 use it before body tag
 --%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
employee = (Employee) session.getAttribute("employee");

if(employee !=null)
{
%>
<body>
    <div align="right"><li  ><a class="btn btn-danger" href="Operations?operation=Logout">Logout</a></li></div>
     
<form action = EditEmpDetails.jsp method ="post">

<%--<%=employee--%>
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
  <input  type="submit"  class="form-control" name="operation" value = "Edit Details">
  
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

<%--
incremental form me id ana chaiye automatically 
admin can't be able to delete to admin
radio button for isadmin in addEmployee
user can edit the details except id
user can't be able to check out pages when logout and before login.

Employee id comes in incremented order automatically
Admin can not delete YourSelf and Anyone
isAdmin k liye RadioButton bnana he
User khud ka data dekh k edit bhi kr pae EmployeeID chord k
User bina login k kisi bhi page pr na jaa pae  (Session valid nhi he to hme home page bhi show nhi hona chahiye direct Login page pr Redirect kr dena chahiye )(Seesion.inValidate use hoga)
 --%>