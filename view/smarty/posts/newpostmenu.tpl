{viewCrumbtrail(array("/overview/{$blog['id']}", "{$blog['name']}"), 'Create New Post')}
{viewPageHeader('New Post', 'doc_add.png', $blog.name)}
    
<div class="menu-wrapper">

    <a href="{$clientroot_blogcms}/posts/{$blog.id}/new/standard">
        <img src="{$clientroot}/resources/icons/64/pages.png"/><h4>Standard Post</h4>
        <span class="subtext">Add text and images in a normal blog style editor.</span>

    </a><a href="{$clientroot_blogcms}/posts/{$blog.id}/new/video">
        <img src="{$clientroot}/resources/icons/64/film.png"/><h4>Video Post</h4>
        <span class="subtext">Feature a video in your blog post can still add text and title.</span>

    </a><a href="{$clientroot_blogcms}/posts/{$blog.id}/new/gallery">
        <img src="{$clientroot}/resources/icons/64/camera2.png"/><h4>Gallery Post</h4>        
        <span class="subtext">Add multiple images in a gallery to your blog.</span></a>
    </a>
</div>