<?php
/**
    Helpful function to keep the title consistant accross the website
    @param $title - required - text to show as title
    @param $icon - required - name of icon in resources/icons/64 folder
    @param $subtitle - optional - string to show as subtitle
    
    @return - string - HTML to echo
    
    @author R.Bertram
    @date 13/09/2014
**/
function viewPageHeader($title, $icon, $subtitle='') {

    $crr = RBWEB_CLIENT_FILE_ROOT.'/resources';

    if($subtitle==''):
        return <<<EOD
     <img src="{$crr}/icons/64/{$icon}" class="settings-icon" /><h1 class="settings-title">{$title}</h1>
EOD;

    else:
        return <<<EOD
     <img src="{$crr}/icons/64/{$icon}" class="settings-icon" /><h1 class="settings-title" style="margin-top:0px; line-height:32px; margin-bottom:16px;">{$title}<br/><span class="subtitle">{$subtitle}</span></h1>
EOD;
    endif;
}


function viewCrumbtrail($arraypath, $stringcurrentpage) {
    $crb = CLIENT_ROOT_BLOGCMS;

    $output = <<<EOD
        <div class="crumbtrail"><a href="{$crb}">Home</a>
EOD;

    for($i = 0; $i < count($arraypath) - 1; $i=$i+2):
    
        $output.= <<<EOD
<a href='{$crb}{$arraypath[$i]}'>{$arraypath[$i+1]}</a>
EOD;
        
    endfor;
    
    return $output.'<a>'.$stringcurrentpage.'</a></div>';
}
?>