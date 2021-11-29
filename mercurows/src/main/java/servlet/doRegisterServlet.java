package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;
import pur.Region;
import service.impl.CustomerServicelmpl;

@WebServlet("/doRegister")

public class doRegisterServlet extends HttpServlet {
    CustomerServicelmpl csi = new CustomerServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        resp.getWriter().println("my first program！");
        // 接受从register.jsp传来的三个参数
        String u = req.getParameter("username");
        String p = req.getParameter("password");
        String tel = req.getParameter("tel");

        // 下面生成 Region，Customer对象，添加入顾客中
        Region re = new Region();
        re.setId(90002);

        Customer cu = new Customer();
        cu.setUsername(u);
        cu.setPass(p);
        cu.setTel(tel);
        cu.setRegion(re);

        // 获取当前时间戳
        String t = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        cu.setRegTime(t);

        boolean res = csi.add(cu);

        // 若找到，则将客户信息写进session，页面去商场首页，否则强制去登陆页
        if (res) {
            req.getRequestDispatcher("doLoin.jsp").forward(req, resp);
        }
        else{
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        //调试运行
//        resp.sendRedirect("main.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
