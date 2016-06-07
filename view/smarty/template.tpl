<!DOCTYPE html>
<html>
<head>
	<title>{$page_title} - Blog CMS from RBwebdesigns</title>
	<link rel="shortcut icon" href="{$clientroot}/resources/icons/64/gear.png" type="image/png" />
    
	<meta charset="UTF-8"> 
	<meta name="description" content="{$page_description}">
    
	<script type="text/javascript">
        function refreshPage() {
            setTimeout("location.reload(true);",1000);
        }
	</script>
	
    {* Add tag for each stylesheet added *}
    {foreach from=$stylesheets item=stylesheet}
        <link rel="stylesheet" type="text/css" href="{$stylesheet}.css" />
    {/foreach}
	
    {* Add tag for each javascript file added *}
    {foreach from=$jsscripts item=script}
        <script type="text/javascript" src="{$script}.js"></script>
    {/foreach}
</head>
<body>
    {* Include the rbwebdesigns global header *}
    {include file="$serverroot/core/view/page_header.tpl"}
    
    <div id="wrapper">
        
        <div id="sidebar">
            
            <div id="logo-holder">
                <img src="{$clientroot_blogcms}/images/logo.png" />
            </div>
            
            <ul>
                {* todo: apply 'current' class back in *}
                <li><a href="{$clientroot_blogcms}/welcome">Welcome</a></li>
                <li><a href="{$clientroot_blogcms}/">My Blogs</a></li>
                <li><a href="{$clientroot_blogcms}/explore">Explore Blogs</a></li>

                {if $smarty.session.admin == 1}
                    <li><a href="{$clientroot_blogcms}/developer">Developer Docs</a></li>
                {/if}
                
                {* Add page-specific menu options *}
                {$page_sidemenu}
            </ul>
        </div>
        
        <div id="content">
            
            <div id="messages">
                {* Check for flash messages *}
                {if isset($smarty.session.messagetoshow) and $smarty.session.messagetoshow != false}				
					{$smarty.session.messagetoshow}
                {/if}
            </div>
            
            {* Output main content *}
            {$content}
        </div>
    </div>
</body>
</html>