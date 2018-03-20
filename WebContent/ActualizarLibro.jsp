<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="modelo.*" %>
<%
LibroModelo libroModelo = new LibroModelo();
int id = Integer.parseInt(request.getParameter("id"));
Libro libro = libroModelo.select(id);

String[] partesTitulo = libro.getTitulo().split(" ");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actualizar Libro</title>
</head>
<body>

<h1>Actualizar libro</h1>

<form action = "ConfirmarCambios.jsp" method = "post">

<input type = "hidden" name = "id" value ="<%=libro.getId() %>">
Titulo del libro: <input type = "text" name = "titulo" value = "<%=libro.getTitulo() %>">
<br>
Autor: <input type = "text" name = "autor" value = "<%=libro.getAutor() %>">
<br>
<input type="submit" value ="Actualizar" name= "actualizar">

</form>

</body>
</html>