package classes;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/")
public class IndexOperate extends HttpServlet{
    public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        ArrayList<JMovie> list = new ArrayList<JMovie>();
        list = JMovie.FindMoviesWithNum(9);
        request.setAttribute("list",list);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            doPost(request, response);
        }
        @Override
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            request.setCharacterEncoding("UTF-8");
            ArrayList<JMovie> list = new ArrayList<JMovie>();
            list = JMovie.FindMoviesWithNum(9);
            request.setAttribute("list",list);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

