<?php

$id=isset($_POST['id'])?trim($_POST['id']):'';


    // fetch query

    function fetch_data($id, &$content){
        
        $currentDirectory = dirname (getcwd());

        require($currentDirectory . "/model/connectBD.php");
        
        $sql = "SELECT * FROM content WHERE id=" . $id.";";
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
			$content=array(); 
			
		}
		else {
			$content = $resultat;
			//var_dump($profil);
		}
    }

    $fetchData= fetch_data($id, $content);

    echo ($content[0]['content']);


?>