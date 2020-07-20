<%@page import="entidades.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Usuarios</title>
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
			<li class="breadcrumb-item active" aria-current="page">Usuarios</li>
		</ol>
		</nav>
		
		<div class="col-md-4 offset-md-4">
<a href="ServletUsuarios?AddUser=1" type="button" class="btn btn-outline-success btn-block"><i class="fa fa-user-circle-o"></i> Agregar Usuario</a>
</div>
	
	<div class="container">
		

		<%
			ArrayList<Usuario> listaUsuario = null;
			if (request.getAttribute("listaUsuarios") != null) {
				listaUsuario = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");
			}
		%>

		<div class="row">
			<div class="col-lg-12">
				<!-- <a href="ServletUsuarios?AddUser=1"
					class="btn btn-outline-primary btn-sm">Agregar</a> -->
				<%
					if (request.getAttribute("msjChange") != null) {
				%>
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<strong><%=request.getAttribute("msj")%></strong>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%
					}
				%>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Usuario</th>
							<th>Legajo</th>
							<th>Tipo</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (listaUsuario != null)
								for (Usuario user : listaUsuario) {
						%>
						<tr>
							<td><%=user.getId()%> <input type="hidden" name="idUsuario"
								value="<%=user.getId()%>"></td>
							<td><%=user.getUsername()%></td>
							<td><%=user.getLegajo()%></td>
							<td><%=user.getTipoUsuario().getTipo()%></td>
							<td><a href="CambiarClave.jsp?idUsuario=<%=user.getId()%>"
								type="submit" class="btn btn-info btn-sm" data-toggle="tooltip"
								data-placement="top" title="Cambiar Clave"> <i
									class="fa fa-refresh"></i></a> 
									 <button class="btn btn-danger btn-sm" type="button" onClick="modalEliminar(this)" id="<%=user.getId()%>"
									name="btn-EliminarAlumno" class="btn btn-outline-danger btn-sm" data-toggle="tooltip"
								data-placement="top" title="Eliminar"><i class="fa fa-trash"></i></button>
									
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
										<div class="modal-body">Esta seguro que desea eliminar
											el registro?</div>
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
	var hr = "ServletUsuarios?deleteUser="+LegajoAlumno;
	jQuery.noConflict();
	$('#VentEliminar').modal('show');
	var enlace = document.querySelector('.test');
	enlace.href = hr;
	
}


</script>	
</body>
</html>