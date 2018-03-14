<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="modelo.*" %>
<%
LibroModelo libroModelo = new LibroModelo();


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Libro</title>
</head>
<body>

<h1>Actualizar libro</h1>

<form method = "post">

Titulo del libro antiguo: <input type = "text" name =" titulo-antiguo">
<br>
Titulo del libro nuevo <input type = "text" name = "titulo_nuevo">
<br>
<input type="submit" value ="Actualizar" name= "actualizar">

</form>

</body>
</html>