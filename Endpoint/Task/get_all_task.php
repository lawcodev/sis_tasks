
<?php
  require_once 'Core/Task/TaskFunctions.php';

  function API_GetAllTasks() {
    $json_success_data = array();
    if($_GET['action'] == 'tasks') {
      $controller = TaskCore::CreateControllerTask(); 
      $json_success_data = $controller->GetAllTasks(1);              
      echo json_encode($json_success_data, JSON_PRETTY_PRINT);
    }
  }
?>