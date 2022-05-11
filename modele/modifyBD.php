<?php

$id=isset($_POST['id'])?trim($_POST['id']):'';


    // fetch query

    function fetch_data($id, &$articles){
        
        $currentDirectory = dirname (getcwd());

        require($currentDirectory . "/modele/connectBD.php");
        
        $sql = "SELECT * FROM publication WHERE id=" . $id.";";
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
			
		}
		else {
			$articles = $resultat;
			//var_dump($profil);
			
		}
    }

    $fetchData= fetch_data($id, $articles);
    echo ($articles[0]['title'] . "¤");
    echo ($articles[0]['autor'] . "¤");
    echo ($articles[0]['date'] . "¤");
    echo ($articles[0]['bibtex'] . "¤");
    echo ($articles[0]['place'] . "¤");
    echo ($articles[0]['type'] . "¤");
    echo ($articles[0]['id'] . "¤");
    
    function modifyArticle() {
        
    }

?>