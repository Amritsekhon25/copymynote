	<!DOCTYPE html>
	
	<%@ page contentType="text/html;charset=UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
	<head>
	<meta charset="UTF-8" />
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
	<title>Welcome to My Website</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Welcome to My Website" />
	<meta name="keywords"
		content="html5, css3, form, switch, animation, :target, pseudo-class" />
	<meta name="author" content="Codrops" />
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	</head>
	<body>
	
	<div 	>
	
	
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
				<div id="container_demo">
					<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
					<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
						id="tologin"></a>
					<div id="wrapper">
	
						<div id="login" class="animate form">
							<span style="color: red"> ${errorMessage}</span>
	
							<form action="/login" method="post" autocomplete="on">
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
								<!-- <p class="keeplogin	"> 
										<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
										<label for="loginkeeping">Keep me logged in</label>
									</p> -->
								<p class="login button">
									<input type="submit" value="Login" />
								</p>
								<p class="change_link">
									Not a member yet ? <a href="/register" class="to_register">Join
										us</a>
								</p>
							</form>
						</div>
	
	
	
					</div>
				</div>
			</section>
			<div class="navbar">
				<a href="#news">About Us</a> <a href="#contact">Contact US</a> <a
					href="#news">Follow On Us</a>
	
			</div>
		</div>
	
	</body>
	</html>