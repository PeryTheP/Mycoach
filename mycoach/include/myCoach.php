

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>MyCoach</title>
	<link href="../style/style.css" rel="stylesheet">
</head>



<body>
<div class="onglet">
<ul>
  <li><a href="">Accueil</a></li>

    <?php
    session_start();
    if (!isset($_SESSION['connecte'])) {

        echo"<li><a href='seance.php'>Seances</a></li>";
        echo"<li><a href='ConnexionUser.php'>Connexion</a></li>"  ;
}
    else{
        echo"<li><a href='seance.php'>Seances</a></li>";
        echo"<li><a href='ConnexionUser.php'>Deconnexion</a></li>"  ;
    }
?>

  

</ul>
</div>

<div class="titre">
	<h1 >Lionel Tronc</h1>
</div>



<div>
    <h2 class="Sous-titre">Description</h2>
    <div class="contenu">
        <p class="imglionel"><img src="../image/lionelT.jpg"></p>

<p class="textDesc"> Rencontrez Lionel Tronc, coach sportif en ligne dévoué et passionné. Fort de plus d'une décennie d'expérience, Lionel a guidé des clients de tous horizons vers leurs objectifs de remise en forme et de performance sportive. Son approche générale  de l'entraînement intègre l'équilibre entre la musculation, le conditionnement physique et une nutrition adaptée. Grâce à une expertise pointue et un soutien inébranlable, Lionel est le partenaire idéal pour atteindre vos aspirations sportives, quels que soient votre niveau de forme actuel et vos ambitions.
</p>
 
 </div>
</div>


<p></p>

<div class="tables">
    <table style="width:100%">
        <tr>
            <th class="competence">Competence</th>
            <th class="formation">Formation</th>
        </tr>
        <tr>
            <td class="competence">
            	<li>Coach Sportif en Ligne indépendant depuis 2010</li><br>
            	<li>Ancien athlète de haut niveau avec plus de 15 ans d'expérience dans diverses disciplines sportives</li><br>
            	<li>Entraîneur personnel pour des clients variés, allant de débutants à des sportifs confirmés</li><br>
            	<li>Spécialisé dans la remise en forme, la musculation, le conditionnement physique et la préparation </li><br>
            	
							</td>
            <td class="formation">
            	<li>Diplômé en Sciences du Sport et de l'Entraînement</li><br>
            	<li>Ancien athlète de haut niveau avec plus de 15 ans d'expérience dans diverses disciplines sportives</li><br>
            	<li>Entraîneur personnel pour des clients variés, allant de débutants à des sportifs confirmés</li><br>
            	<li>Spécialisé dans la remise en forme, la musculation, le conditionnement physique et la préparation </li><br>
            	</td>
        </tr>
    </table>
</div>
</div>

</body>
</html> 