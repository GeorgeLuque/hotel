<?php
header('Content-Type: application/json');

$base = new Database();
$pdo = $base->connect1();

$accion = isset($_GET['accion']) ? $_GET['accion'] : 'leer';
//echo '<pre>'; print_r($accion); echo '</pre>';
switch ($accion) {
    case 'agregar':
        //add instruction
        $clientes = PersonaData::getLikeDni($_POST['documento']);
        if (!is_array($clientes)) {
            $clientes = []; // Devolver el array de resultados
        }
        if (count($clientes) > 0) {
            $id_cliente = $clientes->id;
        } else {
            $cliente = new PersonaData();
            $cliente->tipo_documento = 1;
            $cliente->documento = $_POST['documento'];
            $cliente->nombre = $_POST['nombre'];

            $direccion = 'NULL';
            if ($_POST['direccion'] != '') {
                $direccion = $_POST['direccion'];
            }
            $cliente->direccion = $direccion;
            $s = $cliente->add001();
            $id_cliente = $s[1];
        }

        //validar si no hay reserva para ese dia
        $sentenciaSQL = $pdo->prepare('SELECT * FROM proceso WHERE id_habitacion = :id_habitacion AND fecha_entrada = :fecha_entrada');

        // Asignar valores a los parámetros
        $sentenciaSQL->bindParam(':id_habitacion', $_POST['id_habitacion'], PDO::PARAM_INT); // Si id_habitacion es un número entero
        $sentenciaSQL->bindParam(':fecha_entrada', $_POST['start'], PDO::PARAM_STR); // Si fecha_entrada es una cadena

        // Ejecutar la consulta
        $sentenciaSQL->execute();
        $resultado = $sentenciaSQL->fetchAll(PDO::FETCH_ASSOC);

		if (!empty($resultado)) {
					$resp = array(
						'status' => 'error', // O 'success' según sea el caso
						'message' => 'Reserva anterior ya existente' // Un mensaje opcional
					);
					echo json_encode($resp);
					break;
			}

        $sentenciaSQL = $pdo->prepare("INSERT INTO
			proceso(id_habitacion,id_cliente,dinero_dejado,id_tipo_pago,fecha_entrada,fecha_salida,total,id_usuario,cant_personas,id_caja,estado,fecha_creada,observacion,pagado)
			values(:id_habitacion,$id_cliente,0,1,:start,:end,0,:id_usuario,1,NULL,3,NOW(),:observacion,0)");

        $respuesta = $sentenciaSQL->execute([
            'id_habitacion' => $_POST['id_habitacion'],
            'start' => $_POST['start'],
            'end' => $_POST['end'],
            'observacion' => $_POST['observacion'],
            'id_usuario' => $_SESSION['user_id'],
        ]);
		
		$resp = array(
			'status' => 'success', // O 'success' según sea el caso
			'message' => 'Registrado Correctamente' // Un mensaje opcional
		);
        echo json_encode($resp);
        break;

    case 'agregarDefault':
        //add instruction
        $sentenciaSQL = $pdo->prepare("INSERT INTO
			events(title,color,textColor,start,end)
			values(:title,:description,:textColor,:start,:end)");

        $respuesta = $sentenciaSQL->execute([
            'title' => $_POST['title'],
            'description' => $_POST['description'],
            'textColor' => $_POST['textColor'],
            'start' => $_POST['start'] . ' 06:00:00',
            'end' => $_POST['end'] . ' 23:30:00',
        ]);

        echo json_encode($respuesta);
        break;

    case 'addstatic':
        //add instruction
        $sentenciaSQL = $pdo->prepare("INSERT INTO
			static(s_title,s_color,s_textcolor)
			values(:s_title,:s_color,:s_textcolor)");

        $respuesta = $sentenciaSQL->execute([
            's_title' => $_POST['s_title'],
            's_color' => $_POST['s_color'],
            's_textcolor' => $_POST['s_textcolor'],
        ]);

        echo json_encode($respuesta);
        break;

    case 'eliminar':
        //delete instruction
        $respuesta = false;
        if (isset($_POST['id'])) {
            $sentenciaSQL = $pdo->prepare('DELETE FROM proceso WHERE id=:id');
            $respuesta = $sentenciaSQL->execute([
                'id' => $_POST['id'],
            ]);
        }
        //echo json_encode($respuesta);
        //break;

        if($respuesta){
            $resp = array(
                'status' => 'success', // O 'success' según sea el caso
                'message' => 'Eliminado  Correctamente' // Un mensaje opcional
            );
            echo json_encode($resp);
            break;
        }
    case 'actualizar':
        //update instruction
        $clientes = PersonaData::getLikeDni($_POST['documento']);

        $sentenciaSQL = $pdo->prepare('UPDATE  proceso SET id_habitacion=:id_habitacion,fecha_entrada=:start,fecha_salida=:end,observacion=:observacion WHERE id=:id ');
        $respuesta = $sentenciaSQL->execute([
            'id' => $_POST['id'],
            'id_habitacion' => $_POST['id_habitacion'],
            'start' => $_POST['start'],
            'observacion' => $_POST['observacion'],
            'end' => $_POST['end'],
        ]);


        if (isset($clientes->id)) {
            $clientes->nombre = $_POST['nombre'];
            $clientes::updatecliente($clientes);
           // PersonaData::updatePersona();
        }


        if($respuesta){
            $resp = array(
                'status' => 'success', // O 'success' según sea el caso
                'message' => 'Actualizado Correctamente' // Un mensaje opcional
            );
            echo json_encode($resp);
            break;
        }

        //echo json_encode($respuesta);
        //break;
    default:
        //selecciona los eventos del calendario
        $sentenciaSQL = $pdo->prepare('SELECT id,nombre as title from habitacion');
        $sentenciaSQL->execute();

        $resultado = $sentenciaSQL->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode($resultado);
        break;
}

?>
