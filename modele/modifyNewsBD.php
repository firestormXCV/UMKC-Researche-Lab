<?php

$id=isset($_POST['id'])?trim($_POST['id']):'';


    // fetch query

    function fetch_data($id, &$news){
        
        $currentDirectory = dirname (getcwd());

        require($currentDirectory . "/modele/connectBD.php");
        
        $sql = "SELECT * FROM news WHERE id=" . $id.";";
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
			$news=array(); 
			
		}
		else {
			$news = $resultat;
			//var_dump($profil);
		}
    }

    $fetchData= fetch_data($id, $news);

    echo ($news[0]['title'] . "¤");
    echo ($news[0]['content'] . "¤");
    echo ($news[0]['date'] . "¤");

?>