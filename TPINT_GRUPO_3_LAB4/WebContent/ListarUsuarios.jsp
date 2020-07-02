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
</head>
<body>
	<jsp:include page="menu.html"></jsp:include>


	<div class="container">
		<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">Usuarios</li>
		</ol>
		</nav>

		<%
			ArrayList<Usuario> listaUsuario = null;
			if (request.getAttribute("listaUsuarios") != null) {
				listaUsuario = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");
			}
		%>
		<div class="row">
			<div class="col-lg-12">
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>User</th>
							<th>legajo_Pro</th>
							<th>Tipo</th>
							<th>acciones</th>
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
							<td><input type="submit" class="btn btn-info btn-sm" name="btnModificar"
								value="Modificar">
							<input type="submit" class="btn btn-danger btn-sm" name="btnEliminar"
								value="Eliminar"></td>
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