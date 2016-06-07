{* Blog Overview *}

{viewCrumbtrail(array(), $blog['name'])}
{viewPageHeader("{$blog.name}", 'bargraph.png')}

<div>
    {strip}
    <a href="{$clientroot_blogcms}/posts/{$blog.id}" class="stat-box" title="Manage Posts">{$counts.posts}<br><span class="label">Posts</span></a>
    <a href="{$clientroot_blogcms}/comments/{$blog.id}" class="stat-box" title="View Comments">{$counts.comments}<br><span class="label">Comments</span></a>
    <a href="{$clientroot_blogcms}/contributors/{$blog.id}" class="stat-box" title="Manage Contributors">{$counts.contributors}<br><span class="label">Contributors</span></a>
    <a href="{$clientroot_blogcms}/posts/{$blog.id}" class="stat-box" title="Manage Posts">{$counts.totalviews}<br><span class="label">Total Post Views</span></a>
    {/strip}
</div>

<h3>Latest Posts</h3>
{if $counts.posts > 0}
    {foreach from=$posts item=post}
        <div class="comment-box">
            <a href='{$clientroot_blogcms}/blogs/{$blog.id}/posts/{$post['link']}'>{$post.title}</a>

            {* Label for drafts *}
            {if $post.draft == 1}<i>(draft)</i>{/if}

            {* Label for scheduled posts *}
            {if $post.timestamp > date('Y-m-d H:i:s')}<i>(scheduled)</i>{/if}
            
            <div class="comment-date">
                {formatDate($post.timestamp)}
            </div>
            <div class="comment-info">
                Added by <a href="{$clientroot}/users/{$post.author_id}">{$post.username}</a>
            </div>
        </div>
    {/foreach}
{else}
    <p class="info">Nothing has been posted on this blog, why not <a href="{$clientroot_blogcms}/posts/{$blog.id}/new">make a start</a>?</p>
{/if}


<div class='push-right'>
    <a href='{$clientroot_blogcms}/posts/{$blog.id}' class='action_button'>Manage Posts &gt;</a>
</div>


<h3>Recent Comments</h3>

{if count($comments) > 0}

	{foreach $comments as $comment}
        <div class="comment-box">
            &quot;{$comment.message}&quot;
            <div class="comment-date">
                {formatdate($comment.timestamp)}
            </div>
            <div class="comment-info">
                Added by <a href="{$clientroot}/users/{$comment.userid}">{$comment.name}</a> on <a href="{$clientroot_blogcms}/blogs/{$blog.id}/posts/{$comment.link}">{$comment.title}</a>
            </div>
        </div>
    {/foreach}

    <div class='push-right'>
        <a href='{$clientroot_blogcms}/comments/{$blog.id}' class='action_button'>All Comments &gt;</a>
    </div>
{else}
    <p class="info">No comments have been made on your posts on this blog :(</p>
{/if}

<div class="push-right" style="margin-top:50px;">
    <a href="{$clientroot_blogcms}/posts/{$blog.id}/new" class="action_button">New Post</a>
    <a href="{$clientroot_blogcms}/config/{$blog.id}" class="action_button">Manage Settings</a>
    <a href="{$clientroot_blogcms}/contributors/{$blog.id}" class="action_button">Contributors</a>
    <a href="{$clientroot_blogcms}/blogs/{$blog.id}" target="_blank" class="action_button btn_red">View Blog</a>
</div>