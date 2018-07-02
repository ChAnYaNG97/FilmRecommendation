package classes;

import java.util.ArrayList;

public class Main {
    public static void main(String args[])
    {
        ArrayList<JMovie> list = new ArrayList<JMovie>();
        list = JMovie.FindTenMovies();
        for(JMovie ele : list)
        {
            System.out.println(ele.getMovieName());
        }
    }
}
