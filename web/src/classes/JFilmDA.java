package classes;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.*;
import java.lang.*;
import java.util.ArrayList;


public class JFilmDA {
    private static JMovie jmovie;
    private static JRating jrating;
    private static JUser juser;
    private static String URL = "jdbc:mysql://193.112.37.21:3306/MovieInfo?useUnicode=true&characterEncoding=UTF-8";
    private static  Connection con = null;
    private static  Statement smt;
    static int movieId;
    static String movieName;
    static String year;
    static String genre;
    static String director;
    static String postPic;
    static String stars;
    static String country;
    static String introduction;
    static String tags;
    static String relatedMovies;
    static String rating;
    static String userId;
    static String password;
    static String recommendedMovies;

    public static void ConnectInit() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL,"root","root");
            smt = con.createStatement();
            System.out.println("successfully Connected");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void Terminate() throws SQLException {
        try {
            con.close();
            smt.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }

    }

    public static ArrayList<JMovie> FindAllMovies() {
        ConnectInit();
        String sql = "SELECT * FROM Movie";
        jmovie = null;
        ArrayList<JMovie> movies = new ArrayList<JMovie>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                movieId = rs.getInt("movieId");
                movieName = rs.getString("movieName");
                year = rs.getString("year");
                tags = rs.getString("tags");
                genre = rs.getString("genre");
                director = rs.getString("director");
                postPic = rs.getString("postPic");
                stars = rs.getString("stars");
                country = rs.getString("country");
                introduction = rs.getString("introduction");
                relatedMovies = rs.getString("relatedMovies");
                jmovie = new JMovie(movieId, movieName, year, genre, director, postPic, stars, country, introduction, relatedMovies, tags);
                movies.add(jmovie);

            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Terminate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    public static ArrayList<JRating> FindAllRatings() {
        ConnectInit();
        String sql = "SELECT * FROM Rating";
        jrating = null;
        ArrayList<JRating> ratings = new ArrayList<JRating>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
               userId = rs.getString("userId");
               movieId = rs.getInt("movieId");
               rating = rs.getString("rating");
               jrating = new JRating(userId, movieId, rating);
               ratings.add(jrating);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Terminate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ratings;
    }

    public static ArrayList<JUser> FindAllUsers() {
        ConnectInit();
        String sql = "SELECT * FROM User";
        juser = null;
        ArrayList<JUser> users = new ArrayList<JUser>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                userId = rs.getString("userId");
                password = rs.getString("password");
                recommendedMovies = rs.getString("recommendedMovies");
                juser = new JUser(userId, password, recommendedMovies);
                users.add(juser);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Terminate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public static ArrayList<JMovie> FindMoviesByName(String mName) {
        ConnectInit();
        String sql = "SELECT * FROM Movie WHERE movieName = '" + mName + "'";
        jmovie = null;
        ArrayList<JMovie> movies = new ArrayList<JMovie>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                movieId = rs.getInt("movieId");
                movieName = rs.getString("movieName");
                year = rs.getString("year");
                genre = rs.getString("genre");
                director = rs.getString("director");
                postPic = rs.getString("postPic");
                stars = rs.getString("stars");
                country = rs.getString("country");
                introduction = rs.getString("introduction");
                relatedMovies = rs.getString("relatedMovies");
                tags = rs.getString("tags");
                jmovie = new JMovie(movieId, movieName, year, genre, director, postPic, stars, country, introduction, relatedMovies, tags);
                movies.add(jmovie);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Terminate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    public static ArrayList<JMovie> FindMoviesByYear(String mYear) {
        ConnectInit();
        String sql = "SELECT * FROM Movie WHERE year = '" + mYear + "'";
        jmovie = null;
        ArrayList<JMovie> movies = new ArrayList<JMovie>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                movieId = rs.getInt("movieId");
                movieName = rs.getString("movieName");
                year = rs.getString("year");
                genre = rs.getString("genre");
                director = rs.getString("director");
                postPic = rs.getString("postPic");
                stars = rs.getString("stars");
                country = rs.getString("country");
                introduction = rs.getString("introduction");
                relatedMovies = rs.getString("relatedMovies");
                tags = rs.getString("tags");
                jmovie = new JMovie(movieId, movieName, year, genre, director, postPic, stars, country, introduction, relatedMovies, tags);
                movies.add(jmovie);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Terminate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    public static ArrayList<JRating> FindRatingById(int mId, String uId) {
        ConnectInit();
        String sql = "SELECT * FROM Rating WHERE  userId = ' " + uId + " ' AND movieId = " + mId;
        jrating = null;
        ArrayList<JRating> ratings = new ArrayList<JRating>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                userId = rs.getString("userId");
                movieId = rs.getInt("movieId");
                rating = rs.getString("rating");
                jrating = new JRating(userId, movieId, rating);
                ratings.add(jrating);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Terminate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ratings;
    }

    public static ArrayList<JUser> FindUserById(String uId){
        ConnectInit();
        String sql = "SELECT * FROM Rating WHERE  userId = ' " + uId + "'";
        juser = null;
        ArrayList<JUser> users = new ArrayList<JUser>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                userId = rs.getString("userId");
                password = rs.getString("password");
                recommendedMovies = rs.getString("recommendedMovies");
                juser = new JUser(userId, password, recommendedMovies);
                users.add(juser);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            Terminate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public static  void main(String args[]) throws SQLException {
        ArrayList<JMovie> m = new ArrayList<JMovie>();
        m = FindMoviesByName("Toy Story");
        System.out.println(m.size());
//        ConnectInit();
//        Terminate();
    }
}
