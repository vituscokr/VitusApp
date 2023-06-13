<?php

function html_escpae(string $string)
{
    return htmlspecialchars($string, ENT_QUOTES | ENT_HTML5 , 'UTF-8',true);
}

?>