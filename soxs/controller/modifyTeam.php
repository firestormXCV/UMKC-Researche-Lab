<?php


$uploadDirectory = "/ressources/profilPicture/";
$currentDirectory = dirname (getcwd());
$errors = []; // Store errors here

$fileExtensionsAllowed = ['png', 'jpg', 'jpeg']; // These will be the only file extensions allowed 

$fileName = $_FILES['the_file']['name'];
$fileSize = $_FILES['the_file']['size'];
$fileTmpName  = $_FILES['the_file']['tmp_name'];
$fileType = $_FILES['the_file']['type'];
$fileExtension = strtolower(end(explode('.',$fileName)));

$firstName=isset($_POST['firstName'])?trim($_POST['firstName']):''; // trim pour enlever les espaces avant et apres
$lastName=isset($_POST['lastName'])?trim($_POST['lastName']):'';
$eMail=(isset($_POST['eMail'])&&!empty($_POST['eMail']))?trim($_POST['eMail']):"NULL";
$homepage=(isset($_POST['homepage'])&&!empty($_POST['homepage']))?trim($_POST['homepage']):"NULL";
$diploma=isset($_POST['diploma'])?trim($_POST['diploma']):'';
$researchInterest=isset($_POST['researchInterest'])?trim($_POST['researchInterest']):'';
$startDate=isset($_POST['startDate'])?trim($_POST['startDate']):'';
$endDate=(isset($_POST['endDate'])&&!empty($_POST['endDate']))?trim($_POST['endDate']):"0000-00-00";
$id=isset($_POST['id'])?trim($_POST['id']):'';
$grade=(isset($_POST['grade'])&&!empty($_POST['grade']))?trim($_POST['grade']):'';

$uploadPath = $currentDirectory . $uploadDirectory . basename($fileName); 

    if (isset($_POST['submit']) && !empty($fileName)) {

      if (! in_array($fileExtension,$fileExtensionsAllowed)) {
        $errors[] = "This file extension is not allowed. Please upload a JPG or PNG file";
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

require($currentDirectory . "/model/teamBD.php");
modifyTeamBD($firstName, $lastName, $eMail, $homepage, $diploma, $researchInterest, $startDate, $endDate, $id, $fileName, $grade);
        


$nexturl = "http://localhost/UMKC-Researche-Lab/soxs/index.php?controle=team&action=showTeam";
header ("Location:" . $nexturl);
?>