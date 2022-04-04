<?php

namespace NoLibForIt\Service;

class Ip extends \NoLibForIt\API\Service {

  public const ALLOW        = [ "GET" ];
  public const CONTENT_TYPE = "application/json";

  public function handle() {

    $socket = fsockopen("api.ipify.org", 80);

    if ( empty($socket) ) {
      $this->answer
        ->plain("Service unavailable")
        ->close(503);
    };

    $lines = "";
    fwrite($socket, "GET / HTTP/1.0\r\nHost: api.ipify.org\r\nAccept: */*\r\n\r\n");
    while ( ! feof($socket) ) {
      $lines .= fgets($socket, 1024);
    }
    fclose($socket);
    $lines = explode("\r\n",$lines);
    $ip = $lines[array_key_last($lines)];

    $this->answer
      ->json(array("ip"=>$ip))
      ->ok();

  }

}
?>
