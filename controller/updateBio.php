<?php 

$bio=isset($_POST['bio'])?trim($_POST['bio']):'';

$json = json_encode($bio);
$bytes = file_put_contents("../ressources/Bio.json", $json); //generate json file
echo "Here is the myfile data $bytes.";


?>