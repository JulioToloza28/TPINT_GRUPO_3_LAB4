<%@page import="entidades.Alumno"%>
<%@page import="entidades.Reporte"%>
<%@page import="entidades.Curso"%>
<%@page import="daoImpl.AlumnoDaoImpl"%>
<%@page import="daoImpl.CursoDaoImpl"%>
<%@page import="daoImpl.MateriaDaoImpl"%>
<%@page import="entidades.Materia"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reportes estadisticos</title>
<link href="Css/Style.css" rel="StyleSheet" type="text/css">
</head>
<body>
	<jsp:include page="Menu.jsp"></jsp:include>
	<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" aria-current="page">Reporte</li>
	</ol>
	</nav>
	<div class="container"></div>

	<div class="container">

		<div class="row">
			<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<form action="ServletAlumno?Param=reporte" method="get">
					<div class="row">
						<div class="col-lg-3">
							<div class="form-group">
								<label for="sel1">Cursos:</label> <select id="cbxMateria"
									name="cboCursos" class="custom-select" id="sel1">
									<option selected disabled value="<>">Seleccione...</option>
									<%
										CursoDaoImpl curso = new CursoDaoImpl();
										ArrayList<Curso> listaCurso = null;
										listaCurso = (ArrayList<Curso>) curso.listarCursos();
									%>
									<%
										if (listaCurso != null)
											for (Curso itemCurso : listaCurso) {
									%>
									<option value=<%=itemCurso.getId()%>><%=itemCurso.getId()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="form-group">
								<label for="sel1">Materias:</label> <select id="cboMateria"
									name="cboMateria" class="custom-select" id="sel1">
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
									id="cboCuatrimestre" name="cboCuatrimestre"
									class="form-control" id="sel1">
									<option selected disabled value="">Seleccione...</option>
									<option value="1">1° Cuatrimestre</option>
									<option value="2">2° Cuatrimestre</option>

								</select>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="form-group">

								<label for="sel1">Año:</label> <select id="cdoAnio"
									name="cdoAnio" class="form-control" id="sel1">
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
							<button id="btn-reporte" name="btn-reporte"
								class="btn btn-primary" type="submit">Generar reporte</button>
						</div>
					</div>
				</form>
			</ol>
			</nav>
			<%
		ArrayList<Reporte> listaA = new ArrayList<Reporte>();
		if (request.getAttribute("listaReporte") != null) {
			listaA = (ArrayList<Reporte>) request.getAttribute("listaReporte");
		}
	%>

			<table border="1">
				<tr>
					<td><b>CURSO</b></td>
					<td><b>MATERIA</b></td>
					<td><b>CUATRIMESTRE</b></td>
					<td><b>AÑO</b></td>
					<td><b>NO APROBADOS</b></td>
					<td><b>APROBADOS</b></td>
					<td><b>TOTAL</b></td>
				</tr>

				<%
					for (Reporte a : listaA) {
				%>

				<tr>
					<td><%=a.getCurso().getId()%></td>
					<td><%=a.getMateria().getNombre()%></td>
					<td><%=a.getCurso().getCuatrimestre()%></td>
					<td><%=a.getCurso().getAnio()%></td>
					<td><%=a.getTotal_no_aprobados()%></td>
					<td><%=a.getTotal_aprobados()%></td>
					<td><%=a.getTotal_alumnos()%></td>
				</tr>

				<%
					}
				%>



			</table>

			<script type="text/javascript" src="js/script.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script type="text/javascript"
				src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
			<script type="text/javascript" src="js/script.js"></script>
</body>
</html>