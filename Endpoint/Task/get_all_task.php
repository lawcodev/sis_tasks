
<?php
  require_once 'Core/Task/TaskFunctions.php';

  function API_GetAllTasks() {
    $json_success_data = array();
    if($_GET['action'] == 'tasks') {
      $controller = TaskCore::CreateControllerTask(); 
      $tasks = $controller->GetAllTasks(1); 
      $json_success_data = array(
        'api_status' => '200',
        'api_text' => 'success',
        'api_version' => 1.1,
        'api_copyright' => 'lawcodev',
        'tasks' => $tasks
      );    
      header("Content-type: application/json");
      echo json_encode($json_success_data, JSON_PRETTY_PRINT);
    }
  }
?>