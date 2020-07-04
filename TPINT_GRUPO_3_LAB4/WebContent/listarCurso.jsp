<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@page import="daoImpl.MateriaDaoImpl"%> --%>
<%@page import="entidades.Curso"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Cursos</title>
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

</head>
<body>
	<jsp:include page="menu.html"></jsp:include>

	<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">Cursos</li>
	</ol>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<a href="ServletCurso?AddCourses=1" name="AddCurso"
					class="btn btn-outline-primary btn-sm">Agregar curso</a><br> <br>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Materia</th>
							<th>Cuatrimestre</th>
							<th>Año</th>
							<th>Profesor</th>
							<th>Cant. Alumnos</th>
							<th style="width: 60px"></th>
						</tr>
					</thead>
					<tbody>


						<%
							ArrayList<Curso> listaCurso = null;
							if (request.getAttribute("listaCursoDao") != null) {
								listaCurso = (ArrayList<Curso>) request.getAttribute("listaCursoDao");
							}
						%>
						<%
							if (listaCurso != null)
								for (Curso curso : listaCurso) {
						%>
						<tr>
							<td><%=curso.getMateria()%></td>
							<td><%=curso.getCuatrimestre()%></td>
							<td><%=curso.getAnio()%></td>
							<td><%=curso.getProfesor()%></td>
							<td><%=curso.getCantAlum()%></td>
							<td><a type="button" class="btn btn-primary btn-sm"
								href="ServletCurso?editCourse=<%=curso.getId()%>"><i class="fa fa-edit"></i></a>
								<a type="submit" class="btn btn-danger btn-sm" href="ServletCurso?deleteCourse=<%=curso.getId()%>">
									<i class="fa fa-trash"></i>
								</a></td>
						</tr>
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


</body>
</html>