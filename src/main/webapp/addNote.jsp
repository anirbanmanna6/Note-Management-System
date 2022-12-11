<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_css.jsp"%>
<meta charset="UTF-8">
<title>Add Notes</title>
</head>
<body>
	 <!--   <div class="container"> 
	<div class="container">
		//include navbar
	</div>
	
	-->
	<div class="container inner">
		<br>
		<h2 class="text-center">Add your note here</h2>
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input
					type="text" class="form-control" id="title" name="title"
					aria-describedby="emailHelp" placeholder="Enter title here" required> 
			</div>
			<div class="form-group">
				<label for="content">Entire Content</label> 
				<textarea class="form-control" id="content" name ="content" rows="3" placeholder="Write content here" required></textarea>
			</div>
			<div class="button text-center">
			<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
	</div>
</body>
</html>