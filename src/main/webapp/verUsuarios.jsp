<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.ModeloUsuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ejercicio 1 - CRUD JSP</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<%
ArrayList<ModeloUsuario> usuarios = (ArrayList<ModeloUsuario>) request.getAttribute("usuarios");
%>



<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nombre</th>
      <th scope="col">Modificar</th>
      <th scope="col">Eliminar</th>
      <th><a class='btn btn-success' href='/Ejercicio1Crud/CrearUsuario'><b>+</b></a></th>
    </tr>
  </thead>
    <%
    for(int i = 0; i<usuarios.size();i++){
    	out.print("<tr>");
    	out.print("<td>" + usuarios.get(i).getId() + "</td>");
    	out.print("<td>" + usuarios.get(i).getNombre() + "</td>");
    	out.print("<td><a class='btn btn-primary' href='/Ejercicio1Crud/ModificarUsuario?id=" + usuarios.get(i).getId() + "'>Modificar</a></td>");
    	out.print("<td><a class='btn btn-danger' href='/Ejercicio1Crud/EliminarUsuario?id=" + usuarios.get(i).getId() + "'>Eliminar</a></td>");
    	out.print("</tr>");
    }
    %>
</table>

</body>
</html>