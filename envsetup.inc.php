<?php
/****************************************************************
  Global Definitions
****************************************************************/
    
    define('BLOGS_ROOT', SERVER_PATH_BLOGCMS.'/data/blogs');
    define('TEMPLATES_ROOT', SERVER_PATH_BLOGCMS.'/data/templates');
    define('WIDGETS_ROOT', SERVER_PATH_BLOGCMS.'/app/widgets');

/****************************************************************
  Session Handling
****************************************************************/
    
    // Start Session if not already started
    if(!isset($_SESSION)) session_start();
    
    
/****************************************************************
  Includes from RBwebdesigns
****************************************************************/

    // Language file
    require_once SERVER_ROOT.'/core/lang/en.inc.php';
    
    // Core PHP Function Library
    require_once SERVER_ROOT.'/core/core.php';

    
/****************************************************************
  Constants
****************************************************************/

    // Database Table Names
    if(ISDEV)
    {
        define("DB_NAME_BLOGCMS", 'blog_cms');
        define("TBL_BLOGS", DB_NAME_BLOGCMS.".blogs");
        define("TBL_POSTS", DB_NAME_BLOGCMS.".posts");
        define("TBL_POST_VIEWS", DB_NAME_BLOGCMS.".postviews");
        define("TBL_AUTOSAVES", DB_NAME_BLOGCMS.".postautosaves");
        define("TBL_COMMENTS", DB_NAME_BLOGCMS.".comments");
        define("TBL_CONTRIBUTORS", DB_NAME_BLOGCMS.".contributors");
        define("TBL_FAVOURITES", DB_NAME_BLOGCMS.".favourites");
    }
    else
    {
        define("DB_NAME_BLOGCMS", 'ichiban_blogcms');
        define("TBL_BLOGS", DB_NAME_BLOGCMS.".blogs");
        define("TBL_POSTS", DB_NAME_BLOGCMS.".posts");
        define("TBL_POST_VIEWS", DB_NAME_BLOGCMS.".postviews");
        define("TBL_AUTOSAVES", DB_NAME_BLOGCMS.".postautosaves");
        define("TBL_COMMENTS", DB_NAME_BLOGCMS.".comments");
        define("TBL_CONTRIBUTORS", DB_NAME_BLOGCMS.".contributors");
        define("TBL_FAVOURITES", DB_NAME_BLOGCMS.".favourites");
    }

    
/****************************************************************
  Database Connection
****************************************************************/

    // New DB connection (RBwebdesigns)
    $rb_db = new rbwebdesigns\DB(DB_SERVER, DB_USER, DB_PASS, DB_NAME_RB);
    
    // Connect to the blog_cms database
    $cms_db = new rbwebdesigns\db(DB_SERVER, DB_USER, DB_PASS, DB_NAME_BLOGCMS);
    

/****************************************************************
  Includes
****************************************************************/

    // Smarty
    require_once SERVER_PATH_BLOGCMS.'/app/vendor/smarty/smarty/libs/Smarty.class.php';
    
    // Import class files
    require_once SERVER_PATH_BLOGCMS.'/app/model/mdl_blog.inc.php';
    require_once SERVER_PATH_BLOGCMS.'/app/model/mdl_post.inc.php';
    require_once SERVER_PATH_BLOGCMS.'/app/model/mdl_comment.inc.php';
    require_once SERVER_PATH_BLOGCMS.'/app/model/mdl_contributor.inc.php';
    
    // Generic Controller Class
    require_once SERVER_PATH_BLOGCMS.'/app/controller/generic_bcms_controller.inc.php';

    // Generic View
    require_once SERVER_PATH_BLOGCMS.'/app/view/view.php';

    // Import generic view functions
    require_once SERVER_PATH_BLOGCMS.'/app/view/page_header.php';

?>