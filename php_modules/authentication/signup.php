<?php
    require_once("../connection.php");
    
    $login = $_POST['login'];
    $email = $_POST['email'];
    $password= $_POST['password'];
    $passwordRep=$_POST['passwordRep'];

    $errors=false;

    $createdUser=$db->query("SELECT * FROM users");
    // $data=$createdUser->fetchAll();
    var_dump($createdUser);
    if($createdUser){
        echo "Почта занята";
    }else{
        if(strlen($login)<5 || strlen($login)>40){ 
            echo "Длина логина должна быть от 5 до 40 символов";
            $errors=true;
        }
        if(!strlen($password) >= 8){ 
            echo "Пароль должен содежать минимум 8 символов";
            $errors=true;
        }
        if($password != $passwordRep){ 
            echo "Пароли не совпадают";
            $errors=true;
        }
    }
    
    if(!$errors){
        $token=substr(md5(rand()),0,10);
        $hash=md5($password);
        $sqlAdd="SELECT * FROM users";

        // $sqlAdd="INSERT INTO users (`LOGIN`, `PASSWORD`, `EMAIL`, `CONTACTS_LIST_ID`, `GROUP_CHAT_LIST_ID`, `PRIVATE_CHAT_LIST_ID`, `IMG_PROFILE_ID`, `verification`, `token`) VALUES ('$login', '$hash', '$email', '1', '1', '1', '1', '0', '$token')";
        $data=$db->query($sqlAdd);
        // var_dump($data);
    }
?>