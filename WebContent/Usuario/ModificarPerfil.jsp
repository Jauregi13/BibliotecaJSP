<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.*"%>
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
			<div class="col-sm-3"></div>
			<div class="col-sm-5">
					<h3>Perfil de <%=usuario.getNombre()%> <%=usuario.getApellido()%></h3>
					<form action="http://localhost:8080/Biblioteca/inicio_sesion.jsp" method="get">
						<div class="form-group">
							<label for="dni" class="col-form-label">DNI:</label> <input type="text" class="form-control" id="dni" name="dni">
						</div>
						<div class="form-group">
							<label for="pwd">Contraseña:</label> <input type="password" class="form-control" id="password" name="password">
						</div>
						<button type="submit" class="btn btn-primary">Entrar</button>


					</form>




			</div>






		</div>




	</div>


	<%
		}
	%>

</body>
</html>