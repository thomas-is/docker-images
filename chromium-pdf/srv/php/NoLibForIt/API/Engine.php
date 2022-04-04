<?php

namespace NoLibForIt\API;

class Engine {

  /**
    * @static
    * @uses NoLibForIt\API\Request
    * @uses NoLibForIt\API\Answer
    * @uses NoLibForIt\API\Answer
    **/
  public static function start() {

    $request = new Request;
    $answer  = new Answer;

    if( empty(API_MAP_CLASS) ) {
      $answer
        ->plain("Undefined API_MAP_CLASS.")
        ->close(500);
    }
    if( ! class_exists(API_MAP_CLASS) ) {
      $answer
        ->plain("Missing API_MAP_CLASS: " . API_MAP_CLASS)
        ->close(500);
    }

    $mapClass = API_MAP_CLASS;
    $serviceClass = @$mapClass::SERVICE[@$request->argv[0]];

    if( empty($serviceClass) ) {
      $answer
        ->plain("Not found.")
        ->close(404);
    }

    if( ! class_exists($serviceClass) ) {
      $answer
        ->plain("Class $serviceClass does not exist")
        ->close(500);
    }

    if( $request->method == "OPTIONS" ) {
      /**
        * Allow: GET,HEAD,POST,OPTIONS,TRACE
        * Content-Type: application/json
        **/
      if( @$serviceClass::ALLOW ) {
        $answer->setHeader("Allow",implode(",",$serviceClass::ALLOW));
      }
      if( @$serviceClass::CONTENT_TYPE ) {
        $answer->setHeader("Content-Type",$serviceClass::CONTENT_TYPE);
      }
      $answer->ok();
    }

    $service = new $serviceClass($request);
    $service->handle();

    $answer
      ->plain("Service ended with no reply")
      ->close(520);

  }

}

?>
