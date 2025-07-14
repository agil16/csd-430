<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Movie</title>
</head>
<body>

<h1>Add a New Movie</h1>

<form action="insert_movie.jsp" method="post">
    <label for="title">Title:</label><br/>
    <input type="text" id="title" name="title" required><br/><br/>

    <label for="genre">Genre:</label><br/>
    <input type="text" id="genre" name="genre" required><br/><br/>

    <label for="director">Director:</label><br/>
    <input type="text" id="director" name="director" required><br/><br/>

    <label for="year">Release Year:</label><br/>
    <input type="number" id="year" name="year" required><br/><br/>

    <label for="rating">Rating:</label><br/>
    <input type="number" step="0.1" min="0" max="10" id="rating" name="rating" required><br/><br/>

    <input type="submit" value="Add Movie">
</form>

<p><a href="arely_movies.jsp">View Movie List</a></p>

</body>
</html>
