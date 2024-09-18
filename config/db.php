<?php

try {
    // Ici je me connecte à la base de données
    $mysqlClient = new PDO('mysql:host=localhost;dbname=forum;charset=utf8', 'root');
} catch(Exception $e) {
    // Ici je recupère et affiche l'erreur
    die('ERREUR : ' . $e->getMessage());
}