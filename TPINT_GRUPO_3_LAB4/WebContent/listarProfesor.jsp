<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Profesor"%>
<%@page import="entidades.Localidad"%>
<%@page import="daoImpl.ProfesorDaoImpl"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
    .bs-example{
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
	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<a id="BtnAgregar" name="BtnAgregar" href="ServletsProfesor?BtnAgregar=Profesor" class="btn btn-outline-primary btn-sm">Agregar</a>
				
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
							<td><a href="ServletsProfesor?Param=ModificarProfesor&amp;Data=<%=profesor.getLegajo()%>"
								name="btn-EditarProfesor" class="btn btn-outline-secondary btn-sm">Editar</a></td>
							<td><a data-toggle="modal" data-target="#VentEliminar"  name="btn-EliminarProfesor" class="btn btn-outline-danger btn-sm">Eliminar</a></td>
						</tr>
							<div class="modal fade" id="VentEliminar" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Eliminar</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">Esta seguro que desea eliminar el registro?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-danger" href="ServletsProfesor?Param=EliminarProfesor&amp;Data=<%=profesor.getLegajo() %>"">Eliminar</a>
				</div>
			</div>
		</div>
	</div>	
						<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<% int aux=0;
	   if(request.getAttribute("ProfesorEliminado")!=null)
	   {aux=1;}%>
	<% if(aux==1){%>
	 <h5>Eliminado correctamente</h5>
	<%}%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>