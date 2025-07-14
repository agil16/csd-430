package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**MovieBean class for interacting with arely_movies_data table.
 * Provides methods to get all movie IDs and load a movie by ID.*/
public class MovieBean {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/CSD430";
    private final String jdbcUsername = "student1";
    private final String jdbcPassword = "pass";

    private int movie_id;
    private String title;
    private String genre;
    private String director;
    private int year;
    private double rating; // ✅ new field

    //The getters and setters
    public int getMovie_id() { return movie_id; }
    public void setMovie_id(int movie_id) { this.movie_id = movie_id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public double getRating() { return rating; } // ✅ getter
    public void setRating(double rating) { this.rating = rating; } // ✅ setter

    //The method to get all movie IDs
    public List<Integer> getAllMovieIds() {
        List<Integer> ids = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT movie_id FROM arely_movies_data");
            while (rs.next()) {
                ids.add(rs.getInt("movie_id"));
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ids;
    }

    //Here is the, load a movie by ID
    public void loadById(int id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM arely_movies_data WHERE movie_id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.movie_id = rs.getInt("movie_id");
                this.title = rs.getString("title");
                this.genre = rs.getString("genre");
                this.director = rs.getString("director");
                this.year = rs.getInt("release_year");
                this.rating = rs.getDouble("rating"); // ✅ set rating
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Update a movie record
    public boolean updateMovie() {
        boolean success = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            String sql = "UPDATE arely_movies_data SET title=?, genre=?, director=?, release_year=?, rating=? WHERE movie_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setString(3, director);
            ps.setInt(4, year);
            ps.setDouble(5, rating);
            ps.setInt(6, movie_id);
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    //DELETE a movie by ID
    public boolean deleteById(int id) {
        boolean success = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            String sql = "DELETE FROM arely_movies_data WHERE movie_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                success = true;
            }
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}
