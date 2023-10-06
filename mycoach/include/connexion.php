<?php
$login="root";
$password="";

try{
	$connexion=new PDO('mysql:host=localhost;dbname=mycoach',$login,$password);


}catch(Exeption $e){
	echo "Connexion échoué <br>";
}