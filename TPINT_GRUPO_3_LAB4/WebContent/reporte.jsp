<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reportes estadisticos</title>
<link href="Css/Style.css" rel="StyleSheet" type="text/css">
</head>
<body>
	<jsp:include page="Menu.jsp"></jsp:include>
	<div class="container">
		<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">Reporte</li>
		</ol>
		</nav>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<label class="my-1 mr-2" for="inlineFormCustomSelectPref">Materia</label>
				<select class="custom-select my-1 mr-sm-2"
					id="inlineFormCustomSelectPref">
					<option selected>Choose...</option>
					<option value="1">Programacion 3</option>
					<option value="2">Laboratorio 4</option>
					<option value="3">Metodologia de sistemas I</option>
				</select>
			</div>
		</div>
	</div>

	<div class="container mt-2">
		<canvas id="myChart"></canvas>
	</div>

	<script type="text/javascript" src="js/script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>