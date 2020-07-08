<%@page import="entidades.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sistema universitario</title>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!-- Codigo Agregado de prueba  -->
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="js/bootstrap-datetimepicker.min.js"></script>
<!-- Codigo Agregado de prueba  -->

</head>
<body>
	<%
		ArrayList<Usuario> listaUsuario = null;
		if (request.getAttribute("listaUsuario") != null) {
			listaUsuario = (ArrayList<Usuario>) request.getAttribute("listaUsuario");

			if (listaUsuario != null && !listaUsuario.isEmpty()) {
				for (Usuario user : listaUsuario) {
					session.setAttribute("user", user.getUsername());
				}
			}
		}
	%>

	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div style="width: 90%; float: left">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="navbar-brand" href="Menu.jsp"> <img
						src="img/logo.png" alt="Logo" style="width: 40px;"></a></li>
				<li class="nav-item"><a class="nav-link"
					href="listarProfesor.jsp">Profesores</a></li>
				<li class="nav-item"><a class="nav-link"
					href="ServletCurso?listCourses=1">Cursos</a></li>
				<li class="nav-item"><a class="nav-link"
					href="ServletAlumno?Param=MenuAlumno">Alumnos</a></li>
				<li class="nav-item"><a class="nav-link" href="reporte.jsp">Reportes</a></li>
			</ul>
		</div>
		<div style="width: 10%; float: right">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="ServletUsuarios?Param=1">Usuarios</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><%=session.getAttribute("user")%></a></li>
			</ul>
		</div>
	</nav>
</body>
</html>