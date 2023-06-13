<?php
$_CONFIG["path"] = "."; 
require_once $_CONFIG["path"]."/include/config.php";
require_once $_CONFIG["path"]."/include/global.php";
require_once $_CONFIG["path"]."/include/user.php"; 


$message = "";

function get_db_uuid() {
    global $_DB;
    $sql = "select UUID() as uuid";
    $db = $_DB->query($sql);
    $result =$db->fetch_assoc();
    return $result["uuid"];
}



if($_SERVER["REQUEST_METHOD"] == "POST") {

    $action = $_POST["action"];
    // 참고 : https://www.codingfactory.net/13028
    
    if($action =="upload") {
        if($_Files['file']['error'] == 0) {
            $uploaded_file_name_tmp = $_FILES['file']['tmp_name'];
            $uploaded_file_name = $_FILES['file']['name'];
            $uploaded_file_size = $_FILES['file']['size'];
            $uploaded_file_type = $_FILES['file']['type'];
            $uniqid = uniqid(); 
            $upload_dir = "./data/"; 
            $dest = $upload_dir.$uniqid;
            $user_id = get_user_id();

            if(move_uploaded_file($uploaded_file_name_tmp, $dest)) {

                $sql = "insert into files set 
                filename = '$uploaded_file_name',
                uid = '$uniqid',
                filesize = $uploaded_file_size,
                filetype = '$uploaded_file_type',
                wdate = now(),
                user_id = $user_id
                "; 
                //debug($sql);
    
                if ($_DB->query($sql)) {
                    $message = "The file uploaded";
                }else {
                    $message = "file uploaded but insert failed uid : $uniqid";
                }
            }else {
                $message = "The file could not be moved";
            }
        } else {
            $message = "The file could not be uploaded";
        }
    }
    go($_SERVER['PHP_SELF']);
}

?>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>file upload</title>
</head>
<body>
<?php
if (isset($_SESSION["username"]) && $_SESSION["username"] !="") {
?>
<form action="<?=$_SERVER["PHP_SELF"]?>" method="POST" enctype="multipart/form-data">
<input type="file" name="file" accept="image/*" id="image">
<input type="submit" name="action" value="upload">
</form>
<?=$message?>
<?php
$sql = "select * from files";

$db = $_DB->query($sql);
while($row = $db->fetch_assoc()){
    $filename = $row['uid']; 
    echo "<img src='./data/$filename' width=100>";

}

}
?>

</body>
</html>
