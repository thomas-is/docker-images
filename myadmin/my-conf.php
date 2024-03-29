<?php
/* vim: set expandtab sw=4 ts=4 sts=4: */
/**
 * phpMyAdmin sample configuration, you can use it as base for
 * manual configuration. For easier setup you can use setup/
 *
 * All directives are explained in documentation in the doc/ folder
 * or at <https://docs.phpmyadmin.net/>.
 *
 * @package PhpMyAdmin
 */
//declare(strict_types=1);

  $cfg['PmaAbsoluteUri'] = './';

/**
 * This is needed for cookie based authentication to encrypt password in
 * cookie. Needs to be 32 chars long.
 */
  $cfg['blowfish_secret'] = ''; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

/**
 * Servers configuration
 */
  $i=0;
  $i++;
  $pma_servers = explode(',',getenv('PMA_SERVERS'));
  foreach( $pma_servers as $pma_server ) {
    $cfg['Servers'][$i]['host'] = trim($pma_server);
    $cfg['Servers'][$i]['auth_type'] = 'cookie';
    $cfg['Servers'][$i]['compress'] = false;
    $cfg['Servers'][$i]['AllowNoPassword'] = false;
    $i++;
  }

/**
 * Directories for saving/loading files from server
 */
  $cfg['UploadDir'] = '';
  $cfg['SaveDir'] = '';
