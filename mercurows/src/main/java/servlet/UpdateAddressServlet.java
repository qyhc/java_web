package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pur.City;
import pur.Customer;
import pur.Province;
import pur.Region;
import service.impl.CustomerServicelmpl;

@WebServlet("/updateaddress")
public class UpdateAddressServlet extends HttpServlet {
    CustomerServicelmpl csi = new CustomerServicelmpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
        resp.setContentType("text/html;charset=utf-8");
        resp.setHeader("Cache-Control", "no-cache");
        // 從session 中獲取customer對象
        Customer customer = (Customer) req.getSession().getAttribute("customer");

        Province province = new Province();
        City city = new City();
        Region region = new Region();

        int int_text1 = Integer.parseInt(req.getParameter("int_text1"));//省id
        int int_text2 = Integer.parseInt(req.getParameter("int_text2"));//市id
        int int_text3 = Integer.parseInt(req.getParameter("int_text3"));//区id

        String str_text1 = req.getParameter("str_text1");//省名称
        String str_text2 = req.getParameter("str_text2");//市名称
        String str_text3 = req.getParameter("str_text3");//区名称

        province.setId(int_text1);
        province.setName(str_text1);
        city.setId(int_text2);
        city.setName(str_text2);
        region.setCity(city);
        region.setName(str_text3);
        region.setId(int_text3);

        customer.setRegion(region);
        if (csi.modify(customer)) {
            req.getSession().setAttribute("customer", customer);
            resp.setHeader("Content-Type", "text/html;charset=utf-8");
            resp.getWriter().println("1");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        this.doGet(req, resp);
    }

}
