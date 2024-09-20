<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forum Musique</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/public/css/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand d-flex align-items-center text-light" href="/">
      <img src="/public/img/logo.png" alt="Logo For-Zik" width="50" height="50" class="d-inline-block align-text-top">
      ForZic
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active text-light" href="/">Accueil</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-light" href="/">Forums</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active text-light" href="/">Partage</a>
        </li>
        <?php
            if(isset($_SESSION['user'])){
                ?>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/logout"><i class="fa-solid fa-circle-plus"></i> Deconnexion</a>
                </li>
                <?php
                if($_SESSION['user']['role']== "Admin"){
                    ?>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/users"><i class="fa-solid fa-circle-plus"></i> Utilisateurs</a>
                    </li>
                    <?php
                }
            } else {
            ?>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/register"><i class="fa-solid fa-circle-plus"></i> Inscription</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/connection"><i class="fa-solid fa-circle-plus"></i> Connexion</a>
                </li>
            <?php
            }
            ?>
      </ul>
    </div>
  </div>
</nav>