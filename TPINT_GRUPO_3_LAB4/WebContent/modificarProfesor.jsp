<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.Provincia" %>
<%@page import="entidades.Localidad" %>
<%@page import="entidades.Profesor" %>
<%@page import="daoImpl.ProfesorDaoImpl" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Profesor</title>
</head>
<body>

<jsp:include page="Menu.jsp"></jsp:include>

	<form style="margin: 40px">
	  <nav aria-label="breadcrumb"> 		
		<ol class="breadcrumb"> 			
		<li class="breadcrumb-item active" aria-current="page">Modificar Profesor</li> 
		</ol> 		
		</nav>
		
	 <%  Profesor profe=null;
  		         if(request.getAttribute("ProfesorAMod")!=null){
  		        	profe=(Profesor)request.getAttribute("ProfesorAMod");%>		         
	<form action="ServletsProfesor" method="get" style="margin: 40px">
	<input value="<%=profe.getLegajo()%>" name="txtlegajo" type="hidden" class="form-control">
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Nombre</label> 
				<input value="<%=profe.getNombre() %>" name="txtNombre" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Apellido</label> 
				<input  value="<%=profe.getApellido() %>" name="txtApellido" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-2 mb-3">
				<label for="validationServer03">DNI</label> 
				<input  value="<%=profe.getDni() %>" name="txtDni" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
		</div>
		<div class="form-row">			
			<div class="col-md-2 mb-3">
				<label for="validationServer01">Fecha de Nacimiento</label> 
				<input  value="<%=profe.getFechaNac() %>" name="txtFechaNac" type="date" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Telefono</label> 
				<input value="<%=profe.getTelefono() %>" name="txtTelefono" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
			<div class="col-md-3 mb-3">
				<label for="validationServer01">Email</label> 
				<input value="<%=profe.getMail() %>" name="txtEmail" type="text" class="form-control" id="validationServer01" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
       </div>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Direccion</label>  
				<input value="<%=profe.getDireccion() %>" name="txtDireccion" type="text" class="form-control " id="validationServer02" value="" required>
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
								<%if(profe.getLocalidad().getProvincia().getId()==prov.getId()){%>
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
						<option  selected style="visibility:hidden" value="<%=profe.getLocalidad().getId()%>"><%=profe.getLocalidad().getNombreLoc()%></option>
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
			<button id="btn-EditarProfesor" name="btn-EditarProfesor" class="btn btn-primary" type="submit">Aceptar</button>
			<a Id="Retroceder" name="Retroceder" class="btn btn-secondary" type="submit" href="ServletsProfesor?Param=MenuProfesor">Volver</a>

	</form>
					<%} %>

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
	 <h5>Modificado correctamente</h5>
		
	<%}%>

</body>
</html>