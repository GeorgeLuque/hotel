<?php

if(count($_POST)>0){


	$clienteOld = PersonaData::getbyDni($_POST["documento"]);
	
	if(empty($clienteOld)){

		
	
		$razon_social="NULL";
	  if($_POST["razon_social"]!=""){ $razon_social=$_POST["razon_social"];}
	
	  $giro="";
	  if($_POST["giro"]!=""){ $giro=$_POST["giro"];}
	
	  $direccion="";
	  if($_POST["direccion"]!=""){ $direccion=$_POST["direccion"];}

	  $telefono="";
	  if($_POST["telefono"]!=""){ $telefono=$_POST["telefono"];}
	
	  $fecha_nac="";
	  if($_POST["fecha_nac"]!=""){ $fecha_nac=$_POST["fecha_nac"];}
	  
	
		$cliente = new PersonaData();
		$cliente->tipo_documento = $_POST["tipo_documento"];
		$cliente->documento = $_POST["documento"];
		$cliente->nombre = $_POST["nombre"];
		$cliente->razon_social = $razon_social;
		$cliente->giro = $giro;
		$cliente->direccion = $direccion;
		$cliente->telefono = $telefono;
		$cliente->fecha_nac = $fecha_nac;
		
		$cliente->addCliente();
		//print_r($cliente);
		print "<script>window.location='index.php?view=cliente';</script>";

	}else{?>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		
	<?php	
	print("
    <script>
        Swal.fire({
            title: 'Error',
            text: 'Cliente registrado con anterioridad',
            icon: 'error',
            confirmButtonText: 'Entendido'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location = 'index.php?view=cliente';
            }
        });
    </script>
");

	
        //print "<script>window.location='index.php?view=cliente';</script>";
	}






}


?>