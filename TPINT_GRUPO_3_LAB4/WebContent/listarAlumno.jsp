<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<!--<h1>Mis alumnos</h1>-->
		<nav aria-label="breadcrumb"> 		
		<ol class="breadcrumb"> 			
		<li class="breadcrumb-item active" aria-current="page">Alumnos</li> 		
		</ol> 		
		</nav>
		<div class="row">
			<div class="col-lg-3">
				<div class="form-group">
					<label for="sel1">Cursos:</label> <select class="form-control"
						id="sel1">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<a href="agregarAlumno.jsp" class="btn btn-outline-primary btn-sm">Agregar</a> <a
					href="modificarAlumno.jsp" class="btn btn-outline-secondary btn-sm">Editar</a> <a
					href="cargarNota.jsp" class="btn btn-outline-info btn-sm">Cargar Nota</a>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
						    <th>Legajo</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>DNI</th>
							<th>Fecha nacimiento</th>
							<th>Direccion</th>
							<th>Localidad</th>
							<th>Provincia</th>
							<th>Telefono</th>
							<th>Mail</th>
							<th>Estado Academico</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>18887</td>
							<td>Ariel</td>
							<td>Lobos</td>
							<td>30006789</td>
							<td>14/11/1990</td>
							<td>Lanzareto 897</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>46670291</td>
							<td>arilobos@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18888</td>
							<td>Daniela</td>
							<td>Rubinstein</td>
							<td>35322960</td>
							<td>12/08/1990</td>
							<td>Ecuador 234</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>danirubinstein@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18889</td>
							<td>Julio</td>
							<td>Toloza</td>
							<td>35322960</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>35890023</td>
							<td>jtoloza@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18890</td>
							<td>Rodrigo</td>
							<td>Guzman</td>
							<td>36920579</td>
							<td>12/12/1988</td>
							<td>Tucuman 34</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>48992037</td>
							<td>rguzman@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18890</td>
							<td>Rodrigo</td>
							<td>Guzman</td>
							<td>36920579</td>
							<td>12/12/1988</td>
							<td>Tucuman 34</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>48992037</td>
							<td>rguzman@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18891</td>
							<td>Veronica</td>
							<td>Alvarez</td>
							<td>37495038</td>
							<td>09/03/1993</td>
							<td>Talcahuano 43</td>
							<td>CABA</td>
							<td>Buenos Aires</td>
							<td>47889088</td>
							<td>valvarez@gmail.com</td>
							<td>Libre</td>
						</tr>
						<tr>
							<td>18892</td>
							<td>Maria</td>
							<td>Menendez</td>
							<td>33902389</td>
							<td>24/09/1989</td>
							<td>Olegario 9012</td>
							<td>Bella Vista</td>
							<td>Buenos Aires</td>
							<td>45990289</td>
							<td>Mmenendez@gmail.com</td>
							<td>Libre</td>
						</tr>
												<tr>
							<td>18887</td>
							<td>Ariel</td>
							<td>Lobos</td>
							<td>30006789</td>
							<td>14/11/1990</td>
							<td>Lanzareto 897</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>46670291</td>
							<td>arilobos@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18888</td>
							<td>Daniela</td>
							<td>Rubinstein</td>
							<td>35322960</td>
							<td>12/08/1990</td>
							<td>Ecuador 234</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>danirubinstein@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18889</td>
							<td>Julio</td>
							<td>Toloza</td>
							<td>35322960</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>35890023</td>
							<td>jtoloza@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18890</td>
							<td>Rodrigo</td>
							<td>Guzman</td>
							<td>36920579</td>
							<td>12/12/1988</td>
							<td>Tucuman 34</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>48992037</td>
							<td>rguzman@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18891</td>
							<td>Veronica</td>
							<td>Alvarez</td>
							<td>37495038</td>
							<td>09/03/1993</td>
							<td>Talcahuano 43</td>
							<td>CABA</td>
							<td>Buenos Aires</td>
							<td>47889088</td>
							<td>valvarez@gmail.com</td>
							<td>Libre</td>
						</tr>
						<tr>
							<td>18892</td>
							<td>Maria</td>
							<td>Menendez</td>
							<td>33902389</td>
							<td>24/09/1989</td>
							<td>Olegario 9012</td>
							<td>Bella Vista</td>
							<td>Buenos Aires</td>
							<td>45990289</td>
							<td>Mmenendez@gmail.com</td>
							<td>Libre</td>
						</tr>
												<tr>
							<td>18887</td>
							<td>Ariel</td>
							<td>Lobos</td>
							<td>30006789</td>
							<td>14/11/1990</td>
							<td>Lanzareto 897</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>46670291</td>
							<td>arilobos@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18888</td>
							<td>Daniela</td>
							<td>Rubinstein</td>
							<td>35322960</td>
							<td>12/08/1990</td>
							<td>Ecuador 234</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>47880933</td>
							<td>danirubinstein@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18889</td>
							<td>Julio</td>
							<td>Toloza</td>
							<td>35322960</td>
							<td>10/06/1991</td>
							<td>Brasil 21</td>
							<td>Talar</td>
							<td>Buenos Aires</td>
							<td>35890023</td>
							<td>jtoloza@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18890</td>
							<td>Rodrigo</td>
							<td>Guzman</td>
							<td>36920579</td>
							<td>12/12/1988</td>
							<td>Tucuman 34</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>48992037</td>
							<td>rguzman@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18891</td>
							<td>Veronica</td>
							<td>Alvarez</td>
							<td>37495038</td>
							<td>09/03/1993</td>
							<td>Talcahuano 43</td>
							<td>CABA</td>
							<td>Buenos Aires</td>
							<td>47889088</td>
							<td>valvarez@gmail.com</td>
							<td>Libre</td>
						</tr>
						<tr>
							<td>18890</td>
							<td>Rodrigo</td>
							<td>Guzman</td>
							<td>36920579</td>
							<td>12/12/1988</td>
							<td>Tucuman 34</td>
							<td>Don Torcuato</td>
							<td>Buenos Aires</td>
							<td>48992037</td>
							<td>rguzman@gmail.com</td>
							<td>Regular</td>
						</tr>
						<tr>
							<td>18892</td>
							<td>Maria</td>
							<td>Menendez</td>
							<td>33902389</td>
							<td>24/09/1989</td>
							<td>Olegario 9012</td>
							<td>Bella Vista</td>
							<td>Buenos Aires</td>
							<td>45990289</td>
							<td>Mmenendez@gmail.com</td>
							<td>Libre</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
						    <th>Legajo</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>DNI</th>
							<th>Fecha nacimiento</th>
							<th>Direccion</th>
							<th>Localidad</th>
							<th>Provincia</th>
							<th>Telefono</th>
							<th>Mail</th>
							<th>Estado Academico</th>
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