<?php

    function displayBio(&$bio) {
        require("./model/connectBD.php");
        $sql = "SELECT * FROM admin";
        try{
            $commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				//var_dump($resultat); die(); 
			}
        }
        catch (PDOException $e) {
			echo utf8_encode("Echec de SQL : " . $e->getMessage() . "\n");
			die(); // On arrête tout
		}
        if (count($resultat) == 0) {
			$bio=array(); 
			return false; 
		}
		else {
			$bio = $resultat;
			//var_dump($profil);
			return true;
		}
    }

	function modifyBioBD($name, $title, $contact,$fileNameCV, $fileNamePic) {
		$currentDirectory = dirname (getcwd());
		
		require($currentDirectory . "/model/connectBD.php");
		
		$sql = "UPDATE admin 
					SET name ='$name' , title = '$title', cv = '$fileNameCV', pictureName = '$fileNamePic'
					WHERE id = 1;";
		try {
			
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			
		} catch (PDOException $e){
			echo utf8_encode("Echec insert into : " . $e->getMessage() . "\n") ;
			die();
		}
	}

	function fetch_data(&$admin){
        
		$currentDirectory = dirname (getcwd());
		
		
		
		require("C:/Users/33659/Documents/Cour/2A/Pweb/UwAmp/www/UMKC-Researche-Lab/model/connectBD.php");

		
		$sql = "SELECT * FROM admin WHERE id = 1;";
		try{
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				//var_dump($resultat); die(); 
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de SQL : " . $e->getMessage() . "\n");
			die(); // On arrête tout
		}
		if (count($resultat) == 0) {
			$admin =array(); 
			
		}
		else {
			$admin = $resultat;
			//var_dump($profil);
		}
	}

	
		$fetchData= fetch_data($admin);
		
		echo ($admin[0]['name'] . "¤");
		echo ($admin[0]['title'] . "¤");
		echo ($admin[0]['contact'] . "¤");
		



?>