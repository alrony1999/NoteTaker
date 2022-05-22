<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.helper.*,org.hibernate.*,com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">

		<%@include file="navbar.jsp"%>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Note note = (Note) s.get(Note.class, noteId);
		%>
		<form action="UpdateServlet" method="post">

			<input value="<%=note.getId()%> " name="noteId" type="hidden" />

			<div class="form-group">
				<label for="title">Note title</label> <input name="title"
					type="text" class="form-control" id="title"
					placeholder="Enter here" required value="<%=note.getTitle()%>" />
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" class="form-control" style="height: 300px"
					placeholder="Enter your content here" required><%=note.getContent()%></textarea>
			</div>

			<div class="container text-center ">

				<button type="submit" class="btn btn-success">Save your
					note</button>

			</div>
		</form>
		<br>


	</div>

</body>
</html>