<?php

function addNewsBD($title, $date, $content) {
    
    $currentDirectory = dirname (getcwd());
    require($currentDirectory . "/model/connectBD.php");

    $sql = "INSERT INTO `news` (`id`, `title`, `date`, `content`) VALUES (NULL, '$title', '$date', '$content');";
    try {
        $commande = $pdo->prepare($sql);
        $bool = $commande->execute();
    } catch (PDOException $e){
        echo utf8_encode("Echec insert into : " . $e->getMessage() . "\n") ;
        die();
    }
}

function displayNews(&$news) {
    require("./model/connectBD.php");
    $sql = "SELECT * FROM news";
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
        return false; 
    }
    else {
        $news = $resultat;
        //var_dump($profil);
        return true;
    }
}

function modifyNewsBD($title, $content, $date, $id) {
    $currentDirectory = dirname (getcwd());

    require($currentDirectory . "/model/connectBD.php");

    $sql = "UPDATE news 
                SET title ='$title' , content = '$content', date = '$date'
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