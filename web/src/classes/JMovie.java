package classes;

import java.sql.SQLException;
import java.util.ArrayList;
public class JMovie {
    private int movieId;
    private String movieName;
    private String year;
    private String genre;
    private String director;
    private String postPic;
    private String stars;
    private String country;
    private String introduction;
    private String relatedMovies;
    private String tags;
    public JMovie(){}
    public JMovie(int movieId, String movieName,String year, String genre, String director, String postPic, String stars, String country, String introduction, String relatedMovies, String tags){
        this.movieId = movieId;
        this.movieName = movieName;
        this.year = year;
        this.genre = genre;
        this.director = director;
        this.postPic = postPic;
        this.stars = stars;
        this.country = country;
        this. introduction = introduction;
        this.relatedMovies = relatedMovies;
        this.tags = tags;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getPostPic() {
        return postPic;
    }

    public void setPostPic(String postPic) {
        this.postPic = postPic;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getStars() {
        return stars;
    }

    public void setStars(String stars) {
        this.stars = stars;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getRelatedMovies() {
        return relatedMovies;
    }

    public void setRelatedMovies(String relatedMovies) {
        this.relatedMovies = relatedMovies;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public static  ArrayList<JMovie> FindAllMovie(){
        return JFilmDA.FindAllMovies();
    }

    public static ArrayList<JMovie> FindMoviesByName(String mName){
        return JFilmDA.FindMoviesByName(mName);
    }

    public static ArrayList<JMovie> FindMoviesByYear(String mYear){
        return JFilmDA.FindMoviesByYear(mYear);
    }

    public static  ArrayList<JMovie> FindTenMovies(){
        return JFilmDA.FindTenMovies();
    }

        public static  void main(String args[]) {
            ArrayList<JMovie> m = new ArrayList<JMovie>();
            m = FindTenMovies();
            System.out.println(m.size());

    }
}
