package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;
import service.impl.CustomerServicelmpl;

@WebServlet("/IsLegality")

public class IsLegality extends HttpServlet {

    CustomerServicelmpl csi = new CustomerServicelmpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取本用户名
        Customer customer = (Customer) req.getSession().getAttribute("customer");

        String _u = null;
        String _t = null;
        String _e = null;
        String _c = null;

        if (customer != null) {
            _u = customer.getUsername();
            _t = customer.getTel();
            _e = customer.getEmail();
            _c = customer.getCardID();
        }

        // 当前需要判别的类型（用户名还是电话还是邮箱还是身份证）
        String Stype = req.getParameter("Stype");
        // 获取用户名
        String u = req.getParameter("username");
        // 获取电话
        String tel = req.getParameter("tel");
        // 获取邮箱
        String email = req.getParameter("email");
        // 呼获取身份证
        String cardID = req.getParameter("cardID");
        /**
         *  1:  用户名存在，或null
         *  2：电话存在，或null
         *  -2：电话格式不正确
         *   3： 邮箱格式不正确，或null
         *  4： 身份证存在，或null
         *
         */
        if (Stype == null) {
            resp.getWriter().println("-1");
        }
        else {
            String[] st = Stype.split("&");
            for (String type : st) {
                if (type.equalsIgnoreCase("username") && (u == null || csi.isExist("username", u) && !u.equals(_u))) {
                    resp.getWriter().println("1");
                    return;
                } else if (type.equalsIgnoreCase("tel") && (tel == null || csi.isExist("tel", tel) && !tel.equals(_t))) {
                    resp.getWriter().println("2");
                    return;
                } else if (type.equalsIgnoreCase("tel") && (!csi.isLegality(tel))) {
                    resp.getWriter().println("-2");
                    return;
                } else if (type.equalsIgnoreCase("email") && (email == null || csi.isExist("email", email) && !email.equals(_e))) {
                    resp.getWriter().println("3");
                    return;
                } else if (type.equalsIgnoreCase("cardID") && (cardID == null || csi.isExist("cardID", cardID) && !cardID.equals(_c))) {
                    resp.getWriter().println("4");
                    return;
                }
            }
            resp.getWriter().println("0");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
