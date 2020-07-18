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
<title>Profesor</title>
<style>
 #lblError{color: #D8000C!important;background: #FFD2D2!important;margin:10px 22px;font-size:16px;vertical-align:middle;}
</style>

</head>
<body>

<jsp:include page="Menu.jsp"></jsp:include>

	
	
		
	 <%  Profesor profe=null;
  		         if(request.getAttribute("ProfesorRep")!=null){
  		        	profe=(Profesor)request.getAttribute("ProfesorRep");%>
  		<nav aria-label="breadcrumb"> 		
		<ol class="breadcrumb"> 			
		<li class="breadcrumb-item active" aria-current="page">Agregar Profesor</li> 
		</ol> 		
		</nav>
		
		<%} %>
		
		<%  if(request.getAttribute("ProfesorRepMod")!=null){
		profe=(Profesor)request.getAttribute("ProfesorRepMod");%>
		<nav aria-label="breadcrumb"> 		
		<ol class="breadcrumb"> 			
		<li class="breadcrumb-item active" aria-current="page">Modificar Profesor</li> 
		</ol> 		
		</nav>
		
		<%} %>
		
  		        			         
	<form action="ServletsProfesor" method="get" style="margin: 40px">
	<input value="<%=profe.getLegajo()%>" name="txtlegajo" type="hidden" class="form-control">
	<div class="alert alert-danger" role="alert">(*)DNI ya registrado</div>
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
				<input  value="<%=profe.getDni() %>" name="txtDni" type="text"  class="form-control is-invalid" id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
			</div>
		</div>
		<br>
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
       <br>
		<div class="form-row">
			<div class="col-md-3 mb-3">
				<label for="validationServer02">Direccion</label>  
				<input value="<%=profe.getDireccion() %>" name="txtDireccion" type="text" class="form-control " id="validationServer02" value="" required>
				<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationServer04">Provincia</label> 
					<select  name="cmbProvincia" class="custom-select " id="txtselectProvincia"  required>
						<option selected disabled value=""></option>
					<%-- 	<%
						  ArrayList<Provincia>ListarProvi=null;
							if(request.getAttribute("listaProvDao")!=null){
							ListarProvi = (ArrayList<Provincia>) request.getAttribute("listaProvDao");}%>
							<% if(ListarProvi!=null)
								for(Provincia prov : ListarProvi) {%>
								<%if(profe.getLocalidad().getProvincia().getId()==prov.getId()){%>
								<option selected style="visibility:hidden" value="<%=prov.getId()%>"><%=prov.getNombreProv()%></option>
								<%}  %>	
								<option value="<%=prov.getId()%>"><%=prov.getNombreProv() %></option>								
							<%}  %>	 --%>
					</select>
					<div class="invalid-feedback">Please select a valid state.</div>
				</div>
				 <div class="col-md-2 mb-3">
					<label for="validationServer03">Localidad</label> 
					<select name="cmbLocalidad" class="custom-select " id="txtselectLocalidad" required>
					
						<option  selected style="visibility:hidden" value=""></option>
					<%-- 	<%ArrayList<Localidad> listaLocalidad = null;
					      if (request.getAttribute("listaLocDao") != null) {
						  listaLocalidad = (ArrayList<Localidad>) request.getAttribute("listaLocDao");
					}%>
					<%if (listaLocalidad != null)
						for (Localidad loc : listaLocalidad) {%>
					<option value=<%=loc.getId()%>><%=loc.getNombreLoc()%></option>
					<%}%> --%>
						
					</select>
					<div class="invalid-feedback">Please provide a valid city.</div>
				</div>
			</div>
			<br>
			<%if(request.getAttribute("ProfesorRep")!=null){ %>
		<button id="btn-aceptarProfesor" name="btn-aceptarProfesor" class="btn btn-primary"  type="submit">Aceptar</button>
		<%}else{ %>
		<button id="btn-EditarProfesor" name="btn-EditarProfesor" class="btn btn-primary" type="submit">Aceptar</button>
		<%} %>
			<a Id="Retroceder" name="Retroceder" class="btn btn-secondary" type="submit" href="ServletsProfesor?Param=MenuProfesor">Volver</a>
         
	</form>
	

</body>
</html>