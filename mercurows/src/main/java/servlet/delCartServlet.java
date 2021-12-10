package servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import pur.*;
import service.impl.DataServiceImpl;

@WebServlet("/delCart")
public class delCartServlet extends HttpServlet {
    DataServiceImpl dsi = new DataServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get data by post metoh
        HashMap<Integer, OrderItem> cart;
        OrderItem orderItem;
        Goods goods;
        BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream(), "utf-8"));
        StringBuffer sb = new StringBuffer();
        //构造字符缓冲流
        String temp = "";
        //StringBuffer一边读，一边判断，一边写
        while ((temp = br.readLine()) != null) {
            sb.append(temp);
        }
        //对串进行分割取分割后的第二个字符
        String str_id = sb.toString().split("=")[1].split("&")[0];
        String str_num = sb.toString().split("=")[2];
        //转整数
        int id = Integer.parseInt(str_id);
        int num = Integer.parseInt(str_num);
        System.out.print(str_id);
        System.out.print(str_num);
        //通过id找需要删除的商品
        goods = dsi.findById(id);
        System.out.println(goods);
        // 获取购物车
        cart = (HashMap<Integer, OrderItem>) req.getSession().getAttribute("cart");
        //在购物车中通过需要删除的商品的id找到对应的订单详情
        orderItem = cart.get(goods.getId());
        // 如果该订单的购买商品数量为刚好为减去的购买数量，则将订单详情删除
        if (orderItem.getBuyNum() - num==0) {
            cart.remove(id);
        }
        // 否则的话，将其对应购买数量-1
        else {
            orderItem.setBuyNum(orderItem.getBuyNum() - num);
        }
        // 将购物车重写入Session
        req.getSession().setAttribute("cart", cart);
        // req.getRequestDispatcher("shoppingCart.jsp").forward(req, resp);s
        System.out.println(cart);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
