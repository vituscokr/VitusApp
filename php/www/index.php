
<?php
$_CONFIG["path"] = ".";
require_once $_CONFIG["path"]."/include/config.php";
require_once $_CONFIG["path"]."/include/global.php";
require_once $_CONFIG["path"]."/include/crypt.php";
require_once $_CONFIG["path"]."/include/user.php"; 

if($_POST["action"] == "login") {
    $username = $_POST["username"] ?? "";
    $password = $_POST["password"] ?? ""; 

    if(isset($username) && isset($password)) {
        if(login($username, $password)) {

        }else {
            print("error login");
        }
    }
}else if($_POST["action"] == "logout") {
    logout();
}

?>

<html>
<head>
</head>
<body>
<form action="<?=$_SERVER['PHP_SELF']?>" method="post">
<input type="text" name="keyword" value="<?=$_POST["keyword"] ?? ""?>">
<input type="submit" value="submit">
</form>

<a href="https://google.com/search?q=<?=$_POST["keyword"] ?? ""?>"  target="_blank" rel="noopener noreferrer"> 구글 검색</a>
<br />
<?php
if(!isset($_SESSION["username"]) || $_SESSION["username"] == ""  ) {
?>
<form action="<?=$_SERVER["PHP_SELF"]?>" method="post">
<input type="hidden" name="action" value="login">
<input type="text" name="username" >
<input type="password" name="password">
<input type="submit" value="login">
</form>
<?php
} else {

    if($_POST["action"] == "addOk") {
        $sitename = $_POST["sitename"] ?? "";
        $username = $_POST["username"] ?? "";
        $password = $_POST["password"] ?? ""; 
        $memo = $_POST["memo"] ?? "";
    
        $pass = Encrypt($password, $_CONFIG['password_key']);
    
        $sql = "insert into my_password set 
        sitename = '$sitename',
        username = '$username',
        password = '$pass',
        memo= '$memo'
        ";
        if($_DB->query($sql)) {
            echo "inserted";  
        }else {
            echo "failed";
        }
    }else if($_POST["action"] == "editOk") {
            $sitename = $_POST["sitename"] ?? "";
            $username = $_POST["username"] ?? "";
            $password = $_POST["password"] ?? ""; 
            $memo = $_POST["memo"] ?? "";
            $uid = $_POST["uid"]; 

        
            $pass = Encrypt($password, $_CONFIG['password_key']);
        
            $sql = "update my_password set 
            sitename = '$sitename',
            username = '$username',
            password = '$pass',
            memo= '$memo',
            udate= now()
            where uid= $uid
            ";
            if($_DB->query($sql)) {
                echo "updated";  
            }else {
                echo "failed";
            }
    
    }else if($_POST["action"] == "del") {
        if ($uid = $_POST["uid"]) {
            $sql = "delete from my_password where uid = $uid";
            if($_DB->query($sql)) {
               // echo "deleted";  
            }else {
               // echo "failed";
            }
        }
    }

?>
<?=$_SESSION["username"]?> 님 안녕하세요! 
<form action="<?=$_SERVER["PHP_SELF"]?>" method="post">
<input type="hidden" name="action" value="logout">
<input type="submit" value="logout">
</form>

<?php
if($_POST["action"] == "search") {
    $keyword = $_POST["keyword"];
}
?>
<form action="<?=$_SERVER["PHP_SELF"]?>" method="post">
    <input type="hidden" name="action" value="search">
    <input type="text" name="keyword" value="<?=$keyword?>">
    <input type="submit" value="검색"> 
</form>


<table>
    <thead>
        <tr>
            <td>id</td>
            <td>site</td>
            <td>username</td>
            <td>pass</td>
            <td>관리</td>
</tr>
</thead>
<tbody>
<?php
if($_POST["action"] == "search") {
    $sql = "select * from my_password where sitename like '%$keyword%' or username like '%$keyword%' ";
}else {
    $sql = "select * from my_password";
}
$db = $_DB->query($sql);

while($row = $db->fetch_assoc()) {

    $action = $_SERVER['PHP_SELF'];
    $num = $row["uid"];
    $sitename = $row["sitename"];
    $username = $row["username"];
    $password = Decrypt($row["password"], $_CONFIG["password_key"]);
    echo "<tr>";
    echo "<td>$num</td>";
    echo "<td>$sitename</td>";
    echo "<td>$username</td>";
    echo "<td>$password</td>";
    echo "<td>
    <form action='$action' method='POST'>
    <input type='hidden' name='uid' value='$num'>
    <input type='hidden' name='action' value='del'>
    <input type='submit' value='삭제' name='삭제'>
    </form>

    <form action='$action' method='POST'>
    <input type='hidden' name='uid' value='$num'>
    <input type='hidden' name='action' value='edit'>
    <input type='submit' value='수정' name='수정'>
    </form>

    
    </td>";
    echo "</tr>"; 
}

?>
</tbody>
</table>


<form action="<?=$_SERVER["PHP_SELF"]?>" method="post">
<input type="hidden" name="action" value="add">
<input type="submit" value="작성">
</form>

<?php
if($_POST["action"] == "add" || $_POST["action"] == "edit") {

    //초기화
    $sitename = "";
    $username = "";
    $password = "";
    $memo = "";

    $action = $_POST["action"] == "add" ? "addOk" : "editOk"; 
    $submit = $_POST["action"] == "add" ? "작성" : "수정"; 

    if($_POST["action"] == "edit") {
        if($uid = $_POST["uid"]) {
            $sql = "select * from my_password where uid=$uid";
            if($db = $_DB->query($sql)) {
                $result = $db->fetch_assoc();
               
               
               $uid = $result["uid"];
               $sitename = $result["sitename"];
               $username = $result["username"];
               $password = Decrypt($result["password"], $_CONFIG['password_key']);
               $memo = $result["memo"];

                

            }
        }

    }


?>
    <form action="<?=$_SERVER["PHP_SELF"]?>" method="post">
    <input type="hidden" name="action" value="<?=$action?>">
    <?php
    if($_POST["action"] == "edit") {
?>
    <input type="hidden" name="uid" value="<?=$uid?>">
<?php
    }
    ?>
    
<table border='1'>


    <tr>
        <td>사이트</td>
        <td><input type="text" name="sitename" value="<?=$sitename?>"></td>
    </tr>
    <tr>
        <td>유저명</td>
        <td><input type="text" name="username" value="<?=$username?>"></td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td><input type="text" name="password" value="<?=$password?>"></td>
    </tr>
    <tr>
        <td>메모</td>
        <td><textarea name="memo"><?=$memo?></textarea></td>
    </tr>
    <tr>
        <td colspan=2> <input type="submit" value="<?=$submit?>"></td>
</tr>
</table>
</form>
<?php
}
}
?>
</body>
</html>
