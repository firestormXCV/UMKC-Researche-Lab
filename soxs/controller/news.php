<?php

$title=isset($_POST['title'])?trim($_POST['title']):'';
$content=isset($_POST['content'])?trim($_POST['content']):'';
$date=isset($_POST['date'])?trim($_POST['date']):'';

if (!empty($title)) {
    $currentDirectory = dirname (getcwd());
    require($currentDirectory . "/model/newsBD.php");
    addNewsBD($title, $date, $content);
    $nexturl = "http://localhost/UMKC-Researche-Lab/soxs/index.php?controle=news&action=allNews";
    header ("Location:" . $nexturl);
}

function allNews() {

    require("./model/newsBD.php");
    if(displayNews($news)){
		$_SESSION['news'] = $news;
        $_SESSION['news'] = sort_News_date($news);	
        
	}
	else{
		$msg='No news for the moment ! Please try later bro';
	}

    require ("./view/layout/layout-lab.tpl"); //layout lançant le template de vue du service
}

function date_compare($element1, $element2) {
	$datetime1 = strtotime($element1['date']);
	$datetime2 = strtotime($element2['date']);
	return $datetime2 - $datetime1;
}

function sort_News_date($array) {
	usort($array, 'date_compare');
	return $array;
}

?>