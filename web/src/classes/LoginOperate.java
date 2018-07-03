package classes;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginOperate extends HttpServlet{
    public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        System.out.println(password);
        JUser user = JUser.FindUserByName(username);



        if(user != null && password.equals(user.getPassword())) {
            System.out.println("database username:" + user.getUserName());
            request.getSession().setAttribute("userId", user.getUserId());
            request.getRequestDispatcher("/index").forward(request, response);
        }
        else {
            response.sendRedirect("login.jsp");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        service(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        service(request, response);
    }
}