<?php

$id=isset($_POST['id'])?trim($_POST['id']):'';

function fetch_data($id, &$team){
        
    $currentDirectory = dirname (getcwd());

    require($currentDirectory . "/model/connectBD.php");
    
    $sql = "SELECT * FROM team WHERE id=" . $id.";";
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
        
    }
    else {
        $team = $resultat;
        //var_dump($profil);
    }
}

$fetchData= fetch_data($id, $team);

echo ($team[0]['name'] . "¤");
echo ($team[0]['famillyName'] . "¤");
echo ($team[0]['diploma'] . "¤");
echo ($team[0]['pictureName'] . "¤");
echo ($team[0]['startDate'] . "¤");
echo ($team[0]['endDate'] . "¤");
echo ($team[0]['researchInterest'] . "¤");
echo ($team[0]['email'] . "¤");
echo ($team[0]['homepage'] . "¤");
echo ($team[0]['id'] . "¤");


?>