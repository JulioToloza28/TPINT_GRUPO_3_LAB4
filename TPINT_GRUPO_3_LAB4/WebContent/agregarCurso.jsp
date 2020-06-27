<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Curso</title>
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
		<li class="breadcrumb-item active" aria-current="page">Agregar Curso</li>
		</ol>
	</nav>

	<div class="container">
		<form style="margin: 40px">
		<div class="row">
			<div class="col-md-3 mb-3">
				<label for="sel1">Materia:</label> <select class="form-control"
					id="sel1">
					<option>Laboratorio 1</option>
					<option>Programación 1</option>
					<option>Inglés 1</option>
				</select>
			</div>

			<div class="col-md-3 mb-3">
				<label for="sel1">Cuatrimestre:</label> <select class="form-control"
					id="sel1">
					<option>1er</option>
					<option>2do</option>
				</select>
			</div>

			<div class="col-md-3 mb-3">
				<label for="sel1">Año:</label> <select class="form-control"
					id="sel1">
					<option>2020</option>
					<option>2019</option>
					<option>2018</option>
				</select>
			</div>
		</div>
		
		
			<br>
			<br>
			<div class="row">
			<div class="col-md-3 mb-3">
			<H4>Profesor:</H4>
			</div>
			<div class="col-md-3 mb-3">
				<select class="form-control"
					id="sel1">
					<option>Raul Perez</option>
					<option></option>
					<option></option>
				</select>
			</div>
			</div>
			<br>
			<br>
			
			
			<H4>Alumnos:</H4>
			<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th></th>
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
							<td><input class="form-check-input" type="checkbox" value="false" id="Checkbox1" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox2" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox3" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox4" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox5" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox6" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox7" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox8" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox9" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox10" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox11" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox12" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox13" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox14" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox15" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox16" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox17" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox18" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox19" style="margin-right: auto;   margin-left: auto;"></td>
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
							<td><input class="form-check-input" type="checkbox" value="" id="Checkbox20" style="margin-right: auto;   margin-left: auto;"></td>
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
					
				</table>
			
			
			
			<button class="btn btn-primary" type="submit">Guardar</button>

		</form>


	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>