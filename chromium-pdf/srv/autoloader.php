<?php
require_once('config.php');
/**
 *   @autoloader
 **/
spl_autoload_register(
  function ($class) {
  $file = DIR_PHP.DIRECTORY_SEPARATOR.str_replace('\\',DIRECTORY_SEPARATOR,$class).'.php';
  if( file_exists($file) )
    require_once($file);
  else
    error_log("[autoloader] file not found: ".$file);
  }
);
?>
