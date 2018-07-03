package classes;

import java.util.ArrayList;
public class JUser {
    private int userId;
    private String userName;
    private String password;
    private String recommendedMovies;
    public  JUser() {}
    public JUser(int userId, String userName, String password, String recommendedMovies) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.recommendedMovies = recommendedMovies;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRecommendedMovies() {
        return recommendedMovies;
    }

    public void setRecommendedMovies(String recommendedMovies) {
        this.recommendedMovies = recommendedMovies;
    }

    public static ArrayList<JUser> FindAllUsers(){
        return JFilmDA.FindAllUsers();
    }

    public static ArrayList<JUser> FindUserById(String uId){
        return JFilmDA.FindUserById(uId);
    }

    public static JUser FindUserByName(String uName){return JFilmDA.FindUserByName(uName);}
}

