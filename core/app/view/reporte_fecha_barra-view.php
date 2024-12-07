<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<?php if(isset($_POST['start']) and $_POST['start']!=''){ ?>
<div class="tile-body">
    <div class="row">
        <div class="col-md-12">
            <h4 class="custom-font">
                <strong>diagrama de barra desde: </strong>
                <?php echo $_POST['start'] . ' - ' . $_POST['end']; ?>
            </h4>
            <h4>
                <a href="" onclick="window.print();"><i class="fa fa-print" style="color: #da0e36"></i> </a>
            </h4>

        </div>
    </div>
</div>

<!-- INGRESOS -->
<?php
$montos_sin_cerrar = ProcesoData::getIngresoRangoFechas($_POST['start'], $_POST['end']);
//print_r($montos_sin_cerrar);
$total_sin_cerrar = 0;
if (count($montos_sin_cerrar) > 0) {
    foreach ($montos_sin_cerrar as $monto_sin_cerrar):
        $total_sin_cerrar = $monto_sin_cerrar->precio * $monto_sin_cerrar->cant_noche + $monto_sin_cerrar->total + $total_sin_cerrar;
    endforeach;
}
?>

<?php
/*
$data = [
    // Aquí iría el array de objetos ProcesoData que has proporcionado
    // Por simplicidad, voy a usar un array de ejemplo
    (object)[ 'fecha_entrada' => '2024-06-16 00:00:00', 'id_habitacion' => 1 ],
    (object)[ 'fecha_entrada' => '2024-06-16 10:00:00', 'id_habitacion' => 1 ],
    // ... otros datos
];

// Crear un array para contar el uso de habitaciones por fecha
$habitacionCounts = [];

// Procesar los datos
foreach ($data as $entry) {
    $fecha = substr($entry->fecha_entrada, 0, 10); // Extraer la fecha (YYYY-MM-DD)
    $id_habitacion = $entry->id_habitacion;

    if (!isset($habitacionCounts[$fecha])) {
        $habitacionCounts[$fecha] = [];
    }

    if (!isset($habitacionCounts[$fecha][$id_habitacion])) {
        $habitacionCounts[$fecha][$id_habitacion] = 0;
    }

    $habitacionCounts[$fecha][$id_habitacion]++;
}

// Preparar datos para Chart.js
$dates = [];
$rooms = [];
$counts = [];

foreach ($habitacionCounts as $date => $roomsData) {
    $dates[] = $date;

    foreach ($roomsData as $roomId => $count) {
        $rooms[$roomId][] = $count;
        $counts[$roomId][] = $date;
    }
}

// Convertir datos a formato JSON para usar en Chart.js
$jsonDates = json_encode($dates);
$jsonRooms = json_encode($rooms);
$jsonCounts = json_encode($counts);
*/
?>
<?php

// Asegúrate de que las fechas están en un formato correcto

// Supongamos que $data contiene los datos obtenidos de la base de datos
$data = [
    // Aquí irían los datos que recibiste
];

// Crear un array para contar el uso de habitaciones por fecha
$habitacionCounts = [];

foreach ($montos_sin_cerrar as $entry) {
    $fecha = substr($entry->fecha_entrada, 0, 10); // Extraer la fecha (YYYY-MM-DD)
    //$id_habitacion = $entry->id_habitacion;
    $id_habitacion = HabitacionData::getById($entry->id_habitacion)->nombre;


    if (!isset($habitacionCounts[$fecha])) {
        $habitacionCounts[$fecha] = [];
    }

    if (!isset($habitacionCounts[$fecha][$id_habitacion])) {
        $habitacionCounts[$fecha][$id_habitacion] = 0;
    }

    $habitacionCounts[$fecha][$id_habitacion]++;
}

// Preparar datos para Chart.js
$dates = array_keys($habitacionCounts);
$roomsData = [];

foreach ($habitacionCounts as $date => $roomsDataForDate) {
    foreach ($roomsDataForDate as $roomId => $count) {
        if (!isset($roomsData[$roomId])) {
            $roomsData[$roomId] = [
                'label' => 'Habitación ' . $roomId,
                'data' => array_fill(0, count($dates), 0),
                'backgroundColor' => 'rgba(' . rand(0, 255) . ',' . rand(0, 255) . ',' . rand(0, 255) . ',0.2)',
                'borderColor' => 'rgba(' . rand(0, 255) . ',' . rand(0, 255) . ',' . rand(0, 255) . ',1)',
                'borderWidth' => 1,
            ];
        }
        $index = array_search($date, $dates);
        $roomsData[$roomId]['data'][$index] = $count;
    }
}

$jsonDates = json_encode($dates);
$jsonRoomsData = json_encode(array_values($roomsData));

?>



<canvas id="myChart" width="400" height="200"></canvas>
<script>
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: <?php echo $jsonDates; ?>,
            datasets: <?php echo $jsonRoomsData; ?>
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                tooltip: {
                    callbacks: {
                        label: function(tooltipItem) {
                            return tooltipItem.dataset.label + ': ' + tooltipItem.raw;
                        }
                    }
                }
            },
            scales: {
                x: {
                    beginAtZero: true
                },
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
