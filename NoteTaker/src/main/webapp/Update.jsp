<%@ page import="org.hibernate.*" %>
<%@ page import="com.helper.*" %>
<%@ page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Notes </title>
<%@include file="all_css_jsp.jsp" %>
  </head>
  <body>
<div class="container">
  <%@ include file="Navbar.jsp" %>
  <h1>Edit Notes Here!</h1>
  <br>
  <%
  int noteId= Integer.parseInt(request.getParameter("note_id").trim());
  Session s= FactoryProvider.getFactory().openSession();
	Transaction tx= s.beginTransaction();
	//get object
	Note note=(Note)s.get(Note.class,noteId);
 %>
  <form action="UpdateServlet" method="post">
  
  <input value="<%= note.getId() %>" name="noteId" type="hidden"/>
  <div class="form-group mb-3">
    <label for="title" class="form-label">Title</label>
    <input required name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter your Title here!"
    value="<%= note.getTitle() %>">
    
  </div>
  <div class="form-group mb-3">
    <label for="content" class="form-label">Content</label>
    <textarea required  name="content" id="content" placeholder="Enter your content here!" class="form-control" style="height:300px;"><%= note.getContent() %></textarea>
    
    </div>
  
  <div class="coontainer text-center">
    <button type="submit" class="btn btn-primary">Modify</button>
    </div>
    
</form>
  </div>

</body>
</html>