<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Movie List</title>
</head>
<body>
<h1>Movie List from MySQL Database</h1>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Genre</th>
        <th>Director</th>
        <th>Release Year</th>
        <th>Rating</th>
    </tr>

<%
    // MySQL connection parameters
    String url = "jdbc:mysql://localhost:3306/CSD430";
    String user = "student1";
    String password = "pass";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM arely_movies_data");

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("movie_id") %></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("genre") %></td>
        <td><%= rs.getString("director") %></td>
        <td><%= rs.getInt("release_year") %></td>
        <td><%= rs.getDouble("rating") %></td>
    </tr>
<%
        }
    } catch (Exception e) {
%>
    <tr><td colspan="6">Error: <%= e.getMessage() %></td></tr>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>

</table>
</body>
</html>
