<%@ page import="model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("movie_id"));
    MovieBean bean = new MovieBean();
    bean.loadById(id);
%>
<html>
<head><title>Update Movie</title></head>
<body>
<h2>Update Movie Info</h2>
<form action="movie_update_result.jsp" method="post">
    Movie ID: <strong><%= bean.getMovie_id() %></strong><br>
    <input type="hidden" name="movie_id" value="<%= bean.getMovie_id() %>"><br>

    Title: <input type="text" name="title" value="<%= bean.getTitle() %>"><br>
    Genre: <input type="text" name="genre" value="<%= bean.getGenre() %>"><br>
    Director: <input type="text" name="director" value="<%= bean.getDirector() %>"><br>
    Year: <input type="text" name="year" value="<%= bean.getYear() %>"><br>
    <input type="submit" value="Update Movie">
</form>
</body>
</html>
