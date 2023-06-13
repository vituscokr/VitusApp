<?php

/**
 * 숫자 범위 체크 
 * @param int $number
 * @param string $min 
 * @param string $max 
 * @return bool 
 */
function is_number($number, int $min =0, int $max= 100) 
{
    return ($number >= $min and $number <= $max); 
}

/**
 * 문자열 길이 체크 
 * @param string $text
 * @param string $min 
 * @param string $max 
 * @return bool 
 */
function is_text($text, int $min =0, int $max = 100) 
{
    $length = mb_strlen($text);
    return ($length >= $min and $length <= $max); 
}

/**
 * 패쓰워드 유효성 검사 
 * @param string $password
 * @return bool 
 */
function is_password(string $password) 
{
    if(
        mb_strlen($password) >=8
        and preg_match('/[A-Z]/', $password)
        and preg_match('/[a-z]/', $password)
        and preg_match('/[0-9]/', $password)        
    ) {
        return true;
    }else {
        return false; 
    }
}
?>