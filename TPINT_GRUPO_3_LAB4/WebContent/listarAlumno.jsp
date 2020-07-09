<%@page import="entidades.Alumno"%>
<%@page import="entidades.Localidad"%>
<%@page import="daoImpl.AlumnoDaoImpl"%>
<%@page import="daoImpl.MateriaDaoImpl"%>
<%@page import="entidades.Materia"%>
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

	<jsp:include page="Menu.jsp"></jsp:include>

	<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">Lista de
			alumnos</li>
	</ol>
	</nav>

	<div class="container">

		<form action="ServletAlumno?Param=Filtrar" method="get">
			<div class="row">
				<div class="col-lg-3">
					<div class="form-group">
						<label for="sel1">Materias:</label> <select id="cbxMateria"
							name="cbxMateria" class="custom-select" id="sel1">
							<option selected disabled value="<>">Seleccione...</option>
							<%
								MateriaDaoImpl materiaL = new MateriaDaoImpl();
							ArrayList<Materia> listaMateria = null;
							listaMateria = (ArrayList<Materia>) materiaL.listarMaterias();
							%>
							<%
								if (listaMateria != null)
								for (Materia mate : listaMateria) {
							%>
							<option value=<%=mate.getId()%>><%=mate.getNombre()%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="form-group">
						<label for="sel1">Cuatrimestre:</label> <select
							id="cbxCuatrimestre" name="cbxCuatrimestre" class="form-control"
							id="sel1">
							<option selected disabled value="">Seleccione...</option>
							<option value="1">1° Cuatrimestre</option>
							<option value="2">2° Cuatrimestre</option>

						</select>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="form-group">

						<label for="sel1">Año:</label> <select id="cdxAnio" name="cdxAnio"
							class="form-control" id="sel1">
							<option selected disabled value="">Seleccione...</option>
							<%
								for (int x = 2020; x >= 1990; x--) {
							%>
							<option><%=x%></option>
							<%
								}
							%>
						</select>

					</div>

				</div>
				<div class="col-lg-3">
					<button id="btn-filtrar" name="btn-filtrar" class="btn btn-primary"
						type="submit">Filtrar</button>
				</div>
			</div>
		</form>

		<div class="row">
			<div class="col-sm-12 col-md-6">
				<div class="dataTables_length" id="example_length"></div>
				<div class="col-sm-12 col-md-6">
					<div id="example_filter" class="dataTables_filter">
						<!-- <label>Buscar:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example"> -->
						</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<a href="ServletAlumno?BtnAgregar=Alumno"
						class="btn btn-outline-primary btn-sm">Agregar</a> <a
						id="CargarNota" name="CargarNota"
						href="ServletAlumXcurso?Param=CargarNota"
						class="btn btn-outline-info btn-sm">Cargar Nota</a>

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
							int cont=0;
							int id=(int)session.getAttribute("Session_Legajo");
							if(id!=0 && id!=1)
							{								
								AlumnoDaoImpl AlumnoXPro=new AlumnoDaoImpl();
								listaAlumno=AlumnoXPro.filtroProProfesor(id);
								cont++;
							}
								
							if (cont==0 && id==1) {
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
								<td><a
									href="ServletAlumno?Param=ModificarAlumno&amp;Data=<%=alumno.getLegajo()%>"
									name="btn-EditarAlumno"
									class="btn btn-outline-secondary btn-sm">Editar</a></td>
								<td><a data-toggle="modal" data-target="#VentEliminar"
									name="btn-EliminarAlumno" class="btn btn-outline-danger btn-sm">Eliminar</a></td>
							</tr>
							<div class="modal fade" id="VentEliminar" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Eliminar</h5>
											<button class="close" type="button" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">X</span>
											</button>
										</div>
										<div class="modal-body">Esta seguro que desea eliminar
											el registro?</div>
										<div class="modal-footer">
											<button class="btn btn-secondary" type="button"
												data-dismiss="modal">Cancel</button>
											<a class="btn btn-danger"
												href="ServletAlumno?Param=EliminarAlumno&amp;Data=<%=alumno.getLegajo()%>"">Eliminar</a>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</tbody>
					</table>


				</div>
			</div>
		</div>
		<%
			int aux = 0;
		if (request.getAttribute("AlumnoEliminado") != null) {
			aux = 1;
		}
		%>

		<%
			if (aux == 1) {
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