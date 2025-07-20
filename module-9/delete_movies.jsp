<%@ page import="model.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete a Movie</title>
</head>
<body>
<h1>Delete a Movie Record</h1>

<%
    MovieBean movieBean = new MovieBean();
    List<Integer> movieIds = movieBean.getAllMovieIds();
%>

<% if (movieIds.isEmpty()) { %>
    <p><strong>No records available.</strong></p>
<% } else { %>
<form action="delete_movie_action.jsp" method="post">
    <label for="movie_id">Select a Movie ID to Delete:</label>
    <select name="movie_id" id="movie_id">
        <% for (Integer id : movieIds) { %>
            <option value="<%= id %>"><%= id %></option>
        <% } %>
    </select>
    <input type="submit" value="Delete">
</form>
<% } %>

<h2>Current Movie Records</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th><th>Title</th><th>Genre</th><th>Director</th><th>Year</th>
        </tr>
    </thead>
    <tbody>
<%
    for (Integer id : movieIds) {
        movieBean.loadById(id);
%>
    <tr>
        <td><%= movieBean.getMovie_id() %></td>
        <td><%= movieBean.getTitle() %></td>
        <td><%= movieBean.getGenre() %></td>
        <td><%= movieBean.getDirector() %></td>
        <td><%= movieBean.getYear() %></td>
    </tr>
<%
    }
%>
    </tbody>
</table>

</body>
</html>
