<?php

function displayContent(&$content) {
    require("./model/connectBD.php");
    $sql = "SELECT * FROM content";
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
        return false; 
    }
    else {
        $content = $resultat;
        //var_dump($profil);
        return true;
    }
}

function updateContent($id, $content) {
    $currentDirectory = dirname (getcwd());

	require($currentDirectory . "/model/connectBD.php");
    $sql = "UPDATE content 
					SET content ='$content'
					WHERE id ='$id';";
    
		try {
			
			$commande = $pdo->prepare($sql);
			$bool = $commande->execute();
			
		} catch (PDOException $e){
			echo utf8_encode("Echec insert into : " . $e->getMessage() . "\n") ;
			die();
		}
}
    
?>