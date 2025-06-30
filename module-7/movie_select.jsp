<%@ page import="model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select a Movie</title>
</head>
<body>
<h1>Select a Movie from the List</h1>

<%
    MovieBean movieBean = new MovieBean();
    java.util.List<Integer> movieIds = movieBean.getAllMovieIds();
%>

<form action="movie_display.jsp" method="get">
    <label for="movie_id">Choose Movie ID:</label>
    <select name="movie_id" id="movie_id">
        <%
            for (Integer id : movieIds) {
        %>
            <option value="<%= id %>"><%= id %></option>
        <%
            }
        %>
    </select>
    <input type="submit" value="Submit">
</form>

</body>
</html>
