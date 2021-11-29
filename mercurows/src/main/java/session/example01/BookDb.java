package session.example01;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class BookDb {
    private static Map<String, Book> books = new LinkedHashMap<String, Book>();
    static {
        books.put("1", new Book("1", "Javaweb开发"));
        books.put("2", new Book("2", "Jabc基础"));
        books.put("3", new Book("3", "Java基础"));
        books.put("4", new Book("4", "struts开发"));
        books.put("5", new Book("5", "spring开发"));
    }

    public static Collection<Book> getAll() {
        return books.values();
    }

    public static Book getBook(String id) {
        return  books.get(id);
    }

}
