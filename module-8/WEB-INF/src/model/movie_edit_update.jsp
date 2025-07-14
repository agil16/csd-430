<%@ page import="model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MovieBean bean = new MovieBean();
    bean.setMovie_id(Integer.parseInt(request.getParameter("movie_id")));
    bean.setTitle(request.getParameter("title"));
    bean.setGenre(request.getParameter("genre"));
    bean.setDirector(request.getParameter("director"));
    bean.setYear(Integer.parseInt(request.getParameter("year")));
    bean.setRating(Double.parseDouble(request.getParameter("rating")));

    boolean updated = bean.updateMovie();
%>
<!DOCTYPE html>
<html>
<head><title>Update Result</title></head>
<body>
<% if (updated) { %>
    <h2>Movie Updated Successfully!</h2>
<% } else { %>
    <h2>Failed to Update Movie.</h2>
<% } %>

<table border="1">
    <thead>
        <tr>
            <th>ID</th><th>Title</th><th>Genre</th><th>Director</th><th>Year</th><th>Rating</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%= bean.getMovie_id() %></td>
            <td><%= bean.getTitle() %></td>
            <td><%= bean.getGenre() %></td>
            <td><%= bean.getDirector() %></td>
            <td><%= bean.getYear() %></td>
            <td><%= bean.getRating() %></td>
        </tr>
    </tbody>
</table>

<a href="index.jsp">Back to Home</a>
</body>
</html>
