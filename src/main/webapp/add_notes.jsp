<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add_Notes.jsp</title>
<%@include file="include.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Please Fill Your Notes</h1>

		<!-- this is form -->
		<form action = "SaveNoteServlet" method ="post">
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input required type="text" class="form-control" name ="title" id="title" aria-describedby="emailHelp" placeholder="Entre here">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label> 
				<textarea required id ="content" name ="content" placeholder ="Enter your content here" class="form-control" style="height:250px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
</body>
</html>