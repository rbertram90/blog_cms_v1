    <div class="docs">
    <h1>Documentation</h1>

    <h2>Models</h2>

    <h3>Blogs</h3>

    <h4><i>Constructor</i> - ClsBlogs($dbconn)</h4>
    <p>Construct a new instance of ClsBlogs pass in the DB connection to the blogs database.</p>

    <h4>getBlogsByLetter(char $letter)</h4>
    <p>Fetch all blogs where $letter matches the first character of the blog name.</p>

    <h4>countBlogsByLetter()</h4>
    <p>Fetch a count of all blogs grouped by the first character.</p>
    <p style="color:lightblue;">Just a throught - could we do this in 1 SQL statement?</p>

    <h4>getBlogById(int $id)</h4>
    <p>Fetch all information held in the blogs table for a blog with id = $id.</p>

    <h4>getBlogsByUser(int $userid)</h4>
    <p>Fetch all information held in the blogs table for blogs with user-id = $id.</p>

    <h4>createBlog($pname, $pdesc, $pkey)</h4>
    <p>Create a new blog with given name, description and id which has already been generated.</p>
        
    <h4>deleteBlog($blogid) -- not implemented yet!</h4>
    <p>I will (eventually) have the option to completely delete a blog, however this is more complex than it first seems as not only does the blog need removing from database and physical files but so to do the posts, comments, contributors associated with the blog.</p>
        
    <h4>updateBlog($blogid, $paramNewValues)</h4>
    <p>This is the second version of this function which is more generic and allows any of the matching DB fields to be passed in the array paramater $paramNewValues. This means I can update the database without having to change this part of the code.</p>
        
    <h4>updateWidgetJSON($psJSON, $psBlogID) - Deprecated</h4>
    <p>This will probabily soon merge into function above</p>
        
    <h4>canWrite($blogid)</h4>
    <p>Check if user has permission to write to this blog</p>
        
    <h4>addFavourite($pUserID, $pBlogID)</h4>
    <p>Add blog to the users favourites list - this is called using ajax from the blog view</p>
        
    <h4>removeFavourite($pUserID, $pBlogID)</h4>
    <p>Remove blog to the users favourites list - this is called using ajax from the blog view</p>
        
    <h4>isFavourite($pUserID, $pBlogID)</h4>
    <p>Check if $blog is in $users favourites list - this is called using ajax from the blog view</p>
        
    <h4>getAllFavourites($pUserID)</h4>
    <p>Get all favorite blogs for $user</p>
        
    <h4>getAllFavouritesByBlog($pBlogID)</h4>
    <p>Get users which have favourited a $blog</p>
    
    <h4>getTopFavourites($num=10, $page=0)</h4>
    <p>Get blogs by top favourites</p>

    <h3>Posts</h3>
    <h3>Comments</h3>
    <h3>Contributors</h3>

</div>