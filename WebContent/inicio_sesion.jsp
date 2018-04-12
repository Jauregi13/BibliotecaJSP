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

if(usuarioModelo.usuarioExiste(dni, password)){
	
	Usuario usuario = usuarioModelo.selectPorDni(dni);
	session.setAttribute("usuario", usuario);
	session.setAttribute("comprobacion", "correcto");
	response.sendRedirect("http://localhost:8080/Biblioteca/HTML/index.jsp");
}

else {
	session.setAttribute("usuario", "incorrecto");
	session.setAttribute("comprobacion", "incorrecto");
	response.sendRedirect("http://localhost:8080/Biblioteca/HTML/index.jsp");
}


%>
</body>
</html>