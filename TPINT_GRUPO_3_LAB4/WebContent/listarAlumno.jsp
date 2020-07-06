<%@page import="entidades.Alumno"%>
<%@page import="entidades.Localidad"%>
<%@page import="daoImpl.AlumnoDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de alumnos</title>
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:include page="menu.html"></jsp:include>
	<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">Lista de alumnos</li>
	</ol>
	</nav>

	<div class="container">
		<!--<h1>Mis alumnos</h1>-->
		<div class="row">
			<div class="col-lg-3">
				<div class="form-group">
					<label for="sel1">Materias:</label> <select class="form-control"
						id="sel1">
						<option>Laboratorio IV</option>
						<option>DABD</option>
						<option>Programacion III</option>
						<option>Ingles</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="form-group">
					<label for="sel1">Cuatrimestre:</label> <select
						class="form-control" id="sel1">
						<option>1° Cuatrimestre</option>
						<option>2° Cuatrimestre</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="form-group">
					<label for="sel1">Año:</label> <select class="form-control"
						id="sel1">
						<option>2018</option>
						<option>2019</option>
						<option>2020</option>
					</select>
				</div>
			</div>
<!-- 			<div class="col-lg-3"> -->
<!-- 				<div class="form-group"> -->
<!-- 				<div id="example_filter" class="dataTables_filter"> -->
<!-- 					<label style="margin-bottom:0px;">Buscar: <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example"> -->
<!-- 					</label> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<div class="row">
		<div class="col-sm-12 col-md-6">
		<div class="dataTables_length" id="example_length">
		<label>Mostrar cantidad <select name="example_length" aria-controls="example" class="custom-select custom-select-sm form-control form-control-sm">
		<option value="5">5</option><option value="10">10</option><option value="30">30</option>
		<option value="50">50</option></select></label></div>
		</div><div class="col-sm-12 col-md-6"><div id="example_filter" class="dataTables_filter">
		<label>Buscar:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example">
		</label></div></div></div>
		<div class="row">
			<div class="col-lg-12">
<!-- 				<a href="ServletProvincia?Param=Alumno" class="btn btn-outline-primary btn-sm">Agregar</a> -->
				 <a href="ServletAlumno?BtnAgregar=Alumno" class="btn btn-outline-primary btn-sm">Agregar</a>
				<a href="cargarNota.jsp" class="btn btn-outline-info btn-sm">Cargar Nota</a>
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
							<th>Editar</th>
							<th>Eliminar</th>
						</tr>
					</thead>
					<tbody>
						<%
							ArrayList<Alumno> listaAlumno = null;
							if (request.getAttribute("listaAlum") != null) {
								listaAlumno = (ArrayList<Alumno>) request.getAttribute("listaAlum");
							}
						%>
						<%
							if (listaAlumno != null)
								for (Alumno alumno : listaAlumno) {
						%>
						<tr>
							<td><%=alumno.getLegajo()%></td>
							<td><%=alumno.getNombre()%></td>
							<td><%=alumno.getApellido()%></td>
							<td><%=alumno.getDni()%></td>
							<td><%=alumno.getFechaNac()%></td>
							<td><%=alumno.getDireccion()%></td>
							<td><%=alumno.getLocalidad().getNombreLoc()%></td>
							<td><%=alumno.getLocalidad().getProvincia().getNombreProv()%></td>
							<td><%=alumno.getTelefono()%></td>
							<td><%=alumno.getMail()%></td>
							<td><a href="ServletAlumno?Param=ModificarAlumno&amp;Data=<%=alumno.getLegajo()%>"
								name="btn-EditarAlumno" class="btn btn-outline-secondary btn-sm">Editar</a>
							</td>
							<td><a href="ServletAlumno?Param=EliminarAlumno&amp;Data=<%=alumno.getLegajo()%>" name="btn-EliminarAlumno" class="btn btn-outline-danger btn-sm">Eliminar</a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%
	  int aux=0;
	  if(request.getAttribute("AlumnoEliminado")!=null)
	  {
		  aux=1;
	  }
	%>
	
	<% if(aux==1)
		{
	%>
	 <h5>Eliminado correctamente</h5>
		
	<%
		}
	%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	
</body>
</html>