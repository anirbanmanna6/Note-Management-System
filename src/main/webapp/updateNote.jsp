<%@page import="com.entity.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
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
	<div class="container">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container">
		<br>
		<% 
		int noteId = Integer.parseInt(request.getParameter("note_id"));
		Session s = FactoryProvider.getFactory().openSession();
		Note noteObject = s.get(Note.class, noteId);
		
		%>
		<h2 class="text-center">Edit your note here</h2>
		<form action="UpdateServlet" method="post">
		<input value="<%=noteId%>" name="note_id" type="hidden"/>
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input
					type="text" class="form-control" id="title" name="title"
					aria-describedby="title" value="<%=noteObject.getTitle()%>" required> 
			</div>
			<div class="form-group">
				<label for="content">Entire Content</label> 
				<textarea class="form-control" id="content" name ="content" rows="3" placeholder="Write content here" required><%=noteObject.getContent()%></textarea>
			</div>
			
			<div class="button text-center">
			<button type="submit" class="btn btn-primary">Update</button>
			</div>
		</form>
		<% s.close(); %>
	</div>
</body>
</html>