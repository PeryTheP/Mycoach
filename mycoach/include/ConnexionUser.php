<?php
include('connexion.php');
include("VerifUser.php");
  ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MyCoach-Connexion</title>
    <link href="../style/styleC.css" rel="stylesheet">
</head>

<form method="post" >
<div class="login-form">
     <a href="myCoach.php">MyCoach</a>
     <div class="form-group ">
       <input type="text" class="form-control" placeholder="Identfiant " name="identifiant">
     </div>

     <div class="form-group log-status">
       <input type="password" class="form-control" placeholder="Mot de passe" name="motdepasse">

     </div>
     <button type="submit" class="log-btn" >Connexion</button>
     
    
   </div>
</form >