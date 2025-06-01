<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Beauty and the Beast Songs</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Beauty and the Beast - Song List</h1>
<p>Here are some songs from the movie, who sings them, and what the scene is about.</p>

<table>
    <tr>
        <th>Song</th>
        <th>Singer</th>
        <th>Scene</th>
    </tr>

    <%
        String[] songs = {"Belle", "Gaston", "Be Our Guest", "Something There", "Beauty and the Beast"};
        String[] singers = {"Belle & Villagers", "Gaston & LeFou", "Lumiere", "Belle & Beast", "Mrs. Potts"};
        String[] scenes = {
            "Opening scene in the village",
            "Gaston shows off",
            "The magical dinner show",
            "Belle and the Beast bond",
            "The Ballroom dance scene"
        };

        for (int i = 0; i < songs.length; i++) {
    %>
    <tr>
        <td><%= songs[i] %></td>
        <td><%= singers[i] %></td>
        <td><%= scenes[i] %></td>
    </tr>
    <% } %>

</table>

</body>
</html>
