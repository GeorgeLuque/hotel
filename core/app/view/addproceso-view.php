<?php
$u = UserData::getById(Session::getUID());
$session_id = session_id();
ini_set('date.timezone', 'America/Lima');

if (count($_POST) > 0) {
    $caja = CajaData::getAllAbiertoPorUsuario($u->id);
    // print_r($caja);
    if (count(get_object_vars($caja)) > 0) {
        $id_caja = $caja->id;
    } else {
        $id_caja = 'NULL';
    }

    $clienteV = PersonaData::getbyDni($_POST['documento']);
    $proceso = new ProcesoData();
    $cliente_proceso = new ClienteProcesoData();
    if (!empty($clienteV)) {
        $s = $clienteV;
        $proceso->id_cliente = $s->id;
        $cliente_proceso->id_cliente = $s->id;
    } else {
        printf('cliente no existe');
        $cliente = new PersonaData();
        $cliente->tipo_documento = $_POST['tipo_documento'];
        $cliente->documento = $_POST['documento'];
        $cliente->nombre = $_POST['nombre'];
        $cliente->giro = $_POST['giro'];

        $direccion = 'NULL';
        if ($_POST['direccion'] != '') {
            $direccion = $_POST['direccion'];
        }
        $cliente->direccion = $direccion;

        $nacionalidad = 'NULL';
        if ($_POST['nacionalidad'] != '') {
            $nacionalidad = $_POST['nacionalidad'];
        }
        $razon_social = 'NULL';
        if ($_POST['razon_social'] != '') {
            $razon_social= $_POST['razon_social'];
        }
        $cliente->razon_social = $razon_social;

        $estado_civil = 'NULL';
        if ($_POST['estado_civil'] != '') {
            $estado_civil = $_POST['estado_civil'];
        }
        $cliente->estado_civil = $estado_civil;

        $ocupacion = 'NULL';
        if ($_POST['ocupacion'] != '') {
            $ocupacion = $_POST['ocupacion'];
        }
        $cliente->ocupacion = $ocupacion;

        $telefono = 'NULL';
        if ($_POST['telefono'] != '') {
            $telefono = $_POST['telefono'];
        }
        $cliente->telefono = $telefono;

        $medio_transporte = 'NULL';
        if ($_POST['medio_transporte'] != '') {
            $medio_transporte = $_POST['medio_transporte'];
        }
        $cliente->medio_transporte = $medio_transporte;

        $destino = 'NULL';
        if ($_POST['destino'] != '') {
            $destino = $_POST['destino'];
        }
        $cliente->destino = $destino;

        $motivo = 'NULL';
        if ($_POST['motivo'] != '') {
            $motivo = $_POST['motivo'];
        }
        $cliente->motivo = $motivo;

        $s = $cliente->add();
        $proceso->id_cliente = $s[1];
        $cliente_proceso->id_cliente = $s[1];
    }

    $habitacion = HabitacionData::getById($_POST['id_habitacion']);
    $habitacion->estado = 2;
    $habitacion->updateEstado();

    $proceso->id_habitacion = $_POST['id_habitacion'];
    $proceso->id_tarifa = $_POST['id_tarifa'];

    $proceso->precio = $_POST['precio'];
    $proceso->cant_noche = $_POST['cant_noche'];
    $proceso->dinero_dejado = 0;
    $proceso->fecha_entrada = date('Y-m-j H:i:s');
    $proceso->fecha_salida = $_POST['fecha_salida'] . ' ' . $_POST['hora_salida'];
    $proceso->id_usuario = $_SESSION['user_id'];
    $proceso->cant_personas = 1;
    $proceso->id_caja = $id_caja;
    $proceso->cantidad = $_POST['cantidad'];
    $proceso->pagado = $_POST['pagado'];
    $f = $proceso->addIngreso();

    $cliente_proceso->sesion = $session_id;
    $cliente_proceso->id_proceso = $f[1];
    $cliente_proceso->add();

    $reserva = ProcesoData::getReservaByParams($proceso->id_cliente,$_POST['id_habitacion']);

    if(!empty($reserva)){
      ProcesoData::delById($reserva->id);
    }



    print "<script>window.location='index.php?view=recepcion';</script>";
} else {
    echo "<script>alert('NO SE AGREGÓ NINGÚN CLIENTE. FAVOR DE INGRESAR');</script>";
    print "<script>window.location='index.php?view=recepcion';</script>";
}

?>
