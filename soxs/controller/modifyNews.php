<?php


$title=isset($_POST['title'])?trim($_POST['title']):''; // trim pour enlever les espaces avant et apres
$date=isset($_POST['date'])?trim($_POST['date']):'';
$content=isset($_POST['content'])?trim($_POST['content']):'';
$id=isset($_POST['id'])?trim($_POST['id']):'';


$currentDirectory = dirname (getcwd());
require($currentDirectory . "/model/newsBD.php");
modifyNewsBD($title, $content, $date, $id);
        


$nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=news&action=allNews";
header ("Location:" . $nexturl);
?>