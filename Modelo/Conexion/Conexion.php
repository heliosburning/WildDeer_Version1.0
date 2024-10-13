<?php
  // Datos de conexión
  $server = "b0rzqpj2or25m7edcz6n-postgresql.services.clever-cloud.com";
  $database = "b0rzqpj2or25m7edcz6n";
  $username = "uuf35aqdauedcbislloh";
  $password = "N9EBnDjtFvdrypo7YHIJO1DwTAq9jL";
  $puerto = "50013";

  try {
      $conn = new PDO("pgsql:host=$server;port=$puerto;dbname=$database;", $username, $password);

      //print 'Conexión realizada a la base de datos '.$database;
  } catch (PDOException $e) {
      die('Conexión fallida: ' . $e->getMessage());
  }

?>