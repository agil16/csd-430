<%@ page import="model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><title>Edit Movie</title></head>
<body>
<h2>Select a Movie to Edit</h2>
<%
    MovieBean bean = new MovieBean();
    java.util.List<Integer> ids = bean.getAllMovieIds();
%>
<form method="get" action="movie_edit_form.jsp">
    <label for="movie_id">Movie ID:</label>
    <select name="movie_id">
        <% for (int id : ids) { %>
            <option value="<%= id %>"><%= id %></option>
        <% } %>
    </select>
    <input type="submit" value="Edit Movie">
</form>
</body>
</html>
