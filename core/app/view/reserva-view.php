<!DOCTYPE html>
<html>

<head>

    <meta charset='utf-8' />

    <script src='lib/locale/es.js'></script>
    <!-- jQuery 2.2.3 -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->

    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>



    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href='lib/fullcalendar.min.css' rel='stylesheet' />
    <link href='lib/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <link href='lib/scheduler.min.css' rel='stylesheet' />
    <script src='lib/moment.min.js'></script>
    <script src='lib/fullcalendar.min.js'></script>
    <script src='lib/scheduler.min.js'></script>


    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
            font-size: 14px;
        }

        p {
            text-align: center;
        }

        /* MODIFICA TAÑANO DE CALENADARIO Y MARGEN*/
        #calendar {

            max-width: 2000px !important;
            margin: 1px auto;

        }

        .fc-resource-area td {
            cursor: pointer;
        }

        .close {
            float: right;
            font-size: 20px;
            font-weight: 400;
            line-height: 1;
            color: #fff;
            text-shadow: 0 1px 0 #fff;
            filter: alpha(opacity=20);
            opacity: 1;
        }

        .fc-timeline-event .fc-time {
            font-weight: 700;
            padding: 0 1px;
            display: none !important;
        }

        */

        /* ESTILOS PERSONALIZADOS DE CALENDARIO*/
        .fc-toolbar {
            background-color: #745DA8
                /* Cambiar color de la barra de herramientas */
        }

        .fc-day-header {
            background-color: #89A444;
            /* Cambiar color de los encabezados de los días */
            color: blue;
        }

        .fc-today {
            background-color: #C1C6C2 !important;
            /* Cambiar color del día actual */
        }

        .fc-event {
            background-color: #1583DA;
            /* Cambiar color de los eventos */
            color: white;
        }
    </style>
</head>

