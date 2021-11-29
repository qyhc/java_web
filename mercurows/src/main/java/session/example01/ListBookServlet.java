package session.example01;

import java.io.*;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ListBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");//
        PrintWriter out = resp.getWriter();
        Collection<Book> books = BookDb.getAll();
        out.write("本站提供的图书有：<br />");
        for (Book book : books) {
            System.out.println("上");
            String url = "/mercurows/PurchaseServlet?id="+book.getId();//
            System.out.println("中");
            out.write(book.getName() + "<a href = '" + url + "'>点击购买</a><br />");
            System.out.println("下");
        }
    }

}
