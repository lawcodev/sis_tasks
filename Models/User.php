<?php
  class User implements JsonSerializable {
    protected $user_id = 0;
    protected $names;
    protected $last_names;
    
    public function __construct() {}

    //GET
    function getUserId() {
      return $this->user_id;
    }
    function getNames() {
      return $this->names;
    }
    function getLastNames() {
      return $this->last_names;
    }
    //SET
    function setUserId($user_id) {
      $this->user_id = $user_id;
    }
    function setNames($names) {
      $this->names = $names;
    }
    function setLastNames($last_names) {
      $this->last_names = $last_names;
    }

    public function jsonSerialize() {
      return [
        'user_id' => $this->getUserId(),
        'names' => $this->getNames(),
        'last_names' => $this->getLastNames()
      ];
    }
  }

?>