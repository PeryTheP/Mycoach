<?php
include('connexion.php');


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $identifiant = $_POST['identifiant'];
    $motdepasse = $_POST['motdepasse'];

    // Ajout d'un message de débogage pour vérifier les données POST
    var_dump($_POST);

    $query = "SELECT identifiant,mdp FROM utilisateur WHERE identifiant='$identifiant'AND mdp='$motdepasse'";
    $UserSelect = $connexion->prepare($query);
    
    $UserSelect->execute();
    $result = $UserSelect->fetch();

    // Ajout d'un message de débogage pour vérifier le résultat de la requête
    var_dump($result);

    if ($result !== false) {
        // L'utilisateur est authentifié avec succès
        $_SESSION['identifiant'] = $identifiant;
        $_SESSION['connecte'] = true;

        // Ajout d'un message de débogage pour vérifier si la session est bien définie
        var_dump($_SESSION);

        // Enregistre l'identifiant dans la session
        echo "Authentification réussie !";
        
        // rediriger l'utilisateur vers accueil
        header('Location: myCoach.php');
    } else {
        echo "Identifiant ou mot de passe incorrect";
    }
  
}
?>


