<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Cursos</title>
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
</head>
<body>
	<jsp:include page="menu.html"></jsp:include>


	<div class="container">
		<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">Cursos</li>
		</ol>
		</nav>
		<div class="row">
			<div class="col-lg-12">
				<a href="agregarCurso.jsp" class="btn btn-outline-primary btn-sm">Agregar</a> <a
					href="modificarCurso.jsp" class="btn btn-outline-secondary btn-sm">Editar</a> <a
					href="eliminarCurso.jsp" class="btn btn-outline-info btn-sm">Borrar</a>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Materia</th>
							<th>Cuatrimestre</th>
							<th>Año</th>
							<th>Cant. Alumnos</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Laboratorio 1</td>
							<td>1er</td>
							<td>2020</td>
							<td>32</td>
						</tr>
						<tr>
							<td>Laboratorio 1</td>
							<td>2do</td>
							<td>2019</td>
							<td>20</td>
						</tr>
						<tr>
							<td>Laboratorio 1</td>
							<td>1er</td>
							<td>2019</td>
							<td>50</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>Materia</th>
							<th>Cuatrimestre</th>
							<th>Año</th>
							<th>Cant. Alumnos</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>