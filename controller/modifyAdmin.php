<?php

$uploadDirectoryCV = "\\ressources\\";
$uploadDirectoryPic = "\\ressources\profilPicture\\";
$currentDirectory = dirname (getcwd());
$errors = []; // Store errors here

$fileExtensionsAllowed = ['jpg', 'png', 'jpeg', 'pdf']; // These will be the only file extensions allowed 

$fileNameCV = $_FILES['the_fileCV']['name'];
$fileSizeCV = $_FILES['the_fileCV']['size'];
$fileTmpNameCV  = $_FILES['the_fileCV']['tmp_name'];
$fileTypeCV = $_FILES['the_fileCV']['type'];
$fileExtensionCV = strtolower(end(explode('.',$fileNameCV)));

$fileNamePic = $_FILES['the_filePic']['name'];
$fileSizePic = $_FILES['the_filePic']['size'];
$fileTmpNamePic  = $_FILES['the_filePic']['tmp_name'];
$fileTypePic = $_FILES['the_filePic']['type'];
$fileExtensionPic = strtolower(end(explode('.',$fileNamePic)));


$name=isset($_POST['name'])?trim($_POST['name']):''; // trim pour enlever les espaces avant et apres
$title=isset($_POST['title'])?trim($_POST['title']):'';
$contact=isset($_POST['contact'])?trim($_POST['contact']):'';
$nameCV=isset($_POST['recipient-fileCV'])?trim($_POST['recipient-fileCV']):'';
$namePic=isset($_POST['recipient-filePic'])?trim($_POST['recipient-filePic']):'';


$uploadPathCV = $currentDirectory . $uploadDirectoryCV . basename($fileNameCV); 
$uploadPathPic = $currentDirectory . $uploadDirectoryPic . basename($fileNamePic); 


    if (isset($_POST['submit'])) {

      if (! in_array($fileExtensionCV,$fileExtensionsAllowed) || ! in_array($fileExtensionPic,$fileExtensionsAllowed) ) {
        $errors[] = "This file extension is not allowed. Please upload a PDF file";
      }

      if ($fileSizeCV > 4000000 || $fileSizePic > 4000000) {
        $errors[] = "File exceeds maximum size (4MB)";
      }



        
       

      if ($fileNameCV != '') {
        $didUploadCV = move_uploaded_file($fileTmpNameCV, $uploadPathCV);
      }
      if ($fileNamePic != '') {
        $didUploadPic = move_uploaded_file($fileTmpNamePic, $uploadPathPic);
      }

    }
    require($currentDirectory . "/model/adminBD.php");

    var_dump($fileNameCV, $fileNamePic);
    var_dump($fileNameCV == '');
    var_dump($fileNamePic == '');
    
    if ($fileNameCV == '') {
      $fileNameCV = $nameCV;
    }
    if ($fileNamePic == '') {
      

      $fileNamePic = $namePic;
    }
    var_dump($fileNameCV, $fileNamePic);
    
    
    modifyBioBD($name, $title, $contact,$fileNameCV, $fileNamePic);


$nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=home&action=home";
header ("Location:" . $nexturl);
?>