<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.html"></jsp:include>


	<div class="container">
		<h1>Profesores</h1>
		<div class="row">
			<div class="col-lg-3">
				<!--<div class="form-group">
					<label for="sel1">Cursos:</label> <select class="form-control"
						id="sel1">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>-->
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<a href="agregarProfesor.jsp" class="btn btn-outline-primary btn-sm">Agregar</a> <a
					href="modificarProfesor.jsp" class="btn btn-outline-secondary btn-sm">Editar</a> 
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Legajo</th>
							<th>DNI</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>Fecha Nac</th>
							<th>Direccion</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1234</td>
							<td>1234</td>
							<td>Francisco</td>
							<td>Larray</td>
							<td>2009/01/12</td>
							<td>Brasil 17</td>
						</tr>
						<tr>
							<td>1234</td>
							<td>1234</td>
							<td>Francisco</td>
							<td>Larray</td>
							<td>2009/01/12</td>
							<td>Brasil 17</td>
						</tr>
						<tr>
							<td>1234</td>
							<td>1234</td>
							<td>Francisco</td>
							<td>Larray</td>
							<td>2009/01/12</td>
							<td>Brasil 17</td>
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

</body>
</html>