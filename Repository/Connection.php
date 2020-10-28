<?php 
  class Connection {
    public static function GetConnection()
    {
      try
      {       
        $sql_db_host = "localhost";
        $sql_db_user = "root";
        $sql_db_pass = "@Jcs12344321-lw";
        $sql_db_name = "bd_task";
        $connection = new mysqli($sql_db_host, $sql_db_user, $sql_db_pass, $sql_db_name);
        if (mysqli_connect_errno()) {       
          die("No se puede conectar a la base de datos:");
        }
        else {
          return($connection);
        }         
      }
      catch (Exception $ex){ 
        echo $ex;     
      }
    }
  }
?>
