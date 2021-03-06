package servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;
import pur.OrderItem;
import service.impl.OrdersItemServicelmpl;

@WebServlet("/myOrder")
public class myOrderServlet extends HttpServlet {
    OrdersItemServicelmpl ois = new OrdersItemServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String, Object> user = new HashMap<>();
        Customer customer =  (Customer)req.getSession().getAttribute("customer");
        user.put("customers_id", ""+customer.getId());
        HashMap<Integer, OrderItem> orderitem = ois.findByProp(user);
        req.getSession().setAttribute("orderitem", orderitem);
        req.getRequestDispatcher("myOrder.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
