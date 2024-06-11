<head>
	<!-- la primera linea pertenece a la alerta-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!--pertence al bootstrap-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel= "stylesheet">

</head>
<!-- PROCESO INTENTO DE EJECUCION EN SQL-->
 <!-- ACTULIAZADO 10/06/2024-->
<?php

// define('LBROOT',getcwd()); // LegoBox Root ... the server root
// include("core/controller/Database.php");

if(!isset($_SESSION["user_id"])) {
$user = $_POST['username'];
$pass = sha1(md5($_POST['password']));


function is_sql_injection($input) {
	//die($input);
	$pattern = "/('(''|[^'])*')|(--|#)|(\b(SELECT|INSERT|DELETE|UPDATE|DROP|UNION|EXEC|ALTER|CREATE|TRUNCATE|SHOW|GRANT|REVOKE|LIKE|OR)\b)/i";
    return preg_match($pattern, $input) === 1;
}
$msg ='';
/* METODO GUARDIA */
/*ACTUALIZADO 10/06/2024*/
if (is_sql_injection($user)) {
    $msg='intento de inyecion sql';
	echo "<script>
	document.addEventListener('DOMContentLoaded', function() {
		Swal.fire({
			icon: 'error',
			title: '¡Error!',
			text: '$msg',
			confirmButtonText: 'Aceptar'
		}).then((result) => {
			if (result.isConfirmed) {
				window.location = 'index.php?view=login';
			}
		});
	});
  </script>";
} 
else{$base = new Database();
	$con = $base->connect();
	//$con = Database::conectar();
	 $sql = "select * from user where (email= \"".$user."\" or username= \"".$user."\") and password= \"".$pass."\" and is_active=1";
	//print $sql;
	$query = $con->query($sql);
	$found = false;
	$userid = null;
	while($r = $query->fetch_array()){
		$found = true ;
		$userid = $r['id'];
	}
	
	if($found==true) {
	
	
		$_SESSION['user_id']=$userid ;
	
	// SI HAY USUARIO Y CONTRASEÑA CORRECTA//
		print "<script>window.location='index.php?view=reserva';</script>";
	}else {
		?>
		
		<?php
		print "<script>window.location='index.php?view=login&e=yes';</script>";
	}

}







}else{
	print "<script>window.location='index.php?view=reserva';</script>";
	
}


?>