{* Manage Posts *}

{viewCrumbtrail(array("{$clientroot_blogcms}/overview/{$blog['id']}", "{$blog.name}"), 'Manage Posts')}
{viewPageHeader('Manage Posts', 'papers.png', "{$blog.name}")}

<div class="table_options" style="float:right;">
    <table cellspacing="0" cellpadding="4">

    <tr><td>
        <label for="numtoshow">Show</label>
        <select id="numtoshow" name="numtoshow">
            <option>5</option>
            <option selected>10</option>
            <option>15</option>
            <option>20</option>
        </select>

    </td><td>
        <label for="sortby">Sort</label>
        <select id="sortby" name="sortby">
            <option value="timestamp DESC">Date Posted (Newest First)</option>
            <option value="timestamp ASC">Date Posted (Oldest First)</option>
            <option value="title ASC">Title (A First)</option>
            <option value="title DESC">Title (Z First)</option>
            <option value="author_id ASC">Author ID (Low -> High)</option>
            <option value="author_id DESC">Author ID (High -> Low)</option>
            <option value="hits DESC">Views (Most First)</option>
            <option value="hits ASC">Views (Least First)</option>
            <option value="uniqueviews DESC">Visitors (Most First)</option>
            <option value="uniqueviews ASC">Visitors (Least First)</option>
            <option value="numcomments DESC">Comments (Most First)</option>
            <option value="numcomments ASC">Comments (Least First)</option>
        </select>

    </td><td>
        <label for="filterdrafts">Show<br>Drafts</label>
        <input type="checkbox" id="filterdrafts" name="filterdrafts" checked />

    </td><td>
        <label for="filterscheduled">Show<br>Scheduled</label>
        <input type="checkbox" checked id="filterscheduled" name="filterscheduled" />

    </td></tr>
    </table>
</div>


<div id="posts_display">Loading...</div>

<script>
    var refreshData = function(pagenum) {
        var numtoshow = $("#numtoshow").val();
        var sortby = $("#sortby").val();
        var filterdrafts = $("#filterdrafts").is(':checked');
        var filterscheduled = $("#filterscheduled").is(':checked');

        $.get("{$clientroot_blogcms}/ajax/get_posts",
            {
                b:{$blog.id},
                s:pagenum,
                n:numtoshow,
                o:sortby,
                fd:filterdrafts,
                fs:filterscheduled

            }, function(data) {
                $("#posts_display").html(data);
            }
        );
    };
    $("#numtoshow").change(function() {
        refreshData(1); // change number that is shown - return to first page
    });
    $("#sortby").change(function() {
        refreshData(1); // change sort & return to first page
    });
    $("#filterdrafts").change(function() {
        refreshData(1);
    });
    $("#filterscheduled").change(function() {
        refreshData(1);
    });

    // Init
    refreshData(1);

</script>

<div class="push-right">
	<a href="{$clientroot_blogcms}/posts/{$blog.id}/new" class="action_button">New Post</a>
	<a href="{$clientroot_blogcms}/blogs/{$blog.id}" class="action_button btn_red">View Blog</a>
</div>