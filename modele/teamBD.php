<?php




    function displayTeam(&$team) {
        
        require("./modele/connectBD.php");
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

	function addTeamBD($firstName, $lastName, $eMail, $homepage, $diploma, $researchInterest, $startDate, $endDate, $pictureName) {
		$currentDirectory = dirname (getcwd());
        
		require($currentDirectory . "/modele/connectBD.php");

        $sql = "INSERT INTO `team` (`id`, `name`, `famillyName`, `diploma`, `pictureName`, `startDate`, `endDate`, `researchInterest`, `email` , `homepage`) 
        VALUES (NULL, '$firstName', '$lastName', '$diploma', '$pictureName', '$startDate', '$endDate', '$researchInterest', '$eMail', '$homepage');";
		try {
			$commande = $pdo->prepare($sql);
		
			

			$bool = $commande->execute();
		} catch (PDOException $e){
			echo utf8_encode("Echec insert into : " . $e->getMessage() . "\n") ;
			die();
		}
	}

?>