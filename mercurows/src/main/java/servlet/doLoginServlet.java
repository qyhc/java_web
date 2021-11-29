package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;
import service.impl.CustomerServicelmpl;

@WebServlet("/doLoin")

public class doLoginServlet extends HttpServlet {
    CustomerServicelmpl csi = new CustomerServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        resp.getWriter().println("my first program！");
        String u = req.getParameter("username");
        String p = req.getParameter("password");

        Customer c = csi.login(u, p);
        // 若找到，则将客户信息写进session，页面去商场首页，否则强制去登陆页
        if (c != null) {
            req.getSession().setAttribute("customer", c);
            req.getRequestDispatcher("market").forward(req, resp);
        }
        else{
            req.getRequestDispatcher("doLoin.jsp").forward(req, resp);
        }
        //调试运行
//        resp.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
