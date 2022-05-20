<?php

function addPictureBD($caption, $fileName) {
    $currentDirectory = dirname (getcwd());

    require($currentDirectory . "/model/connectBD.php");

    $sql = "INSERT INTO `gallery` (`id`, `namePicture`, `caption`) VALUES (NULL, '$fileName', '$caption');";
    try {
        $commande = $pdo->prepare($sql);
    
        

        $bool = $commande->execute();
    } catch (PDOException $e){
        echo utf8_encode("Echec insert into : " . $e->getMessage() . "\n") ;
        die();
    }
}

function displayPicture(&$pictures) {
    require("./model/connectBD.php");
    $sql = "SELECT * FROM gallery";
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
        $pictures=array(); 
        return false; 
    }
    else {
        $pictures = $resultat;
        //var_dump($profil);
        return true;
    }
}

?>