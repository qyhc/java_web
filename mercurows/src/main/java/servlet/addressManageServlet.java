package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.CustomerServicelmpl;

@WebServlet("/addressManage")

public class addressManageServlet extends HttpServlet {
    CustomerServicelmpl csi = new CustomerServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        resp.getWriter().println("my first program！");
        // String u = req.getParameter("username");
        // String p = req.getParameter("password");
        // Customer c = csi.login(u, p);
        // req.getSession().setAttribute("customer", c);
        req.getRequestDispatcher("addressManage.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
