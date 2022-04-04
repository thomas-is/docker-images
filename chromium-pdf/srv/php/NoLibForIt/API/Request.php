<?php

namespace NoLibForIt\API;

/**
  * API_BASE_URL must be defined
  * the REQUEST_URI is parsed relatively to API_BASE_URL
  *
  * for example with
  *   API_BASE_URL/endpoint/foo/bar?flag&prop=42
  *
  *   $this->argv[0]       = 'endpoint'
  *   $this->argv[1]       = 'foo'
  *   $this->argv[2]       = 'bar'
  *   $this->param['flag'] = ''
  *   $this->param['prop'] = '42'
  *
  * $this->argc     arguments count
  * $this->argv     arguments list
  * $this->param    associative array or query parameters
  * $this->header   associative array of HTTP headers
  * $this->method   method
  * $this->body     body
  *
  * all query parameters are set as strings
  *
  * empty argv are allowed
  *   API_BASE_URL/////foo
  * will set
  *   $this->argv[0] = ''
  *   $this->argv[1] = ''
  *   $this->argv[2] = ''
  *   $this->argv[3] = ''
  *   $this->argv[4] = 'foo'
  *
  * empty query param is allowed
  *   API_BASE_URL/endpoint?=42
  * will set
  *   $this->param[''] = '42'
  *
  * in case of duplicated query param, only the last one is set
  *   API_BASE_URL/endpoint?a=1&a=2&a=3
  * will set
  *   $this->param['a'] = '3'
  *
  *
  **/
class Request {

  public  int    $argc   = 0;
  public  array  $argv   = array();
  public  array  $param  = array();
  public  array  $header = array();
  public  string $method = "";
  public  string $body   = "";
  private Answer $answer;

  public function __construct() {

    $this->answer = new Answer;

    if( ! defined('API_BASE_URI') ) {
      $this->answer
        ->plain("API_BASE_URI is undefined")
        ->close(500);
    }

    if( ! isset($_SERVER) ) {
      $this->answer
        ->plain("\$_SERVER is not set")
        ->close(500);
    }

    if( ! isset($_SERVER['REQUEST_URI']) ) {
      $this->answer
        ->plain("REQUEST_URI is not set")
        ->close(500);
    }

    $uri = $_SERVER['REQUEST_URI'];

    if( substr($uri,0,strlen(API_BASE_URI)) != API_BASE_URI ) {
      $this->answer
        ->json(
          [
            "error"        => "API_BASE_URI mismatch",
            "API_BASE_URI" => API_BASE_URI,
            "REQUEST_URI"  => $uri,
          ]
        )->close(500);
    }

    $uri = substr($uri,strlen(API_BASE_URI));
    $uri = parse_url($uri);

    if( empty(@$uri['path']) ) {
      $this->answer
        ->plain("URI has no path")
        ->close(500);
    }

    $arg = explode( '/', $uri['path'] );
    if( empty($arg[0]) ) {
      array_shift($arg);
    }
    foreach( $arg as $urlencoded ) {
      $this->argv[]  = urldecode($urlencoded);
    }
    $this->argc = count($this->argv);

    $param = array();
    if( @$uri['query'] ) {
      $param = explode( '&', $uri['query'] );
    }
    foreach( $param as $line ) {
      $element = explode("=",$line);
      $key     = urldecode(@$element[0]);
      $value   = urldecode(@$element[1]);
      $this->param[$key] = $value;
    }

    foreach($_SERVER as $key => $value) {
      if ( substr($key,0,5) <> 'HTTP_' ) {
        continue;
      }
      $prop = str_replace(' ','-',
        ucwords(
          str_replace('_',' ',
            strtolower(
              substr($key, 5)
            )
          )
        )
      );
      $this->header[$prop] = $value;
    }

    $this->method  = @$_SERVER['REQUEST_METHOD'];
    $this->body    = file_get_contents('php://input');

  }

  public function requiresAuth( $headerKey = "Authorization" ) {

    if( ! defined('API_AUTH_FILE') ) {
      $this->answer
        ->plain("API_AUTH_FILE is undefined")
        ->close(500);
    }

    if( ! file_exists(API_AUTH_FILE) ) {
      $this->answer
        ->plain("API_AUTH_FILE not found")
        ->close(500);
    }

    $xauth = @$this->header[$headerKey];
    if( ! $xauth ) {
      $this->answer
        ->plain("Unauthorized")
        ->close(401);
    }

    $token = file_get_contents(API_AUTH_FILE);
    $token = trim($token);

    if( empty($token) ) {
      $this->answer
        ->plain("Empty token not allowed")
        ->close(500);
    }

    if( strlen($token) < 16 ) {
      $this->answer
        ->plain("Insecure token")
        ->close(500);
    }

    if( $xauth != $token ) {
      $this->answer
        ->plain("Forbidden")
        ->close(403);
    }

  }


}

?>
