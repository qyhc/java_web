package servlet;
import java.io.IOException;

import javax.servlet.*;


public class demo1 extends GenericServlet{

    @Override
    public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
        System.out.println("第二个");
    }

}
