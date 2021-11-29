package session.example01;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");//
        PrintWriter out = resp.getWriter();
        //变量cart引用用户的购物车
        List<Book> cart = null;
        //变量purFlag标记用户是否购买过商品
        boolean purFlag = true;
        //获得用户的session
        HttpSession session = req.getSession(false);
        //如果session为null，purFlag设置为false
        if (session == null) {
            purFlag = false;
        }
        else {
            //获取用户购物车
            cart = (List) session.getAttribute("cart");
            //如果用的购物车为null，purFlag置为为false
            if (cart == null) {
                purFlag = false;
            }
        }
        //如果purFlag 为flase，表明用户没有购买图书 重定向到Listservlet 页面
        if (!purFlag) {
            out.write("对不起！您没有购买任何商品！");
        }
        else {
            //否者显示用户购买图书的信息
            out.write("您购买的图书有：<br />");
            double price = 0;
            for (Book book : cart) {
                out.write(book.getName() + "<br />");
            }
        }
    }

}
