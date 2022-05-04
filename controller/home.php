<?php

function home() {
	
	$json = file_get_contents('ressources/Bio.json');
  
	// Decode the JSON file
	$json_data = json_decode($json,true);
	  
	// Display data

	$_SESSION['adminBio'] = $json_data;

	require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
}

?>