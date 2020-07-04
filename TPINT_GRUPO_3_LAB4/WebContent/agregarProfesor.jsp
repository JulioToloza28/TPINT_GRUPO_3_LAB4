<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Localidad"%>
<%@page import="entidades.Provincia"%>
<%@page import="daoImpl.LocalidadDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Profesor</title>
</head>
<body>

	<jsp:include page="menu.html"></jsp:include>

	<form action="ServletsProfesor" method="get" style="margin: 40px">
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Nombre</label> <input
					name="txtNombre" type="text" class="form-control"
					id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Apellido</label> <input
					name="txtApellido" type="text" class="form-control "
					id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-1 mb-3">
				<label for="validationServer03">DNI</label> <input name="txtDNI"
					type="text" class="form-control " id="validationServer02" value=""
					required>
				<div class="valid-feedback">Looks good!</div>

			</div>

		</div>
		<div class="form-row">
			<div class="col-md-2 mb-3">
				<label for="validationServer01">Fecha de Nacimiento</label> <input
					name="txtFechaNac" type="date" class="form-control"
					id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-2 mb-3">
				<label for="validationServer01">Telefono</label> <input
					name="txtTelefono" type="text" class="form-control"
					id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Email</label> <input name="txtMail"
					type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>

		</div>
		<div class="form-row">

			<div class="col-md-3 mb-3">
				<label for="validationServer02">Direccion</label> <input
					name="txtDireccion" type="text" class="form-control "
					id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>

			<div class="col-md-2 mb-3">
				<label for="validationServer04">Provincia</label> <select
					name="cmbProvincia" class="custom-select " id="validationServer04"
					required>
					<option selected disabled value="">Seleccione...</option>
					<%
						ArrayList<Provincia> ListarProvi = null;
					if (request.getAttribute("listaProvDao") != null) {
						ListarProvi = (ArrayList<Provincia>) request.getAttribute("listaProvDao");
					}
					%>
					<%
						if (ListarProvi != null)
						for (Provincia prov : ListarProvi) {
					%>
					<option value=<%=prov.getId()%>><%=prov.getNombreProv()%></option>
					<%}%>

				</select>
				<div class="invalid-feedback">Please select a valid state.</div>
			</div>

			<div class="col-md-2 mb-3">
				<label for="validationServer04">Localidad</label> <select
					name="cmbLocalidad" class="custom-select " id="validationServer04"
					required>
					<option selected disabled value="">Seleccione...</option>
					<%
						ArrayList<Localidad> listaLocalidad = null;
					if (request.getAttribute("listaLocDao") != null) {
						listaLocalidad = (ArrayList<Localidad>) request.getAttribute("listaLocDao");
					}
					%>
					<%
						if (listaLocalidad != null)
						for (Localidad loc : listaLocalidad) {
							
					%>
					<option><%=loc.getNombre()%></option>
					<%}%>
				</select>
				<div class="invalid-feedback">Seleccione una Localidad</div>
			</div>
		</div>

		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">Usuario</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="inputPassword"
					placeholder="Usuario">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="inputPassword"
					placeholder="Contraseña">
			</div>

		</div>
		<div class="form-group row">
			<label for="inputPassword" class="col-sm-2 col-form-label">Verificar</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="inputPassword"
					placeholder="Repetir Contraseña">
			</div>
		</div>
		<button class="btn btn-primary" name="btn-Acaptar" type="submit">Agregar</button>
	</form>

	<%
		int fila = 0;
	if (request.getAttribute("cantFilas") != null) {
		fila = 1;
	}
	%>
	<%
		if (fila == 1) {
	%>
	<h2>Agregado Correctamente</h2>
	<%
		}
	%>





</body>
</html>