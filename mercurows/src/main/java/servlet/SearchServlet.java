package servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import pur.*;
import service.impl.GoodsServicelmpl;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    GoodsServicelmpl gsi = new GoodsServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // resp.getWriter().println("searchservlet");
        // 输入为空的情况？
        System.out.print("--------------------------A--------------------------------------------");

        req.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
        resp.setContentType("text/html;charset=utf-8");
        resp.setHeader("Cache-Control", "no-cache");
        // PrintWriter out = resp.getWriter();  //输出中文，这一句一定要放到response.setContentType("text/html;charset=utf-8"),  response.setHeader("Cache-Control", "no-cache")后面，否则中文返回到页面是乱码
        String keyWord = req.getParameter("content");
        // 查询所有的在库商品
        HashMap<Integer, Goods> allGoods = gsi.findByProp(null);
        // 结果存储包含关键字的商品结果集
        HashMap<Integer, Goods> res = new HashMap<Integer, Goods>();
        // 遍历哈希表
        for (Map.Entry<Integer, Goods> entry : allGoods.entrySet()) {
            // 看当前遍历到的商品是否包含该关键字
            if (math(entry.getValue().getKeywords(), keyWord)) {
                // 若是则添加
                res.put(entry.getKey(), entry.getValue());
                System.out.print(entry.getValue());
            }
        }

        // 将查询结果写入session
        req.getSession().setAttribute("goods_search", res);
        // System.out.print(gsi.findByProp(null));
        req.getRequestDispatcher("search.jsp").forward(req,resp);
        // resp.sendRedirect("search.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    /**
     *  匹配字符串字串
     * @param give 所给的字符串
     * @param goal  目标字串
     */
    public boolean math(String give, String goal) {
        if (give.length() < goal.length())
            return false;
        for (int i = 0; i < give.length(); i++) {
            int cnt = 0;
            int j = 0;
            while (cnt + j < goal.length() && give.subSequence(i, i + cnt).equals(goal.subSequence(j, j + cnt))) {
                cnt++;
            }
            if(cnt+j == goal.length())
                return true;
        }
        return false;
    }

}
