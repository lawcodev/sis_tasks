<?php
  function API_GetAllUsers() {
    $json_success_data = array();
    if($_GET['action'] == 'users') {
      // $controller = TaskCore::CreateControllerTask(); 
      // $tasks = $controller->GetAllTasks(1); 
      $json_success_data = array(
        'api_status' => 200,
        'api_text' => 'success',
        'api_version' => 1.1,
        'api_copyright' => 'lawcodev',
        'users' => []
      );    
      header("Content-type: application/json");
      echo json_encode($json_success_data, JSON_PRETTY_PRINT);
    }
  }
?>