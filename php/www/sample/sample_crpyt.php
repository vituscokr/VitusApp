<?php
/**
 * 보안상 이유로 아래의 코드는 github에 올리지 않도록 합니다.
 */
$_CONFIG["path"] = ".."; 
require_once $_CONFIG["path"]."/include/config.php";
require_once $_CONFIG["path"]."/include/global.php";
require_once $_CONFIG["path"]."/include/crypt.php";
?>
<html>
<head>
</head>

<form action="<?=$_SERVER["PHP_SELF"]?>" method="POST">
<input type="hidden" name="action" value="encrypt">
<input type="text" name="string" >
<input type="submit" value="암호화">
</form>

<form action="<?=$_SERVER["PHP_SELF"]?>" method="POST">
<input type="hidden" name="action" value="decrypt">
<input type="text" name="string" >
<input type="submit" value="복호화">
</form>

<?php
if($_POST["action"] == "encrypt") {
    $string = $_POST["string"];
    $enpassword = Encrypt($string, $_CONFIG["password_key"]);

    echo "문자: $string<br>";
    echo "암호화 : $enpassword";
}else if($_POST["action"] == "decrypt") {
    $string = $_POST["string"];
    $depassword = Decrypt($string, $_CONFIG["password_key"]);
    echo "문자: $string<br>";
    echo "복호화 : $depassword";
}
?>
</html>