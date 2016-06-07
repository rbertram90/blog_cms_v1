<?php

namespace rbwebdesigns\blogcms;

class GenericBlogCMSController {
    
    protected $view;
    
    public function __construct($cms_db, $view) {
        $this->view = $view;
    }
    
    /**
        Throw Errors - can we include instead!
    **/
    public function throwAccessDenied() {
        redirect(CLIENT_ROOT_BLOGCMS.'/accessdenied');
        return;
    }
    
    public function throwNotFound() {
        redirect(CLIENT_ROOT_BLOGCMS.'/notfound');
        return;
    }
    
    public function notFound($params) {
        // require_once SERVER_PATH_BLOGCMS.'/app/www_root/404.php';
        $this->view->setPageTitle('Page Not Found');
        $this->view->render('404.tpl');
    }
    
    public function accessDenied($params) {
        // require_once SERVER_PATH_BLOGCMS.'/app/www_root/403.php';
        $this->view->setPageTitle('Access Denied');
        $this->view->render('403.tpl');
    }
    
    /**
        Side menu content
    **/
    public function getSideMenu($params, $currentpage) {
        if(gettype($params) === "array") {
            if(strlen($params[0]) === 10 && is_numeric($params[0])) {
                // guessing it is a blog id, should we be checking against the DB here?
                $blogid = $params[0];
                require_once SERVER_PATH_BLOGCMS.'/app/view/sidemenu.php';
                return getCMSSideMenu($blogid, $currentpage);
            }
        }
        return '<li class="nolink">Actions</li><li><a href="'.CLIENT_ROOT_BLOGCMS.'/newblog">Create a new blog</a></li>';
    }

}
?>
                            
                            