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
<title>Listado de libros</title>
</head>
<body>

<h3>Listado de los libros</h3>

<table border = 1>
<tr>
<td>Titulo</td>
<td>Autor</td>
</tr>
<%

libros = libroModelo.selectAll();
Iterator<Libro> i = libros.iterator();
while(i.hasNext()){
	Libro libro = i.next();
	out.print("<tr>");
	out.print("<td>" + libro.getTitulo() + "</td>");
	out.print("<td>" + libro.getAutor() + "</td>");
	out.print("</tr>");
}


%>


</table>


</body>
</html>