<?php

namespace NoLibForIt\Service;

class Ping extends \NoLibForIt\API\Service {

  public const ALLOW        = [ "GET", "POST", "PUT", "PATCH" ];
  public const CONTENT_TYPE = "application/json";
  public const CHARSET      = "utf-8";

  public function handle() {
    $this->answer
      ->with($this->request)
      ->ok();
  }

}

?>
