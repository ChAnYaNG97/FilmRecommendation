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
    static int userId;
    static String userName;
    static String movieName;
    static String year;
    static String genre;
    static String director;
    static String postPic;
    static String stars;
    static String country;
    static String introduction;
    static String relatedMovies;
    static String rating;
    static String password;
    static String recommendedMovies;
    static double averageRating;

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
        String sql = "SELECT * FROM Movie1";
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
                averageRating = rs.getDouble("rating");
                jmovie = new JMovie(movieId, movieName, year, genre, director, postPic, stars, country, introduction, relatedMovies, averageRating);
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

    public static ArrayList<JUser> FindAllUsers() {
        ConnectInit();
        String sql = "SELECT * FROM User";
        juser = null;
        ArrayList<JUser> users = new ArrayList<JUser>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                userId = rs.getInt("userId");
                userName = rs.getString("userName");
                password = rs.getString("password");
                recommendedMovies = rs.getString("recommendedMovies");
                juser = new JUser(userId, userName, password, recommendedMovies);
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


    public static ArrayList<JRating> FindAllRatings() {
        ConnectInit();
        String sql = "SELECT * FROM Rating";
        jrating = null;
        ArrayList<JRating> ratings = new ArrayList<JRating>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
               userId = rs.getInt("userId");
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

    public static String FindMovieByUserId(int userId) {
        ConnectInit();
        String sql = "SELECT * FROM User1 WHERE userId = " + userId;
        System.out.println(sql);
        String result = "";
        try {
            ResultSet rs = smt.executeQuery(sql);
            while(rs.next()){
                result = rs.getString("recommendedMovies");
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
        return result;

    }
    public static ArrayList<JMovie> FindMoviesByName(String mName) {
        ConnectInit();
        String sql = "SELECT * FROM Movie1 WHERE lower(movieName) LIKE '%" + mName + "%'";
        System.out.println(sql);
        jmovie = null;
        ArrayList<JMovie> movies = new ArrayList<JMovie>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                postPic = rs.getString("postPic");
                stars = rs.getString("stars");
                movieId = rs.getInt("movieId");
                movieName = rs.getString("movieName").split("\\(")[0];
                year = rs.getString("year");
                genre = rs.getString("genre");
                director = rs.getString("director");
                stars = rs.getString("stars");
                country = rs.getString("country");
                introduction = rs.getString("introduction");
                relatedMovies = rs.getString("relatedMovies");
                averageRating = rs.getDouble("rating");
                if (postPic.equals("")){
                    postPic = "./images/NoPicFind.jpg";
                }
                if (stars.equals("")){
                    stars = "International stars";
                }
                if (director.equals("")){
                    director = "Famous director";
                }
                jmovie = new JMovie(movieId, movieName, year, genre, director, postPic, stars, country, introduction, relatedMovies, averageRating);
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

    public static JMovie FindMoviesById(int id) {
        ConnectInit();
        String sql = "SELECT * FROM Movie1 WHERE movieId = " + id;
        jmovie = null;
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
                averageRating = rs.getDouble("rating");
                if (postPic.equals("")){
                    postPic = "./images/NoPicFind.jpg";
                }
                if (stars.equals("")){
                    stars = "International stars";
                }
                jmovie = new JMovie(movieId, movieName, year, genre, director, postPic, stars, country, introduction, relatedMovies,averageRating);
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
        return jmovie;
    }

    public static ArrayList<JMovie> FindMoviesByYear(String mYear) {
        ConnectInit();
        String sql = "SELECT * FROM Movie1 WHERE year = '" + mYear + "'";
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
                averageRating = rs.getDouble("rating");
                if (postPic.equals("")){
                    postPic = "./images/NoPicFind.jpg";
                }
                if (stars.equals("")){
                    stars = "International stars";
                }
                if (director.equals("")){
                    director = "Famous director";
                }
                jmovie = new JMovie(movieId, movieName, year, genre, director, postPic, stars, country, introduction, relatedMovies, averageRating);
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

    public static  ArrayList<JMovie> FindMoviesWithNum(int mNum){
        ConnectInit();
        String sql = "SELECT * FROM Movie1 ORDER BY RAND() LIMIT " + mNum;
        jmovie = null;
        ArrayList<JMovie> movies = new ArrayList<JMovie>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            System.out.println("rs" + rs);
            while (rs.next()) {
                movieId = rs.getInt("movieId");
                movieName = rs.getString("movieName").split("\\(")[0];
                year = rs.getString("year");
                genre = rs.getString("genre");
                director = rs.getString("director");
                postPic = rs.getString("postPic");
                stars = rs.getString("stars");
                country = rs.getString("country");
                introduction = rs.getString("introduction");
                relatedMovies = rs.getString("relatedMovies");
                averageRating = rs.getDouble("rating");
                if (postPic.equals("")){
                    postPic = "./images/NoPicFind.jpg";
                }
                if (stars.equals("")){
                    stars = "International stars";
                }
                if (director.equals("")){
                    director = "Famous director";
                }
                jmovie = new JMovie(movieId, movieName, year, genre, director, postPic, stars, country, introduction, relatedMovies, averageRating);
                movies.add(jmovie);
            }
            rs.close();
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
                userId = rs.getInt("userId");
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
        String sql = "SELECT * FROM Rating WHERE  userId = '" + uId + "'";
        juser = null;
        ArrayList<JUser> users = new ArrayList<JUser>();
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                userId = rs.getInt("userId");
                userName = rs.getString("userName");
                password = rs.getString("password");
                recommendedMovies = rs.getString("recommendedMovies");
                juser = new JUser(userId, userName,password, recommendedMovies);
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

    public static JUser FindUserByName(String uName){
        ConnectInit();
        String sql = "SELECT * FROM User WHERE  userName= '" + uName + "'";
        juser = null;
        try {
            ResultSet rs = smt.executeQuery(sql);
            while (rs.next()) {
                userId = rs.getInt("userId");
                userName = rs.getString("userName");
                password = rs.getString("password");
                recommendedMovies = rs.getString("recommendedMovies");
                juser = new JUser(userId, userName,password, recommendedMovies);
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
        return juser;
    }



}
