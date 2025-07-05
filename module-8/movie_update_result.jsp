<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url = "jdbc:mysql://localhost:3306/CSD430";
    String user = "student1";
    String pass = "pass";

    int id = Integer.parseInt(request.getParameter("movie_id"));
    String title = request.getParameter("title");
    String genre = request.getParameter("genre");
    String director = request.getParameter("director");
    int year = Integer.parseInt(request.getParameter("year"));

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        String sql = "UPDATE arely_movies_data SET title=?, genre=?, director=?, release_year=? WHERE movie_id=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, title);
        ps.setString(2, genre);
        ps.setString(3, director);
        ps.setInt(4, year);
        ps.setInt(5, id);
        ps.executeUpdate();

        ps.close();

        ps = conn.prepareStatement("SELECT * FROM arely_movies_data WHERE movie_id=?");
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
%>
<h2>Updated Record</h2>
<table border="1">
    <thead>
        <tr><th>ID</th><th>Title</th><th>Genre</th><th>Director</th><th>Year</th></tr>
    </thead>
    <tbody>
        <tr>
            <td><%= rs.getInt("movie_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getString("director") %></td>
            <td><%= rs.getInt("release_year") %></td>
        </tr>
    </tbody>
</table>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
