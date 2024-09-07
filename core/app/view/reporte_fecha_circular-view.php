<?php if(isset($_POST['start']) and $_POST['end']!=''){ 

    ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gráfico Comparativas de Reservas</title>

    <!-- Estilos y scripts necesarios -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.pie.min.js"></script>
</head>
<body>

<?php



    // Datos en duro para el ejemplo
    try {
        $total_reservas = ProcesoData::getCantidadDeReservas($_POST['start'],$_POST['end'])->cantidad;
        $total_cancelaciones = ProcesoData::getCantidadDeCancelaciones($_POST['start'],$_POST['end'])->cantidad;
        $total_checkins = ProcesoData::getCantidadDeCheckin($_POST['start'],$_POST['end'])->cantidad;
    } catch (\Throwable $th) {
        print_r($th->getMessage());
    }


    // Suma total
    $suma_total = $total_reservas + $total_cancelaciones + $total_checkins;
?>

<section class="tile">
    <!-- Encabezado -->
    <div class="tile-header dvd dvd-btm">
        <h1 class="custom-font"><strong>Estadísticas de Reservas, Cancelaciones y Check-ins</strong></h1>
        <ul class="controls">
            <li class="remove">
                <a href="" onclick="window.print();">
                    <i class="fa fa-print" style="color: #da0e36"></i>
                </a>
            </li>
        </ul>
    </div>
    <!-- /Encabezado -->

    <!-- Cuerpo -->
    <div class="tile-body">
        <div class="row">
            <div class="col-md-12">
                <!-- Contenedor para el gráfico circular -->
                <div id="pie-chart" style="height: 450px"></div>
            </div>
        </div>
    </div>
    <!-- /Cuerpo -->
</section>

<script>
    
    $(window).on('load', function() {
        // Datos para el gráfico circular
        var data = [
            {
                label: 'Reservas',
                data: <?php echo ($total_reservas * 100) / $suma_total; ?>
            },
            {
                label: 'Cancelaciones',
                data: <?php echo ($total_cancelaciones * 100) / $suma_total; ?>
            },
            {
                label: 'Check-ins',
                data: <?php echo ($total_checkins * 100) / $suma_total; ?>
            }
        ];

        // Opciones de estilo y comportamiento del gráfico
        var options = {
            series: {
                pie: {
                    show: true,
                    innerRadius: 0,
                    stroke: {
                        width: 0
                    },
                    label: {
                        show: true,
                        threshold: 0.05
                    }
                }
            },
            colors: ['#428bca', '#d9534f', '#5cb85c'], // Colores para cada sección
            grid: {
                hoverable: true,
                clickable: true,
                borderWidth: 0,
                color: '#ccc'
            },
            tooltip: true,
            tooltipOpts: {
                content: '%s: %p.0%' // Mostrar el porcentaje en el tooltip
            }
        };

        // Dibujar el gráfico
        $.plot($("#pie-chart"), data, options);

        // Redibujar el gráfico cuando cambie el tamaño de la ventana
        $(window).resize(function() {
            $.plot($("#pie-chart"), data, options);
        });
    });
    
</script>

</body>
</html>
<?php }else{
    print "<script>window.location='index.php?view=pre_reporte_fecha_circular';</script>";
} ?>