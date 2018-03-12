<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.*"  %>


<%
LibroModelo libroModelo = new LibroModelo();
String id = request.getParameter("id");
int id_numero = Integer.parseInt(id);
Libro libro = libroModelo.select(id_numero);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Información del libro</title>
</head>
<body>

<h1>INFORMACION DEL LIBRO</h1>

<%

out.print("<table>");
out.print("<tr>");
out.print("<td>Titulo</td>");
out.print("<td>" + libro.getTitulo() + "</td>");
out.print("</tr>");
out.print("<tr>");
out.print("<td>Autor</td>");
out.print("<td>" + libro.getAutor() + "</td>");
out.print("</tr>");
out.print("</table>");
out.print("<a href=ListarLibros.jsp> Volver al listado</a>");




%>

</body>
</html>