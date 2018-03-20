<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.*"%>
<%
	LibroModelo libroModelo = new LibroModelo();
	Libro libro = new Libro();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type ="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Añadir libro</title>
</head>
<body>
<jsp:include page="./includes/menu.html"></jsp:include>
	<h1>Formulario para añadir libro</h1>

	<form action="" method="post">

		Titulo del libro: <input type="text" name="titulo"> <br>
		<br> Autor del libro: <input type="text" name="autor"> <br><br>
		<!--Imagen del libro: <input type="file" name= "imagen">
		<br><br> -->
		<input type="submit" value="añadir" name="anadir">

	</form>

	<%
		String titulo = request.getParameter("titulo");
		String autor = request.getParameter("autor");
		if(request.getParameter("anadir") != null){
			if (request.getParameter("titulo") != null && request.getParameter("autor") != null
					&& request.getParameter("titulo") != "" && request.getParameter("autor") != "") {

				libro.setTitulo(titulo);
				libro.setAutor(autor);
				
				if(libroModelo.select(titulo) != null){
				
					%>
					<!--  <div class="alert alert-danger" role="alert">
						Este titulo de libro ya existe <a href="#" class="alert-link">an example link</a>. Give it a click if you like.
					</div> -->
				<%
				}
				else {
					libroModelo.insert(libro);
				}

			}
		
		}
		
	%>

</body>
</html>