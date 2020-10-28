<?php
  $json_error_data;
  function GetErrorActionNotFound() {
    $json_error_data = array(
      'api_status' => '400',
      'api_text' => 'failed',
      'api_version' => 1.1,
      'api_copyright' => 'lawcodev',
      'errors' => array(
        'error_id' => '2',
        'error_text' => 'Ruta no encontrada, especifique ruta y/o accion.'
      )
    );
    header("Content-type: application/json");
    echo json_encode($json_error_data, JSON_PRETTY_PRINT);
    exit();
  }
?>