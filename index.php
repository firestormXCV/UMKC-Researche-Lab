<?php
    session_start();
    date_default_timezone_set('America/Chicago');
    if (isset($_GET["controle"], $_GET["action"])) {
        $controle = $_GET["controle"];
        $action = $_GET["action"];
    } else {
        $controle = "article";
        $action = "displayAll";
    }

    require_once "./controller/$controle.php";
    $action();
?>