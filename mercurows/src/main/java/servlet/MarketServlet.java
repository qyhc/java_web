package servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import pur.*;
import service.impl.DataServiceImpl;
import service.impl.GoodsServicelmpl;

@WebServlet("/market")
public class MarketServlet extends HttpServlet {
    GoodsServicelmpl gsi = new GoodsServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // resp.getWriter().println("marketservlet");
        HashMap<Integer, Goods> goods = null;
        req.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
        resp.setContentType("text/html;charset=utf-8");
        resp.setHeader("Cache-Control", "no-cache");
        // PrintWriter out = resp.getWriter();  //输出中文，这一句一定要放到response.setContentType("text/html;charset=utf-8"),  response.setHeader("Cache-Control", "no-cache")后面，否则中文返回到页面是乱码
        String keyWord = req.getParameter("content");
        System.out.print("--------------------------A--------------------------------------------");
        if (keyWord == null) {
            req.setAttribute("goods", gsi.findByProp(null));
        }
        else {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("keywords", keyWord);
            goods = (HashMap<Integer, Goods>) gsi.findByProp(map);
            req.setAttribute("goods", goods);

        }

        // System.out.print(gsi.findByProp(null));
        req.getRequestDispatcher("market.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
