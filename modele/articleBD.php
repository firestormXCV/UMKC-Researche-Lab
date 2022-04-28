<?php

    function displayArticle(&$articles) {
        require("./modele/connectBD.php");
        $sql = "SELECT * FROM publication";
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
			$articles=array(); 
			return false; 
		}
		else {
			$articles = $resultat;
			//var_dump($profil);
			return true;
		}
    }

	function addArticleBD($title, $autor, $fileName, $date) {
		$currentDirectory = dirname (getcwd());

		require($currentDirectory . "/modele/connectBD.php");

        $sql = "INSERT INTO `publication` (`id`, `title`, `autor`, `fileName`, `date`) VALUES (NULL, '$title', '$autor', '$fileName', '$date');";
		try {
			$commande = $pdo->prepare($sql);
		
			

			$bool = $commande->execute();
		} catch (PDOException $e){
			echo utf8_encode("Echec insert into : " . $e->getMessage() . "\n") ;
			die();
		}
	}

?>