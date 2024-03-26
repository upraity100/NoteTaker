<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="org.hibernate.Query"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entities.NoteTaker"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All note.jsp</title>
<%@include file="include.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>All Notes</h1>

		<div class="row">
			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from NoteTaker");
				List<NoteTaker> list = q.list();

				for (NoteTaker n : list) {
				%>

				<div class="card mt-3">
					<div class="card-body">
						<h5 class="card-title"><%=n.getId() %></h5>
						<p class="card-text"><%=n.getContent()%></p>
						<a href="DeleteServlet?id=<%=n.getId()%>" class="btn btn-danger">Delete</a>
						<a href="update.jsp?id=<%=n.getId()%>" class="btn btn-primary">Update</a>
					</div>
				</div>

				<%
				}

				s.close();
				%>

			</div>
		</div>

	</div>

</body>
</html>