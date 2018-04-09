<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
UsuarioModelo usuarioModelo = new UsuarioModelo();
String dni = request.getParameter("dni");

String password = request.getParameter("password");

Usuario usuario = new Usuario();
usuario.setDni(dni);
usuario.setPassword(password);
if(usuarioModelo.usuarioExiste(dni, password)){
	
	session.setAttribute("usuario", usuario);
	response.sendRedirect("http://localhost:8080/Biblioteca/HTML/index.jsp");
}

else if(usuarioModelo.usuarioExiste(dni, password) == null){
	%>
	<jsp:include page="./../includes/menu.html"></jsp:include>
	<div class="modal" id="inicio_sesion" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">Inicio de sesión incorrecta</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
          
        </div>
        
        
      </div>
    </div>
  </div>
  <%
}



%>
</body>
</html>