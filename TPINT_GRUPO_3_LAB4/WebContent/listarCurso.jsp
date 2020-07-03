<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="daoImpl.MateriaDaoImpl"%>
<%@page import="entidades.Materia"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.bs-example {
	margin: 20px;
}
</style>

</head>
<body>
	<jsp:include page="menu.html"></jsp:include>

	<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">Cursos</li>
	</ol>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<a href="ServletCurso?AddCurso=1" name="AddCurso"
					class="btn btn-outline-primary btn-sm">Agregar curso</a><br>
				<br>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Materia</th>
							<th>Cuatrimestre</th>
							<th>Año</th>
							<th>Cant. Alumnos</th>
							<th style="width: 60px"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Laboratorio 1</td>
							<td>1er</td>
							<td>2020</td>
							<td>32</td>
							<td><a type="button" class="btn btn-primary btn-sm"
								href="modificarCurso.jsp"><i class="fa fa-edit"></i></a>
								<button type="button" class="btn btn-danger btn-sm">
									<i class="fa fa-trash" onclick="confirmar()"></i>
								</button></td>
						</tr>
						<tr>
							<td>Laboratorio 1</td>
							<td>2do</td>
							<td>2019</td>
							<td>20</td>
							<td><button type="button" class="btn btn-primary btn-sm">
									<i class="fa fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger btn-sm">
									<i class="fa fa-trash"></i>
								</button></td>
						</tr>
						<tr>
							<td>Laboratorio 1</td>
							<td>1er</td>
							<td>2019</td>
							<td>50</td>
							<td><button type="button" class="btn btn-primary btn-sm">
									<i class="fa fa-edit"></i>
								</button>
								<button type="button" class="btn btn-danger btn-sm">
									<i class="fa fa-trash"></i>
								</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>


	<script>
		function confirmar() {
			if (!confirm("¿Deseas eliminar este curso?")) {
				return false; //no se borra
			} else {
				//si se borra
				return true;
			}
		}
	</script>

</body>
</html>