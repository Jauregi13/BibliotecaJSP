<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="modelo.*" %>
<% 

Usuario usuario = (Usuario)session.getAttribute("usuario");

%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://localhost:8080/Biblioteca/css/style.css" type ="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style type="text/css">
.site-header {
	background-color: blue;
}

a {
	color: white;
	width: 200px;
	text-align: center;
}

a:hover {
	text-decoration: none;
	color: blue;
	font-weight: bold;
	background-color: white;
	border-radius: 5px 5px 5px 5px;
	background-color: white;
}

a:focus {
	text-decoration: none;
	background-color: white;
	font-weight: bold;
	color: blue;
	border-radius: 5px 5px 5px 5px;
}

.dropdown-menu {
	background-color: blue;
	width: 100px;
}

.dropdown-menu a {
	color: white;
}

.dropdown-menu a:hover, .dropdown-menu a:focus{
	color: blue;
}

.dropdown:hover>.dropdown-menu {
	display: block;
}

li {

	list-style: none;

}

.icon-home, .icon-user {

	font-size : 25px;

}
</style>



<nav class="site-header sticky-top py-1">
	<div
		class="container d-flex flex-column flex-md-row justify-content-between">
		<a class="py-2" href="http://localhost:8080/Biblioteca/HTML/index.jsp"><span class="icon-home"></span></a>
		<a class="py-2" href="http://localhost:8080/Biblioteca/ListarLibros.jsp">Listar libros</a>
		<a class="py-2" href="http://localhost:8080/Biblioteca/ListarPrestamos.jsp">Listar prestamos</a>
		<li class="dropdown" style="margin-left: 110px;"><a class="py-2 d-none d-md-inline-block dropdown dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-user"></span> <%=usuario.getNombre()%></a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" tabindex="-1" href="http://localhost:8080/Biblioteca/Usuario/Perfil.jsp">Mi perfil</a></li>
			</ul>
		</li>
		<a class="py-2 d-none d-md-inline-block" href="http://localhost:8080/Biblioteca/cerrarSesion.jsp"  style="margin-right: -50px; float:right;">Cerrar Sesion</a>
	</div>
</nav>


