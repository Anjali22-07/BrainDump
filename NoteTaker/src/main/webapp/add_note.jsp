<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_css_jsp.jsp" %>
</head>
<body>

<div class="container">
  <%@include file="Navbar.jsp" %>
  
  <h1>Add your Notes here!</h1>
  <!-- adding the form to insert content -->
  <form action="SaveNoteServlet" method="post">
  <div class="form-group mb-3">
    <label for="title" class="form-label">Title</label>
    <input required name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter your Title here!">
    
  </div>
  <div class="form-group mb-3">
    <label for="content" class="form-label">Content</label>
    <textarea required  name="content" id="content" placeholder="Enter your content here!" class="form-control" style="height:300px;"></textarea>
    
    </div>
  
  <div class="coontainer text-center">
    <button type="submit" class="btn btn-primary">ADD</button>
    </div>
    
</form>
</div>

</body>
</html>