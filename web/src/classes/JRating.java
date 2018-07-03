package classes;

import java.util.ArrayList;
public class JRating {
    private int userId;
    private int movieId;
    private String rating;
    public JRating(){}
    public JRating(int userId, int movieId, String rating){
        this.userId = userId;
        this.movieId = movieId;
        this.rating = rating;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public static  ArrayList<JRating> FindALLRating(){
        return JFilmDA.FindAllRatings();
    }

    public static ArrayList<JRating> FindRatingById(int mId, String uId){
        return JFilmDA.FindRatingById(mId, uId);
    }
}
