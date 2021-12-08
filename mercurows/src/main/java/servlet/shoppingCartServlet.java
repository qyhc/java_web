package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;

import java.io.IOException;

@WebServlet("/shoppingCart")

public class shoppingCartServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer =(Customer) req.getSession().getAttribute("customer");
        if (customer == null) {
            req.getRequestDispatcher("doLoin.jsp").forward(req, resp);
        }
        else {
            req.getRequestDispatcher("shoppingCart.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
