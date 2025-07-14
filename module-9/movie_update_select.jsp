<%@ page import="model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Select Movie to Update</title></head>
<body>
<h2>Select a Movie to Update</h2>
<%
    MovieBean bean = new MovieBean();
    java.util.List<Integer> ids = bean.getAllMovieIds();
%>
<form action="movie_update_form.jsp" method="get">
    <label>Movie ID:</label>
    <select name="movie_id">
        <% for (Integer id : ids) { %>
            <option value="<%= id %>"><%= id %></option>
        <% } %>
    </select>
    <input type="submit" value="Edit">
</form>
</body>
</html>
