<?php

namespace NoLibForIt\Service;

class CheckAuth extends \NoLibForIt\API\Service {

  public const ALLOW        = [ "GET", "POST", "PUT", "PATCH" ];
  public const CONTENT_TYPE = "text/plain; charset=uft-8";

  public function handle() {
    $this->request->requiresAuth();
    $this->answer
      ->with("Access granted")
      ->ok();
  }

}

?>
