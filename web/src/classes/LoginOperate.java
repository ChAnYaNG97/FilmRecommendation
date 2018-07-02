package classes;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginOperate extends HttpServlet{
    public void init()throws ServletException{
        JFilmDA.ConnectInit();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        //String title = "使用POST方法读取表单";
        String username =new String("admin");
        //String docType = "<!DOCTYPE html> \n";
        String password = new String("admin");
        if(username.equals("root") && password.equals("root")) {
            request.getSession().setAttribute("username", "admin");
//            ArrayList<Product> list = ProductDA.FindAll();
//            request.setAttribute("list",list);
            String address = "./articles.jsp";
            request.getRequestDispatcher(address).forward(request,response);
        }
        else{
            response.sendRedirect("./login.jsp");
        }
    }
    public void destroy(){
        try {
            JFilmDA.Terminate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
