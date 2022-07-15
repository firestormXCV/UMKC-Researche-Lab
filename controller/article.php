<?php

/**
 * displayAll
 * display the article 
 * @return void
 */
function displayAll() {
    $msg ='sqalala';
	
    require("./model/articleBD.php");
    if(displayArticle($articles)){	//fetch the data from the database
		$_SESSION['articles'] = $articles;	//put the article in the session
        $_SESSION['articles'] = sort_Articles_date($articles);	//sort the article by date
	}
	else{
		$msg='No article for the moment ! Please try later bro';
	}

	require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
}

/**
 * date_compare
 * compare the date between 2 date and 
 * @param  mixed $element1 date 1
 * @param  mixed $element2 date 2
 * @return return the difference between the 2 date
 */
function date_compare($element1, $element2) {
	
	$datetime1 = strtotime($element1['date']);
	$datetime2 = strtotime($element2['date']);
	return $datetime2 - $datetime1;
}

/**
 * sort_Articles_date
 *	Sort the array depending the date of the publication, from the most recent to the oldest
 * @param  mixed $array array of publications
 * @return sorted array
 */
function sort_Articles_date($array) {
	usort($array, 'date_compare');
	return $array;
}

?>

