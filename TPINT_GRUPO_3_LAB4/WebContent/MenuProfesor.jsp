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


	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div style="width: 80%; float: left">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="navbar-brand" href="#"> <img
						src="img/logo.png" alt="Logo" style="width: 40px;"></a></li>
				<li class="nav-item"><a class="nav-link"
					href="ServletCurso?listCourses=1">Cursos</a></li>
			<!-- 	<li class="nav-item"><a class="nav-link"
					href="ServletAlumno?Param=MenuAlumno">Alumnos</a></li> -->
				<!-- <li class="nav-item"><a class="nav-link" href="reporte.jsp">Reportes</a></li> -->
			</ul>
		</div>
		<div style="width: 20%; float: right">
			<ul class="navbar-nav">
			<li class="nav-item"><a class="navbar-brand" href="#"> <img
						src="img/logo.png" alt="Logo" style="width: 40px;"></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><%=session.getAttribute("Session_user")%>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#logoutModal"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						Logout
				</a></li>
			</ul>
		</div>
	</nav>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Seguro que
						desea salir?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body">Selecciones "Logout" para cerrar su
					sesion.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>