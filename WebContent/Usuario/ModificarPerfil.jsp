<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Perfil</title>
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
				<jsp:include page="./../includes/menuNormal.jsp"></jsp:include>
	<%
		} else {
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
			
											
							</div>
							<div class="col-sm-8">
								<form action="" method="get">
									<table class="table">
										<tr>
										<th scope="col">Nombre</td>
										<td>
											<div class="form-group">
												<input type="text" class="form-control" id="nombre" name="nombre" value="<%=usuario.getNombre() %>">
										
											</div>
										</td>
										</tr>
										<tr>
										<th scope="col">Apellidos</td>
										<td><input type="text" class="form-control" id="apellidos" name="apellidos" value="<%=usuario.getApellido() %>">
										
										</td>
										</tr>
										<tr>
										<th scope="col">DNI</td>
										<td><input type="text" class="form-control" id="dni" name="dni" value="<%=usuario.getDni() %>"></td>
										<tr>
										<th scope="col">Fecha de nacimiento</td>
										<td><input type="date" class="form-control" id="fecha" name="fecha" value="<%=usuario.getFecha_nacimiento() %>"></td>
										</tr>		
									</table>
									<input type="submit" class="btn btn-primary" id="guardar" name="guardar" value="Guardar">
								</form>		
							</div>	
						</div>		
					</div>


	<%
					if(request.getParameter("guardar") != null){
						
						UsuarioModelo usuarioModelo = new UsuarioModelo();
						Usuario usuarioActualizar = new Usuario();
						SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
						
						String nombre = request.getParameter("nombre");
						String apellido = request.getParameter("apellidos");
						String dni = request.getParameter("dni");
						Date fecha = (Date)formato.parse(request.getParameter("fecha"));
						int id = usuario.getId();
						
						usuarioActualizar.setNombre(nombre);
						usuarioActualizar.setApellido(apellido);
						usuarioActualizar.setDni(dni);
						usuarioActualizar.setFecha_nacimiento(fecha);
						usuarioActualizar.setId(id);
						
						usuarioModelo.Update(usuarioActualizar);
						
					}
	
	
		}
	%>

</body>
</html>