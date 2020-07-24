<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@page import="daoImpl.MateriaDaoImpl"%> --%>
<%@page import="entidades.Curso"%>
<%@page import="entidades.Turno"%>
<%@page import="entidades.Materia"%>
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
		<li class="breadcrumb-item active" aria-current="page">Mis Cursos</li>
	</ol>
	</nav>
	
	
	<%
		if (request.getAttribute("Mensaje") != null) {
			String Mensaje = request.getAttribute("Mensaje").toString();
	%>
	<div class="alert alert-success" role="alert">
		<%=Mensaje%>
	</div>
	<%
		}
	%>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div></div>
				<table id="ListarCursosProfesor" class="display" style="width: 100%">
					<thead>
						<tr>
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
							<td><%=curso.getMateria()%></td>
							<td><%=curso.getTurno()%></td>
							<td><%=curso.getCuatrimestre()%></td>
							<td><%=curso.getAnio()%></td>
							<td><%=curso.getCantAlum()%></td>
							<td><a type="button"
								class="btn btn-outline-secondary btn-sm"
								href="ServletCurso?showCourse-professor=<%=curso.getId()%>"
								data-toggle="tooltip" title="Ver Curso"><i
									class="fa fa-group"></i></a> <a type="button"
								class="btn btn-outline-success btn-sm"
								href="ServletAlumXcurso?uploadNotes=<%=curso.getId()%>"
								data-toggle="tooltip" title="Cargar Notas"><i
									class="fa fa-pencil-square"></i></a>
						</tr>
						<%
							}
						%>


					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- Modal cargar nota -->
	
<div class="modal fade" id="VentanaCargaNota" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Cargar Nota</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary">Guradar</button>
      </div>
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