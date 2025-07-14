<%@ page import="model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int movieId = Integer.parseInt(request.getParameter("movie_id"));
    MovieBean bean = new MovieBean();
    bean.loadById(movieId);
%>
<!DOCTYPE html>
<html>
<head><title>Edit Movie</title></head>
<body>
<h2>Update Movie Information</h2>
<form method="post" action="movie_edit_update.jsp">
    <input type="hidden" name="movie_id" value="<%= bean.getMovie_id() %>">

    <p><strong>ID:</strong> <%= bean.getMovie_id() %> (not editable)</p>

    Title: <input type="text" name="title" value="<%= bean.getTitle() %>"><br>
    Genre: <input type="text" name="genre" value="<%= bean.getGenre() %>"><br>
    Director: <input type="text" name="director" value="<%= bean.getDirector() %>"><br>
    Release Year: <input type="text" name="year" value="<%= bean.getYear() %>"><br>
    Rating: <input type="text" name="rating" value="<%= bean.getRating() %>"><br>

    <input type="submit" value="Update Movie">
</form>
</body>
</html>
