<?php

$id=isset($_POST['id'])?trim($_POST['id']):'';
$table=isset($_POST['id'])?trim($_POST['table']):'';

$currentDirectory = dirname (getcwd());

require($currentDirectory . "/modele/connectBD.php");

$sql = "DELETE FROM ". $table ." WHERE id=" . $id.";";
try{

    $commande = $pdo->prepare($sql);
    $bool = $commande->execute();


    if ($bool) {
        echo "Record deleted successfully";
        //var_dump($resultat); die(); 
    }
}
catch (PDOException $e) {
    echo utf8_encode("Echec de SQL : " . $e->getMessage() . "\n");
    die(); // On arrête tout
}

$nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=article&action=displayAll";
header ("Location:" . $nexturl);
?>