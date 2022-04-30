<?php

$currentDirectory = dirname (getcwd());

    $uploadDirectory = "\\ressources\publication\\";

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

    $uploadPath = $currentDirectory . $uploadDirectory . basename($fileName); 

    if (isset($_POST['submit'])) {

      if (! in_array($fileExtension,$fileExtensionsAllowed)) {
        $errors[] = "This file extension is not allowed. Please upload a JPEG or PNG file";
      }

      if ($fileSize > 4000000) {
        $errors[] = "File exceeds maximum size (4MB)";
      }

      if (empty($errors)) {
        $didUpload = move_uploaded_file($fileTmpName, $uploadPath);

        if ($didUpload) {
          echo "The file " . basename($fileName) . " has been uploaded";
          require($currentDirectory . "/modele/articleBD.php");
          addArticleBD($title, $autor, $fileName, $date);
        } else {
          echo "An error occurred. Please contact the administrator.";
        }
      } else {
        foreach ($errors as $error) {
          echo $error . "These are the errors" . "\n";
        }
      }

    }
    
    $nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=article&action=displayAll";
    header ("Location:" . $nexturl);

?>