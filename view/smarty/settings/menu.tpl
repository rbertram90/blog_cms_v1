{viewCrumbtrail(array("/overview/{$blog.id}", {$blog.name}), 'Settings')}
{viewPageHeader('Settings', 'gear.png', {$blog.name})}

<p style="margin-bottom:15px;" class="info">This section allows you to change the look and feel of the blog.
These can only be changed by blog administrators.</p>

<div class="menu-wrapper">

    <h3>General</h3>

    <a href="{$clientroot_blogcms}/config/{$blog.id}/general">
    <img src="{$clientroot}/resources/icons/64/id.png"/>
    <h4>Name &amp; Description</h4><span class="subtext">Update the identity of your blog</span>

    </a><a href="{$clientroot_blogcms}/config/{$blog.id}/posts">
    <img src="{$clientroot}/resources/icons/64/pages_gear.png"/>
    <h4>Posts</h4><span class="subtext">Change how posts are displayed</span>

    </a><a href="{$clientroot_blogcms}/config/{$blog.id}/pages">
    <img src="{$clientroot}/resources/icons/64/pages_gear.png"/>
    <h4>Pages</h4><span class="subtext">Add posts to the blog menu</span>

    </a><a href="{$clientroot_blogcms}/config/{$blog.id}/header">
    <img src="{$clientroot}/resources/icons/64/header.png"/>
    <h4>Header</h4><span class="subtext">Settings for your blog header</span>

    </a><a href="{$clientroot_blogcms}/config/{$blog.id}/footer">
    <img src="{$clientroot}/resources/icons/64/footer.png"/>
    <h4>Footer</h4><span class="subtext">Settings for your blog footer</span></a>

    <div style="height:20px;"></div>

    <h3>Design</h3>

    <a href="{$clientroot_blogcms}/config/{$blog.id}/blogdesigner">
    <img src="{$clientroot}/resources/icons/64/paintbrush.png"/>
        <h4>Customise Design</h4><span class="subtext">Fine tune the look of your blog</span>

    </a><a href="{$clientroot_blogcms}/config/{$blog.id}/template">
    <img src="{$clientroot}/resources/icons/64/star_doc.png"/>
        <h4>Change template</h4><span class="subtext">Choose from our pre-made designs</span>

    </a><a href="{$clientroot_blogcms}/config/{$blog.id}/widgets">
    <img src="{$clientroot}/resources/icons/64/oven_gear.png"/>
        <h4>Configure Widgets</h4><span class="subtext">Change what is shown on the sidebar of your blog</span>

    </a><a href="{$clientroot_blogcms}/config/{$blog.id}/stylesheet">
    <img src="{$clientroot}/resources/icons/64/css.png"/>
        <h4>Edit Stylesheet</h4><span class="subtext">Ideal for Advanced Users</span></a>

</div>

<div class="push-right" style="margin-top:60px; width:98%;">
    <a href="{$clientroot_blogcms}/posts/{$blog.id}/new" class="action_button">New Post</a>
    <a href="{$clientroot_blogcms}/posts/{$blog.id}" class="action_button">Current Posts</a>
    <a href="{$clientroot_blogcms}/blogs/{$blog.id}" class="action_button btn_red">View Blog</a>
</div>