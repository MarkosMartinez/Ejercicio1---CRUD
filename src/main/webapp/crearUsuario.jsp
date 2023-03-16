<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<form class="form-inline" action="CrearUsuario" method="POST">   
  <div class="form-group mx-sm-3 mb-2">
    <label for="nombre"  class="sr-only">Nombre y Apellido: </label>
    <input type="text" name="nombre" class="form-control" id="nombre" required="required">
  </div>
  <div class="form-group mx-sm-3 mb-2">
    <label for="dni"  class="sr-only">DNI: </label>
    <input type="text" name="dni" class="form-control" id="dni" required="required">
  </div>
  <div class="form-group mx-sm-3 mb-2">
    <label for="codigo"  class="sr-only">Codigo: </label>
    <input type="number" name="codigo" class="form-control" id="codigo" required="required">
  </div>
  <div class="form-group mx-sm-3 mb-2">
    <label for="fecha_nacimiento"  class="sr-only">Fecha de nacimiento: </label>
    <input type="date" name="fecha_nacimiento" class="form-control" id="fecha_nacimiento">
  </div>
  <button type="submit" class="btn btn-primary mb-2">Crear usuario</button>
</form>

</body>
</html>