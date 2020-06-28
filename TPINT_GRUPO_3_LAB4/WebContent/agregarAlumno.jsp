<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Alumno</title>
</head>
<body>
	<jsp:include page="menu.html"></jsp:include>
		<nav aria-label="breadcrumb"> 		
		<ol class="breadcrumb"> 			
		<li class="breadcrumb-item active" aria-current="page">Agregar alumnos</li> 		
		</ol> 		
		</nav>
	<form action="ServletAlumno" method="get" style="margin: 40px">
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Nombre</label> 
				<input name="txtNombre" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Apellido</label> 
				<input name="txtApellido" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-2 mb-3">
				<label for="validationServer03">DNI</label> 
				<input name="txtDni" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>

			</div>
		</div>
		<div class="form-row">
			<div class="col-md-2 mb-3">
				<label for="validationServer01">Fecha de Nacimiento</label> 
				<input name="txtFechaNac" type="date." class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Direccion</label>  
				<input name="txtDireccion" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationServer03">Localidad</label> 
					<input name="txtLocalidad" type="text" class="form-control " id="validationServer03" required>
					<div class="invalid-feedback">Please provide a valid city.</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationServer04">Provincia</label> 
					<select
						class="custom-select " id="validationServer04" required>
						<option selected disabled value="">Provincia</option>
						<option>Buenos Aires</option>
						<option>Tucuman</option>
					</select>
					<div class="invalid-feedback">Please select a valid state.</div>
				</div>
				<!-- <div class="col-md-3 mb-3">
					<label for="validationServer05">C.P</label> <input type="text"
						class="form-control " id="validationServer05" required>
					<div class="invalid-feedback">Please provide a valid zip.</div>
				</div> -->
			</div>
			
			<div class="form-row">
			<div class="col-md-6 mb-3">
				<label for="validationServer01">Telefono</label> 
				<input name="txtTelefono" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-6 mb-3">
				<label for="validationServer01">Email</label> 
				<input name="txtEmail" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
       </div>
		
			<button id="btn-aceptar" name="btn-aceptar" class="btn btn-primary" type="submit">Agregar</button>
	</form>
	
	<%
	  int filas=0;
	  if(request.getAttribute("cantFilas")!=null)
	  {
		  filas=1;
	  }
	 
	
	%>
	
	<% if(filas==1)
		{
	%>
	 <h1>Agregado Correctamente</h1>
		
	<%
		}
	%>


</body>
</html>