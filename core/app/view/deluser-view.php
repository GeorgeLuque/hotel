<?php


$user= UserData::delById($_GET["id"]);

Core::redir("./index.php?view=users");
?>