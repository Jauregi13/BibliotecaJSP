<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="modelo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%
LibroModelo libroModelo = new LibroModelo();
PrestamoModelo prestamoModelo = new PrestamoModelo();
ArrayList<Libro> libros = new ArrayList();

Object sesion = session.getAttribute("usuario");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Listado de libros</title>
</head>
<style type ="text/css">

td a {

	color: black;

}

td {

text-align: center;

}




</style>
<body>
<%
	if(sesion == null){
		%>
		<jsp:include page="./includes/menu.html"></jsp:include>
		<%
	}
	else {
		Usuario usuario = (Usuario)sesion;
		
		if(usuario.getRol().equals("normal")){
			%>
			<jsp:include page="./includes/menuNormal.jsp"></jsp:include>
			<%
		}
		else {
			%>
			<jsp:include page="./includes/menuAdmin.jsp"></jsp:include>
			<%
		}
	

	
%>


<div class ="container">

	<h3>Listado de los libros</h3>
	<table class ="table">
	<tr>
	<td>Titulo</td>
	<td>Autor</td>
	<%
	if(usuario.getRol().equals("normal")){
		out.print("<td></td>");
	}
	else{
		out.print("<td colspan='3'>Acciones</td>");
	}
	%>
	<td>Estado</td>
	</tr>
	<%
	
	libros = libroModelo.selectAll();
	Iterator<Libro> i = libros.iterator();
	while(i.hasNext()){
		Libro libro = i.next();
		out.print("<tr>");
		out.print("<td>" + libro.getTitulo() + "</td>");
		out.print("<td>" + libro.getAutor() + "</td>");
		out.print("<td><a href='InformacionLibro.jsp?id="+libro.getId()+"'><button type='button' class='btn btn-primary'><span class='icon-info'></span>Info</button></a></td>");
		if(usuario.getRol().equals("admin")){
			out.print("<td><a href='ActualizarLibro.jsp?id="+libro.getId()+"'><button type='button' class='btn btn-warning'>Modificar</button></a></td>");
			out.print("<td><a href='ActualizarLibro.jsp?id="+libro.getId()+"'><button type='button' class='btn btn-danger' title='Eliminar libro'><span class='icon-circle-with-cross'</span></button></a></td>");
			
		}
		
		if(prestamoModelo.estaDisponible(libro)){
			out.print("<td><div class='alert alert-success' role='alert' style='width:100%'>Disponible</div></td>");
			
		}
		else {
			out.print("<td><div class='alert alert-danger' role='alert'>No disponible</div></td>");
		}
		
		if(prestamoModelo.estaDisponible(libro) && usuario.getRol().equals("normal") && usuario != null ){
			out.print("<td><a href='CogerPrestado.jsp?id=" +libro.getId()+ "' role='button' class='btn btn-primary'>Coger Prestado</a></td>");
		}
			
		out.print("</tr>");
	}
		}
	%>
	</table>
</div>
</body>
</html>