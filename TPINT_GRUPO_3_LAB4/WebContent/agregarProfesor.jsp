<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="entidades.Localidad"%>
<%@page import="entidades.Provincia"%>
<%@page import="daoImpl.LocalidadDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
 <style>
  #lblCreado{color: #4F8A10!important;background: #DFF2BF!important;margin:10px 22px;font-size:14px;vertical-align:middle;}
  span#lblError{color: #D8000C!important;background-color: #FFD2D2!important;margin:10px 22px;font-size:14px;vertical-align:middle;}
  #txtCaracteres{color:red;}
</style>
<script>
function cambiar_Localidad(){ 
	var IdProv = document.getElementById('cmbProvincia');
	var user = IdProv.selectedIndex;
	
	if(user!=null){
		document.getElementById('div1').innerText=user;
	}
	return false;
};

function onlyLetter(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letter = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    special = "8-37-39-46";
    special_key = false
    for (var i in special) {
        if (key == special[i]) {
            special_key = true;
            break;
        }
    }
    if (letter.indexOf(tecla) == -1 && !special_key) {
        return false;
    }
}

function onlyNumber(car) {
    var key = window.Event ? car.which : car.keyCode;
    return (key >= 48 && key <= 57)
}

function validateMin() {
    var Min_Length = 8;
    var length = $("#txtTelefono").val().length;
    if (length < Min_Length)
    {
        $("#txtTelefono").addClass("is-invalid");
        $("#txtTelefono").after("<p id='txtCaracteres'>La cantidad de caracteres es 8 o 10, usted escribio " + length + " caracteres</p>");
        return false;
    }
    else{$("#txtTelefono").addClass("is-valid");}
}
function cleanError() {
    $("#txtCaracteres").remove();
    $("#txtTelefono").removeClass("is-invalid");
    //$("#txtTelefono").addClass("is-valid");
}

function validateMail() {
    obj = document.getElementById("txtMail");
    valueForm = obj.value;
    var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
    if (valueForm.search(mailFormat) == 0) {
    	$("#txtMail").addClass("is-valid");
    	$("#txtMail").removeClass("is-invalid");
    } else {
    	$("#txtMail").addClass("is-invalid");
    }
}

</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Profesor</title>
</head>
<body>

	<jsp:include page="Menu.jsp"></jsp:include>
		<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">Agregar Profesor</li>
		</ol>
		</nav>

		<form action="ServletsProfesor" method="get" style="margin: 40px">
			<div class="form-row">
				<div class="col-md-3 mb-3">
					<label for="validationServer01">Nombre</label> <input
						name="txtNombre" type="text" class="form-control"
						onKeyPress="return onlyLetter(event)" required>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationServer02">Apellido</label> <input
						name="txtApellido" type="text" class="form-control "
						onKeyPress="return onlyLetter(event)" value="" required>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-2 mb-3">
					<label for="validationServer03">DNI</label> <input name="txtDNI"
						type="text" class="form-control " onKeyPress="return onlyNumber(event)" value=""
						required>
					<div class="valid-feedback">Looks good!</div>

				</div>

			</div>
			<br>
			<div class="form-row">
				<div class="col-md-2 mb-3">
					<label for="validationServer01">Fecha de Nacimiento</label> <input
						name="txtFechaNac" max="2020-07-09" min="1900-01-01" type="date" class="form-control"
						id="validationServer01" required>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationServer01">Telefono</label> <input
						id="txtTelefono" name="txtTelefono" type="text" class="form-control"
						maxlength="10" onKeyPress="return onlyNumber(event)" onFocusOut="return validateMin()" onKeyUp="return cleanError()" required>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationServer01">Email</label> 
					<input id="txtMail" name="txtMail" type="email" class="form-control" onFocusOut="return validateMail()" required>
					<div class="valid-feedback">Looks good!</div>
				</div>

			</div>
			<br>
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
			<br>
			<button id="btn-aceptarProfesor" name="btn-aceptarProfesor" class="btn btn-primary"  type="submit">Aceptar</button>
			<a Id="Retroceder" name="Retroceder" class="btn btn-secondary" type="submit" href="ServletsProfesor?Param=MenuProfesor">Volver</a>
		</form>
<%-- 
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
	%> --%>
	
</body>
</html>