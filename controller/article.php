<?php

function displayAll() {
    $msg ='sqalala';
	
    require("./modele/articleBD.php");
    if(displayArticle($articles)){
		$_SESSION['articles'] = $articles;
        $_SESSION['articles'] = sort_Articles_date($articles);	
	}
	else{
		$msg='No article for the moment ! Please try later bro';
	}

	require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
}

function date_compare($element1, $element2) {
	$datetime1 = strtotime($element1['date']);
	$datetime2 = strtotime($element2['date']);
	return $datetime2 - $datetime1;
}

function sort_Articles_date($array) {
	usort($array, 'date_compare');
	return $array;
}

?>