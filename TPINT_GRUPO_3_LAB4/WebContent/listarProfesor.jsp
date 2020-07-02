<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de profesores</title>
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
    .bs-example{
        margin: 20px;        
    }
</style>
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />

</head>
<body>
	<jsp:include page="menu.html"></jsp:include>

	<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">Profesores</li>
	</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<a href="agregarProfesor.jsp" class="btn btn-outline-primary btn-sm">Agregar</a>
				<!--<a href="modificarProfesor.jsp"
					class="btn btn-outline-secondary btn-sm">Editar</a> <a
					href="listarProfesor.jsp" class="btn btn-outline-danger btn-sm">Eliminar</a>  -->
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Legajo</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>DNI</th>
							<th>Fecha Nac</th>
							<th>Direccion</th>
							<th>Localidad</th>
							<th>Provincia</th>
							<th>Telefono</th>
							<th>Mail</th>
							<th style="width:60px;"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>22331</td>
							<td>Adriana</td>
							<td>Perez</td>
							<td>32546464</td>
							<td>14/11/1990</td>
							<td>Lanzareto 897</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>46670291</td>
							<td>Mmenendez@gmail.com</td>
							<td><button type="button" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></button></td>						
						    <td><button type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></button></td>

						</tr>

						<tr>
							<td>22332</td>
							<td>Daniel</td>
							<td>Sterli</td>
							<td>32546465</td>
							<td>12/08/1990</td>
							<td>Ecuador 234</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>
						<tr>
							<td>22333</td>
							<td>Juan</td>
							<td>Mordecai</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>

						<tr>
							<td>22333</td>
							<td>Claudio</td>
							<td>Martinez</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>

						<tr>
							<td>22333</td>
							<td>Mateo</td>
							<td>Pereira</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>

						<tr>
							<td>22333</td>
							<td>Cecilia</td>
							<td>Milbert</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>
						<tr>
							<td>22333</td>
							<td>Raul</td>
							<td>Mordel</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>
						<tr>
							<td>22333</td>
							<td>Juan</td>
							<td>Mordecai</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>
						<tr>
							<td>22333</td>
							<td>Juan</td>
							<td>Mordecai</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>
						<tr>
							<td>22333</td>
							<td>Juan</td>
							<td>Mordecai</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>
						<tr>
							<td>22333</td>
							<td>Carlos</td>
							<td>Amarilla</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
						</tr>
						<tr>
							<td>22333</td>
							<td>Sandra</td>
							<td>Moschey</td>
							<td>32546466</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>Mmenendez@gmail.com</td>
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