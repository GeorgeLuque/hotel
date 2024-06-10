<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
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
/* metodo guardia */
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




$base = new Database();
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
//	session_start();
//	print $userid;
	$_SESSION['user_id']=$userid ;
//	setcookie('userid',$userid);
//	print $_SESSION['userid'];
	
	print "<script>window.location='index.php?view=reserva';</script>";
}else {
	?>
    <script>
		Swal.fire({
			icon: "error",
			title: "Atencion",
			text: <?php  echo $msg;   ?>,
			});
	</script>
    <?php
	/*print "<script>window.location='index.php?view=login';</script>";*/
}

}else{
	print "<script>window.location='index.php?view=reserva';</script>";
	
}


?>