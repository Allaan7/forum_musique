<?php 
    require_once(__DIR__ . "/../partials/head.php");

?>
<div class="form-wrapper">
    <h1>Inscription</h1>
    <form method="POST">

        <div class="form-item">
            <label for="pseudo"></label>
            <input type="text" id="pseudo" name="pseudo" required="required" placeholder="Votre pseudo"></input>
            <?php if (isset($arrayError['pseudo'])) {
				?>
					<p class='text-danger'><?= $arrayError['pseudo'] ?></p>
				<?php
            } ?>
        </div>

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
            <?php if (isset($arrayError['password'])) {
				?>
					<p class='text-danger'><?= $arrayError['password'] ?></p>
				<?php
            } ?>
        </div>

        <div class="button-panel">
            <input type="submit" class="button" title="Sign In" value="S'inscrire"></input>
        </div>
    </form>
</div>

<?php 
    require_once(__DIR__ . "/../partials/footer.php");
?>