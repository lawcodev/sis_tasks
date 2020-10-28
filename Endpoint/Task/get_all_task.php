
<?php
  function API_GetAllTasks() {
    require_once 'Core/Task/TaskFunctions.php';
    require_once 'Config/config.php';

    $json_success_data = array();
    if($_GET['action'] == 'tasks') {
      $controller = TaskCore::CreateControllerTask(); 
      $tasks = $controller->GetAllTasks(1); 
      $json_success_data = array(
        'api_status' => 200,
        'api_text' => 'success',
        'api_version' => $api_version,
        'api_copyright' => $api_copyright,
        'tasks' => $tasks
      );    
      header("Content-type: application/json");
      echo json_encode($json_success_data, JSON_PRETTY_PRINT);
    }
  }
?>