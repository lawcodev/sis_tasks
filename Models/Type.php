<?php
  class Type implements JsonSerializable {
    protected $type_id = 0;
    protected $name;

    public function __construct() {}

    //GET
    function getTypeId() {
      return $this->type_id;
    }
    function getName() {
      return $this->name;
    }
    //SET
    function setTypeId($type_id) {
      $this->type_id = $type_id;
    }
    function setName($name) {
      $this->name = $name;
    }

    public function jsonSerialize() {
      return [
        'type_id' => $this->getTypeId(),
        'name' => $this->getName()
      ];
    }
  }
?>