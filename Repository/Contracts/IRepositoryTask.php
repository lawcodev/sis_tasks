<?php
  interface IRepositoryTask {
    public function GetAllTasks($type, $param = null);
    // public function GetByIdTask($finish_date);
    // public function UpdateTask($task);
    // public function CreateTask($task);
    // public function DeleteTask($task_id);
  }
?>