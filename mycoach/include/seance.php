<?php
session_start();
include('connexion.php');





if (!isset($_SESSION['connecte'])) {
    // Rediriger l'utilisateur vers la page de connexion si non authentifié
    header('Location: ConnexionUser.php');
    exit();
}
  ?>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MyCoach-seance</title>
    <link href="../style/styleS.css" rel="stylesheet">
</head>


<body>
<div class="onglet">
<ul>
        <?php 
     
        if (isset($_SESSION['connecte']) && $_SESSION['connecte'] == true) {
                // Si la condition est vraie, cela signifie que l'utilisateur est connecté.
                echo '<li><a href="myCoach.php">Accueil</a></li>';
               
                // Affiche un lien vers la page "seances.php" pour accéder aux séances
                echo '<li><a href="seances.php">Séances</a></li>';

                // Affiche un lien vers la page "includes/deconnexion.php" pour se déconnecter
                echo '<li><a href="deconnexion.php">Déconnexion</a></li>';
            }?>
</ul>
</div>



<?php 
     try
     {
      //permet d'aller chercher les info dans la BDD
     $seance = "SELECT  HeureDebut,HeureFIN, nomSP, libNIV, nomSA, adresse, cp, ville ,DateS
        FROM seance, sport, niveau, salle
    WHERE sport.id_sport=seance.sport AND niveau.id_niveau=seance.id_NIV AND salle.id_salle=seance.salle";

    $resultatseance = $connexion->query($seance);
      } 
    
    catch (PDOException $e) {
    // En cas d'erreur de la base de données.
    echo "Erreur de la base de données. ";
        }
        
?>


<!--espace pour lisibilité sur page-->

<div class="espace">
    <h1></h1>

</div>


<div >
    <table>
        <tr ><!--haut du tableau -->

            <td>
                Sport  

            </td>
          
             <td>
                 Salle
            </td>
             <td>
                 Niveau  
            </td>
             <td>
                Horaire 
            </td>
            <td>
                Date 
            </td>
        </tr>
        <?php

        //recup chaque ligne de la requete 
        while ($seanceRow = $resultatseance->fetch()) 
        {


            //crée une ligne dans le tableau a chaque entre et une cellule pour chaque caté

        echo "<tr><td>". $seanceRow['nomSP'] . "</h4>"."</td>"; 
        //prend la ligne sport 

        echo "<td>". $seanceRow['nomSA']. "</h4>"."</td>";
        //prend la ligne salle 

        echo "<td>". $seanceRow['libNIV'] . "</h4>"."</td>";
        //prend la ligne niveau
        echo "<td>" . $seanceRow['HeureDebut'] ."  ".$seanceRow['HeureFIN']." </h4>"."</td>";
        //prend la ligne heure debut-fin 


        echo "<td>" . $seanceRow['DateS'] ." </h4>"."</td></tr>";
        }
        //prend la ligne date

         ?>

    </table>
</div>
</div>

</body>
</html>