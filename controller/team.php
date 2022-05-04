<?php


$firstName=isset($_POST['firstName'])?trim($_POST['firstName']):''; // trim pour enlever les espaces avant et apres
$lastName=isset($_POST['lastName'])?trim($_POST['lastName']):'';
$eMail=(isset($_POST['eMail'])&&!empty($_POST['eMail']))?trim($_POST['eMail']):"NULL";
$homepage=(isset($_POST['homepage'])&&!empty($_POST['homepage']))?trim($_POST['homepage']):"NULL";
$diploma=isset($_POST['diploma'])?trim($_POST['diploma']):'';
$researchInterest=isset($_POST['researchInterest'])?trim($_POST['researchInterest']):'';
$startDate=isset($_POST['startDate'])?trim($_POST['startDate']):'';
$endDate=(isset($_POST['endDate'])&&!empty($_POST['endDate']))?trim($_POST['endDate']):"0000-00-00";

if (!empty($firstName)) {
    $currentDirectory = dirname (getcwd());
    if(!empty($_FILES['the_file']['name'])) {

        $uploadDirectory = "\\ressources\profilPicture\\";
        
        $errors = []; // Store errors here

        $fileExtensionsAllowed = ['jpg',' png', 'jpeg']; // These will be the only file extensions allowed 

        $fileName = $_FILES['the_file']['name'];
        $fileSize = $_FILES['the_file']['size'];
        $fileTmpName  = $_FILES['the_file']['tmp_name'];
        $fileType = $_FILES['the_file']['type'];
        $fileExtension = strtolower(end(explode('.',$fileName)));



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
            $fullName = $fileName;
            
            
            
            } else {
            echo "An error occurred. Please contact the administrator.";
            }
        } else {
            foreach ($errors as $error) {
            echo $error . "These are the errors" . "\n";
            }
        }

        }
    }

    
    if (!isset($fullName)) {
        $fullName = "NULL";
    }
    require($currentDirectory . "/modele/TeamBD.php");

    addTeamBD($firstName, $lastName, $eMail, $homepage, $diploma, $researchInterest, $startDate, $endDate, $fullName);
    
    $nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=team&action=showTeam";
    
    header ("Location:" . $nexturl);

}


function showTeam() {
    $msg ='sqalala';
	
    require("./modele/teamBD.php");
    
    if(displayTeam($team)){
        
		$_SESSION['team'] = $team;
        
	}
	else{
		$msg='No article for the moment ! Please try later bro';
	}

	require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
}

?>

