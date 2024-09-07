<?php

if(count($_POST)>0){

	TarifaHabitacionData::updateConParams($_POST["id"],$_POST["precio"]);
	$habitacion = $_POST["id_habitacion"];

print "<script>window.location='index.php?view=ha_tarifas&id=$habitacion';</script>";

}

?>