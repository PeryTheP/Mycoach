<?php
include('connexion.php');
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
  <li><a href="../MyCoach.html">Accueil</a></li>
  <li><a href="">Parcours</a></li>
  <li><a href="">Formation</a></li>
  <li><a href="seance.php">Seances</a></li>
  <li><a href="">Contact</a></li>

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
        <tr class="Catego"><!--haut du tableau -->

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