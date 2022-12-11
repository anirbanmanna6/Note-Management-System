<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function ajaxFunction1()
	{
		//call to ajax
		
		var xmlHttpRequest = new XMLHttpRequest();
		xmlHttpRequest.open("GET", "addNote.jsp");
		xmlHttpRequest.onreadystatechange = function() 
		{
		    if (this.readyState == 4 && this.status == 200) 
		    {
		    	console.log(this.responseText);
		     	document.getElementById("originalBody").innerHTML = this.responseText;
		    }
		};
		
		xmlHttpRequest.send();
	}

</script>
<meta charset="UTF-8">
<title>Navbar</title>
	<%@include file="all_css.jsp" %>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark container"
		style="background: #8E24AA">
		<a class="navbar-brand" href="index.jsp">Note Management System</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="javascript:ajaxFunction1()">Add Note</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="showNote.jsp" tabindex="-1">Show
						Notes</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<div id = "originalBody">
	</div>
</body>
</html>