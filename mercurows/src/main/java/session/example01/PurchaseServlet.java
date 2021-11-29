package session.example01;

import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class PurchaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //活得用户购买的商品
        System.out.println("PurchaseServlet------------------------------------------");
        String id = req.getParameter("id");
        if (id == null) {
            //如果用户购买的商品为null，重定向到ListBookServlet页面
            String url = "ListBookServlet";
            resp.sendRedirect(url);
            return;
        }

        Book book = BookDb.getBook(id);
        //创建或者活得用户的Session对象
        HttpSession session = req.getSession();
        //从Session对象中活得用户的购物车
        List<Book> cart = (List) session.getAttribute("cart");
        if (cart == null) {
            //首次购买，为用户创建一个购物车(List 集合模拟购物车)
            cart = new ArrayList<Book>();
            //将购物车存入Session对象
            session.setAttribute("cart", cart);
        }
        //将商品放入购物车
        cart.add(book);
        //创建Cookie存放Session的标识符
        Cookie cookie = new Cookie("JSESSIONID", session.getId());
        cookie.setMaxAge(60 * 30);
        cookie.setPath("/");
        resp.addCookie(cookie);
        //重定向到购物车页面
        String url = "CartServlet";
        resp.sendRedirect(url);

    }
}
