{viewCrumbtrail(array("/overview/{$blog.id}", {$blog.name}, "/config/{$blog.id}", 'Settings'), 'Configure Pages')}
{viewPageHeader('Configure Pages', 'pages_gear.png', {$blog.name})}

<h3 style="margin-bottom:0;">Current Pages</h3>
<p style="margin-bottom:10px;">Each post selected as a page will appear (in the order shown) as a link in your blog navigation menu.</p>

{if count($pages) == 0}
    
    <p class='info'>No Pages Found</p>
    
{else}
    
    <table cellpadding="10" width="100%" style="margin-bottom:20px;">
        {foreach from=$pages item=page}
            <tr>
                <td>
                    <a href="{$clientroot_blogcms}/blogs/{$blog.id}/posts/{$page.link}" target="_blank">{$page.title}</a>
                </td>
                <td style="text-align:right;">
                    
                    <form action="{$clientroot_blogcms}/config/{$blog.id}/pages/up" method="POST" style="display:inline">
                        <input type="hidden" name="fld_postid" value="{$page.id}" />
                        <button type="submit">&#x25B2;</button>
                    </form>

                    <form action="{$clientroot_blogcms}/config/{$blog.id}/pages/down" method="POST" style="display:inline">
                        <input type="hidden" name="fld_postid" value="{$page.id}" />
                        <button type="submit">&#x25BC;</button>
                    </form>

                    <form action="{$clientroot_blogcms}/config/{$blog.id}/pages/remove" method="POST" style="display:inline">
                        <input type="hidden" name="fld_postid" value="{$page.id}" />
                        <button type="submit">Remove</button>
                    </form>
                    
                </td>
            </tr>
        {/foreach}
    </table>

{/if}


<h3 style="margin-bottom:0;">Add Page</h3>
<p style="margin-bottom:20px;">You can set blog posts as 'pages' which appear on the menu of your blog</p>

<form action="{$clientroot_blogcms}/config/{$blog.id}/pages/add" method="POST">
    <select name="fld_postid" id="fld_postid">
        
        {foreach from=$posts item=post}
        
            {if in_array({$post.id}, $pagelist) == false}
                <option value="{$post.id}">{$post.title}</option>
            {/if}

        {/foreach}
                
    </select>
    <input type="submit" name="fld_submit" value="Add" />
</form>

<div class="push-right">
    <input type="button" value="Go Back" name="goback" onclick="window.history.back()" />
</div>