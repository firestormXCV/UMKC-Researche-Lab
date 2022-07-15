<?php
    //First and only page of the website, the content change depending the 2 variable action and controle
    session_start();                                    //Create the global variable, $_SESSION
    date_default_timezone_set('America/Chicago');       //Set the timezone
    if (isset($_GET["controle"], $_GET["action"])) {    //If a page is selected, render the page
        $controle = $_GET["controle"];
        $action = $_GET["action"];
    } else {                                            //Else go on homepage
        $controle = "home";
        $action = "home";
    }

    require_once "./controller/$controle.php";         //Navigate to the php file corresponding the controle variable
    $action();                                         //Start the function corresponding the action variable
?>  