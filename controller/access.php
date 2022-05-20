<?php

function login() {
    
    $email=isset($_POST['email'])?trim($_POST['email']):''; // trim pour enlever les espaces avant et apres
    $mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';
    $msg='';

    if (count($_POST)==0) require ("./view/layout/layout.tpl");
    else {
        require('./model/accessBD.php');
        if(verif_LoginBD($email, $mdp, $profil)) {
            $_SESSION['profil'] = $profil;

            var_dump($_POST["remember"]);
            

            if(!empty($_POST["remember"])) {
                setcookie ("member_login",$email ,time()+ (10 * 365 * 24 * 60 * 60));
            } else {
                if(isset($_COOKIE["member_login"])) {
                    setcookie ("member_login","");
                }
            }

            $nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=article&action=displayAll";
            header ("Location:" . $nexturl);
       
        
        } else {
            $msgLog = "Utilisateur inconnu !";
            unset($_SESSION['profil']); //pour ne pas afficher deconnxion lorsqu'il y a une erreur de connexion
            require("./view/layout/layout.tpl");
        }
    
   

	
    }
    
}

function bye() {
    $_SESSION['profil'] = NULL;
    header("Location: index.php");
}	
?>