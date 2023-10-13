<?php
include('connexion.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $identifiant = $_POST['identifiant'];
    $motdepasse = $_POST['motdepasse'];



    $query = "SELECT identifiant,mdp FROM utilisateur WHERE identifiant='$identifiant'AND mdp='$motdepasse'";
    $UserSelect = $connexion->prepare($query);
    
    $UserSelect->execute();
    $result = $UserSelect->fetch();

       if ($result !== false) {
        // L'utilisateur est authentifié avec succès
        $_SESSION['identifiant'] = $identifiant;
        $_SESSION['connecte']=true;
         // Enregistre l'identifiant dans la session
        echo "Authentification réussie!";
        
        // rediriger l'utilisateur vers accueil
        header('Location: ../myCoach.html');
    } else {
        echo "Identifiant ou mot de passe incorrect";
    }
    $UserSelect->closeCursor(); // Terminez la requête
}
?>
