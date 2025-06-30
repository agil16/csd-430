CREATE DATABASE IF NOT EXISTS CSD430;
USE CSD430;

CREATE TABLE arely_movies_data (
  movie_id INT PRIMARY KEY,
  title VARCHAR(100),
  genre VARCHAR(50),
  release_year INT,
  director VARCHAR(100),
  rating DECIMAL(2,1)
);

INSERT INTO arely_movies_data (movie_id, title, genre, release_year, director, rating) VALUES
(1, 'Arrival', 'Sci-Fi', 2016, 'Denis Villeneuve', 8.0),
(2, 'Hidden Figures', 'Drama', 2016, 'Theodore Melfi', 7.8),
(3, 'Parasite', 'Thriller', 2019, 'Bong Joon-ho', 8.6),
(4, 'Inception', 'Sci-Fi', 2010, 'Christopher Nolan', 8.8),
(5, 'Coco', 'Animation', 2017, 'Lee Unkrich', 8.4),
(6, 'The Farewell', 'Drama', 2019, 'Lulu Wang', 7.6),
(7, 'Knives Out', 'Mystery', 2019, 'Rian Johnson', 7.9),
(8, 'The Social Network', 'Biography', 2010, 'David Fincher', 7.7),
(9, 'Inside Out', 'Animation', 2015, 'Pete Docter', 8.1),
(10, 'Black Panther', 'Action', 2018, 'Ryan Coogler', 7.3);
