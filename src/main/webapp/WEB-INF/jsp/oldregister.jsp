<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Welcome to My Website</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Welcome to My Website" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
		        <link rel="stylesheet" type="text/css" href="css/footer.css" />
		
		<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
    <div>
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">About Us</a></li>
      <li><a href="#">Contact US</a></li>
      <li><a href="#">Page 3</a></li>
    </ul>
  </div>
</nav>



  
  
 
            <header>
                <h1>Welcome to My Website</h1>
				
            </header>
            <section>				
                <div id="container_demo" >
                   
                    <div id="wrapper">
                    
                        <div id="login" class="animate form">
                            <form  action="saveuser" method="post" autocomplete="on" modelAttribute="emp">
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="uname" class="uname" data-icon="u">Username</label>
                                    <input id="uname" name="uname" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                <p> 
                                    <label for="email" class="email" data-icon="e" > Email</label>
                                    <input id="email" name="email" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                                </p>
                                <p> 
                                    <label for="password" class="password" data-icon="p">Password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                
                                    <label for="confirm_password" class="confirm_password" data-icon="p">Confirm Password </label>
                                    <input id="confirm_password" name="confirm_password" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                 <p> 
                                    <label for="country" class="country" data-icon="u" > Country</label>
                                    <input id="country" name="country" required="required" type="country" placeholder="country"/> 
                                </p>
                                 <p> 
                                    <label for="state" class="state" data-icon="u" > State</label>
                                    <input id="state" name="state" required="required" type="state" placeholder="state"/> 
                                </p>
                                
                                <p> 
                                    <label for="city" class="city" data-icon="u" > City</label>
                                    <input id="city" name="city" required="required" type="city" placeholder="city"/> 
                                </p>
                                <p> 
                                    <label for="recoveryEmail" class="recoveryEmail" data-icon="e" > Recovery Email</label>
                                    <input id="recoveryEmail" name="recoveryEmail" required="required" type="email" placeholder="myrecoverymail@mail.com"/> 
                                </p>
                                
                                
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="/" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
                   
        </div>

    </body>
</html>