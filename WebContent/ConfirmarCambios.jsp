<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.*" %>

<%
LibroModelo libroModelo = new LibroModelo();

int id = Integer.parseInt(request.getParameter("id"));
String nuevoTitulo = request.getParameter("titulo");
String nuevoAutor = request.getParameter("autor");

Libro libro = new Libro();

libro.setAutor(nuevoAutor);
libro.setTitulo(nuevoTitulo);
libro.setId(id);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Confirmacion</title>
</head>
<body>

<%

if(request.getParameter("actualizar") != null){
	
	libroModelo.update(libro);
	
	out.print("<div class = 'alert alert-success'> Se realizo el cambio</div>");
	
	Thread.sleep(1000);
	
	response.sendRedirect("ListarLibros.jsp");
}



%>


</body>
</html>