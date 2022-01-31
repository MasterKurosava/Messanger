<?php
    session_start();
    if($_SESSION['auth']){
        header("Location: pages/main.php");
    }else{
        header("Location: pages/signin.php");
    }
    // header("Location: pages/main.php");
?>