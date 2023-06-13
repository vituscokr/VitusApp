<?php
$user = [ 
    "name" => '',  
    "age" => '' ,
    "terms" => '',
];
$error = [
    "name" => '',
    "age" => '',
    "terms" => false,
];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $validation_filters["name"]["filter"] = FILTER_VALIDATE_REGEXP;
    $validation_filters["name"]["options"]["regexp"] = "/^[A-z]{2,10}$/";
    $validation_filters["age"]["filter"] = FILTER_VALIDATE_INT;
    $validation_filters["age"]["options"]["min_range"] = 18;
    $validation_filters["age"]["options"]["max_range"] = 65;
    $validation_filters["terms"] = FILTER_VALIDATE_BOOLEAN;
    $user = filter_input_array(INPUT_POST, $validation_filters);

    $errors["name"] = $user["name"] ? "" : "Name must be 2-10 letters using A-z"; 
    $errors["age"] = $user["age"] ? "" : "You must be 16-65";
    $errors["terms"] = $user["terms"] ? "" : "You must agree to the terms & conditions";

    $invalid = implode($errors); 

    if ($invalid) {
        $message = "Please correct the following errors";
    }else {
        $message = "Thank you. your data was valid";
    }
     
    $user["name"] = filter_var($user["name"], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    $user["age"] = filter_var($user["age"], FILTER_SANITIZE_NUMBER_INT);
    
}
?>
<?=$message?>
<form action="<?=$_SERVER["PHP_SELF"]?>" method="POST">
Name: <input type="text" name="name" value="<?=$user['name']?>">
<span class="error"><?=$errors['name']?></span><br>
Age: <input type="text" name="age" value="<?=$user['age']?>">
<span class="error"><?=$errors["age"]?></span><br>
<input type="checkbox" name="terms" value="true" <?=$user["terms"] ? "checked": "" ?>>
I agree to the terms and conditions
<span class="error"><?=$errors["terms"]?></span><br>
<input type="submit" value="Save">

</form> 
