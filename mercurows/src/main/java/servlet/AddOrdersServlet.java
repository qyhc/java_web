package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

import pur.Orders;
import service.impl.OrdersServicelmpl;

@WebServlet("/addOrders")
public class AddOrdersServlet extends HttpServlet{
    OrdersServicelmpl oci = new OrdersServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Orders order = new Orders();


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        this.doGet(req, resp);
    }

}
