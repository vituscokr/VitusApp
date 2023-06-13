<?php
/**
 * html 문자열을 이스케이프 처리합니다. 
 * 
 * @param string $string 
 * @return string 
 */
function html_escpae(string $string)
{
    return htmlspecialchars($string, ENT_QUOTES | ENT_HTML5 , 'UTF-8',true);
}

?>