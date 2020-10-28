<?php

require_once 'Connection.php';
require_once 'Models/Task.php';
require_once 'Models/Type.php';
require_once 'Models/User.php';
require_once 'Contracts/IRepositoryTask.php';

class RepositoryTask implements IRepositoryTask {
    
  public function GetAllTasks($type, $param = null) {
    $connection = Connection::GetConnection();
    $list = array();
    $reader = array(); 
    try {
      if($type == 1) {
        $result = $connection->query("CALL stp_getAllTasks()");  
      } else if($type == 2){
        $result = $connection->query("CALL stp_getByFinishDateTask('" . $param . "')");
      }
      $i = 0;
      while ($fila = $result->fetch_row()) {
        array_push($reader, $fila);   
        $task = new Task();
        $type = new Type();
        $user = new User();

        $task->setTaskId(intval($reader[$i][0]));
        $task->setName($reader[$i][1]);
        $task->setStartDate($reader[$i][2]);
        $task->setFinishDate($reader[$i][3]);
        $task->setPercentagePlan(floatval($reader[$i][4]));
        $task->setState(intval($reader[$i][5]));
        //Tipo
        $type->setTypeId(intval($reader[$i][6]));
        $type->setName($reader[$i][7]);

        $task->setDiffDays(intval($reader[$i][8]));
        $task->setIsPending(intval($reader[$i][9]));
        //Usuario
        $user->setUserId(intval($reader[$i][10]));
        $user->setNames($reader[$i][11]);
        $user->setLastNames($reader[$i][12]);
        
        $task->setType($type);
        $task->setUser($user);
        
        array_push($list, $task);
        $i = $i + 1;
      }
      mysqli_free_result($result);
      mysqli_close($connection);
      return $list;
    }
    catch (Exception $ex) {
      echo $ex;
    }   
  }
}

?>


