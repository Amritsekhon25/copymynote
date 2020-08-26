<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Note</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<script type="text/javascript">

	var _validFileExtensions = [ ".txt" ];
	

	function HandleBackFunctionality()
	{
		
		
		alert('dd');
	    if(window.event) //Internet Explorer
	    {
	           alert("Browser back button is clicked on Internet Explorer...");
	    }
	    else //Other browsers e.g. Chrome
	    {
	           alert("Browser back button is clicked on other browser...");
	    }
	}
	
	// Txt File validation Code
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
	
	// Copy Text  Data
	function copyData(id) {
		  var copyText = document.getElementById(id).innerText;
			var elem = document.createElement("textarea");
		    document.body.appendChild(elem);
		    elem.value = copyText;
		    elem.select();
		    document.execCommand("copy");
		    document.body.removeChild(elem);
		  alert("Copied");
		}
	
	//Update Note set Saved Data
	function updateData(id) {
		  var updateTitle = document.getElementById('title'+id).innerText;
		  var updateNote = document.getElementById('note'+id).innerText;

		  document.getElementById('updateTitle'+id).value = updateTitle;

		  document.getElementById('updateNote'+id).value = updateNote;

		  
		}
	// onclick multiple return
	function multipleReturn(id)
	{
		var requireField=requiredField(id)
		if(requireField==false)
			return false;
		var updateConfirm= updateConfirmaton();

		 if(updateConfirm==false)
		return false;
		else
			return true;
  }
	
	// Note saveConfirmaton
	function saveConfirmaton()
	{
		 var strconfirm = confirm("Are you sure you want to save?");
		    if (strconfirm == true) {
		        return true;
		    }	
		    else
		    	return false;
		   }
	
	// Note updateConfirmaton
	function updateConfirmaton()
	{
		 var strconfirm = confirm("Are you sure you want to update?");
		    if (strconfirm == true) {
		        return true;
		    }	
		    else
		    	return false;
		   }
	
	// Note deleteConfirmaton

	function deleteConfirmaton()
	{
		 var strconfirm = confirm("Are you sure you want to Delete?");
		    if (strconfirm == true) {
		        return true;
		    }	
		    else
		    	return false;
		   }
	// File Validation Code
	function myFunction(id) {

		if(id===0){

		document.getElementById('saveFile').addEventListener('change', function() {

			ValidateSingleInput(this);

			var fr = new FileReader();
			fr.onload = function() {
				document.getElementById("saveFileContent").value = fr.result;				
						}

			fr.readAsText(this.files[0]);
		})
		}
		else
			{
			alert(id)
			document.getElementById('123').addEventListener('change', function() {
				alert(id)

				ValidateSingleInput(this);

				var fr = new FileReader();
				fr.onload = function() {
					document.getElementById("editFileContent").value = fr.result;
							}

				fr.readAsText(this.files[0]);
			})
			

			}
	}

	// Required Field Validation
	function requiredField(id) {
			var title,note,file;
		if(id===0)
		{
		 title = document.getElementById("title").value;
		 note = document.getElementById("note").value;
		 file = document.getElementById("saveFile").value;
		}
		else
			{
			title = document.getElementById("updateTitle"+id).value;
			 note = document.getElementById("updateNote"+id).value;
			 //file = document.getElementById("file"+id).value;
			 file="";
			}

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



<body >
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
request.setAttribute("isBackButtonPressed","true");
%>

	<div class="header-section note-section">
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

	<div class="note">
		<c:if test="${isLoggedIn eq true}">

			<div class="wrap">
				<div class="note-inner">
					<h3>Welcome ${loggedInUserName}</h3>
					<div class="add-note">
						<span style="color: red"> ${error}</span>
						<span style="color: red"> ${noteLimitError}</span>


						<form action="addNote" method="post" autocomplete="on"
							onsubmit="return saveConfirmaton()" enctype="multipart/form-data">

							<h1>Add Note</h1>
							

							<p>
								<label for="title" class="title" data-icon=""> Add Title
								</label> <input id="title" name="saveTitle" type="text"
									placeholder="Add Title" />
							</p>
							<p>
								<label for="note" class="note" data-icon=""> Add Note </label>

								<textarea id="note" name="saveNote" rows="4" cols="50"
									placeholder="Describe yourself notes..."></textarea>
							</p>
							<input type="file" name="saveFile" id="saveFile"
								onclick="myFunction(0)" />


							<div class="cta-btn Add-note">
								<button onclick="return requiredField(0)">Add Note</button>
							</div>


							<textarea id="saveFileContent" name="saveFileContent" rows="4"
								cols="50" style="display: none;"></textarea>
						</form>

					</div>
					<c:if test="${not empty notelist}">
						<div class="note-list"><div><h3>Your Notes</h3> 	<div class="search-bar">
					<form action="" method="get">
						<input type="text" name="search" id="search"
							placeholder="search note"></input> <input type="image"
							src="/images/search_icon.png"></input>

					</form>
				</div></div></div>

						<c:forEach items="${notelist}" var="listValue">
							<div class="popup-sec">
								<div class="popup-sec-inner">
									<h4 id=title${listValue.id}<%-- class="btn btn-info btn-lg" data-toggle="modal"
										data-target="#myModal${listValue.id}" --%>>${listValue.title}</h4>
									<div class="modal fade view-modal" id="myModal${listValue.id}"
										role="dialog">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">${listValue.title}</h4>
												</div>
												<div class="modal-body">
													<p>${listValue.note}</p>
												</div>

											</div>
										</div>
									</div>



									<div class="modal fade" id="updateModal${listValue.id}"
										role="dialog">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Update Note</h4>
												</div>
												<div class="modal-body">
													<div class="add-note">
														<form action="edit/${listValue.id}" method="post"
															autocomplete="on" enctype="multipart/form-data">
															<h1>Update Note</h1>
															<p>
																<label for="title" class="title" data-icon="">
																	Update Title </label> <input id="updateTitle${listValue.id}"
																	name="editTitle" type="text" placeholder="Add Title" />
															</p>
															<p>
																<label for="note" class="note" data-icon="">
																	Update Note </label>

																<textarea id="updateNote${listValue.id}" name="editNote"
																	rows="4" cols="50"
																	placeholder="Describe yourself notes..."></textarea>
															</p>
															<%-- <input type="file" name="editFile"
																id="123"
																onclick="myFunction(${listValue.id})" /> --%>


															<div class="cta-btn Add-note">
																<button onclick="return multipleReturn(${listValue.id})">update
																</button>
															</div>


															<textarea id="editFileContent" name="editFileContent"
																rows="4" cols="50" style="display: none;"></textarea>
														</form>
													</div>
												</div>

											</div>
										</div>
									</div>

									<p id="note${listValue.id}" class="noteTitleLimitFix">${listValue.note}</p>
									<div class="cta-btn">

										<a class="btn btn-info btn-lg" data-toggle="modal"
											data-target="#myModal${listValue.id}"><img
											src="images/new_view.jpg"></img></a> <a
											onclick="updateData(${listValue.id})"
											class="btn btn-info btn-lg" data-toggle="modal"
											data-target="#updateModal${listValue.id}"><img
											src="images/edit-icon.png"></img></a> <a href='#'
											onclick="copyData('note'+${listValue.id})"><img
											src="images/newcopy.jpg"></img></a> <a
											onclick="return deleteConfirmaton()"
											href="delete/${listValue.id}"><img
											src="images/new_delete.jpg"></img></a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>

				</div>
			</div>
		</c:if>
		<c:if test="${not empty lists}">
			<c:forEach items="${lists}" var="listValue">
				<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
				<a class="hiddenanchor" id="toregister"></a>
				<a class="hiddenanchor" id="tologin"></a>
				<div id="wrapper">

					<div id="login" class="animate form">${listValue}</div>
				</div>
			</c:forEach>
		</c:if>
		<div class="paginations">

			<c:forEach var="i" begin="1" end="${totalPages}">
				<a href="viewNote?pageNo=${i}">${i}</a>

			</c:forEach>
		</div>
		<c:if test="${!isLoggedIn eq true}">

			<h1>
				You are not Authorized to access now. Please <a href="/">Login</a>
				again
			</h1>

		</c:if>

	</div>

</body>
</html>
