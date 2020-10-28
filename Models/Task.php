<?php
  class Task implements JsonSerializable {
    protected $task_id = 0;
    protected $name;
    protected $start_date;
    protected $finish_date;
    protected $type;
    protected $percentage_plan;
    protected $state;
    protected $user;
    protected $diff_days;
    protected $is_pending;

    public function __construct() {}

    //GET
    function getTaskId() {
      return $this->task_id;
    }
    function getName() {
      return $this->name;
    }
    function getStartDate() {
      return $this->start_date;
    }
    function getFinishDate() {
      return $this->finish_date;
    }
    function getType() {
      return $this->type;
    }
    function getPercentagePlan() {
      return $this->percentage_plan;
    }
    function getState() {
      return $this->state;
    }
    function getUser() {
      return $this->user;
    }
    function getDiffDays() {
      return $this->diff_days;
    }
    function getIsPending() {
      return $this->is_pending;
    }
    //SET
    function setTaskId($task_id) {
      $this->task_id = $task_id;
    }
    function setName($name) {
      $this->name = $name;
    }
    function setStartDate($start_date) {
      $this->start_date = $start_date;
    }
    function setFinishDate($finish_date) {
      $this->finish_date = $finish_date;
    }
    function setType($type) {
      $this->type = $type;
    }
    function setPercentagePlan($percentage_plan) {
      $this->percentage_plan = $percentage_plan;
    }
    function setState($state) {
      $this->state = $state;
    }
    function setUser($user) {
      $this->user = $user;
    }
    function setDiffDays($diff_days) {
      $this->diff_days = $diff_days;
    }
    function setIsPending($is_pending) {
      $this->is_pending = $is_pending;
    }

    public function jsonSerialize() {
      return [
        'task_id' => $this->getTaskId(),
        'name' => $this->getName(),
        'start_date' => $this->getStartDate(),
        'finish_date' => $this->getFinishDate(),
        'percentage_plan' => $this->getPercentagePlan(),
        'state' => $this->getState(),
        'type' => $this->getType(),
        'user' => $this->getUser(),
        'diff_days' => $this->getDiffDays(),
        'is_pending' => $this->getIsPending()
      ];
    }
  }

?>