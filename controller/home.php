<?php

function home() {
	
	require("./model/adminBD.php");
	if(displayBio($bio)) {
		$_SESSION['bio'] = $bio;
	} else {
		$msg='No bio for the moment ! Please try later bro';
	}


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
		$msg='No content for the moment ! Please try later bro';
	}

	require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
}

$id=isset($_POST['idixi'])?trim($_POST['idixi']):'';
$content=isset($_POST['content'])?trim($_POST['content']):'';

if (!empty($id)) {
    
    $currentDirectory = dirname (getcwd());

    require($currentDirectory . "/model/contentBD.php");
    updateContent($id, $content);
}



?>