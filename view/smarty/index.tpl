{viewPageHeader('Your Blogs', 'book.png')}

{* Check if this user contributes/ owns to at least 1 blog *}
{if count($blogs) > 0}

    <table cellspacing="2" cellpadding="6" width="100%" class="summary_table">

        <tr>
            <th>Blog Name</th>
            <th>Contributors</th>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
        </tr>
        
        {* Loop through all the blogs this user can contribute to *}
        {foreach from=$blogs item=blog}

            <tr>
                <td>
                    <a href="{$clientroot_blogcms}/overview/{$blog.id}" title="{$blog.name}" style="font-size:120%;">{$blog.name}</a>
                    <br><span class="date">{$blog.latestpost.timestamp}</span>
                </td>
                <td>
                    {foreach from=$blog.contributors item=contributor name=contributors}
                        
                        <a href="{$clientroot}/users/{$contributor.id}" class="user-link" target="_blank">
                        {* Remove whitespace after name *}
                        {strip}
                            {if $contributor.id == $smarty.session.userid}
                                <span data-userid="{$contributor.id}">You</span>
                            {else}
                                <span data-userid="{$contributor.id}">{$contributor.username}</span>
                            {/if}

                            {* Output a comma if this isn't the last item *}
                            {if !$smarty.foreach.contributors.last},{/if}
                        {/strip}
                        </a>
                        
                    {/foreach}

                    <script>
                      $(".user-link").mouseenter(function() {ldelim}showUserProfile($(this), "{$smarty.const.CLIENT_ROOT_ABS}", "{$clientroot_blogcms}"){rdelim});
                      $(".user-link").mouseleave(function() {ldelim}hideUserProfile($(this)){rdelim});
                    </script>
                </td>
                <td width="10">
                    <div class="option-dropdown">
                        <div class="default-option">- Actions -</div>
                        <div class="hidden-options">
                            <a href="{$clientroot_blogcms}/posts/{$blog.id}">Manage Current Posts</a>
                            <a href="{$clientroot_blogcms}/posts/{$blog.id}/new">Create New Post</a>
                            <a href="{$clientroot_blogcms}/contributors/{$blog.id}">Contributors</a>
                            <a href="{$clientroot_blogcms}/config/{$blog.id}">Blog Settings</a>
                            <a href="{$clientroot_blogcms}/files/{$blog.id}">Files</a>
                        </div>
                    </div>             
                </td>
                <td width="74">
                    <a href="{$clientroot_blogcms}/blogs/{$blog.id}" class="action_button btn_red" target="_blank">View Blog</a>
                </td>
            </tr>

        {/foreach}
    
    </table>

{* This user doesn't have any blogs *}
{else}

    <p class="info">You aren't contributing to any blogs, why not <a href="{$clientroot_blogcms}/newblog">create a blog</a>?</p>

{/if}


{* todo: recent updates from blogs the user has subscribed to - see: /app/views/favorite_blogs_summary.php *}