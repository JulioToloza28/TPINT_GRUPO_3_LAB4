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
		<h1>Mis Alumnos</h1>
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
				<a href="#" class="btn btn-outline-primary btn-sm">Agregar</a> <a
					href="#" class="btn btn-outline-secondary btn-sm">Editar</a> <a
					href="#" class="btn btn-outline-info btn-sm">Cargar Nota</a>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Ashton Cox</td>
							<td>Junior Technical Author</td>
							<td>San Francisco</td>
							<td>66</td>
							<td>2009/01/12</td>
							<td>$86,000</td>
						</tr>
						<tr>
							<td>Cedric Kelly</td>
							<td>Senior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2012/03/29</td>
							<td>$433,060</td>
						</tr>
						<tr>
							<td>Charde Marshall</td>
							<td>Regional Director</td>
							<td>San Francisco</td>
							<td>36</td>
							<td>2008/10/16</td>
							<td>$470,600</td>
						</tr>
						<tr>
							<td>Haley Kennedy</td>
							<td>Senior Marketing Designer</td>
							<td>London</td>
							<td>43</td>
							<td>2012/12/18</td>
							<td>$313,500</td>
						</tr>
						<tr>
							<td>Shou Itou</td>
							<td>Regional Marketing</td>
							<td>Tokyo</td>
							<td>20</td>
							<td>2011/08/14</td>
							<td>$163,000</td>
						</tr>
						<tr>
							<td>Michelle House</td>
							<td>Integration Specialist</td>
							<td>Sydney</td>
							<td>37</td>
							<td>2011/06/02</td>
							<td>$95,400</td>
						</tr>
						<tr>
							<td>Suki Burks</td>
							<td>Developer</td>
							<td>London</td>
							<td>53</td>
							<td>2009/10/22</td>
							<td>$114,500</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
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