<%@ page import="org.hibernate.*" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.helper.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes: Note Taker</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>

<div class="container">
  <%@include file="Navbar.jsp" %>
  <h1 class="text-uppercase">All NOTES:</h1>
  
  <div class="row">
  
  <div class="col-12">
  <%
  Session s= FactoryProvider.getFactory().openSession();
  Query q=s.createQuery("from Note");
  List<Note> list= q.list();
  for(Note note: list){
 %>
	     <div class="card mt-3">
  <img src="img/sticky-notes.png" style="max-width:100px;"class="card-img-top m-4 mx-auto" alt="...">
  <div class="card-body px-5">
    <h5 class="card-title"><%= note.getTitle() %> </h5>
    <p class="card-text"><%= note.getContent() %></p>
    <p><b class="text-primary">
    <%= note.getAddDate() %></b>
    </p>
    <div class="container text-center mt-2">
    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
    <a href="Update.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
    </div>
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