<?php

function display() {
    $msgh ='';
    require("./modele/articleBD.php");
    if(displayArticle($articles)){
		$_SESSION['articles']=$articles;	
	}
	else{
		$msg='No article for the moment ! Pls try later bro';
	}

	require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
}

?>