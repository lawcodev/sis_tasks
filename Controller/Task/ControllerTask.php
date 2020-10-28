<?php 
  require './Repository/RepositoryTask.php';
  class ControllerTask {
    protected $irepository_task;

    public function __construct(IRepositoryTask $irepository_task) {
      $this->irepository_task = new RepositoryTask();
    }

    public function GetAllTasks($type, $param = '') {
      return $this->irepository_task->GetAllTasks($type, $param);
    }
  }
?>