<body>



    <!--CALENDARIO-->
    <div id='calendar'></div>
    <!--FORMULARIO DE RESERVA-->

    <!-- Modal add. update, delete-->
    <div class="modal fade" id="ModalEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-success">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="titleEvent"> </h4>
                </div>
                <div class="modal-body" style="background-color: #f5eded !important;">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Habitación &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <select name="id_habitacion" id="id_habitacion" class="form-control">
                                        <?php $rooms = HabitacionData::getAll(); ?>
                                        <?php foreach($rooms as $room):?>
                                        <option value="<?php echo $room->id; ?>"><?php echo $room->nombre; ?></option>
                                        <?php endforeach;?>
                                    </select>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Check In &nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <input type="date" class="form-control" name="txtDate" id="txtDate" required>
                                    <span class="input-group-addon"> Hora</span>
                                    <input type="time" class="form-control" name="txtHour" id="txtHour" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Check Out &nbsp;&nbsp; &nbsp;</span>
                                    <input type="date" class="form-control" name="txtDateEnd" id="txtDateEnd"
                                        required>
                                    <span class="input-group-addon"> Hora &nbsp;&nbsp;</span>
                                    <input type="time" class="form-control" name="txtHourEnd" id="txtHourEnd"
                                        required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Documento &nbsp;&nbsp; </span>
                                    <input type="text" class="form-control" name="documento" id="documento" required
                                        placeholder="Ingrese documento">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Nombres &nbsp;&nbsp; &nbsp;&nbsp;</span>
                                    <input type="text" class="form-control" name="nombre" id="nombre" required
                                        placeholder="Nombres completos">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Telefono &nbsp;&nbsp; &nbsp;&nbsp;</span>
                                    <input type="text" class="form-control" name="telefono" id="telefono" required
                                        placeholder="Telefono">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Observación </span>
                                    <input type="text" class="form-control" name="observacion" id="observacion"
                                        required placeholder="Observación">
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="txtId" name="txtId"><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAdd">Agregar</button>
                    <button type="button" class="btn btn-secondary" id="btnUpdate">Actualizar</button>
                    <button type="button" class="btn btn-danger" id="btnDel">Eliminar</button>
                    <button type="button" class="btn btn-default" id="btnClose"
                        data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModalView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content modal-success">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="titleEvent_view"> </h4>
                </div>
                <div class="modal-body" style="background-color: #f5eded !important;">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Habitación &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <select name="id_habitacion_view" id="id_habitacion_view" class="form-control" disabled >
                                        <?php $rooms = HabitacionData::getAll(); ?>
                                        <?php foreach($rooms as $room):?>
                                        <option value="<?php echo $room->id; ?>"><?php echo $room->nombre; ?></option>
                                        <?php endforeach;?>
                                    </select>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Check In &nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <input type="date" class="form-control" name="txtDate_view" id="txtDate_view" required>
                                    <span class="input-group-addon"> Hora</span>
                                    <input type="time" class="form-control" name="txtHour_view" id="txtHour_view" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Check Out &nbsp;&nbsp; &nbsp;</span>
                                    <input type="date" class="form-control" name="txtDateEnd_view" id="txtDateEnd_view"
                                        required>
                                    <span class="input-group-addon"> Hora &nbsp;&nbsp;</span>
                                    <input type="time" class="form-control" name="txtHourEnd_view" id="txtHourEnd_view"
                                        required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"> Nombres &nbsp;&nbsp; &nbsp;&nbsp;</span>
                                    <input type="text" class="form-control" name="nombre_view" id="nombre_view" required
                                        placeholder="Nombres completos">
                                </div>
                            </div>
   
  
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnClose"
                        data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>




    <script>
        $(function() { // document ready

            $('#calendar').fullCalendar({
                now: new Date(),
                editable: true,
                selectable: true,
                aspectRatio: 2.3, //MODIFICA ALTURA DE CALENDARIO EN PAGINA//
                scrollTime: '00:00',
                header: {
                    left: 'promptResource today prev,next',
                    center: 'title',
                    right: 'timelineMonth,timelineDay,timelineThreeDays'
                },
                defaultView: 'timelineMonth',
                views: {
                    timelineThreeDays: {
                        type: 'timeline',
                        duration: {
                            days: 5
                        }
                    }
                },
                resourceAreaWidth: '10%', //MODIFICA BARRA HABITACIONES//
                resourceColumns: [{
                    labelText: 'Habitaciones',
                    field: 'title'
                }],

                select: function(startDate, endDate, mjsEvent, view, resource) {
                    var fechaHora = startDate.format().split("T");
                    var fechaHoraEnd = endDate.format().split("T");
                    var check = moment(startDate).format('YYYY-MM-DD');
                    var today = moment(new Date()).format('YYYY-MM-DD');
                    $('#txtDate').val(fechaHora[0]);
                    $('#txtHour').val(fechaHora[1]);
                    $('#txtDateEnd').val(fechaHoraEnd[0]);
                    $('#txtHourEnd').val(fechaHoraEnd[1]);
                    $('#id_habitacion').val(resource.id);
                    $('#titleEvent').html(resource.title);
                    if (check >= today) {
                        $("#ModalEvent").modal();
                    } else {

                        Swal.fire({
                            title: 'Error',
                            text: 'No se pueden crear reservas en el pasado!',
                            icon: 'error',
                            confirmButtonText: 'Entendido'
                        });
                    }
                },
                eventClick: function(calEvent) {
                    if (calEvent.estado == "3") {
                        $('#titleEvent').html(calEvent.title);
                        $('#id_habitacion').val(calEvent.resourceId);
                        $('#documento').val(calEvent.documento);
                        $('#txtId').val(calEvent.id);
                        $('#nombre').val(calEvent.title);
                        $('#telefono').val(calEvent.telefono);
                        $('#observacion').val(calEvent.observacion);
                        datehhour = calEvent.start._i.split(" ");
                        datehhourEnd = calEvent.end._i.split(" ");
                        $('#txtDate').val(datehhour[0]);
                        $('#txtHour').val(datehhour[1]);
                        $('#txtDateEnd').val(datehhourEnd[0]);
                        $('#txtHourEnd').val(datehhourEnd[1]);
                        $("#ModalEvent").modal();
                    }
                    if (calEvent.estado == "0") {
                        $('#titleEvent_view').html(calEvent.title);
                        $('#id_habitacion_view').val(calEvent.resourceId);
                        $('#nombre_view').val(calEvent.title);
                        datehhour = calEvent.start._i.split(" ");
                        datehhourEnd = calEvent.end._i.split(" ");
                        $('#txtDate_view').val(datehhour[0]);
                        $('#txtHour_view').val(datehhour[1]);
                        $('#txtDateEnd_view').val(datehhourEnd[0]);
                        $('#txtHourEnd_view').val(datehhourEnd[1]);
                        $("#ModalView").modal();
                    }
                },
                eventResize: function(calEvent, delta, revertFunc) {
                    if (calEvent.estado == "3") {
                        $('#txtId').val(calEvent.id);
                        $('#nombre').val(calEvent.title);
                        $('#documento').val(calEvent.documento);
                        $('#telefono').val(calEvent.telefono);
                        $('#id_habitacion').val(calEvent.resourceId);
                        $('#observacion').val(calEvent.observacion);
                        var fechaHora = calEvent.start.format().split("T");
                        var fechaHoraEnd = calEvent.end.format().split("T");
                        $('#txtDate').val(fechaHora[0]);
                        $('#txtHour').val(fechaHora[1]);
                        $('#txtDateEnd').val(fechaHoraEnd[0]);
                        $('#txtHourEnd').val(fechaHoraEnd[1]);
                        DataGUI();
                        DataSendUI('actualizar', NewEvent, true);
                    }
                },
                eventDrop: function(calEvent) {
                    if (calEvent.estado == "3") {
                        $('#id_habitacion').val(calEvent.resourceId);
                        $('#documento').val(calEvent.documento);
                        $('#txtId').val(calEvent.id);
                        $('#nombre').val(calEvent.title);
                        $('#observacion').val(calEvent.observacion);
                        $('#telefono').val(calEvent.telefono);

                        var fechaHora = calEvent.start.format().split("T");
                        var fechaHoraEnd = calEvent.end.format().split("T");
                        $('#txtDate').val(fechaHora[0]);
                        $('#txtHour').val(fechaHora[1]);

                        $('#txtDateEnd').val(fechaHoraEnd[0]);
                        $('#txtHourEnd').val(fechaHoraEnd[1]);
                        DataGUI();
                        DataSendUI('actualizar', NewEvent, true);
                    }

                },



                resources: "index.php?action=reserva",
                events: "index.php?action=reservas",

                // COLOCA NOMBRE DE HUESPED EN CALENADARIO

                eventRender: function(calEvent, element) {


                    var hoy = Date();

                    if (calEvent.estado == '0') {
                        element.css({
                            'background-color': '5BEE0C',
                            'border-color': '060400',
                            'color': 'BLACK'
                        });
                    }
                    if (calEvent.estado == '2') {
                        element.css({
                            'background-color': '#5BEE0C',
                            'border-color': '#060400',
                            'color': 'BLACK'
                        });
                    }
                }

            });

        });


        $('#bagregar').click(function() {

            if (estaCompleto()) {

                DataGUI();
                DataSendUI('addroom', NewEvent);
                $('#ModalRoom').modal('toggle');
                limpiar();
                $('#calendar').fullCalendar('refetchResources');

            } else {
                Swal.fire({
                    title: 'Error',
                    text: 'Faltan Datos',
                    icon: 'error',
                    confirmButtonText: 'Entendido'
                });
            }


        });

        $('#btnAdd').click(function() {

            if (estaCompleto()) {
                DataGUI();
                DataSendUI('agregar', NewEvent);
                $('#ModalEvent').modal('toggle');
                limpiar();


            } else {
                Swal.fire({
                    title: 'Error',
                    text: 'Faltan Datos',
                    icon: 'error',
                    confirmButtonText: 'Entendido'
                });
            }
        });

        $('#btnDel').click(function() {


          if(estaCompleto()){
            DataGUI();
            DataSendUI('eliminar', NewEvent);
            $('#ModalEvent').modal('toggle');
            limpiar();
          }else{
            Swal.fire({
                    title: 'Error',
                    text: 'Faltan Datos para referencia ',
                    icon: 'error',
                    confirmButtonText: 'Entendido'
                });
          }

          
        });

        $('#btnUpdate').click(function() {

          if(estaCompleto()){
            DataGUI();
            DataSendUI('actualizar', NewEvent);
            $('#ModalEvent').modal('toggle');
            limpiar();
          }else{
            Swal.fire({
                    title: 'Error',
                    text: 'Faltan Datos',
                    icon: 'error',
                    confirmButtonText: 'Entendido'
                });
          }

 
        });

        $('#btnClose').click(function() {

            $('#ModalEvent').modal('toggle'),
                limpiar();
        });

        $('#btnClose1').click(function() {
            $('#ModalEvent').modal('toggle'),
                limpiar();
        });

        function limpiar() {
            document.getElementById("txtId").value = "";
            document.getElementById("id_habitacion").value = "";
            document.getElementById("documento").value = "";
            document.getElementById("nombre").value = "";
            document.getElementById("telefono").value = "";
            document.getElementById("txtDate").value = "";
            document.getElementById("txtDateEnd").value = "";
            document.getElementById("observacion").value = "";
            $("#titleEvent").empty();

        }


        function estaCompleto() {
            let idHabitacion = document.getElementById("id_habitacion").value.trim();
            let documento = document.getElementById("documento").value.trim();
            let nombre = document.getElementById("nombre").value.trim();
            let txtDate = document.getElementById("txtDate").value.trim();
            let txtDateEnd = document.getElementById("txtDateEnd").value.trim();

            if (txtId && idHabitacion && documento && nombre  && txtDate && txtDateEnd ) {
                return true; // o return 1;
            } else {
                return false;
            }
        }


        function DataGUI() {

            NewEvent = {
                // TABLE EVENTO 
                id: $('#txtId').val(),
                id_habitacion: $('#id_habitacion').val(),
                documento: $('#documento').val(),
                nombre: $('#nombre').val(),
                telefono: $('#telefono').val(),
                observacion: $('#observacion').val(),
                start: $('#txtDate').val() + " " + $('#txtHour').val(),
                end: $('#txtDateEnd').val() + " " + $('#txtHourEnd').val()
            };

        }

        function DataSendUI(accion, objEvento) {
            $.ajax({
                type: 'POST',
                url: 'index.php?action=reserva&accion=' + accion,
                data: objEvento,
                success: function(response) {
                    console.log(response); // Muestra la respuesta en la consola
                    // Verifica el estado de la respuesta
                    if (response.status === "error") {
                        // Si la respuesta indica un error
                        Swal.fire({
                            title: 'Error',
                            text: response.message, // Muestra el mensaje de error recibido
                            icon: 'error',
                            confirmButtonText: 'Entendido'
                        });
                    }
                    if (response.status === "success") {
                        $('#calendar').fullCalendar('refetchEvents');
                        Swal.fire({
                            title: "Correcto",
                            text: "Presiona OK para continuar",
                            icon: "success"
                        });
                        if (!modal) {
                            $('#ModalEvent').modal('toggle');
                            $('#ModalRoom').modal('toggle');
                        }
                        // Si la respuesta es exitosa


                    }
                    if (response.status === "true") {
                        $('#calendar').fullCalendar('refetchEvents');
                        Swal.fire({
                            title: "Correcto",
                            text: "Presiona OK para continuar",
                            icon: "success"
                        });
                        if (!modal) {
                            $('#ModalEvent').modal('toggle');
                            $('#ModalRoom').modal('toggle');
                        }
                        // Si la respuesta es exitosa


                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("Error details:", {
                        textStatus: textStatus,
                        errorThrown: errorThrown,
                        jqXHR: jqXHR
                    });
                    Swal.fire({
                        title: 'Error',
                        text: jqXHR.responseText,
                        icon: 'error',
                        confirmButtonText: 'Entendido'
                    });
                    //window.location.reload();
                }
            });
        }
    </script>
    <script src='lib/locale/es.js'></script>

</body>

</html>
