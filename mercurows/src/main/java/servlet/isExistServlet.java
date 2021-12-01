package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.impl.CustomerServicelmpl;

@WebServlet("/isExist")

public class isExistServlet extends HttpServlet {

    CustomerServicelmpl csi = new CustomerServicelmpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取填选用户名
        String u = req.getParameter("username");
        // 获取填选邮箱
        String tel = req.getParameter("tel");
        if (csi.isExist("username",u)||csi.isExist("tel",tel)) {
            resp.getWriter().println("1");
        }
        else {
            resp.getWriter().println("0");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
