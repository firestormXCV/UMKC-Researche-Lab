<?php

/**
 * login
 * function to login as an administrator on the site and display the administration button
 * @return void
 */
function login() {
    
    $email=isset($_POST['email'])?trim($_POST['email']):''; // Trim  is used to cut the space/tab before and after the string
    $mdp=isset($_POST['mdp'])?trim($_POST['mdp']):'';
    $msg='';

    if (count($_POST)==0) require ("./view/layout/layout.tpl"); // If no parameter as been receive, just normaly display the login form
    else {                                                      // Else it mean a login request as been send already and the email and password are in the variable from the same name
        require('./model/accessBD.php');
        if(verif_LoginBD($email, $mdp, $profil)) {              // Verif if the password and email match the database
            $_SESSION['profil'] = $profil;                      // Put a variable in the SESSION so the rest of the website is displaying the admin button            

            if(!empty($_POST["remember"])) {                    //If the person who logged in checked the remember me case
                setcookie ("member_login",$email ,time()+ (10 * 365 * 24 * 60 * 60));   //Put the email in the cookies for temporary time
            } else {
                if(isset($_COOKIE["member_login"])) {
                    setcookie ("member_login","");
                }
            }

            $currentDirectory = dirname (getcwd());
            var_dump($currentDirectory);
            //die;
            $nexturl = "http://localhost/UMKC-Researche-Lab/index.php?controle=article&action=displayAll";
            header ("Location:" . $nexturl); //display the publication page
       
        
        } else { //login fail
            $msgLog = "Unkonw User !";
            unset($_SESSION['profil']);             //delete the wrong combination of email and password from the SESSION variable
            require("./view/layout/layout.tpl");    //refresh page
        }
    
   

	
    }
    
}

/**
 * bye
 * Logout function, triggered when logout button is pressed
 * @return void
 */
function bye() {
    $_SESSION['profil'] = NULL; //delete the admin variable so the admin button are now hidden
    header("Location: index.php"); //refresh the current page
}	
?>