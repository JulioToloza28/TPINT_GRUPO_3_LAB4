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
				<input name="txtFechaNac" type="text" class="form-control" id="validationServer01" required>
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
						<option selected disabled value="">Choose...</option>
						<option>...</option>
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
			<div class="form-row">
			<div class="col-md-2 mb-3">
 					<!-- <label for="sel1">Curso</label> 
					<select class="form-control" id="sel1">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
					</select>-->
				</div>
				<div class="col-md-2 mb-3">
					<label for="sel1">Materia</label> 
					<select class="form-control" id="sel1">
						<option>Programacion I</option>
						<option>Matematica</option>
						<option>SPD</option>
						<option>Laboratorio IV</option>
					</select>
				</div>
				<div class="col-md-2 mb-3">
					<label for="sel1">Cuatrimestre</label> 
					<select class="form-control" id="sel1">
						<option>1</option>
						<option>2</option>
					</select>
				</div>
				<div class="col-md-2 mb-3">
					<label for="sel1">Año</label> 
					<select class="form-control" id="sel1">
						<option>2018</option>
						<option>2019</option>
						<option>2020</option>
					</select>
				</div>
				<div class="col-md-2 mb-3">
				  <button id="btn-materias" class="btn btn-outline-dark" type="button" style="bottom:0; position: absolute;">+</button>
			    </div>
			   </div>

			 
			<button id="btn-aceptar" class="btn btn-primary" type="submit">Agregar</button>
	</form>
	
	<%
	  int filas=0;
	  if(request.getAttribute("cantFilas")!=null)
		  
	
	%>


</body>
</html>