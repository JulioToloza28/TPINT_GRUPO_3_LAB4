<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bienvenido</title>
<link href="Css/Style.css" rel="StyleSheet" type="text/css">

</head>
<body>
	<jsp:include page="menu.html"></jsp:include>

	<div class="login-form">
		<form action="/examples/actions/confirmation.php" method="post">
			<h2 class="text-center">Log in</h2>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Usuario"
					required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="Clave"
					required="required">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block">Ingresar</button>
			</div>
			<div class="clearfix">
				<label class="pull-left checkbox-inline"></label> <a href="#"
					class="pull-right">Olvido su clave?</a>
			</div>
		</form>
		<p class="text-center">
			<a href="#">Crear una cuenta</a>
		</p>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>

</body>
</html>