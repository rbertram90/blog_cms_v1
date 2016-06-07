<?php
function getCMSSideMenu($blogid, $p) {
        /*
        $menu = array();
        $menu[] = array('','Your Blogs');
        $menu[] = array('explore', 'Explore Blogs');
        $menu[] = array('changelog', 'Blog CMS Changes');
        if($_SESSION['admin'] == 1) $menu[] = array('developer', 'Developer Docs');    
        $menu[] = array('overview/'.$blogid, 'Overview');
        $menu[] = array('comments/'.$blogid, 'Comments');
        $menu[] = array('posts/'.$blogid, 'Manage Posts');
        $menu[] = array('posts/'.$blogid.'/new', 'Create New Post');
        $menu[] = array('config/'.$blogid, 'Settings');
        $menu[] = array('config/'.$blogid, 'Settings');
        */
    
    
    // (15 June 2015) note: this is a bit of a work-around... we shouldn't be outputting html here...
    $clientroot = CLIENT_ROOT_BLOGCMS;
    
    // Todo: not show the settings menu option to users who do not have permission to perform the actions

return <<<EOD
	<li class="nolink">Blog Actions</li>
	<li><a href="{$clientroot}/overview/{$blogid}">Dashboard</a></li>
	<li><a href="{$clientroot}/comments/{$blogid}">Comments</a></li>
	<li><a href="{$clientroot}/posts/{$blogid}">Manage Posts</a></li>
	<li><a href="{$clientroot}/posts/{$blogid}/new">Create New Post</a></li>
    <li><a href="{$clientroot}/files/{$blogid}">Files</a></li>
	<li><a href="{$clientroot}/config/{$blogid}">Settings</a></li>
	<li><a href="{$clientroot}/contributors/{$blogid}">Contributors</a></li>
	<li><a href="{$clientroot}/blogs/{$blogid}">View Blog</a></li>
EOD;
    
}
?>