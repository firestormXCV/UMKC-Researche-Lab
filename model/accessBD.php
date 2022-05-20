<?php

    function verif_loginBD($email, $mpd, &$profil) {
        require("./model/connectBD.php");
        $sql="SELECT * FROM `user` WHERE email=:email";
        try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $email);
			

			$bool = $commande->execute();
			if ($bool) {
				$resultat = $commande->fetchAll(PDO::FETCH_ASSOC); //tableau d'enregistrements
				
				$msg=isset($_SESSION['msgErr'])?$_SESSION['msgErr']:'';
	
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
		if (count($resultat) == 0) {
			$profil=array(); // Pour qu'il y ait quand même quelque chose...
			return false; 
		}
		else if (isset($resultat[0]['mdp']) && $resultat[0]['mdp'] == $mpd) {
			$profil = $resultat;;
			//var_dump($profil); die();
			return true;
		}
    }

?>