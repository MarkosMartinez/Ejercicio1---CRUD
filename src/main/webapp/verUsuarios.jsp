<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.Usuario"%>
<%@ page import="modelo.Rol"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ejercicio 1 - CRUD JSP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="Estilos/style.css">
</head>
<body>
      <c:if test = "${aviso == 'usucreado'}">
         <div class='alert alert-success' role='alert'>Usuario creado con exito!</div>
      </c:if>
      <c:if test = "${aviso == 'usueliminado'}">
        <div class='alert alert-danger' role='alert'>Usuario eliminado!</div>
      </c:if>
      <c:if test = "${aviso == 'usumodificado'}">
        <div class='alert alert-primary' role='alert'>Usuario Modificado!</div>
      </c:if>
      <c:if test = "${aviso == 'error'}">
         <div class='alert alert-danger' role='alert'>Ha ocurrido un error. Vuelve a intentarlo!</div>
      </c:if>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <h2>Ejercicio 1 - Crud JSP</h2>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class='btn btn-success' id="btncrearUser" href='/Ejercicio1Crud/CrearUsuario'><b>Crear usuario</b></a>
    </div>
  </div>
</nav>

<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nombre</th>
      <th scope="col">Contraseña</th>
      <th scope="col">Rol</th>
      <th scope="col">Fecha de Nacimiento</th>
      <th scope="col">Modificar</th>
      <th scope="col">Eliminar</th>
    </tr>
  </thead>
  
    <c:forEach var="usuario" items="${usuarios}">
	<tr>
		<td>${usuario.id}</td>
		<td>${usuario.nombre}</td>
		  <c:set var="cantcontrasenia" value=""/>
    <c:forEach begin="0" end="${usuario.password.length() - 1}" var="z">
      <c:set var="cantcontrasenia" value="${cantcontrasenia}*"/>
    </c:forEach>
    <td>${cantcontrasenia}</td>
		<c:set var="encontrado" value="false" />
		<c:forEach var="rol" items="${roles}">
			<c:if test="${usuario.id_rol == rol.id}">
				<td>${rol.nombre}</td>
				<c:set var="encontrado" value="true" />
			</c:if>
		</c:forEach>
		<c:if test="${not encontrado}">
			<td>Sin Rol!</td>
		</c:if>
		<c:choose>
			<c:when test="${usuario.fechaNacimiento == null}">
				<td>Fecha Indefinida</td>
			</c:when>
			<c:otherwise>
				<td><fmt:formatDate pattern="dd-MM-yyyy" value="${usuario.fechaNacimiento}" /></td>
			</c:otherwise>
		</c:choose>
		<td><a class="btn btn-primary" href="/Ejercicio1Crud/ModificarUsuario?id=${usuario.id}">Modificar</a></td>
		<td><a class="btn btn-danger" href="/Ejercicio1Crud/EliminarUsuario?id=${usuario.id}">Eliminar</a></td>
		<c:if test="${usuario.password == null}">
			<c:set target="${usuario}" property="password" value="null" />
		</c:if>
	</tr>
</c:forEach>

</table>

</body>
</html>