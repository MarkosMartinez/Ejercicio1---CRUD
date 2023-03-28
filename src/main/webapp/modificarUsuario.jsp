<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.Rol"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar un usuario</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<%
int id = (Integer) request.getAttribute("id");
int id_rol = (Integer) request.getAttribute("id_rol");
String nombre = (String) request.getAttribute("nombre");
Date fecha = (Date) request.getAttribute("fecha");
ArrayList<Rol> roles = (ArrayList<Rol>) request.getAttribute("roles");
%>

<div class="container">
  <div class="row">
    <div class="col">
<form action="ModificarUsuario" method="POST">   
  <div class="form-group">
  <input type="hidden" name="id" value="${id}"/>
    <label for="id"><b>ID:${id}</b></label>
    <!--<input type="text" name="id" id="id" class="form-control" placeholder="Error!" value="${id}" readonly="readonly">-->
  </div>
  <div class="form-group">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Error" value="${nombre}" required="required">
  </div>
  <div class="form-group">
    <label for="nombre">Fecha de nacimiento:</label>
     <input type="date" name="fecha_nacimiento" class="form-control" id="fecha_nacimiento" placeholder="Error" value="${fecha}" required="required">
  </div>
  <div class="form-group">
    <label for="password">Contraseña:</label>
     <input type="password" name="password" class="form-control" id="password" placeholder="Nueva Contraseña" required="required">
  </div>
  <div class="form-group">
    <label for="roles"  class="sr-only">Rol:</label>
    <select id="roles" class="form-select" name="roles" required="required">
    <option value="0"></option>
    <%
    for(Rol rol:roles){
    	if(id_rol == rol.getId()){
    		out.print("AAAAAA");
    		out.print("<option selected value='" + rol.getId() +"'>" + rol.getNombre() + "</option>");
    	}else{
    	out.print("<option value='" + rol.getId() +"'>" + rol.getNombre() + "</option>");
    	}
    }
    %>
	</select>
  </div>
  <button type="submit" class="btn btn-primary">Modificar</button>
</form>
  </div>
  </div>
</div>

</body>
</html>