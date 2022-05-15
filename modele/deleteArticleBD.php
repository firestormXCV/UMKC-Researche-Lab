<?php

$id=isset($_POST['id'])?trim($_POST['id']):'';
echo '<script>alert("Welcome to Geeks for Geeks")</script>';
$currentDirectory = dirname (getcwd());

require($currentDirectory . "/modele/connectBD.php");

$sql = "DELETE FROM publication WHERE id=" . $id.";";
try{
    $nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=location&action=locate";
    header ("Location:" . $nexturl);
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
echo '<script>alert("Welcome to Geeks for Geeks")</script>';

?>