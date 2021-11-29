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
        System.out.print("--------------------------A--------------------------------------------");
        req.setAttribute("goods", gsi.findByProp(null));
        System.out.print(gsi.findByProp(null));
        req.getRequestDispatcher("market.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
