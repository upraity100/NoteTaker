<%@page import="com.entities.NoteTaker"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update page</title>
<%@include file="include.jsp"%>
</head>
<body>
<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>This Is Update Page:</h1>
		
		<%
		int id = Integer.parseInt(request.getParameter("id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		
		NoteTaker note = (NoteTaker)s.get(NoteTaker.class, id);
		Transaction tx = s.beginTransaction();
		s.save(note);
		tx.commit();
		s.close();
		
		%>
		
		<form action = "UpdateServlet" method ="post">
			<input value ="<%=note.getId() %>" name ="id" type ="hidden">
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input type="text" class="form-control" name ="title" id="title" value="<%=note.getTitle() %>">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label> 
				<textarea id ="content" name ="content" class="form-control" style="height:250px" ><%=note.getContent()%></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Update</button>
			</div>
		</form>
	</div>

</body>
</html>