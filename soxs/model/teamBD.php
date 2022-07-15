<?php

    function displayTeam(&$team) {
        
        require("./model/connectBD.php");
        $sql = "SELECT * FROM team";
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
			$team=array(); 
			return false; 
		}
		else {
			$team = $resultat;
			//var_dump($profil);
			return true;
		}
    }

	function addTeamBD($firstName, $lastName, $eMail, $homepage, $diploma, $researchInterest, $startDate, $endDate, $pictureName, $grade) {
		$currentDirectory = dirname (getcwd());
		require($currentDirectory . "/model/connectBD.php");
		
        $sql = "INSERT INTO `team` (`id`, `name`, `famillyName`, `diploma`, `pictureName`, `startDate`, `endDate`, `researchInterest`, `email` , `homepage`, `grade`) 
            VALUES (NULL, '$firstName', '$lastName', '$diploma', '$pictureName', '$startDate', '$endDate', '$researchInterest', '$eMail', '$homepage', '$grade');";
		try {
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();

		} catch (PDOException $e){
			echo utf8_encode("Echec insert into : " . $e->getMessage() . "\n") ;
			die();
		}
	}

	function modifyTeamBD($firstName, $lastName, $eMail, $homepage, $diploma, $researchInterest, $startDate, $endDate, $id, $fileName, $grade) {
		$currentDirectory = dirname (getcwd());
		
		require($currentDirectory . "/model/connectBD.php");
		if (!empty($fileName)) {
			if (!empty($grade)) {
				$sql = "UPDATE team 
				SET name ='$firstName' , famillyName = '$lastName', email = '$eMail', homepage = '$homepage', diploma = '$diploma',
				researchInterest = '$researchInterest', startDate = '$startDate', endDate = '$endDate', pictureName = '$fileName', grade ='$grade'
				WHERE id ='$id';";
			} else {
				$sql = "UPDATE team 
				SET name ='$firstName' , famillyName = '$lastName', email = '$eMail', homepage = '$homepage', diploma = '$diploma',
				researchInterest = '$researchInterest', startDate = '$startDate', endDate = '$endDate', pictureName = '$fileName'
				WHERE id ='$id';";
			}
		} else {
			if (!empty($grade)) {
				$sql = "UPDATE team 
				SET name ='$firstName' , famillyName = '$lastName', email = '$eMail', homepage = '$homepage', diploma = '$diploma',
				researchInterest = '$researchInterest', startDate = '$startDate', endDate = '$endDate', grade ='$grade'
				WHERE id ='$id';";
			} else {
				$sql = "UPDATE team 
				SET name ='$firstName' , famillyName = '$lastName', email = '$eMail', homepage = '$homepage', diploma = '$diploma',
				researchInterest = '$researchInterest', startDate = '$startDate', endDate = '$endDate'
				WHERE id ='$id';";
			}
		}
		
					
		
		try {
			
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			
		} catch (PDOException $e){
			var_dump($sql);
			echo utf8_encode("Echec insert into : " . $e->getMessage() . "\n") ;
			die();
		}
	}
?>