{* Manage Comments *}

{viewCrumbtrail(array("/overview/{$blog.id}", {$blog.name}), 'Comments')}
{viewPageHeader('Comments', 'comment.png', {$blog.name})}

<p class="info">Total Comments: {count($comments)}</p>

<style>
    .comments-column {ldelim}
        width:50%;
        display:inline-block;
        vertical-align:top;
    {rdelim}
</style>

<div class="comments-column">
{* Output First Column *}
{foreach $comments as $comment}{strip}

    {if $comment@iteration is even}

        <div class="contributor-card" style="height:auto; width:98%;">
            <img src="{$clientroot}/resources/icons/64/cross.png" onclick="if(confirm('Are you sure you wish to delete this comment?')) {ldelim}window.location = '{$clientroot_blogcms}/comments/{$comment.blog_id}/delete/{$comment.id}'{rdelim}" title="Remove Comment" style="height:20px; cursor:pointer; float:right;" />

            <p style="color:#777;">{formatdate($comment.timestamp)}</p>
            <p style="font-size:1.1em;">&#147;{$comment.message}&#148;<a href="{$clientroot}/users/{$comment.user_id}" style="font-size:0.8em;"> - {$comment.user.username}</a></p>

            <p style="font-size:0.75em;">On post <a href="{$clientroot_blogcms}/blogs/{$comment.blog_id}/posts/{$comment.link}">{$comment.title}</a></p>
        </div>

    {/if}

{/strip}{foreachelse}
    <p class="info">No comments have been made on your posts</p>

{/foreach}
    
</div><div class="comments-column">

{* Output Second Column *}
{foreach $comments as $comment}{strip}
    
    {if $comment@iteration is odd}

        <div class="contributor-card" style="height:auto; width:98%;">
            <img src="{$clientroot}/resources/icons/64/cross.png" onclick="if(confirm('Are you sure you wish to delete this comment?')) {ldelim}window.location = '{$clientroot_blogcms}/comments/{$comment.blog_id}/delete/{$comment.id}'{rdelim}" title="Remove Comment" style="height:20px; cursor:pointer; float:right;" />

            <p style="color:#777;">{formatdate($comment.timestamp)}</p>
            <p style="font-size:1.1em;">&#147;{$comment.message}&#148;<a href="{$clientroot}/users/{$comment.user_id}" style="font-size:0.8em;"> - {$comment.user.username}</a></p>

            <p style="font-size:0.75em;">On post <a href="{$clientroot_blogcms}/blogs/{$comment.blog_id}/posts/{$comment.link}">{$comment.title}</a></p>
        </div>

    {/if}
    
{/strip}{/foreach}
</div>


<div class="push-right" style="margin-top:50px;">
    <a href="{$clientroot_blogcms}/posts/{$blog.id}/new" class="action_button">New Post</a>
    <a href="{$clientroot_blogcms}/posts/{$blog.id}" class="action_button">Current Posts</a>
    <a href="{$clientroot_blogcms}/config/{$blog.id}" class="action_button">Manage Settings</a>
    <a href="{$clientroot_blogcms}/contributors/{$blog.id}" class="action_button">Contributors</a>
    <a href="{$clientroot_blogcms}/blogs/{$blog.id}" target="_blank" class="action_button btn_red">View Blog</a>
</div>