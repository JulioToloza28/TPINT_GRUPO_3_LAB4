/**
 * 
 */

$(document).ready(function() {
	$('#example').DataTable( {
        "scrollX": true,
        "displayLength": 100
    } );
});

var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        labels: ['Aprobados', 'Desaprobados', 'Promocionados'],
        datasets: [{
            label: 'Programacion 3',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [5, 10, 5, 2, 20, 30, 45]
        }]
    },

    // Configuration options go here
    options: {}
});