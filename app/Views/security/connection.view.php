<?php 
    require_once(__DIR__ . "/../partials/head.php");

?>
<div class="form-wrapper">
    <h1>Connexion</h1>
    <form method="POST">
        <div class="form-item">
            <label for="mail"></label>
            <input type="email" id="mail" name="mail" required="required" placeholder="Addresse email"></input>
            <?php if (isset($arrayError['mail'])) {
				?>
					<p class='text-danger'><?= $arrayError['mail'] ?></p>
				<?php
            } ?>
        </div>

        <div class="form-item">
            <label for="password"></label>
            <input type="password" id="password" name="password" required="required" placeholder="Mot de passe"></input>
        </div>

        <div class="button-panel">
            <input type="submit" class="button" title="connexion" value="Se connecter"></input>
            <?php if (isset($arrayError['password'])) {
				?>
					<p class='text-danger'><?= $arrayError['password'] ?></p>
				<?php
            } ?>
        </div>
    </form>
</div>

<?php 
    require_once(__DIR__ . "/../partials/footer.php");
?>