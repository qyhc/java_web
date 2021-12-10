package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;
import pur.OrderItem;
import pur.Orders;
import service.impl.DataServiceImpl;
import service.impl.OrdersItemServicelmpl;
import service.impl.OrdersServicelmpl;

@WebServlet("/addOrders")
public class AddOrdersServlet extends HttpServlet{
    OrdersServicelmpl oci = new OrdersServicelmpl();
    DataServiceImpl dsi = new DataServiceImpl();
    OrdersItemServicelmpl oici = new OrdersItemServicelmpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer = (Customer)req.getSession().getAttribute("customer");
        Orders order = new Orders();
        BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(), "utf-8"));
        StringBuffer sb = new StringBuffer();
        //构造字符缓冲流
        String temp = "";

        //StringBuffer一边读，一边判断，一边写
        while ((temp = br.readLine()) != null) {
            sb.append(temp);
        }

        String str_id = sb.toString().split("&")[0].split("=")[1];
        int id = Integer.parseInt(str_id);
        String str_num = sb.toString().split("&")[1].split("=")[1];
        int num = Integer.parseInt(str_num);
        String str_totalSum = sb.toString().split("&")[2].split("=")[1];
        float totalSum = Float.parseFloat(str_totalSum);
        String t = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        order.setTotalSum(totalSum);
        order.setCarriage(10.0);
        order.setRealSum(totalSum);
        order.setTotalNum(num);
        order.setReceiverAddress(customer.getDetail_address());
        order.setReceiverName(customer.getUsername());
        order.setReceiverTel(customer.getTel());
        order.setOrderTime(t);
        order.setPayTime(t);
        order.setCustomer(customer);
        oci.add(order);

        // 创建订单详情类
        OrderItem orderItem = new OrderItem();
        orderItem.setOrders(order);
        orderItem.setGoods(dsi.findById(id));
        orderItem.setBuyPrice(dsi.findById(id).getOut_price());
        orderItem.setBuyNum(num);
        oici.add(orderItem);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        this.doGet(req, resp);
    }

}
