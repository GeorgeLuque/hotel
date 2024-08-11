<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<?php if(isset($_POST['start']) and $_POST['start']!=''){ ?>
<div class="tile-body">
    <div class="row">
        <div class="col-md-12">
            <h4 class="custom-font">
                <strong>Diagrama de horas de uso por habitación desde: </strong>
                <?php echo $_POST['start'] . ' - ' . $_POST['end']; ?>
            </h4>
            <h4>
                <a href="" onclick="window.print();"><i class="fa fa-print" style="color: #da0e36"></i> </a>
            </h4>
        </div>
    </div>
</div>

<?php
$horas_uso = ProcesoData::getHorasDeUsoPorHabitacion();
//print_r($horas_uso);
$habitacionCounts = [];
foreach ($horas_uso as $entry) {
    $id_habitacion = $entry->id_habitacion;
    $total_horas_uso = $entry->total_horas_uso;

    if (!isset($habitacionCounts[$id_habitacion])) {
        $habitacionCounts[$id_habitacion] = 0;
    }

    $habitacionCounts[$id_habitacion] += $total_horas_uso;
}

// Preparar datos para Chart.js
$habitaciones = array_keys($habitacionCounts);
$horasData = array_values($habitacionCounts);

$jsonHabitaciones = json_encode($habitaciones);
print_r($jsonHabitaciones);
$jsonHorasData = json_encode($horasData);
?>

<canvas id="myChart" width="400" height="200"></canvas>
<script>
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar', // Puedes cambiarlo a 'line' si prefieres
        data: {
            labels: <?php echo $jsonHabitaciones; ?>,
            datasets: [{
                label: 'Horas de uso por habitación',
                data: <?php echo $jsonHorasData; ?>,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</body>
</html>
<?php }else{
    print "<script>window.location='index.php?view=pre_reporte_fecha_barra';</script>";
} ?>
