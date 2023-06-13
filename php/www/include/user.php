<?php
function login(string $username, string $password) 
{
    global $_DB, $_SESSION , $_CONFIG;

    $en_pass = Encrypt($password , $_CONFIG["secrete_key"]);
    $sql = "select * from user where username='$username' and password='$en_pass'";
    $db = $_DB->query($sql);
    $count = $db-> num_rows;
    if($count == 1) {
        $_SESSION["username"] = $username;
        return true;
    }else {
        $_SESSION["username"] = "";
        return false;
    }
}

function logout() 
{
    global $_SESSION;
    $_SESSION["username"] = "";
    session_unset();
    session_destroy();
}

?>