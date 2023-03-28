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

<%
ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios");
ArrayList<Rol> roles = (ArrayList<Rol>) request.getAttribute("roles");
%>
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
  
    <%
    for(int i = 0; i<usuarios.size();i++){
    	out.print("<tr>");
    	out.print("<td>" + usuarios.get(i).getId() + "</td>");
    	out.print("<td>" + usuarios.get(i).getNombre() + "</td>");
    	String cantcontrasenia = "";
    	for(int z = 0; z< usuarios.get(i).getPassword().length();z++){
    		cantcontrasenia = cantcontrasenia + "*";
    	}
    	out.print("<td>" + cantcontrasenia + "</td>");
    	boolean encontrado = false;
    	for(Rol rol:roles){
    		encontrado = false;
    		if(usuarios.get(i).getId_rol() == rol.getId()){
    			out.print("<td>" + rol.getNombre() + "</td>");
    			encontrado = true;
    			break;
    		}
    	}
    	if(!encontrado){
			out.print("<td>Sin Rol!</td>");
		}
    	if(usuarios.get(i).getFechaNacimiento() == null){
        	out.print("<td>Fecha Indefinida</td>");
        	}else{
        		%>
        		<td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${usuarios.get(i).getFechaNacimiento()}" /></td>
        	<%}
        	out.print("<td><a class='btn btn-primary' href='/Ejercicio1Crud/ModificarUsuario?id=" + usuarios.get(i).getId() + "'>Modificar</a></td>");
    	out.print("<td><a class='btn btn-danger' href='/Ejercicio1Crud/EliminarUsuario?id=" + usuarios.get(i).getId() + "'>Eliminar</a></td>");
    	if(usuarios.get(i).getPassword() == null){
    		usuarios.get(i).setPassword("null");
    	}
    	out.print("</tr>");
    }
    %>
</table>

</body>
</html>