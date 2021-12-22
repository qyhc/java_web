package servlet;

import java.io.IOException;
import java.io.PrintWriter;

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
        req.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
        resp.setContentType("text/html;charset=utf-8");
        resp.setHeader("Cache-Control", "no-cache");
        PrintWriter out = resp.getWriter();
        // 若找到，则将客户信息写进session，页面去商场首页，否则强制去登陆页
        if (c != null) {
            // out.print("<script>alert('登录成功!正在问您跳转至商城');</script>");
            req.getSession().setAttribute("customer", c);
            req.getRequestDispatcher("market").forward(req, resp);
        }
        else {
            out.print("<script>alert('账号或密码错误!');window.location='doLoin.jsp'</script>");
            // req.getRequestDispatcher("doLoin.jsp").forward(req, resp);
        }
        //调试运行
//        resp.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
