package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;
import service.impl.CustomerServicelmpl;

@WebServlet("/updatepass")

public class UpdatepassServlet extends HttpServlet {
    CustomerServicelmpl csi = new CustomerServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 從session 中獲取customer對象
        Customer customer = (Customer) req.getSession().getAttribute("customer");

        // 獲取頁面要修改的内容 （也可以采用bean 對象處理）
        String oriPassword = req.getParameter("oriPassword");
        String tel = req.getParameter("tel");
        if (customer.getPass().equals(oriPassword) && customer.getTel().equals(tel)) {
            String newPassword = req.getParameter("newPassword");
            customer.setPass(newPassword);
            if (csi.modify(customer)) {
                req.getSession().setAttribute("customer", customer);
                resp.setHeader("Content-Type", "text/html;charset=utf-8");
                // resp.getWriter().println("更新成功");
                resp.getWriter().println("1");
            } else {
                resp.getWriter().println("0");
            }
        }
        else {
            resp.getWriter().println("0");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        this.doGet(req, resp);
    }

}
