<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Movie</title>
</head>
<body>

<%
    // Get parameters from form submission
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String director = request.getParameter("director");
    String yearStr = request.getParameter("year");
    String ratingStr = request.getParameter("rating");

    int year = 0;
    double rating = 0.0;
    try {
        year = Integer.parseInt(yearStr);
        rating = Double.parseDouble(ratingStr);
    } catch (NumberFormatException e) {
        out.println("<p>Error: Year and Rating must be numbers.</p>");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "Pass123!");
        
        // Insert SQL statement (movie_id is auto-increment, so exclude it)
        String sql = "INSERT INTO arely_movies_data (title, genre, director, release_year, rating) VALUES (?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, genre);
        ps.setString(3, director);
        ps.setInt(4, year);
        ps.setDouble(5, rating);

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<p>New movie added successfully!</p>");
        } else {
            out.println("<p>Error: Could not add the movie.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (ps != null) try { ps.close(); } catch (Exception ignore) {}
        if (conn != null) try { conn.close(); } catch (Exception ignore) {}
    }
%>

<p><a href="arely_movies.jsp">View Movie List</a></p>
<p><a href="add_movie.jsp">Add Another Movie</a></p>

</body>
</html>
