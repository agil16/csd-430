package model;

import java.io.Serializable;

public class Book implements Serializable {
    private String title, author, isbn, publisher;
    private double price;

    public Book() {}

    public Book(String title, String author, String isbn, String publisher, double price) {
        this.title = title; this.author = author; this.isbn = isbn; this.publisher = publisher; this.price = price;
    }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }

    public String getPublisher() { return publisher; }
    public void setPublisher(String publisher) { this.publisher = publisher; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
