package servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;


public class demo2 extends HttpServlet {
    String username;
    public void destroy() {
        System.out.println("对象销毁成功");
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        username = req.getParameter( "username");
        try{
            Thread.sleep(3000);
        }
        catch (InterruptedException e){
            e.printStackTrace();
        }
        PrintWriter pw = resp.getWriter();
        pw.println("Welcome"+ username);
        pw.close();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
