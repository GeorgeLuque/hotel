<?php

if(count($_POST)>0){ 
	//print_r($_POST);
	$cliente = PersonaData::getById($_POST["id_cliente"]);
	//print_r($cliente);

	$cliente->tipo_documento = $_POST["tipo_documento"];
	$cliente->documento = $_POST["documento"];
	$cliente->nombre = $_POST["nombre"];

	$razon_social="NULL";
  if($_POST["razon_social"]!=""){ $razon_social=$_POST["razon_social"];}

  $giro="NULL";
  if($_POST["giro"]!=""){ $giro=$_POST["giro"];}

  $direccion="NULL";
  if($_POST["direccion"]!=""){ $direccion=$_POST["direccion"];}

  $telefono="NULL";
  if($_POST["telefono"]!=""){ $telefono=$_POST["telefono"];}

  $fecha_nac="";
  if($_POST["fecha_nac"]!=""){ $fecha_nac=$_POST["fecha_nac"];}
  


	$cliente->razon_social = $razon_social;
	$cliente->giro = $giro;
	$cliente->direccion = $direccion;
	$cliente->telefono = $telefono;
	$cliente->fecha_nac = $fecha_nac;
	//print_r($cliente);

	$cliente->updatecliente($cliente);

print "<script>window.location='index.php?view=cliente';</script>";


}


?>