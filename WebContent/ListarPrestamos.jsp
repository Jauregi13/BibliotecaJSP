<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="modelo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%
PrestamoModelo prestamoModelo = new PrestamoModelo();
ArrayList<Prestamo> prestamos = new ArrayList();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type ="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Listado de prestamos</title>
</head>
<body>
<h3>Listado de prestamos</h3>

<table border = 1>
<tr>
<td>DNI</td>
<td>Titulo</td>
<td>Fecha de prestamo</td>
<td>Fecha de limite</td>
<td>Entregado</td>
</tr>
<%
prestamos = prestamoModelo.selectAll();
Iterator<Prestamo> i = prestamos.iterator();
while(i.hasNext()){
	Prestamo prestamo = i.next();
	out.print("<tr>");
	out.print("<td>" + prestamo.getUsuario().getDni() + "</td>");
	out.print("<td>" + prestamo.getLibro().getTitulo() + "</td>");
	out.print("<td>" + prestamo.getFechaPrestamo() + "</td>");
	out.print("<td>" + prestamo.getFechaLimite() + "</td>");
	if(prestamo.isEntregado()){
		%>
		<td><center><span class="glyphicon glyphicon-thumbs-up"></span></center></td>
		<script>
		$(document).ready(function(){
			if()
			$("tr").attr("bgcolor", "green");
		});
		
		
		
		
		</script>
		<%
	}
	else{
		%>
		<td><center><span class="glyphicon glyphicon-thumbs-down"></span></center></td>
		<%
	}
		
	out.print("</tr>");
	
	
	
	
	

	
}


%>


</table>



</body>
</html>