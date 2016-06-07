<div class="crumbtrail">
	<a href="{$clientroot_blogcms}">Home</a><a href='{$clientroot_blogcms}/overview/{$blog.id}'>{$blog.name}</a><a href='{$clientroot_blogcms}/contributors/{$blog.id}'>Contributors</a><a>Add</a>
</div>

<img src="{$clientroot}/resources/icons/64/avatar.png" class="settings-icon" />
<h1 class="settings-title" style="margin-top:0px;">Add Contributor<br>
<span class="subtitle">{$blog.name}</span></h1>

<form action="{$clientroot_blogcms}/contributors/{$blog.id}/add/submit" method="POST">
    
	<label for="fld_contributor">Friend</label>
	<select name="fld_contributor" id="fld_contributor">
		<option value="0">Select...</option>
        
	    {foreach from=$friends item=friend}
        
		    <option value="{$friend.id}">{$friend.username} ({$friend.name} {$friend.surname})</option>
        
	    {/foreach}
        
	</select>
    
    <label for="fld_privileges">Access Level</label>
    
    <div class="info" style="font-size:80%;">
        <p><strong>Post Only</strong> <i>(Recommended!)</i> - Allows contributor to post new posts and edit their own posts on the blog.</p>
        <p><strong>All</strong> - Gives the contributor full access over the blog, including to edit stylesheet.</p>
    </div>
    
    <select id="fld_privileges" name="fld_privileges">
        <option value="p" selected>Post Only</option>
        <option value="a">All</option>
    </select>
    
    <div class="push-right">
	    <input type="submit" name="fld_submit_contrib" value="Add Contributor" />
        <input type="button" value="Cancel" name="goback" onclick="window.history.back()" />
    </div>
	
</form>