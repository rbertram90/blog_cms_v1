{viewCrumbtrail(array("/overview/{$blog['id']}", $blog['name'], "/config/{$blog['id']}", 'Settings'), 'Template Gallery')}
{viewPageHeader('Template Gallery', 'star_doc.png', $blog['name'])}

<p>To apply a new template to your blog go to the <i>blog manager</i> page and select <i>apply new template</i> from there you can see a list of templates which you can apply and edit.</p>

<p class="info">Warning: Applying a new Template will overwrite any changes you have made using our blog designer!</p>

<div class="template_wrapper">
	<h3>Default Blue</h3>
	<img src="{$clientroot_blogcms}/images/template_screenshots/defaultblue.png" alt="Default Blue Template" width="300" />
	<p>Timeless Classic Blog Design</p>
	<form action="{$clientroot_blogcms}/config/{$blog.id}/template/submit" method="post">
		<input type="hidden" value="tmplt_default_blue" name="template_id" />
		<div class="push-right">
			<input type="submit" value="Apply to Blog" />
		</div>
	</form>
</div>


<div class="template_wrapper">
	<h3>Default Blue - Menu Aligned Left</h3>
	<img src="{$clientroot_blogcms}/images/template_screenshots/template_menu_align_left.png" alt="Blue Template with menu aligning left" width="300" />
	<p>Timeless Classic Blog Design with a slight tweak</p>
	<form action="{$clientroot_blogcms}/config/{$blog.id}/template/submit" method="post">
		<input type="hidden" value="tmplt_blue_rmenu" name="template_id" />
		<div class="push-right">
			<input type="submit" value="Apply to Blog" />
		</div>
	</form>
</div>


<div class="template_wrapper">
	<h3>Black and Yellow</h3>
	<img src="{$clientroot_blogcms}/images/template_screenshots/black_and_yellow.png" alt="Black Template with yellow sub-colour" width="300" />
	<p>A night time feel blog template with hints of construction about it.</p>
	<form action="{$clientroot_blogcms}/config/{$blog.id}/template/submit" method="post">
		<input type="hidden" value="tmplt_black_yellow" name="template_id" />
		<div class="push-right">
			<input type="submit" value="Apply to Blog" />
		</div>
	</form>
</div>

<div class="push-right" style="margin-top:30px;">
    <input type="button" value="Cancel" name="goback" onclick="window.history.back()" />
</div>