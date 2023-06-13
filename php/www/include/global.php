<?php
/**
 * header 출력
 */
header('P3P: CP="NOI CURa ADMa DEVa TAIa OUR DELa BUS IND PHY ONL UNI COM NAV INT DEM PRE"');
/**
 * 세션을 디비에 저장하기 위한 설정
 */

 $_DB_SESSION = "";

 $_CONFIG["session_life"] = get_cfg_var("session.gc_maxlifetime"); 


 function session_open(string $savePath, string $sessionName) :bool 
 {
    global $_CONFIG, $_DB_SESSION;

    $_DB_SESSION = new mysqli(
        $_CONFIG["session_db_host"],
        $_CONFIG["session_db_user"],
        $_CONFIG["session_db_pass"], 
        $_CONFIG["session_db_database"]
    );
    return true;
 }

 function session_close() {
    return true; 
 }

 function session_read($key) {
    global $_DB_SESSION, $_CONFIG;
    $qry = "select session_value FROM sessions WHERE session_key = '$key' AND session_expiry > ".time();
    $db = $_DB_SESSION->query($qry);
    if($result = $db->fetch_assoc()) {
        return $result["session_value"]; 
    }
    return "";
 }

 function session_write($key, $val) {
    global $_DB_SESSION, $_CONFIG;
    $expiry = time() + $_CONFIG['session_life'];
    $value = addslashes($val);
    $qry = "insert into sessions set 
    session_key = '$key',
    session_expiry ='$expiry',
    session_value = '$value'
    ";
    $db = $_DB_SESSION->query($qry);
    if(!$db) {
      $time = time();
        $qry = "update sessions set 
        session_expiry ='$expiry',
        session_value = '$value'
        where session_key = '$key' and session_expiry > $time
        ";
        $db = $_DB_SESSION->query($qry);
    }

    return true;
 }
 function sess_destroy($key) {
    global $_DB_SESSION;

    debug("session_destroy");

    $qry = "delete from sessions where session_key='$key'";

    $db = $_DB_SESSION->query($qry);
    return true;
 }

 function sess_gc($maxlifetime) {
    global $_DB_SESSION;

    $qry = "delete from sessions where session_expiry < ".time();
    $db = $_DB_SESSION->query($qry);
    //return $db->affetched_row();
    return true;
 }

 function set_session_id($session_id) {
    if($session_id){
      @session_id($session_id);
    }
 }

 session_set_save_handler(
   "session_open",
   "session_close",
   "session_read",
   "session_write",
   "sess_destroy",
   "sess_gc"
);
session_set_cookie_params(0,"/",$_CONFIG["cookie_domain"]);
ini_set('session.cache_limiter' ,'nocache, must-revalidate-revalidate');
ini_set('session.cookie_domain', $_CONFIG["cookie_domain"]); 
ini_set("session.save_path", "/home/pi/www/sessions");


session_start(); 

function debug($value) {
    echo "<pre>";
    echo var_dump($value); 
    echo "</pre>";
}

$_DB = new mysqli(
   $_CONFIG["db_host"],
   $_CONFIG["db_user"],
   $_CONFIG["db_password"], 
   $_CONFIG["db_database"]);

$_DB-> set_charset("utf8");
?>