package servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;
import pur.OrderItem;
import service.impl.OrdersItemServicelmpl;

@WebServlet("/infoCenter")
public class infoCenterServlet extends HttpServlet {
    OrdersItemServicelmpl ois = new OrdersItemServicelmpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // String sId = req.getSession().getId();
        Customer customer = (Customer) req.getSession().getAttribute("customer");
        if (customer == null) {
            req.getRequestDispatcher("doLoin.jsp").forward(req, resp);
            // resp.sendRedirect("doLoin.jsp");
        }
        else {
            HashMap<String, Object> user = new HashMap<>();
            user.put("customers_id", ""+customer.getId());
            HashMap<Integer, OrderItem> orderitem = ois.findByProp(user);
            req.getSession().setAttribute("orderitem", orderitem);
            // req.getSession().setAttribute("customer", customer);
            req.getRequestDispatcher("infoCenter.jsp").forward(req, resp);
            // resp.sendRedirect("infoCenter.jsp");
            // String sId = req.getSession().getId();
            // Cookie cookie = new Cookie("JSESSIONID", sId);
            // cookie.setMaxAge(6 * 6 * 24 * 7);
            // resp.addCookie(cookie);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
