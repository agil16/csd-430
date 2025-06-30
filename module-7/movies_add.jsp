<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>




<html>
<head>
    <title>Add a New Movie</title>
</head>
<body>
<h1>Add a New Movie to the Database</h1>

<form action="movie_add.jsp" method="post">
    <label>Title: <input type="text" name="title" required></label><br><br>
    <label>Genre: <input type="text" name="genre" required></label><br><br>
    <label>Director: <input type="text" name="director" required></label><br><br>
    <label>Release Year: <input type="number" name="release_year" required></label><br><br>
    <label>Rating: <input type="number" step="0.1" min="0" max="10" name="rating" required></label><br><br>
    <input type="submit" value="Add Movie">
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String director = request.getParameter("director");
        String yearStr = request.getParameter("release_year");
        String ratingStr = request.getParameter("rating");

        if (title != null && genre != null && director != null && yearStr != null && ratingStr != null) {
            int year = Integer.parseInt(yearStr);
            double rating = Double.parseDouble(ratingStr);

            Connection conn = null;
            PreparedStatement ps = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "Pass123!");
                String sql = "INSERT INTO arely_movies_data (title, genre, director, release_year, rating) VALUES (?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, title);
                ps.setString(2, genre);
                ps.setString(3, director);
                ps.setInt(4, year);
                ps.setDouble(5, rating);
                int rows = ps.executeUpdate();

                if (rows > 0) {
                    out.println("<p style='color:green;'>Movie added successfully!</p>");
                } else {
                    out.println("<p style='color:red;'>Failed to add movie.</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (ps != null) try { ps.close(); } catch (Exception ignored) {}
                if (conn != null) try { conn.close(); } catch (Exception ignored) {}
            }
        }
    }
%>

</body>
</html>
