package servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import pur.*;
import service.impl.DataServiceImpl;

public class addCartServlet extends HttpServlet {
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
        String str_id = sb.toString().split("=")[1];
        //转整数
        int id = Integer.parseInt(str_id);
        System.out.print(str_id);
        //通过id找商品
        goods = dsi.findById(id);
        System.out.println(goods);
        cart = (HashMap<Integer, OrderItem>) req.getSession().getAttribute("cart");
        //判断session中有无购物车cart
        if (cart == null) {
            //若无则生成
            cart = new HashMap<Integer, OrderItem>();
        }
        //若有，则修改后重新写入；若无则全新写入


        //判断购物详情是否在购物车中存在，若存在，则修改数量，否则，新增一条购物详情
        orderItem = cart.get(goods.getId());
        if (orderItem == null) {
            orderItem = new OrderItem();
            orderItem.setGoods(goods);
            orderItem.setBuyNum(1);
        }
        else {
            orderItem.setBuyNum(orderItem.getBuyNum() + 1);
        }
        //将购物详情写入购物车
        cart.put(goods.getId(), orderItem);

        //如有则修改后改，否则全新写入
        // req.setAttribute("cart", cart);
        req.getSession().setAttribute("cart", cart);
        System.out.println(cart);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
