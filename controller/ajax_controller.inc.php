<?php
namespace rbwebdesigns\blogcms;

class AjaxController extends GenericBlogCMSController
{
    private $db;
    protected $view;
    
    public function __construct($db, $view, $params)
    {
        $this->db = $db;
        $this->route($params);
        $this->view = $view;
    }
    
    public function route($params)
    {
        $method = ($params == false) ? null : sanitize_string($params[0]);
        
        switch($method)
        {
            case 'get_posts':
                $modelPosts = new ClsPost($this->db);
                $modelUsers = $GLOBALS['gClsUsers'];
                require SERVER_PATH_BLOGCMS.'/app/ajax/get_posts_ajax.php';
                break;
                
            case 'add_image':
                require SERVER_PATH_BLOGCMS.'/app/ajax/add_image_to_post.php';
                break;
			
			case 'widget_settings':
				require SERVER_PATH_BLOGCMS.'/app/ajax/widget_settings.php';
				break;
			
			case 'widget_list':
				if(array_key_exists('element', $_GET))
				{
					$elem = sanitize_string($_GET['element']);
					require SERVER_PATH_BLOGCMS.'/app/ajax/get_widget_list.php';
				}
				else
				{
					echo "No element selected";
				}
				break;

            case 'check_title':
                require SERVER_PATH_BLOGCMS.'/app/ajax/ajax_checkDuplicateTitle.php';
                break;
                
            case 'submit_image_upload':
                require SERVER_PATH_BLOGCMS.'/app/ajax/submit_image_upload.php';
                break;
                
			case 'autosave':
				require SERVER_PATH_BLOGCMS.'/app/ajax/autosave.php';
				break;
                
            case 'view_image_drop':
                require SERVER_PATH_BLOGCMS.'/app/ajax/view_image_drop.php';
                break;
                
            case 'drop_image_upload':
                
                if(isset($_GET['blogid']))
                {
                    $BlogID = sanitize_string($_GET['blogid']);
                }
                else
                {
                    http_response_code(500);
                    die("Could not retrieve blog information");
                }
                
                // Check User Permissions
                $blogModel = new ClsBlog($this->db);
                $blogModel->canWrite($BlogID);
                    
                require SERVER_PATH_BLOGCMS.'/app/ajax/drop_image_upload.php';
                break;
        }
        
        return;
    }
    
}
?>