<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Curso"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Cursos</title>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
.bs-example {
	margin: 20px;
}

.MensajeServlet {
	color: navy;
	/* background-color:gray; */
	text-align: Center;
}
</style>

</head>
<body>
	<jsp:include page="Menu.jsp"></jsp:include>


	<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">Listar
			Cursos</li>
	</ol>
	</nav>

	<div class="container">
		<%
			if (request.getAttribute("Mensaje") != null) {
				String Mensaje = request.getAttribute("Mensaje").toString();
				String Clase = "";
				if (Mensaje == "Curso Editado correctamente.")
					Clase = "warning";
				else if (Mensaje == "Curso creado correctamente.")
					Clase = "success";
				else
					Clase = "danger";
		%>

		<div class="alert alert-<%=Clase%>" role="alert">
			<%=Mensaje%>
		</div>
		<%
			}
		%>
		<div class="row">
			<div class="col-lg-12">
				<div class="col-md-4 offset-md-4">
					<a href="ServletCurso?AddCourses=1" name="AddCurso"
						class="btn btn-outline-success btn-block"><i class="fa fa-group"></i>
						Agregar curso</a>
				</div>
				<table id="ListarCursos" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Profesor</th>
							<th>Materia</th>
							<th>Turno</th>
							<th>Cuatrimestre</th>
							<th>Año</th>
							<th>Cant. Alumnos</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>


						<%
							ArrayList<Curso> listaCurso = null;
							if (request.getAttribute("listaCursos") != null) {
								listaCurso = (ArrayList<Curso>) request.getAttribute("listaCursos");
							}
						%>
						<%
							if (listaCurso != null)
								for (Curso curso : listaCurso) {
						%>
						<tr>
							<td><%=curso.getProfesor()%></td>
							<td><%=curso.getMateria()%></td>
							<td><%=curso.getTurno()%></td>
							<td><%=curso.getCuatrimestre()%></td>
							<td><%=curso.getAnio()%></td>
							<td><%=curso.getCantAlum()%></td>
							<td><a type="button" class="btn btn-outline-secondary btn-sm" href="ServletCurso?editCourse=<%=curso.getId()%>" data-toggle="tooltip" title="Editar">
							<i class="fa fa-edit"></i>
							</a> 
							<a type="submit" class="btn btn-outline-danger btn-sm" href="ServletCurso?deleteCourse=<%=curso.getId()%>" data-toggle="tooltip" title="Eliminar"> 
							<i class="fa fa-trash-o"></i>
							</a>
							</td>
						</tr>
						<%
							}
						%>


					</tbody>
				</table>
			</div>
		</div>
	</div>

<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script src="js/espanol.js"></script>	
<script type="text/javascript" src="js/script.js"></script>

</body>
</html>