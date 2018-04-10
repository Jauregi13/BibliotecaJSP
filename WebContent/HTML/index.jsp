<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="modelo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%
Object sesion = session.getAttribute("usuario");

if(sesion == null){
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
else {
	Usuario usuario = (Usuario)sesion;
	String rol = usuario.getRol();
	if(rol.equals("normal")){
		%>
		<jsp:include page="./../includes/menuNormal.jsp"></jsp:include>
		<%
	}
	else {
		
		%>
		<jsp:include page="./../includes/menu.html"></jsp:include>
	<%
	}
	
%>

<title>Biblioteca</title>
</head>
<body>


</body>
</html>

<%
}


%>