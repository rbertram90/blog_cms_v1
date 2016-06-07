<?php
namespace rbwebdesigns\blogcms;
use rbwebdesigns;

/****************************************************************
    setup.php
		
    Required at the TOP of the index page, after the root include
    but before anything is echoed out.
    
    @author R Bertram
    @date JAN 2013
    
****************************************************************/

    // Setup for 'Plugins' Installed using composer
    require_once SERVER_ROOT.'/vendor/autoload.php';
    require_once SERVER_PATH_BLOGCMS.'/app/vendor/autoload.php';
    
    /**
        https://michelf.ca/projects/php-markdown/
        https://github.com/nickcernis/html-to-markdown
    **/
    
    // Setup - Stage 1
    require_once SERVER_PATH_BLOGCMS.'/app/envsetup.inc.php';

	
/****************************************************************
  Router
****************************************************************/

    $json_string = file_get_contents(SERVER_PATH_BLOGCMS.'/app/config/sitemap.json');
    $pages = json_decode($json_string, true);
    $router = new rbwebdesigns\Router($pages);


/****************************************************************
  Set-Up Users Model & Auth flags
****************************************************************/    
    
    // Connect to Users Database
    $gClsUsers = new rbwebdesigns\Users($rb_db);
	
    // Check if we are logged in
    if(!isset($_SESSION['userid'])) {
        $gbLoggedIn = false;
    }
    else {
        $gbLoggedIn = true;
        $gobjUser = $gClsUsers->getUserById($_SESSION['userid']);
    }
	
    	
/****************************************************************
  Stylesheets - not used?
****************************************************************/

	$global_css_includes = array(
		RBWEB_CLIENT_FILE_ROOT.'/resources/css/core',
		RBWEB_CLIENT_FILE_ROOT.'/resources/css/forms',
	);

/****************************************************************
  JavaScript - not used?
****************************************************************/

	$global_js_includes = array(
		RBWEB_CLIENT_FILE_ROOT.'/resources/js/jquery-1.8.0.min',
		RBWEB_CLIENT_FILE_ROOT.'/resources/js/core-functions',
		RBWEB_CLIENT_FILE_ROOT.'/resources/js/validate',
		RBWEB_CLIENT_FILE_ROOT.'/resources/js/ajax'
	);

/***************************************************************/
?>