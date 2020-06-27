<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" />
</head>
<body>
<jsp:include page="menu.html"></jsp:include>
		<nav aria-label="breadcrumb"> 		
		<ol class="breadcrumb"> 			
		<li class="breadcrumb-item active" aria-current="page">Cargar notas</li> 		
		</ol> 		
		</nav>

	<div class="container">
	<!--<h1>Mis alumnos</h1>-->
		<div class="row">
			<div class="col-lg-12">
				<a href="agregarAlumno.jsp" class="btn btn-outline-primary btn-sm">Agregar</a> 
				<a href="modificarAlumno.jsp" class="btn btn-outline-secondary btn-sm">Editar</a> 
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
						    <th>Legajo</th>
							<th>Nombre</th>
							<th>Apellido</th>
							<th>Parcial 1</th>
							<th>Parcial 2</th>
							<th>Recuperatorio 1</th>
							<th>Recuperatorio 2</th>
							<th>Estado academico</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>18887</td>
							<td>Ariel</td>
							<td>Lobos</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial1">
 							  </div>
  							</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial2">
 							  </div>
  							</td>
  							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 1">
 							  </div>
  							</td>
  							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 2">
 							  </div>
  							</td>
							<td>
							  <select class="custom-select">
								  <option selected>Seleccionar</option>
 								  <option value="1">Promocionado</option>
 								  <option value="2">Regular</option>
  								  <option value="3">Libre</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>18888</td>
							<td>Daniela</td>
							<td>Rubinstein</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial1">
 							  </div>
  							</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial2">
 							  </div>
  							</td>
  							 <td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 1">
 							  </div>
  							</td>
  							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 2">
 							  </div>
  							</td>
							<td>
							  <select class="custom-select">
								  <option selected>Seleccionar</option>
 								  <option value="1">Promocionado</option>
 								  <option value="2">Regular</option>
  								  <option value="3">Libre</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>18889</td>
							<td>Julio</td>
							<td>Toloza</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial1">
 							  </div>
  							</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial2">
 							  </div>
  							</td>
  							 <td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 1">
 							  </div>
  							</td>
  							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 2">
 							  </div>
  							</td>
							<td>
							  <select class="custom-select">
								  <option selected>Seleccionar</option>
 								  <option value="1">Promocionado</option>
 								  <option value="2">Regular</option>
  								  <option value="3">Libre</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>18890</td>
							<td>Rodrigo</td>
							<td>Guzman</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial1">
 							  </div>
  							</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial2">
 							  </div>
  							</td>
  							 <td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 1">
 							  </div>
  							</td>
  							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 2">
 							  </div>
  							</td>
							<td>
							  <select class="custom-select">
								  <option selected>Seleccionar</option>
 								  <option value="1">Promocionado</option>
 								  <option value="2">Regular</option>
  								  <option value="3">Libre</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>18891</td>
							<td>Veronica</td>
							<td>Alvarez</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial1">
 							  </div>
  							</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial2">
 							  </div>
  							</td>
  							 <td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 1">
 							  </div>
  							</td>
  							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 2">
 							  </div>
  							</td>
							<td>
							  <select class="custom-select">
								  <option selected>Seleccionar</option>
 								  <option value="1">Promocionado</option>
 								  <option value="2">Regular</option>
  								  <option value="3">Libre</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>18892</td>
							<td>Maria</td>
							<td>Menendez</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial1">
 							  </div>
  							</td>
							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Parcial2">
 							  </div>
  							</td>
  							  <td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 1">
 							  </div>
  							</td>
  							<td> 
							  <div class="form-group">
   								 <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Recuperatorio 2">
 							  </div>
  							</td>
							<td>
							  <select class="custom-select">
								  <option selected>Seleccionar</option>
 								  <option value="1">Promocionado</option>
 								  <option value="2">Regular</option>
  								  <option value="3">Libre</option>
								</select>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th>
							   <button id="btn-aceptar" class="btn btn-primary" type="submit">Aceptar</button>
							</th>
						</tr>
					</tfoot> 
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