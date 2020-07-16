/**
 * 
 */

$(document).ready(
		function() {
			$('#example').DataTable({
				"scrollX" : false
			}), $('#AlumnosCursoAM').DataTable({
				"scrollX" : true,
				"displayLength" : 100,
				"order" : [ [ 1, "asc" ] ],
				columnDefs : [ {
					targets : "_all",
					className : 'dt-center'
				} ]
			}), $('#AlumnosCursoD').DataTable({
				"scrollX" : true,
				"displayLength" : 100,
				"order" : [ [ 0, "asc" ] ],
				columnDefs : [ {
					targets : "_all",
					className : 'dt-center'
				} ]
			}), $('#ListarCursos').DataTable(
					{
						"scrollX" : true,
						"displayLength" : 10,
						"order" : [[ 0, "asc" ], [ 4, "desc" ], [ 3, "desc" ], [ 2, "asc" ],
								[ 1, "asc" ]],
						columnDefs : [ {
							targets : 0,
							className : 'dt-left'
						}, {
							targets : "_all",
							className : 'dt-center'
						} ]
					});
		});

var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
	// The type of chart we want to create
	type : 'bar',

	// The data for our dataset
	data : {
		labels : [ 'Aprobados', 'Desaprobados', 'Promocionados' ],
		datasets : [ {
			label : 'Programacion 3',
			backgroundColor : 'rgb(255, 99, 132)',
			borderColor : 'rgb(255, 99, 132)',
			data : [ 5, 10, 5, 2, 20, 30, 45 ]
		} ]
	},

	// Configuration options go here
	options : {}
});