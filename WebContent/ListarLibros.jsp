<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="modelo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%
LibroModelo libroModelo = new LibroModelo();
ArrayList<Libro> libros = new ArrayList();


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Listado de libros</title>
</head>
<body>
<jsp:include page="./includes/menu.html"></jsp:include>
<h3>Listado de los libros</h3>

<table border = 1>
<tr>
<td>Titulo</td>
<td>Autor</td>
<td></td>
<td></td>
</tr>
<%

libros = libroModelo.selectAll();
Iterator<Libro> i = libros.iterator();
while(i.hasNext()){
	Libro libro = i.next();
	out.print("<tr>");
	out.print("<td>" + libro.getTitulo() + "</td>");
	out.print("<td>" + libro.getAutor() + "</td>");
	out.print("<td><a href='InformacionLibro.jsp?id="+libro.getId()+"'>Ver</a></td>");
	out.print("<td><a href='ActualizarLibro.jsp?id="+libro.getId()+"'>Modificar</a></td>");
	out.print("</tr>");
}


%>
</table>

<br>
<br>
<a href='CrearLibro.jsp'> Crear libro</a>

</body>
</html>