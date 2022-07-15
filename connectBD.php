<?php
		

	$hostname = "kc-isia-mysqlpl";	//ou localhost
	$base= "soxs-lab-data";
	$loginBD= "soxslabdata_user";	//ou "root"
	$passBD="254QkcU11Kyb";
	//$pdo = null;

try {

	$pdo = new PDO ("mysql:host=$hostname;dbname=$base", "$loginBD", "$passBD");
}

catch (PDOException $e) {
	die  ("Echec de connexion : " . $e->getMessage() . "\n");
}


///////////////////////////////////////////
//Voici 2 lignes pour tester la connexion seule, en invoquant ce fichier.
//   Eliminer ces 2 lignes si le test est réussi !
//		$ok = 'connexion ok';
//		die ($ok); 




/********************************************************
Ancienne ecriture plus directe pour mysql mais pas polymorphe
if (! isset ($link)) {


$link = mysqli_connect($hote, $login, $pass) 
		or die ("erreur de connexion :" . mysqli_connect_error() 
		. 'numéro :' . mysqli_connect_errno()); 
mysqli_select_db($link, $bd) 
		or die ("erreur d'accès à la base :" . $bd);
		
}
*/




?>
