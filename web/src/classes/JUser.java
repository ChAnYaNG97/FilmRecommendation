package classes;

import java.util.ArrayList;
public class JUser {
    private String userId;
    private String password;
    private String recommendedMovies;
    public  JUser() {}
    public JUser(String userId, String password, String recommendedMovies) {
        this.userId = userId;
        this.password = password;
        this.recommendedMovies = recommendedMovies;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
}
