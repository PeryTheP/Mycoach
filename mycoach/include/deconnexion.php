<?php
session_start();
unset($_SESSION['connecte']);
session_destroy();
header('Location: ConnexionUser.php');
?>