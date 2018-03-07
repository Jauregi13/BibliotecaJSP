<%@ page import="modelo.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de usuarios</title>
</head>
<body>

<h3>Listado de usuarios</h3>

<%
UsuarioModelo usuarioModelo = new UsuarioModelo();
ArrayList<Usuario> usuarios = usuarioModelo.selectAll();

out.print("<table border = 1>");
out.print("<tr>");
out.print("<td>DNI</td>");
out.print("<td>nombre</td>");
out.print("<td>apellido</td>");
out.print("<td>fecha de nacimiento</td>");
out.print("</tr>");

Iterator<Usuario> i = usuarios.iterator();

while(i.hasNext()){
	Usuario usuario = i.next();
	out.print("<tr>");
	out.print("<td>"+usuario.getDni()+"</td>");
	out.print("<td>"+usuario.getNombre()+"</td>");
	out.print("<td>"+usuario.getApellido()+"</td>");
	out.print("<td>"+usuario.getFecha_nacimiento()+"</td>");
	out.print("</tr>");

}



%>
</body>
</html>