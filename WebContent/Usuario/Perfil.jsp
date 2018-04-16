<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Perfil</title>
</head>
<body>

<%
Object sesion = session.getAttribute("usuario");


if(sesion == null){
%>	
	<jsp:include page="./../includes/menu.html"></jsp:include>
<%
}	
else {
		Usuario usuario = (Usuario)sesion;
		if(usuario.getRol().equals("normal")){
			%>
			<jsp:include page="./../includes/menuNormal.jsp"></jsp:include>
			<%
		}
		else {
			
			%>
			<jsp:include page="./../includes/menuAdmin.jsp"></jsp:include>
		<%
		}
		%>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">				
					<h3>Perfil de <%=usuario.getNombre()%> <%=usuario.getApellido()%></h3>
					<hr>		
				</div>		
			</div>
			<div class="row">
				<div class="col-sm-4">
					<img src="./../images/perfil.png">
					<br><br>
					<a class="btn btn-primary" href="http://localhost:8080/Biblioteca/Usuario/ModificarPerfil.jsp" style="width:200px;">Modificar Perfil</a>

								
				</div>
				<div class="col-sm-8">
					<table class="table">
						<tr>
						<th scope="col">Nombre</td>
						<td><%=usuario.getNombre() %></td>
						</tr>
						<tr>
						<th scope="col">Apellidos</td>
						<td><%=usuario.getApellido() %></td>
						</tr>
						<tr>
						<th scope="col">DNI</td>
						<td><%=usuario.getDni() %></td>
						<tr>
						<th scope="col">Fecha de nacimiento</td>
						<td><%=usuario.getFecha_nacimiento() %>
						</tr>		
					</table>			
				</div>	
			</div>		
		</div>
		
		
		
		
		<%
	}	


%>


</body>
</html>