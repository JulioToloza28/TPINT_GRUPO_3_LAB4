<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Eliminar Curso</title>
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
		<h1>Eliminar Curso</h1>

		<form style="margin: 40px">
			<div class="col-md-3 mb-3">
				<label for="sel1">Materia:</label> <select class="form-control" disabled
					id="sel1">
					<option>Laboratorio 1</option>
					<option>Programación 1</option>
					<option>Inglés 1</option>
				</select>
			</div>

			<div class="col-md-3 mb-3">
				<label for="sel1">Cuatrimestre:</label> <select class="form-control" disabled
					id="sel1">
					<option>1er</option>
					<option>2do</option>
				</select>
			</div>

			<div class="col-md-3 mb-3">
				<label for="sel1">Año:</label> <select class="form-control" disabled
					id="sel1">
					<option>2020</option>
					<option>2019</option>
					<option>2018</option>
				</select>
			</div>
			
			<button class="btn btn-primary" type="submit">Eliminar</button>

		</form>


	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>