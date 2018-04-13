<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="modelo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<title>Biblioteca</title>
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
	          <h4 class="modal-title">Inicio de sesi�n incorrecta</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <div class="modal-body">
	          <p>Introduce de nuevo el DNI y la contrase�a</p>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login" id="cerrar">Int�ntalo de nuevo</button>
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
			<jsp:include page="./../includes/menuNormal.jsp"></jsp:include>
			<%
		}
		else {
			
			%>
			<jsp:include page="./../includes/menuAdmin.jsp"></jsp:include>
		<%
		}
	}	


%>

</body>
</html>