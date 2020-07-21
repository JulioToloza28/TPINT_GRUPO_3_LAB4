<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Profesor"%>
<%@page import="entidades.Localidad"%>
<%@page import="daoImpl.ProfesorDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daoImpl.MateriaDaoImpl"%>
<%@page import="entidades.Materia"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de profesores</title>
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
<style>
.bs-example {
	margin: 20px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />

</head>
<body>

	<jsp:include page="Menu.jsp"></jsp:include>

	<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">Profesores</li>
	</ol>
	</nav>

	<div class="container" >
		<form action="ServletsProfesor" method="get">
			<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				
				<div class="row">			
				
					
					<div class="col-lg-6">

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

							<label for="sel1">Año:</label> <select id="cdxAnio"
								name="cdxAnio" class="form-control" id="sel1">
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

				</div>
				<div class="col align-self-center">
					<button id="btn-filtrar" name="btn-filtrar"
						class="btn btn-outline-info" type="submit">
						<i class="fa fa-search"></i>Filtrar
					</button>

				</div>
			</ol>
			</nav>
		</form>
		
		<div class="col-md-4 offset-md-4">	<a id="BtnAgregar" name="BtnAgregar"
					href="ServletsProfesor?BtnAgregar=Profesor" type="button"
					class="btn btn-outline-success btn-block"><i class="fa fa-user-plus"></i>
					Agregar Profesor</a></div>
					<br>
	<!-- 	<div class="row">
			<div class="col-lg-3"></div>
		</div> -->
		<div class="row">
			<div class="col-lg-12">
				<!-- <a id="BtnAgregar" name="BtnAgregar"
					href="ServletsProfesor?BtnAgregar=Profesor"
					class="btn btn-outline-primary btn-sm">Agregar</a> -->
			
<%
					if (request.getAttribute("cantFilas") != null) {
				%>
				<div class="alert alert-success" role="alert">Se agrego
					correctamente</div>
				<%
					}
				%>
				<%if (request.getAttribute("cantFilasMod") != null) {%>
				<div class="alert alert-warning" role="alert">Se modifico correctamente</div>

				<%}%>
				<%
					if (request.getAttribute("ProfesorEliminado") != null) {
				%>
				<div class="alert alert-danger" role="alert">Se elimino
					correctamente</div>

				<%
					}
				%>
			


				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Legajo</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>DNI</th>
							<th>Fecha Nac</th>
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
							ArrayList<Profesor> listaProfesor = null;
						if (request.getAttribute("listaProf") != null) {
							listaProfesor = (ArrayList<Profesor>) request.getAttribute("listaProf");
						}
						%>
						<%
							if (request.getAttribute("listaFiltradaProf") != null) {
							listaProfesor = (ArrayList<Profesor>) request.getAttribute("listaFiltradaProf");
						}
						%>


						<%
							if (listaProfesor != null)
							for (Profesor profesor : listaProfesor) {
						%>
						<tr>
							<td><%=profesor.getLegajo()%></td>
							<td><%=profesor.getNombre()%></td>
							<td><%=profesor.getApellido()%></td>
							<td><%=profesor.getDni()%></td>
							<td><%=profesor.getFechaNac()%></td>
							<td><%=profesor.getDireccion()%></td>
							<td><%=profesor.getLocalidad().getNombreLoc()%></td>
							<td><%=profesor.getLocalidad().getProvincia().getNombreProv()%></td>
							<td><%=profesor.getTelefono()%></td>
							<td><%=profesor.getMail()%></td>
							<td><a
								href="ServletsProfesor?Param=ModificarProfesor&amp;Data=<%=profesor.getLegajo()%>"
								name="btn-EditarProfesor"
								class="btn btn-outline-secondary btn-sm">Editar</a></td>
							<td> <button type="button" onClick="modalEliminar(this)" id="<%=profesor.getLegajo()%>"
									name="btn-EliminarAlumno" class="btn btn-outline-danger btn-sm"> Eliminar</button>
							
						<%-- 	<a href="ServletsProfesor?Param=EliminarProfesor&amp;Data=<%=profesor.getLegajo()%>" 
								name="btn-EliminarProfesor"
								class="btn btn-outline-danger btn-sm">Eliminar</a> --%>
								
								</td>
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
									<div class="modal-body">Esta seguro que desea eliminar el
										registro?. -Se eliminara el usuario y los cursos asociados</div>
										 <input type="hidden" class="form-control" id="recipient-name"> 
									<div class="modal-footer">
										<button class="btn btn-secondary" type="button"
											data-dismiss="modal">Cancel</button>
										<a class="btn btn-danger test" id="LegajoEliminar"
												href="">Eliminar</a>
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript">
function modalEliminar(btn){
	var LegajoAlumno = btn.id;
	var hr = "ServletsProfesor?Param=EliminarProfesor&Data="+LegajoAlumno;
	jQuery.noConflict();
	$('#VentEliminar').modal('show');
	var enlace = document.querySelector('.test');
	enlace.href = hr;
	
}


</script>	
</body>
</html>