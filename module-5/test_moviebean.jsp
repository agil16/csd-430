<%@ page import="model.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Test MovieBean</title>
</head>
<body>

<h2>Testing MovieBean: List of Movie IDs</h2>

<%
    MovieBean bean = new MovieBean();
    List<Integer> ids = null;
    try {
        ids = bean.getAllMovieIds();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>

<% if (ids != null && !ids.isEmpty()) { %>
    <ul>
        <% for (Integer id : ids) { %>
            <li>Movie ID: <%= id %></li>
        <% } %>
    </ul>

    <%
        try {
            bean.loadById(ids.get(0));
    %>
        <h3>Details for Movie ID <%= ids.get(0) %></h3>
        <table border="1">
            <tr><th>Title</th><td><%= bean.getTitle() %></td></tr>
            <tr><th>Genre</th><td><%= bean.getGenre() %></td></tr>
            <tr><th>Director</th><td><%= bean.getDirector() %></td></tr>
            <tr><th>Year</th><td><%= bean.getYear() %></td></tr>
        </table>
    <%
        } catch (Exception ex) {
            out.println("<p>Error loading movie: " + ex.getMessage() + "</p>");
            ex.printStackTrace(new java.io.PrintWriter(out));
        }
    %>

<% } else { %>
    <p>No movie IDs found.</p>
<% } %>

</body>
</html>
