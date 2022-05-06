<?php

	$caption=isset($_POST['caption'])?trim($_POST['caption']):''; // trim pour enlever les espaces avant et apres
	var_dump($caption);
	if($caption != '') {

		$uploadDirectory = "\\ressources\gallery\\";
		$currentDirectory = dirname (getcwd());
		$errors = []; // Store errors here

		$fileExtensionsAllowed = ['jpg', 'jpeg', 'png']; // These will be the only file extensions allowed 

		$fileName = $_FILES['the_file']['name'];
		$fileSize = $_FILES['the_file']['size'];
		$fileTmpName  = $_FILES['the_file']['tmp_name'];
		$fileType = $_FILES['the_file']['type'];
		$fileExtension = strtolower(end(explode('.',$fileName)));
		
		

		$uploadPath = $currentDirectory . $uploadDirectory . basename($fileName); 

		if (isset($_POST['submit'])) {

		if (! in_array($fileExtension,$fileExtensionsAllowed)) {
			$errors[] = "This file extension is not allowed. Please upload a JPEG, JPG or PNG file";
		}

		if ($fileSize > 4000000) {
			$errors[] = "File exceeds maximum size (4MB)";
		}

		if (empty($errors)) {
			$didUpload = move_uploaded_file($fileTmpName, $uploadPath);

			if ($didUpload) {
			echo "The file " . basename($fileName) . " has been uploaded";
			require($currentDirectory . "/modele/galleryBD.php");
			addPictureBD($caption, $fileName);
			} else {
			echo "An error occurred. Please contact the administrator.";
			}
		} else {
			foreach ($errors as $error) {
			echo $error . "These are the errors" . "\n";
			}
		}

		}
		
		$nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=gallery&action=showGallery";
		header ("Location:" . $nexturl);
	} 

	function showGallery() {
		require("/modele/galleryBD.php");
		if(displayPicture($pictures)){
			$_SESSION['pictures'] = $pictures;
				
		}
		else{
			$msg='No article for the moment ! Please try later bro';
		}
	
		require ("./view/layout/layout.tpl"); //layout lançant le template de vue du service
		
	}

?>