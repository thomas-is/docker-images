<?php

namespace NoLibForIt\Service;

class DumpServer extends \NoLibForIt\API\Service {

  public const ALLOW        = [ "GET" ];
  public const CONTENT_TYPE = "application/json";

  public function handle() {
    $this->answer
      ->json( ['$_SERVER'=>$_SERVER] )
      ->ok();
  }

}

?>
