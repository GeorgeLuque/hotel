<?php

//printf($_GET["id"]);
//$tarifa_ha = TarifaData::delById($_GET["id"]);
$tarifa_ha = TarifaHabitacionData::delById($_GET["id"]);


Core::redir("./index.php?view=habitacion");
?>