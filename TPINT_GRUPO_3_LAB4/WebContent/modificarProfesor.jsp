<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Profesor</title>
</head>
<body>

<jsp:include page="menu.html"></jsp:include>

	<form style="margin: 40px">
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Nombre</label> <input type="text"
					class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Apellido</label> <input type="text"
					class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-1 mb-3">
				<label for="validationServer03">DNI</label> <input type="text"
					class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>

			</div>
	
		</div>
		<div class="form-row">
			<div class="col-md-2 mb-3">
				<label for="validationServer01">Fecha de Nacimiento</label> 
				<input name="txtFechaNac" type="date" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-2 mb-3">
				<label for="validationServer01">Telefono</label> <input type="text"
					class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Email</label> <input type="text"
					class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			
		</div>
		<div class="form-row">
			
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Direccion</label> <input type="text"
					class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>

			<div class="col-md-2 mb-3">
				<label for="validationServer04">Localidad</label> <select
					class="custom-select " id="validationServer04" required>
					<option selected disabled value="">Seleccione...</option>
					<option>Tigre</option>
				</select>
				<div class="invalid-feedback">Please select a valid state.</div>
			</div>

			<div class="col-md-2 mb-3">
				<label for="validationServer04">Provincia</label> <select
					class="custom-select " id="validationServer04" required>
					<option selected disabled value="">Seleccione...</option>
					<option>Buenos Aires</option>
				</select>
				<div class="invalid-feedback">Please select a valid state.</div>
			</div>

			
		</div>

		

		<button class="btn btn-primary" type="submit">Agregar</button>
	</form>

</body>
</html>