<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Provincia" %>
<%@page import="entidades.Localidad" %>
<%@page import="entidades.Alumno" %>
<%@page import="daoImpl.AlumnoDaoImpl" %>
<%@page import="java.util.ArrayList" %>

<script type="text/javascript">
function cambiar_Localidad(){ 
	var IdProv;
	IdProv = document.getElementById('txtselectProvincia').value;
	$.ajax({
		type : 'POST',
		url : 'ServletLocalidad',
		dataType : "json",
		data : {
			ProvinciaId : IdProv
		},
		success : function(result) {
			if (result) {
				//$("#txtselectLocalidad option:not(:disabled)").remove();
				$.each(result, function(index, option) {
					console.log("option: " + option)
					$("#txtselectLocalidad").append(
							'<option value="' + option.ID + '">'
									+ option.Nombre + '</option>')					
				});
			}
		},
		error : function(data) {
			alert('fail');
		}
	})
};
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alumno</title>
</head>
<body>
	<jsp:include page="Menu.jsp"></jsp:include>
	  <nav aria-label="breadcrumb"> 		
		<ol class="breadcrumb"> 			
		<li class="breadcrumb-item active" aria-current="page">Agregar alumnos</li> 
		</ol> 		
		</nav>
		         
	<form action="ServletAlumno" method="get" style="margin: 40px">
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Nombre</label> 
				<input  name="txtNombre" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Apellido</label> 
				<input name="txtApellido" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-2 mb-3">
				<label for="validationServer03">DNI</label> 
				<input name="txtDni" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
		</div>
		<div class="form-row">			
			<div class="col-md-2 mb-3">
				<label for="validationServer01">Fecha de Nacimiento</label> 
				<input name="txtFechaNac" type="date" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Telefono</label> 
				<input name="txtTelefono" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Email</label> 
				<input name="txtEmail" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
       </div>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Direccion</label>  
				<input name="txtDireccion" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationServer04">Provincia</label> 
					<select name="cmbProvincia" class="custom-select " id="txtselectProvincia" onchange="cambiar_localidad()" required>
						<option selected disabled value="">Provincia</option>
						<%
						  ArrayList<Provincia>ListarProvi=null;
							if(request.getAttribute("listaProvDao")!=null){
							ListarProvi = (ArrayList<Provincia>) request.getAttribute("listaProvDao");}%>
							<% if(ListarProvi!=null)
								for(Provincia prov : ListarProvi){%>
								<option value=<%=prov.getId()%>><%=prov.getNombreProv() %></option>
								<%} %>	
					</select>
					<div class="invalid-feedback">Please select a valid state.</div>
				</div>
				 <div class="col-md-2 mb-3">
					<label for="validationServer03">Localidad</label> 
					<select name="cmbLocalidad" class="custom-select " id="txtselectLocalidad" required>
						<option selected disabled value="">Localidad</option>
						<%ArrayList<Localidad> listaLocalidad = null;
					      if (request.getAttribute("listaLocDao") != null) {
						  listaLocalidad = (ArrayList<Localidad>) request.getAttribute("listaLocDao");
					}%>
					<%if (listaLocalidad != null)
						for (Localidad loc : listaLocalidad) {%>
					<option value=<%=loc.getId()%>><%=loc.getNombreLoc()%></option>
					<%}%>
					</select>
					<div class="invalid-feedback">Please provide a valid city.</div>
				</div>
			</div>
			<button id="btn-aceptar" name="btn-aceptar" class="btn btn-primary" type="submit">Agregar</button>
			<a Id="Retroceder" name="Retroceder" class="btn btn-secondary" type="submit" href="ServletAlumno?Param=MenuAlumno">Volver</a>
	</form>

	<%
	  int filas=0;
	  if(request.getAttribute("cantFilas")!=null)
	  {
		  filas=1;
	  }
	 
	
	%>
	
	<% if(filas==1)
		{
	%>
	 <h5>Agregado correctamente</h5>
		
	<%
		}
	%>


</body>
</html>