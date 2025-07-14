<%@ page import="model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String movieIdParam = request.getParameter("movie_id");
    if (movieIdParam != null) {
        int movieId = Integer.parseInt(movieIdParam);
        MovieBean movieBean = new MovieBean();
        movieBean.deleteById(movieId);
    }
    response.sendRedirect("delete_movie.jsp");
%>
