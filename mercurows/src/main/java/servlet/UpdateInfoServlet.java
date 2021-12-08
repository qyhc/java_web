package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.Customer;
import service.impl.CustomerServicelmpl;

@WebServlet("/updateInfo")

public class UpdateInfoServlet extends HttpServlet {
    CustomerServicelmpl csi = new CustomerServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 從session 中獲取customer對象
        Customer customer = (Customer) req.getSession().getAttribute("customer");

        // 獲取頁面要修改的内容 （也可以采用bean 對象處理）
        String realname = req.getParameter("realname");
        // 處理中文亂碼問題
        realname = new String(realname.getBytes("iso8859-1"), "utf-8");
        // 從新設置顧客的參數
        customer.setRealname(realname);

        // 以下如法炮製

        String intro = req.getParameter("intor");
        customer.setIntro(intro);

        String tel = req.getParameter("tel");
        customer.setTel(tel);

        String email = req.getParameter("email");
        customer.setEmail(email);

        String gender = req.getParameter("gender");
        customer.setGender(gender);

        String cardID = req.getParameter("cardID");
        customer.setCardID(cardID);

        if (csi.modify(customer)) {
            req.getSession().setAttribute("customer", customer);
            resp.setHeader("Content-Type", "text/html;charset=utf-8");
            resp.getWriter().println("更新成功");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        this.doGet(req, resp);
    }

}
