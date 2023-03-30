<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<c:if test = "${aviso == 'error'}">
         <div class='alert alert-danger' role='alert'>DNI o Contraseña no valida!</div>
      </c:if>

<div class="container">
  <div class="row">
    <div class="col">
		<form action="Login" method="POST">   
		  <div class="form-group">
		    <label for="dni">DNI:</label>
		    <input type="text" class="form-control" id="dni" name="dni" aria-describedby="emailHelp" placeholder="DNI" required="required">
		  </div>
		  <div class="form-group">
		    <label for="password">Contraseña:</label>
		    <input type="password" name="password" class="form-control" id="password" placeholder="Contraseña" required="required">
		  </div>
		  <button type="submit" class="btn btn-primary">Iniciar Sesion</button>
		</form>
 </div>
  </div>
</div>
</body>
</html>