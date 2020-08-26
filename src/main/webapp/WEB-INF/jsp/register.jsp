<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
<title>Copymynote Registration</title>
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://geodata.solutions/includes/countrystatecity.js"></script>
<script>
	/* function checkForm(form)
	{
	     if(!form.terms.checked) {
	    alert("Please indicate that you accept the Terms and Conditions");
	    form.terms.focus();
	    return false;
	  }
	  return true;
	} */

	// Function to check Whether both passwords 
	// is same or not. 
	function checkPassword(form) {
		password1 = form.password.value;
		password2 = form.confirm_password.value;

		var mob = /^[1-9]\d{9}$/;
		var passwordValidation = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
		var txtMobile = form.mobile.value;
		alert(txtmobile)

		// If password not entered 
		if (password1 == '')
			alert("Please enter Password");

		// If confirm password not entered 
		else if (password2 == '')
			alert("Please enter confirm password");

		// If Not same return False.     
		else if (password1 != password2) {
			alert("\nPassword did not match: Please try again...")
			return false;
		}

		else if (!passwordValidation.test(password1)) {
			alert("Please use secure password,which contain atleast 8 character including one upper, lower case,one digit and one special charactor.");
			return false;
		}
		if (txtmobile == '') {

		} else(!mob.test(txtMobile)) {
			alert("Please enter valid mobile number.");
			mobile.focus();
			return false;
		}

	}
</script>
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
					<img src="assets/images/logo-cmn-96x84.png" alt=""><span>Copy
						My Note</span>
				</div>
				<div class="menu">
					<ul>
						<li><a
							href="index.html"
							target="_blank">About us</a>
						<li><a
							href="index.html"
							target="_blank">Services</a></li>
						<li><a
							href="termsandconditions.html"
							target="_blank">Terms & Conditions</a></li>
						<li><a
							href="index.html"
							target="_blank">Contact us</a>
						<li><a
							href="index.html"
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
		<div class="form-sec">
			<div class="left-sec"></div>
			<div class="right-sec">
				<div id="wrapper" class="form-section register-form-sec">
					<div id="login" class="animate form register-form">
						<span style="color: red"> ${errorMessage}</span>

						<form action="saveUser" method="post" autocomplete="on"
							onSubmit="return checkPassword(this)" modelAttribute="emp">
							<h1>Sign up</h1>
							<p>
								<label for="uname" class="uname" data-icon="u">Username*</label>
								<input id="uname" name="uname" required="required" type="text"
									placeholder="mysuperusername690" />
							</p>
							<p>
								<label for="email" class="email" data-icon="e"> Email*</label> <input
									id="email" name="email" required="required" type="email"
									placeholder="mysupermail@mail.com" />
							</p>
							<p>
								<label for="password" class="password" data-icon="p">Password*
								</label> <input id="password" name="password" required="required"
									type="password" placeholder="eg. X8df!90EO" />
							</p>
							<p>
								<label for="confirm_password" class="confirm_password"
									data-icon="p">Confirm Password* </label> <input
									id="confirm_password" name="confirm_password"
									required="required" type="password" placeholder="eg. X8df!90EO" />
							</p>
							<p>
								<label for="mobile" class="mobile" data-icon="p">Mobile
									No.</label> <input id="mobile" name="mobile" type="number"
									placeholder="eg. +91999999999" />
							</p>
							<p>
								<label for="country" class="country">Country*</label> <select
									name="country" class="countries" id="countryId"
									required="required">
									<option value="">Select Country</option>
								</select>
							</p>


							<p>
								<label for="state" class="state"> State*</label><select
									name="state" class="states" id="stateId" required="required">
									<option value="">Select State</option>
								</select>
							</p>


							<p>
								<label for="city" class="city"> City*</label> <select
									name="city" class="cities" id="cityId" required="required">
									<option value="">Select City</option>
								</select>
							</p>


							<p class="recovery_Email">
								<label for="recoveryEmail" class="recoveryEmail" data-icon="e">
									Recovery Email</label> <input id="recoveryEmail" name="recoveryEmail"
									type="email" placeholder="myrecoverymail@mail.com" />
							</p>


							<p class="tnc">
								<input type="checkbox" name="terms" required="required">
								I accept the <a target="_blank"
									href="https://copymynotemini.blogspot.com/2020/08/terms-and-conditions.html">Terms
									and Conditions</a>
							</p>

							<p class="signin button">
								<input type="submit" value="Sign up" />
							</p>
							<p class="change_link">
								Already a member ? <a href="/" class="to_register"> Go and
									log in </a>
							</p>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>