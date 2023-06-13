<?php
header("Access-Control-Allow-Origin: *");
header('Content-type: application/json');

$method = $_SERVER["REQUEST_METHOD"];

$result = "success";
$message = "";
$data = [ "a" => a, "b"=> b, "c" => ["0", "1","2"]];

$data =  [
    "result" => $result,
    "message" => $message,
    "data"  => $data
];

//echo json_encode($data); 


switch($method) {
    case 'GET':
        echo json_encode($data);
        break;
    case "POST":
        echo "post";
        break;
    case "PUT":
        echo "put";
        break;
    case "PATCH":
        echo "patch";
        break;
    case "DELETE":
        echo "delete";
        break;
    default:
        echo "unknown";
        break;
}
?>