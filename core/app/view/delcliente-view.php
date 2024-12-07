<?php


$cliente = PersonaData::delById($_GET["id"]);
//ClienteData::getById($_GET["id"]);

Core::redir("./index.php?view=cliente");
?>