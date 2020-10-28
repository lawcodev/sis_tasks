<?php
  require_once 'Controller/Task/ControllerTask.php';
  
  class TaskCore {
    public function CreateControllerTask() {
      $task = new RepositoryTask();
      return new ControllerTask($task);
    }
  }
  
?>