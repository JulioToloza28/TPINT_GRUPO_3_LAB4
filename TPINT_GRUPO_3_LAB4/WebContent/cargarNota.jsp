<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="entidades.AlumnosPorCursos"%>
	<%@page import="java.util.ArrayList"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cargar nota</title>
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
		<li class="breadcrumb-item active" aria-current="page">Cargar
			notas</li>
	</ol>
	</nav>
	
	<form action="ServletAlumXcurso" method="get" style="margin: 40px">

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Legajo</th>
							<th>Alumno</th>
							<th>Parcial 1</th>
							<th>Parcial 2</th>
							<th>Recuperatorio 1</th>
							<th>Recuperatorio 2</th>
							<th>Estado academico</th>
						</tr>
					</thead>
					<tbody>
							
							<%ArrayList<AlumnosPorCursos> listaAlumno = null;
							if (request.getAttribute("listaAlumConNota") != null) {
								listaAlumno = (ArrayList<AlumnosPorCursos>) request.getAttribute("listaAlumConNota");}%>
							
							<%if (listaAlumno != null){
								for (AlumnosPorCursos alumnoXNota : listaAlumno) {%>
							<tr>
							
								<td><%=alumnoXNota.getAlumno().getLegajo()%></td>
								<td><%=alumnoXNota.getAlumno().getNombre()%></td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" id="notaParcial1" placeholder="Parcial1" value="<%=alumnoXNota.getParcial1()%>">
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" id="notaParcial2"
											placeholder="Parcial2" value="<%=alumnoXNota.getParcial2()%>">
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" id="Recuperatorio1"
											placeholder="Recuperatorio 1"
											value="<%=alumnoXNota.getRecuperatorio1()%>">
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" id="Recuperatorio2"
											placeholder="Recuperatorio 2"
											value="<%=alumnoXNota.getRecuperatorio1()%>">
									</div>
								</td>
								<td>
									<div class="form-group">
										<select class="custom-select">
											<option selected></option>
											<option value="1">En Curso</option>
											<option value="2">Promocionado</option>
											<option value="3">Regular</option>
											<option value="4">Libre</option>
										</select>
									</div>
								</td>
							</tr>


							<%}%>
							
							<% } %>
						
					</tbody>
					<tfoot>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</tfoot>
				</table>
				<input id="btnGuardar" name="btnGuardar" class="btn btn-primary" type="submit" value="Guardar"> 
					<a id="Retroceder"	name="Retroceder" class="btn btn-secondary" type="submit" href="ServletAlumno?Param=MenuAlumno">Volver</a>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	</form>
</body>
</html>