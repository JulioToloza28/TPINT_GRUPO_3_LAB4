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
				<div class="col-md-4">
					<label class="my-1 mr-6" for="inlineFormCustomSelectPref">Materia</label>
					<select class="custom-select my-1 mr-sm-2" id="cmbMateria">
						<option selected="">Seleccione...</option>
						<option value="1">Programacion 3</option>

					</select>
				</div>

				<div class="col-md-4">
					<label class="my-1 mr-6" for="inlineFormCustomSelectPref">Estado
						Academico</label> <select class="custom-select my-1 mr-sm-2"
						id="EstadoAcademico">
						<option selected="">Seleccione...</option>
						<option value="1">En curso</option>

					</select>


				</div>
				<div class="col-md-4" style="width: 1030px;">
					<button id="btn-filtrar" name="btn-filtrar" class="btn btn-primary"
						type="submit">Filtrar</button>
				</div>
			</ol>
			</nav>
			
<!-- 			<div class="row">
			<div class="col-lg-12">
				<a href="ServletUsuarios?AddUser=1" class="btn btn-outline-primary btn-sm">Agregar</a>
				<div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer"><div class="row"><div class="col-sm-12 col-md-6"><div class="dataTables_length" id="example_length"><label>Show <select name="example_length" aria-controls="example" class="custom-select custom-select-sm form-control form-control-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-12 col-md-6"><div id="example_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example"></label></div></div></div><div class="row"><div class="col-sm-12"><div class="dataTables_scroll"><div class="dataTables_scrollHead" style="overflow: hidden; position: relative; border: 0px; width: 100%;"><div class="dataTables_scrollHeadInner" style="box-sizing: content-box; width: 1110px; padding-right: 0px;"><table class="display dataTable no-footer" style="width: 1110px; margin-left: 0px;" role="grid"><thead>
						<tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 85px;" aria-sort="ascending" aria-label="ID: activate to sort column descending">ID</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 124px;" aria-label="User: activate to sort column ascending">User</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 228px;" aria-label="legajo_Pro: activate to sort column ascending">legajo_Pro</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 237px;" aria-label="Tipo: activate to sort column ascending">Tipo</th><th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" style="width: 256px;" aria-label="acciones: activate to sort column ascending">acciones</th></tr>
					</thead></table></div></div><div class="dataTables_scrollBody" style="position: relative; overflow: auto; width: 100%;"><table id="example" class="display dataTable no-footer" style="width: 100%;" role="grid" aria-describedby="example_info"><thead>
						<tr role="row" style="height: 0px;"><th class="sorting_asc" aria-controls="example" rowspan="1" colspan="1" style="width: 85px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-sort="ascending" aria-label="ID: activate to sort column descending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">ID</div></th><th class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 124px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="User: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">User</div></th><th class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 228px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="legajo_Pro: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">legajo_Pro</div></th><th class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 237px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="Tipo: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">Tipo</div></th><th class="sorting" aria-controls="example" rowspan="1" colspan="1" style="width: 256px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="acciones: activate to sort column ascending"><div class="dataTables_sizing" style="height: 0px; overflow: hidden;">acciones</div></th></tr>
					</thead>
					
					<tbody>
						
						
						
						
						
					<tr role="row" class="odd">
							<td class="sorting_1">1 <input type="hidden" name="idUsuario" value="1"></td>
							<td>admin</td>
							<td>1</td>
							<td>administrador</td>
							<td><a href="CambiarClave.jsp?idUsuario=1" class="btn btn-info btn-sm"><i class="fas fa-exchange-alt"></i>
									Cambiar Clave</a>
						</td></tr><tr role="row" class="even">
							<td class="sorting_1">2 <input type="hidden" name="idUsuario" value="2"></td>
							<td>Gema</td>
							<td>1</td>
							<td>profesor</td>
							<td><a href="CambiarClave.jsp?idUsuario=2" class="btn btn-info btn-sm"><i class="fas fa-exchange-alt"></i>
									Cambiar Clave</a>
						</td></tr></tbody>
				</table></div></div></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="example_info" role="status" aria-live="polite">Showing 1 to 2 of 2 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="example_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="example_previous"><a href="#" aria-controls="example" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="example" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item next disabled" id="example_next"><a href="#" aria-controls="example" data-dt-idx="2" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
			</div>
		</div>
	</div>
			 -->

			<!-- <div class="container mt-2">
		<canvas id="myChart"></canvas>
	</div> -->

			<script type="text/javascript" src="js/script.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script type="text/javascript"
				src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
			<script type="text/javascript" src="js/script.js"></script>
</body>
</html>