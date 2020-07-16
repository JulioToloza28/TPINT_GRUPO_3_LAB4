<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Provincia" %>
<%@page import="entidades.Localidad" %>
<%@page import="entidades.Alumno" %>
<%@page import="daoImpl.AlumnoDaoImpl" %>
<%@page import="java.util.ArrayList" %>



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
		<li class="breadcrumb-item active" aria-current="page">Modificar alumnos</li> 
		</ol> 		
		</nav>
			 <%  Alumno alum=null;
  		         if(request.getAttribute("AlumnoAMod")!=null){
		         alum=(Alumno)request.getAttribute("AlumnoAMod");%>		         
	<form action="ServletAlumno" method="get" style="margin: 40px">
	<input value="<%=alum.getLegajo()%>" name="txtlegajo" type="hidden" class="form-control">
	<input value="<%=alum.getDni()%>" name="txtDniViejo" type="hidden" class="form-control">
	<%-- <input value="<%=alum.getLocalidad().getId()%>" name="txtGetIdLocalidad" type="hidden" class="form-control"> --%>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Nombre</label> 
				<input value="<%=alum.getNombre() %>" name="txtNombre" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Apellido</label> 
				<input  value="<%=alum.getApellido() %>" name="txtApellido" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-2 mb-3">
				<label for="validationServer03">DNI</label> 
				<input  value="<%=alum.getDni() %>" name="txtDni" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
		</div>
		<div class="form-row">			
			<div class="col-md-2 mb-3">
				<label for="validationServer01">Fecha de Nacimiento</label> 
				<input  value="<%=alum.getFechaNac() %>" name="txtFechaNac" type="date" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Telefono</label> 
				<input value="<%=alum.getTelefono() %>" name="txtTelefono" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Email</label> 
				<input value="<%=alum.getMail() %>" name="txtEmail" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
       </div>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Direccion</label>  
				<input value="<%=alum.getDireccion() %>" name="txtDireccion" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationServer04">Provincia</label> 
					<select  name="cmbProvincia" class="custom-select " id="txtselectProvincia"  required>
<%-- 						<option selected disabled value="<%=alum.getLocalidad().getProvincia().getId()%>"><%=alum.getLocalidad().getProvincia().getNombreProv()%></option> --%>
						<%
						  ArrayList<Provincia>ListarProvi=null;
							if(request.getAttribute("listaProvDao")!=null){
							ListarProvi = (ArrayList<Provincia>) request.getAttribute("listaProvDao");}%>
							<% if(ListarProvi!=null)
								for(Provincia prov : ListarProvi) {%>
								<%if(alum.getLocalidad().getProvincia().getId()==prov.getId()){%>
								<option selected style="visibility:hidden" value="<%=prov.getId()%>"><%=prov.getNombreProv()%></option>
								<%}  %>	
								<option value="<%=prov.getId()%>"><%=prov.getNombreProv() %></option>								
							<%}  %>	
					</select>
					<div class="invalid-feedback">Please select a valid state.</div>
				</div>
				 <div class="col-md-2 mb-3">
					<label for="validationServer03">Localidad</label> 
					<select name="cmbLocalidad" class="custom-select " id="txtselectLocalidad" required>
						<option  selected style="visibility:hidden" value="<%=alum.getLocalidad().getId()%>"><%=alum.getLocalidad().getNombreLoc()%></option>
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
			<button id="btn-EditarAlumno" name="btn-EditarAlumno" class="btn btn-primary" type="submit">Aceptar</button>
			<a Id="Retroceder" name="Retroceder" class="btn btn-secondary" type="submit" href="ServletAlumno?Param=MenuAlumno">Volver</a>

	</form>
					<%} %>


</body>
</html>