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
<script type="text/javascript" src="Test.js"></script>

<title>Add Employee</title>
</head>
<body>
<%@include file="Navbar.jsp" %><%-- here we add the Navbar --%>
<div class="container">


  <form action ="Operations" method = "post" name = "formAction">  
    <div class="input-group">
      <input id="id" type="number" class="form-control" name="id" id="id1" placeholder="Enter id" required>
      <input  type="text" class="form-control" name="firstName" id="firstName" placeholder="Enter First Name" required>
      <input  type="text" class="form-control" name="lastName" id="lastName" placeholder="Enter Last Name" required>
      <input  type="text" class="form-control" name="userName" name="userName" placeholder="Enter User Name" required>
      <input  type="password" class="form-control" name="password" name="password" placeholder="Enter  Password" required>
      <input  type="text" class="form-control" name="isAdmin" name="isAdmin" placeholder="In case of Admin type y otherwise n" required>
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>   
    </div>
      <input  type="submit"  class="form-control" name="operation" value = "Add">
      </form>
</div>

</body>
</html>