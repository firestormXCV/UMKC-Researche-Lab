<?php

function home() {
	
	$json = file_get_contents('ressources/Bio.json');
  
	// Decode the JSON file
	$json_data = json_decode($json,true);
	  
	// Display data

	$_SESSION['adminBio'] = $json_data;
	
	require("./model/newsBD.php");
    if(displayNews($news)){
		$_SESSION['news'] = $news;
        
        
	}
	else{
		$msg='No news for the moment ! Please try later bro';
	}

	require("./model/contentBD.php");
	if(displayContent($content)){
		$_SESSION['content'] = $content;
        
	}
	else{
		$msg='No article for the moment ! Please try later bro';
	}

	


	require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
}

$id=isset($_POST['idixi'])?trim($_POST['idixi']):'';
$content=isset($_POST['content'])?trim($_POST['content']):'';
var_dump($id);

if (!empty($id)) {
    
    $currentDirectory = dirname (getcwd());

    require($currentDirectory . "/model/contentBD.php");
    updateContent($id, $content);
    $nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=home&action=home";
    header ("Location:" . $nexturl);
}


?>