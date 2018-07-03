package classes;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/display")
public class DisplayOperate extends HttpServlet{
    public void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
       int id = Integer.parseInt(request.getParameter("id"));
       JMovie movie = JMovie.FindMoviesById(id);
       String[] ids = movie.getRelatedMovies().split(" ");
       ArrayList<JMovie> recommendedMovies = new ArrayList<JMovie>();
       for(String idstring : ids) {
           recommendedMovies.add(JMovie.FindMoviesById(Integer.parseInt(idstring)));
       }


        request.setAttribute("movie",movie);
        request.setAttribute("relatedmovie",recommendedMovies);
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }
}