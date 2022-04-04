<?php

namespace NoLibForIt\API;

class Map {

  public const NS = "\\NoLibForIt\\Service\\";
  public const SERVICE = array(
    "ping"    => self::NS . "Ping",
    "ip"      => self::NS . "Ip",
    "server"  => self::NS . "DumpServer",
    "auth"    => self::NS . "CheckAuth",
    "test"    => self::NS . "Test",
  );

}
