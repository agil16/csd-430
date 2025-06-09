<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Feedback Summary</title>
  <style>
    table {
      border-collapse: collapse;
      width: 60%;
      margin-top: 20px;
    }
    th, td {
      border: 1px solid #333;
      padding: 8px;
      text-align: left;
    }
  </style>
</head>
<body>

  <h1>Thank You for Your Feedback!</h1>
  <p>Here is a summary of what you submitted:</p>

  <%
    // Extract user input from request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String meal = request.getParameter("meal");
    String rating = request.getParameter("rating");
    String comments = request.getParameter("comments");
  %>

  <table>
    <tr><th>Field</th><th>Your Response</th></tr>
    <tr><td>Full Name</td><td><%= name %></td></tr>
    <tr><td>Email Address</td><td><%= email %></td></tr>
    <tr><td>Meal Ordered</td><td><%= meal %></td></tr>
    <tr><td>Overall Rating</td><td><%= rating %></td></tr>
    <tr><td>Additional Comments</td><td><%= comments %></td></tr>
  </table>

</body>
</html>
