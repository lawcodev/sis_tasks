<?php 
  require_once 'Core/Task/TaskFunctions.php';
  require_once 'Endpoint/Task/get_task_by_finish_date.php';
  require_once 'Endpoint/Task/get_all_task.php';
  require_once 'Error/json_error.php';
        
  class TokenEndPoint {
      
    public function __construct(){}
              
    public function EndPoint(){
      header('Content-Type: application/JSON');     
      header('Access-Control-Allow-Origin: *');
      
      $method = $_SERVER['REQUEST_METHOD'];
      if($method == 'GET') {
        $action = $_GET['action'];
        switch ($action) {
          case 'tasks':
            API_GetAllTasks();
            break;
          case 'task':
            API_GetTaskByFinishDate();
            break;
          default:
            GetErrorActionNotFound();
            break;
        }
      }
      else if($method == 'POST') {
        //...code typing
      } 
      else if($method == 'PUT') {
        //...code typing
      }
      else if($method == 'DELETE') {
        //...code typing
      }
    }
  }
?>
