<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="modelo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%
PrestamoModelo prestamoModelo = new PrestamoModelo();
ArrayList<Prestamo> prestamos = new ArrayList();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de prestamos</title>
</head>
<body>

<%

Object sesion = session.getAttribute("usuario");

if (sesion == null) {
%>
<jsp:include page="./../includes/menu.html"></jsp:include>
<%
}

else {
	Usuario usuario = (Usuario) sesion;
	if (usuario.getRol().equals("normal")) {
%>
		<jsp:include page="./includes/menuNormal.jsp"></jsp:include>
<%
	} else {
%>
		<jsp:include page="./../includes/menuAdmin.jsp"></jsp:include>
<%
	}
%>
	<div class ="container">
		<h3>Libros no devueltos</h3>

		<table class="table">
		<tr>
			<td>Titulo</td>
			<td>Fecha de prestamo</td>
			<td>Dias Restantes</td>
			<td>Entregado</td>
		</tr>

<%

		prestamos = (ArrayList<Prestamo>)prestamoModelo.SelectPorIdUsuario(usuario);
		Iterator<Prestamo> i = prestamos.iterator();
		
		long milisegundosDia = 24 * 60 * 60 * 1000;
		Date fecha_actual = new Date();
		while(i.hasNext()){
			Prestamo prestamo = i.next();
			
			long dias = (prestamo.getFechaLimite().getTime() - fecha_actual.getTime()) / milisegundosDia;
			out.print("<tr>");
			out.print("<td>" + prestamo.getLibro().getTitulo() + "</td>");
			out.print("<td>" + prestamo.getFechaPrestamo() + "</td>");
			%>
			<td>
				<div class="progress">
	  				<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow='<%=dias %>' aria-valuemin="0" aria-valuemax="21" style="width: 100%"></div>
				</div>
			</td>
			<%
			if(prestamo.isEntregado()){
				%>
				<td><center><span class="icon-thumbs-up"></span></center></td>
				<%
			}
			else{
				%>
				<td><span class="icon-thumbs-down"></span></td>
				<%
			}
				
			out.print("</tr>");
			
			
			
			
			
		
			
		}

}
%>


		</table>
</div>


</body>
</html>