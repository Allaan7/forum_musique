<?php

function isNotEmpty($value) {
    global $arrayError;
    if(empty($_POST[$value])){
        $arrayError[$value] = "Le champ $value ne peut pas être vide.";
        return $arrayError;
    }
    return false;
}

function checkFormat($nameInput, $value){
    global $arrayError;
    $regexName = '/^[a-zA-Zà-üÀ-Ü -]{2,255}$/';
    $regexPassword = '/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/';

    switch ($nameInput) {
        case 'pseudo':
            if(!preg_match($regexName, $value)){
                $arrayError['pseudo'] = 'Merci de renseigner un pseudo correcte!';
            }
            break;
        case 'mail':
            if(!filter_var($value, FILTER_VALIDATE_EMAIL)){
                $arrayError['mail'] = 'Merci de renseigner un e-mail correcte!';
            }
            break;
        case 'password':
            if(!preg_match($regexPassword, $value)){
                $arrayError['password'] = 'Merci de donné un mot de passe avec au minimum : 8 caractères, 1 majuscule, 1 miniscule, 1 caractère spécial!';
            }
        break;
    }
}

function check($nameInput, $value){

    isNotEmpty($nameInput);
    $value = htmlspecialchars($value);
    checkFormat($nameInput, $value);

}