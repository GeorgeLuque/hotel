<?php


$cliente = CategoriaData::delById($_GET["id"]);
//ClienteData::getById($_GET["id"]);

Core::redir("./index.php?view=categoria");
?>