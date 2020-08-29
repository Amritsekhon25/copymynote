<!DOCTYPE html>
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
<title>CopyMyNote Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		{
	String user=(String)request.getSession().getAttribute("userId");
	        if(user!=null)
	        {
	            response.sendRedirect("/viewNote");
	        }
	        
		}
%>
	<div class="header-section">
		<div class="wrap">
			<div class="header">
				<div class="logo">
					<img src="assets/images/logo-cmn-96x84.png" alt=""><span>Copy My Note</span>
				</div>
				<div class="menu">
					<ul>
						<li><a
							href="AboutUs.html"
							target="_blank">About us</a>
						<li><a
							href="Services.html"
							target="_blank">Services</a></li>
						<li><a
							href="Term&Conditions.html"
							target="_blank">Terms & Conditions</a></li>
						<li><a
							href="ContactUs.html"
							target="_blank">Contact us</a>
						<li><a
							href="AboutUs.html"
							target="_blank">Support us</a>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="container_demo">
		<img src="images/bg1.jpeg">
		<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>
		<div id="wrapper" class="form-section">
			<div id="login" class="animate form">
				<span style="color: red"> ${errorMessage}</span>

				<form action="login" autocomplete="on" method="post">
					<h1>Log in</h1>
					<p>
						<label for="username" class="uname" data-icon="u"> Your
							email or username </label> <input id="username" name="username"
							required="required" type="text"
							placeholder="myusername or mymail@mail.com" />
					</p>
					<p>
						<label for="password" class="youpasswd" data-icon="p">
							Your password </label> <input id="password" name="password"
							required="required" type="password" placeholder="eg. X8df!90EO" />
					</p>
					<!-- <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p> -->
					<p class="login button">
						<input type="submit" value="Login" />
					</p>
					<p class="change_link">
						Not a member yet ? <a href="register" class="to_register">Join
							us</a>
					</p>
				</form>
			</div>
		</div>
	</div>

</body>
</html>