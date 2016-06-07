<?php
namespace rbwebdesigns\blogcms;
use Codeliner;

/****************************************************************
  Blog CMS System Start Point
****************************************************************/
    
    // Define the absolute path to the Blog CMS client root
    // See if we are running locally or not

    if(strpos($_SERVER['HTTP_HOST'], 'local') === FALSE) {
        // Live system
        define('DOCUMENT_ROOT', $_SERVER['DOCUMENT_ROOT']); // This should not be used outside this file
        define('CLIENT_ROOT_BLOGCMS_ABS', 'http://rbwebdesigns.co.uk/projects/blogcms');
        
    } else {
        // define('DOCUMENT_ROOT', $_SERVER['DOCUMENT_ROOT'].'/rbwebdesigns');
        // define('CLIENT_ROOT_BLOGCMS_ABS', 'http://rbwebdesigns.local:8080/projects/blogcms');
        define('DOCUMENT_ROOT', 'C:/xampp_5.6.11/htdocs/rbwebdesigns');
        define('CLIENT_ROOT_BLOGCMS_ABS', 'http://blogcms.local:8080/projects/blogcms');
    }
    
    // Setup all reletive paths
    require_once DOCUMENT_ROOT.'/root.inc.php';

    
    if(ISDEV)
    {
        $rootservername = "rbwebdesigns.local";
    }
    else
    {
        $rootservername = "www.rbwebdesigns.co.uk";
    }

    if($_SERVER['SERVER_NAME'] != $rootservername)
    {
        define('RBWEB_CLIENT_FILE_ROOT', CLIENT_ROOT_ABS);
    }
    else
    {
        define('RBWEB_CLIENT_FILE_ROOT', CLIENT_ROOT);
    }

    // Include common RBwebdesigns script
    require_once SERVER_PATH_BLOGCMS.'/app/setup.inc.php';

    
/****************************************************************
  Get Request Parameters
****************************************************************/
    
    // Get controller
    $p = isset($_GET['p']) ? safeString($_GET['p']) : -1;

    // Proccess Query String
    if(isset($_GET['query'])) {
        $queryParams = strlen($_GET['query']) > 0 ? explode("/", $_GET['query']) : false;
    } else {
        $queryParams = false;
    }

    // Check if we are in the CMS or viewing a blog
    if($p === 'blogs' && strtolower(gettype($queryParams)) == 'array') {
        
        // Viewing a blog
        
        // Get the ID from the URL (& remove)
        define('BLOG_KEY', array_shift($queryParams));
        
        // Check key is somewhat valid
        if(strlen(BLOG_KEY) !== 10 || !is_numeric(BLOG_KEY)) redirect(CLIENT_ROOT_BLOGCMS.'/notfound');
        
        // Location to blog index file
        $indexPath = BLOGS_ROOT."/".BLOG_KEY."/default.php";
        
        // Check index file exists
        if(file_exists($indexPath)) require $indexPath;
        else redirect(CLIENT_ROOT_BLOGCMS.'/notfound');
        
        // Exit this script
        exit;
        
    } elseif(!$gbLoggedIn) {
        
        // CMS - Check user is logged in
        // if(!isset($_SESSION['userid'])) redirect(CLIENT_ROOT_ABS);
        
        // Show login page
        require_once SERVER_PATH_BLOGCMS.'/app/view/login.php';
        die();
        
        // redirect(CLIENT_ROOT_BLOGCMS.'/accessdenied');
    }


/****************************************************************
  Setup model
****************************************************************/

    $models = array(
        'users' => $GLOBALS['gClsUsers']
    );

// $this->models['users']
//        $this->modelBlogs = new ClsBlog($cms_db);
//        $this->modelContributors = new ClsContributors($cms_db);
//        $this->modelPosts = new ClsPost($cms_db);
//        $this->modelComments = new ClsComment($cms_db);
//        $this->modelUsers = $GLOBALS['gClsUsers'];
//        $this->modelSecurity = new rbwebdesigns\AppSecurity();
    

/****************************************************************
  Setup View
****************************************************************/

    $view = new View($models);


/****************************************************************
  Setup controller
****************************************************************/
    
    // Handle Page Load
    $endpoint = $router->lookup($p);
    if($endpoint === false) $endpoint = $router->lookup("home");

    // Create controller
    switch($p) {
        case 'posts':
            require_once SERVER_PATH_BLOGCMS.'/app/controller/postscms_controller.inc.php';
            $page_controller = new PostsController($cms_db, $view);
            break;

        case 'config':
            require_once SERVER_PATH_BLOGCMS.'/app/controller/settings_controller.inc.php';
            $page_controller = new SettingsController($cms_db, $view);
            break;
            
        case 'files':
            require_once SERVER_PATH_BLOGCMS.'/app/controller/files_controller.inc.php';
            $page_controller = new FilesController($cms_db, $view);
            break;
        
        case 'contributors':
            require_once SERVER_PATH_BLOGCMS.'/app/controller/contributors_controller.inc.php';
            $page_controller = new ContributorController($cms_db, $view);
            break;
        
        case 'ajax':
            require_once SERVER_PATH_BLOGCMS.'/app/controller/ajax_controller.inc.php';
            $page_controller = new AjaxController($cms_db, $view, $queryParams);
            exit; // go no further in this script!
            break;
            
        default:
            require_once SERVER_PATH_BLOGCMS.'/app/controller/blogcms_controller.inc.php';
            $page_controller = new MainController($cms_db, $view);
            break;
    }


/****************************************************************
  Additional site-specific file paths
****************************************************************/

    $css_includes = array(
        CLIENT_ROOT_BLOGCMS.'/css/blogs_stylesheet'
    );
    
    $js_includes = array();
    
    
/****************************************************************
  Default template content
****************************************************************/
    
    // Data Required for each page - Defaulted
    $DATA = array(
        'page_title' => 'Default Page Title',
        'page_description' => 'Default Page Description',
        'includes_css' => array_merge($global_css_includes, $css_includes),
        'includes_js' => array_merge($global_js_includes, $js_includes),
        'page_content' => '',
        'page_menu_actions' => ''
    );

    
/****************************************************************
  Generate final content
****************************************************************/
        
    // Try and get values from JSON
    if(array_key_exists('title', $endpoint)) $DATA['page_title'] = $endpoint['title'];
    if(array_key_exists('description', $endpoint)) $DATA['page_description'] = $endpoint['description'];
    
    // Set the side menu content
    $view->setSideMenu($page_controller->getSideMenu($queryParams, $p));
    
    // Title, description could also be dynamically assigned in this function call
    $page_controller->$endpoint['f']($queryParams);
    
?>