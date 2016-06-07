{* Manage Files *}

{viewCrumbtrail(array("/overview/{$blog.id}", {$blog.name}), 'Files')}
{viewPageHeader('Files', 'landscape.png', {$blog.name})}

{if count($images) == 0}
    <p class="info">No images uploaded to this blog</p>
{/if}

<style>
    .imageholder {
        width:31%;
        height:120px;
        display:inline-block;
        background-color:#fff;
        margin:1%;
    }
    .image {
        background-size:cover;
        width:100%;
        height:100%;
        text-align:center;
        padding-top:100px;
    }
    .image button {
        display:none;
    }
    .image:hover button {
        display:inline;
    }
    .imageholder p {
        padding:2px;
        margin:0px;
        font-size:0.9em;
    }
</style>

<div>
    <button type="button" onclick="rbrtf_showWindow('{$clientroot_blogcms}/ajax/view_image_drop?blogid={$blog.id}')" title="Insert Image"><img src="{$clientroot}/resources/icons/document_image_add_32.png" style="width:15px; height:15px;" /> Add Image</button>
    
    <p>Total Space Used = {$foldersize} KB <br> Limit = 50 MB</p>
</div>

<div style="vertical-align:top;">
    {foreach $images as $image}{strip}
    <div class="imageholder">
        <div style="background-image:url('{$clientroot_blogcms}/data/blogs/{$blog.id}/images/{$image.name}');" class="image">
            <form action="{$clientroot_blogcms}/files/{$blog.id}/delete/{$image.file}" method="POST">
                <button onclick="return confirm('Are you sure you want to delete this image?');">Delete</button>
            </form>
        </div>
        <p style="border-bottom:1px solid #ccc;">File size: {$image.size} KB</p>
        <p>Uploaded: {$image.date}</p>
    </div>
    {/strip}{/foreach}
</div>