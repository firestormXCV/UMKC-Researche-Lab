<?php

    $uploadDirectory = "/ressources/publication/";   //set the directory where to upload the file
    $currentDirectory = dirname (getcwd());
    $errors = []; // Store errors here

    $fileExtensionsAllowed = ['pdf']; // These will be the only file extensions allowed 

    $fileName = $_FILES['the_file']['name'];
    $fileSize = $_FILES['the_file']['size'];
    $fileTmpName  = $_FILES['the_file']['tmp_name'];
    $fileType = $_FILES['the_file']['type'];
    $fileExtension = strtolower(end(explode('.',$fileName)));

    $autor=isset($_POST['autor'])?trim($_POST['autor']):''; // fetch the data from the form with POST method
    $date=isset($_POST['date'])?trim($_POST['date']):'';
    $title=isset($_POST['title'])?trim($_POST['title']):'';
    $type=isset($_POST['type'])?trim($_POST['type']):'';
    $place=isset($_POST['place'])?trim($_POST['place']):'';
    $bibtex=isset($_POST['bibtex'])?trim($_POST['bibtex']):'';
    

    $uploadPath = $currentDirectory . $uploadDirectory . basename($fileName); //the futur URL of the file is the addition of the current directory, the upload directory and it's name

    if (isset($_POST['submit'])) {    //if a file as been send

      if (! in_array($fileExtension,$fileExtensionsAllowed)) { //if the file don't have the right extension
        $errors[] = "This file extension is not allowed. Please upload a JPEG or PNG file";
      }

      if ($fileSize > 4000000) { // if file is to big
        $errors[] = "File exceeds maximum size (4MB)";
      }

      if (empty($errors)) { //if there is no error
        $didUpload = move_uploaded_file($fileTmpName, $uploadPath); //upload the file at the targeted location

        if ($didUpload) {
          echo "The file " . basename($fileName) . " has been uploaded";
          require($currentDirectory . "/model/articleBD.php");
          addArticleBD($title, $autor, $fileName, $date,$type, $place, $bibtex);   // Call the function to insert in the database a new entry
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
    header ("Location:" . $nexturl);  //refresh the page

?>