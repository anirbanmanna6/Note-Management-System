<!doctype html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.hibernate.query.NativeQuery"%>
<%@page import="javax.persistence.StoredProcedureQuery"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Note"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@include file="all_css.jsp"%>
<title>View Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>	
	<div class="row">
		<div class="col-12">
			
			<%
			Session s = FactoryProvider.getFactory().openSession();
			Query q = s.createQuery("from Note");
			//single -> uniqueResult & uniqueResultOptional
			//multiple -> list()
			List<Note> listNote = q.list(); //direct - not using procedure
			for(Note note : listNote)
			{
			%>
			<div class="card mt-3">
				<div class="card-body px-4"> <!-- px means both -  pl and pr  -->
					<img src="image/notepad.png" class="mx-auto d-block" style="max-width:30px;"/>		
					<h5 class="card-title mt-2"><%=note.getTitle()%></h5>
					<p class="card-text"><%=note.getContent() %></p>
					<p style="font-size: 12px;">Last Updated On <b class ="text-primary"><%=note.getAddedDate() %></b></p>
					<div class ="container text-center" >
					<div class ="btn-group">
						<form action ="updateNote.jsp?note_id=<%=note.getId() %>" method="post" > 
						<!-- instead of POST method, we can use input type = hidden -->
						<button class="btn btn-primary mr-2" >Update</button>
						</form>
						<form action = "DeleteServlet?note_id=<%=note.getId() %>" method="post">
						<button class="btn btn-danger" >Delete</button>
						</form>
					</div>
					</div>
				</div>
			</div>
			<%
			}
			s.close();
			FactoryProvider.closeFactory();
			%>
			
		</div>
	</div>
	</div>


</body>
</html>