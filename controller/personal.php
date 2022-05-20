<?php

function personal() {

    require("./model/contentBD.php");
    if(displayContent($content)){
		$_SESSION['content'] = $content;
        
	}
	else{
		$msg='No article for the moment ! Please try later bro';
	}

	require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
}

$id=isset($_POST['idix'])?trim($_POST['idix']):'';
$content=isset($_POST['content'])?trim($_POST['content']):'';
var_dump($id);

if (!empty($id)) {
    
    $currentDirectory = dirname (getcwd());

    require($currentDirectory . "/model/contentBD.php");
    updateContent($id, $content);
    $nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=personal&action=personal";
    header ("Location:" . $nexturl);
}

?>