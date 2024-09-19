<?php
    require_once(__DIR__ . "/partials/head.php");
?>
    <h1>Les utilisateurs du forum</h1>
    <h2>Les utilisateurs</h2>
<?php
    if(isset($users)){
        foreach($users as $user){
            ?>
            <a><?= $user['pseudo'] ?></a>
            <?php
        }
    }
?>
    <h2>Les admins</h2>
    <?php
    if(isset($admins)){
        foreach($admins as $admin){
            ?>
            <a><?= $admin['pseudo'] ?></a>
            <?php
        }
    }
?>
    

<?php
    include_once(__DIR__ . "/partials/footer.php");
?>