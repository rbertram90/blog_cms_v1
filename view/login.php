<?php
    $username = "";
    $message= "";
    $continue = true;

    // really quick screen to log in
    if(isset($_POST['fld_username']) && isset($_POST['fld_password']))
    {
        $username = sanitize_string($_POST['fld_username']);
        $password = sanitize_string($_POST['fld_password']);
        
        if(strlen($username) == 0)
        {
            $message = "<p class='error'>Username not entered</p>";
            $continue = false;
        }
        elseif(strlen($password) == 0)
        {
            $message = "<p class='error'>Please complete the password field</p>";
            $continue = false;
        }
        
        if($continue)
        {
            $account = new rbwebdesigns\AccountManager($rb_db);

            if($account->login($username, $password))
            {
                redirect('/');
            }
            else
            {
                $message = "<p class='error'>Login Failed</p>";
            }
        }
    }
?><!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <?=$message;?>
        <form action="/" method="POST">
            <label for="fld_username">Username</label>
            <input type="text" name="fld_username" value="<?=$username?>" />

            <label for="fld_password">Password</label>
            <input type="password" name="fld_password" />

            <button>Login</button>
        </form>
    </body>
</html>