<?php

if(count($_POST)>0){
	$is_admin=0;
	if(isset($_POST["is_admin"])){$is_admin=1;}

	$userOld = UserData::getByUserName(trim($_POST["username"]));
	//print_r($userOld);
	if(empty($userOld)){

		
		$user = new UserData();
		$user->name = $_POST["name"];
		$user->lastname = $_POST["lastname"];
		$user->username = trim($_POST["username"]);
		$user->email = $_POST["email"];
		$user->is_admin=$is_admin;
		$user->password = sha1(md5($_POST["password"]));
		$user->add();
		
		
		print "<script>window.location='index.php?view=users';</script>";
	}else{


		?>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<?php

			print("
			<script>
				Swal.fire({
					title: 'Error',
					text: 'Usuario ya registrado con anterioridad',
					icon: 'error',
					confirmButtonText: 'Entendido'
				}).then((result) => {
					if (result.isConfirmed) {
						window.location = 'index.php?view=users';
					}
				});
			</script>
			");


	}


}


?>
