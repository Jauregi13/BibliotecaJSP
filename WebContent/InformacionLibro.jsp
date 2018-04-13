<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.*"%>


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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Información del libro</title>
</head>
<body>
	<%
Object sesion = session.getAttribute("usuario");

Object comprobacion = session.getAttribute("comprobacion");

if(sesion == null){
%>	
	<jsp:include page="./../includes/menu.html"></jsp:include>
<%
}	
else if(comprobacion.equals("incorrecto")){
		%>
		<jsp:include page="./../includes/menu.html"></jsp:include>
		
		<script>
	      $(document).ready(function()
	      {
	         $("#inicioSesion").modal("show");
	         
	         $("#cerrar").click(function(){
	        	 $("#inicioSesion").modal("hide");
	         });
	      });
	    </script>
		<div class="modal" id="inicioSesion">
	    <div class="modal-dialog">
	      <div class="modal-content border-danger text-danger">
	      
	        <div class="modal-header">
	          <h4 class="modal-title">Inicio de sesión incorrecta</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <div class="modal-body">
	          <p>Introduce de nuevo el DNI y la contraseña</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login" id="cerrar">Inténtalo de nuevo</button>
	        </div>
	        
	        
	      </div>
	    </div>
	  </div>
	<%
	session.removeAttribute("usuario");
	session.removeAttribute("comprobacion");
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
	}	


%>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">

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

			</div>

			<div class="col-sm-6">

				<img src=<%=libro.getImagen() %>>


			</div>



		</div>



	</div>


</body>
</html>