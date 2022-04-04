<?php

namespace NoLibForIt\Service;

class Ping extends \NoLibForIt\API\Service {

  public const ALLOW        = [ "GET" ];
  public const CONTENT_TYPE = "application/pdf";
  public const CHARSET      = "utf-8";

  public function handle() {
    $this->answer
      ->with($this->request)
      ->ok();
  }

}

?>
