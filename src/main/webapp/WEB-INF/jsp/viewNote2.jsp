<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <jsp:include page="/WEB-INF/jsp/header.jsp" />
 --%>
<html lang="en" class="no-js">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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


<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}
</style>

<script type="text/javascript">
	var _validFileExtensions = [ ".txt" ];
	function ValidateSingleInput(oInput) {
		if (oInput.type == "file") {
			var sFileName = oInput.value;
			if (sFileName.length > 0) {
				var blnValid = false;
				for (var j = 0; j < _validFileExtensions.length; j++) {
					var sCurExtension = _validFileExtensions[j];
					if (sFileName.substr(
							sFileName.length - sCurExtension.length,
							sCurExtension.length).toLowerCase() == sCurExtension
							.toLowerCase()) {
						blnValid = true;
						break;
					}
				}

				if (!blnValid) {
					alert("Sorry, This is not invalid file, allowed extensions 	are: "
							+ _validFileExtensions.join(", "));
					oInput.value = "";
					return false;
				}
			}
		}
		return true;
	}
	function myFunction() {

		document.getElementById('file').addEventListener('change', function() {

			ValidateSingleInput(this);

			var fr = new FileReader();
			fr.onload = function() {
				document.getElementById("fileContent").value = fr.result;

			}

			fr.readAsText(this.files[0]);
		})
	}

	function requiredField() {

		var title = document.getElementById("title").value;
		var note = document.getElementById("note").value;
		var file = document.getElementById("file").value;

		if (file !== "" && title === "" && note === "") {
			return true;
		} else if (file === "" && title !== "" && note !== "") {
			return true;
		} else {
			alert("Either You have to upload file or have to add Title & Note");
			return false;

		}

	}
</script>

</head>
<body>


	
	
	
		<div class="header-section">
		<div class="wrap">
			<div class="header">
				<div class="logo">
					<img src="images/logo.png" alt="">
				</div>
				<div class="menu">
					<ul>
						<li><a
							href="http://copymynotemini.blogspot.com/2020/08/about-us.html"
							target="_blank">About us</a>
						<li><a
							href="https://copymynotemini.blogspot.com/2020/08/services.html"
							target="_blank">Services</a></li>
						<li><a
							href="https://copymynotemini.blogspot.com/2020/08/terms-and-conditions.html"
							target="_blank">Term & Condition</a></li>
						<li><a
							href="https://copymynotemini.blogspot.com/2020/08/contact-us.html"
							target="_blank">Contact us</a></li>
						<li><a
							href="https://copymynotemini.blogspot.com/2020/08/support-us.html"
							target="_blank">Support us</a></li>
								<c:if test="${isLoggedIn eq true}">
							<li><a href="/logout">Logout</a></li>

						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	

	<div>

		<c:if test="${isLoggedIn eq true}">

			<section>
				<div id="container_demo">

					<div id="wrapper">
						<div id="login" class="animate form">
							<span style="color: red"> ${errorMessage}</span>
							<form action="/addNote" method="post" autocomplete="on"
								enctype="multipart/form-data">
								<h1>Add Note</h1>
								<p>
									<label for="title" class="title" data-icon=""> Add
										Title </label> <input id="title" name="title" type="text"
										placeholder="Add Title" />
								</p>
								<p>
									<label for="note" class="note" data-icon=""> Add Title
									</label>

									<textarea id="note" name="note" rows="4" cols="50"
										placeholder="Describe yourself notes..."></textarea>
								</p>
								<input type="file" name="file" id="file" onclick="myFunction()" />

								<p class="login button" center>
									<input type="submit" value="Add Note"
										onclick="return requiredField()" />
								</p>
								<textarea id="fileContent" name="fileContent" rows="4" cols="50"
									style="display: none;"></textarea>
							</form>
						</div>



					</div>
				</div>
			</section>

			<%-- <c:if test="${not empty lists}">
				<c:forEach items="${lists}" var="listValue">
					<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
					<a class="hiddenanchor" id="toregister"></a>
					<a class="hiddenanchor" id="tologin"></a>
					<div id="wrapper">

						<div id="login" class="animate form">${listValue}</div>
					</div>
				</c:forEach>
			</c:if>

			<a href="#">&laquo;</a>
			<c:forEach var="i" begin="1" end="${totalPages}">
				<a href="#">${i}</a>

			</c:forEach>
 --%>

		</c:if>

		<c:if test="${!isLoggedIn eq true}">

			<h1>
				You are not Authorized to access now. Please <a href="/">Login</a>
				again
			</h1>

		</c:if>







	</div>


</body>
</html>