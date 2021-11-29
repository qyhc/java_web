package servlet;

import java.io.IOException;

import javax.servlet.*;

public class demo implements Servlet{

    @Override
    public void destroy() {
        System.out.println("销毁成功 ");

    }

    @Override
    public ServletConfig getServletConfig() {
        System.out.println("销毁成功 ");

        return null;
    }

    @Override
    public String getServletInfo() {
        System.out.println("销毁成功 ");

        return null;
    }

    @Override
    public void init(ServletConfig arg0) throws ServletException {
        System.out.println("初始化成功");

    }

    @Override
    public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
        System.out.println("第一个");
    }


}
