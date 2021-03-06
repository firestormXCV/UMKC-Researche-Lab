<?php

$uploadDirectory = "/ressources/publication/";
$currentDirectory = dirname (getcwd());
$errors = []; // Store errors here

$fileExtensionsAllowed = ['pdf']; // These will be the only file extensions allowed 

$fileName = $_FILES['the_file']['name'];
$fileSize = $_FILES['the_file']['size'];
$fileTmpName  = $_FILES['the_file']['tmp_name'];
$fileType = $_FILES['the_file']['type'];
$fileExtension = strtolower(end(explode('.',$fileName)));


$autor=isset($_POST['autor'])?trim($_POST['autor']):''; // trim pour enlever les espaces avant et apres
$date=isset($_POST['date'])?trim($_POST['date']):'';
$title=isset($_POST['title'])?trim($_POST['title']):'';
$type=isset($_POST['type'])?trim($_POST['type']):'';
$place=isset($_POST['place'])?trim($_POST['place']):'';
$bibtex=isset($_POST['bibtex'])?trim($_POST['bibtex']):'';
$id=isset($_POST['id'])?trim($_POST['id']):'';


$uploadPath = $currentDirectory . $uploadDirectory . basename($fileName); 

    if (isset($_POST['submit'])) {

      if (! in_array($fileExtension,$fileExtensionsAllowed)) {
        $errors[] = "This file extension is not allowed. Please upload a PDF file";
      }

      if ($fileSize > 4000000) {
        $errors[] = "File exceeds maximum size (4MB)";
      }

      if (empty($errors)) {
        $didUpload = move_uploaded_file($fileTmpName, $uploadPath);

        if ($didUpload) {
          echo "The file " . basename($fileName) . " has been uploaded";
          
        } else {
          echo "An error occurred. Please contact the administrator.";
        }
      } else {
        foreach ($errors as $error) {
          echo $error . "These are the errors" . "\n";
        }
      }

    }
    require($currentDirectory . "/model/articleBD.php");
          
    modifyArticleBD($title, $autor, $date,$type, $place, $bibtex, $id, $fileName);


$nexturl = "http://localhost/UMKC-Researche-Lab/soxs/index.php?controle=article&action=displayAll";
header ("Location:" . $nexturl);
?>