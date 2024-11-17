<?php
header('Content-Type: application/json');

$base = new Database();
$pdo = $base->connect1();

$accion = isset($_GET['accion']) ? $_GET['accion'] : 'leer';

switch ($accion) {
    case 'agregar':
 

        $clientes = PersonaData::getLikeDni($_POST['documento']);

        if (!empty($clientes)) {
            $id_cliente = $clientes->id; // Suponiendo que $clientes es una lista de objetos PersonaData
 
        } else {
            $cliente = new PersonaData();
            $cliente->tipo_documento = 1;
            $cliente->documento = $_POST['documento'];
            $cliente->nombre = $_POST['nombre'];
            $telefono = ($_POST['telefono'] != '') ? $_POST['telefono'] : 'NULL';
            $cliente->telefono = $telefono;
            $s = $cliente->add001();
            $id_cliente = $s[1];
        }



        $sentenciaSQL = $pdo->prepare('SELECT * FROM proceso WHERE id_habitacion = :id_habitacion AND fecha_entrada = :fecha_entrada');
        $sentenciaSQL->bindParam(':id_habitacion', $_POST['id_habitacion'], PDO::PARAM_INT);       
        $sentenciaSQL->bindParam(':fecha_entrada', $_POST['start'], PDO::PARAM_STR);

        


        $sentenciaSQL->execute();
        $resultado = $sentenciaSQL->fetchAll(PDO::FETCH_ASSOC);

		if (!empty($resultado)) {
					$resp = array(
						'status' => 'error', 
						'message' => 'Reserva anterior ya existente' 
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
			'status' => 'success', 
			'message' => 'Registrado Correctamente' 
		);
        echo json_encode($resp);
        break;

    case 'agregarDefault':
 
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
        
        $procesoCancelacion = ProcesoData::getById($_POST['id']);

        $respuesta = false;
        $respuesta2 = false;
        
        if (isset($_POST['id'])) {
            $sentenciaSQL = $pdo->prepare('DELETE FROM proceso WHERE id=:id');
            $respuesta = $sentenciaSQL->execute([
                'id' => $_POST['id'],
            ]);
        }

        if($respuesta){
            $sentenciaSQL = $pdo->prepare("INSERT INTO
            proceso_cancelados(id_habitacion,id_cliente,dinero_dejado,id_tipo_pago,fecha_entrada,fecha_salida,total,id_usuario,cant_personas,id_caja,estado,fecha_creada,observacion,pagado)
            VALUES(:id_habitacion,:id_cliente,0,1,:fecha_entrada,:fecha_salida,0,:id_usuario,1,NULL,3,NOW(),:observacion,0)");
        
            $respuesta2 = $sentenciaSQL->execute([
                'id_cliente' => $procesoCancelacion->id_cliente,
                'id_habitacion' => $procesoCancelacion->id_habitacion,
                'fecha_entrada' => $procesoCancelacion->fecha_entrada,
                'fecha_salida' => $procesoCancelacion->fecha_salida,
                'observacion' => $procesoCancelacion->observacion,
                'id_usuario' => $procesoCancelacion->id_usuario, 
            ]);
        }
        

        if($respuesta2){
            $resp = array(
                'status' => 'success', 
                'message' => 'Eliminado  Correctamente' 
            );
            echo json_encode($resp);
            break;
        }
    case 'actualizar':

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
            $clientes->telefono = $_POST['telefono'];
            $clientes::updatecliente($clientes);
   
        }


        if($respuesta){
            $resp = array(
                'status' => 'success', 
                'message' => 'Actualizado Correctamente' 
            );
            echo json_encode($resp);
            break;
        }

    
    default:
        
        $sentenciaSQL = $pdo->prepare('SELECT id,nombre as title from habitacion');
        $sentenciaSQL->execute();

        $resultado = $sentenciaSQL->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode($resultado);
        break;
}

?>
