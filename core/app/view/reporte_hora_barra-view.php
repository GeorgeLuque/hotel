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
$h = array();
$c = 0;
foreach ($habitaciones as $i) {
    $h[$c] =  HabitacionData::getById($i)->nombre;
    $c++;
}
//print_r($h);
$horasData = array_values($habitacionCounts);

$jsonHabitaciones = json_encode($h);
$jsonHorasData = json_encode($horasData);
?>

<canvas id="myChart" width="400" height="200"></canvas>

<script>
    function getRandomColor() {
        const r = Math.floor(Math.random() * 255);
        const g = Math.floor(Math.random() * 255);
        const b = Math.floor(Math.random() * 255);
        return `rgba(${r}, ${g}, ${b}, 0.2)`; // Puedes ajustar la opacidad (0.2) si lo deseas
    }

    function generateColorArray(length) {
        const colorArray = [];
        for (let i = 0; i < length; i++) {
            colorArray.push(getRandomColor());
        }
        return colorArray;
    }


    const ctx = document.getElementById('myChart').getContext('2d');
    
    const myChart = new Chart(ctx, {
        type: 'bar', // Puedes cambiarlo a 'line' si prefieres
        data: {
            labels: <?php echo $jsonHabitaciones; ?>,
            datasets: [{
                label: 'Horas de uso por habitación',
                data: <?php echo $jsonHorasData; ?>,
                backgroundColor: generateColorArray(<?php echo count($h); ?>),
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
