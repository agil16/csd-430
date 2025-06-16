<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Book" %>

<html>
<head><title>Book Inventory</title></head>
<body>
    <h1>Book Inventory</h1>
    <p>This table shows books details.</p>

<%
    ArrayList<Book> books = new ArrayList<>();
    books.add(new Book("The Martin", "Andy Weir", "978-0-553-41802-6", "Crown Publishing Group", 8.99));
    books.add(new Book("Red Mars", "Kim Stanley Robinson", "978-0-553-56275-9", "Bantam Spectra", 8.99));
    books.add(new Book("All Systems Red", "Martha Wells", "978-0-7653-9753-9", "Tor.com", 16.99));
    books.add(new Book("Sleeping Giants", "Sylvain Neuvel", "978-1-101-94666-8", "Del Rey", 13.98));
    books.add(new Book("Dark Matter", "Blake Crouch", "978-1-101-90422-4", "Crown Publishing Group", 13.98));
%>

    <table border="1" cellpadding="5" cellspacing="0">
        <thead><tr>
            <th>Title</th><th>Author</th><th>ISBN</th><th>Publisher</th><th>Price</th>
        </tr></thead>
        <tbody>
            <% for(Book b : books) { %>
            <tr>
                <td><%= b.getTitle() %></td>
                <td><%= b.getAuthor() %></td>
                <td><%= b.getIsbn() %></td>
                <td><%= b.getPublisher() %></td>
                <td><%= String.format("%.2f", b.getPrice()) %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
