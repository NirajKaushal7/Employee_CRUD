<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>	
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<%String message = (String)request.getAttribute("message");
if(message == null)
{
message = (String)request.getParameter("message");//this for when we hit the url without login	
}
if(message != null)
{
%>
<div >
<center>
  <strong style="color:red"><%=message%></strong>
</center>
</div>
<% } %>
<form action ="Init" method = "post">
  <div class="form-group">
    <label for="exampleInputEmail1">User Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter User  Name" name = "userName">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name = "password">
  </div>

  <button type="submit" value = "Login" class="btn btn-primary" name = "operation">Login</button>
</form>
</body>
</html>