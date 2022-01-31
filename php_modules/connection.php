<?php
    $host="localhost";
    $name="root";
    $password="";
    $dbname="kurosava";
    $db = new PDO("mysql:host=$host;dbname=$dbname", $name, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    if(!$db){
        die('Ошибка соединения: '. mysql_error());
    }
?>