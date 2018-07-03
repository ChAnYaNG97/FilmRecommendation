<!doctype html>
<html lang="en">
<%@ page language="java" pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="classes.JMovie" %>
<%JMovie movie = (JMovie)request.getAttribute("movie");%>
    <%ArrayList<JMovie> relatedMovies = (ArrayList<JMovie>) request.getAttribute("relatedmovie");%>

<head>
    <title>Hello, world!</title>

    <!-- Required meta tags -->
    <meta charset="utf-8"></meta>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
        crossorigin="anonymous"></link>
    <!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="./css/display.css"></link>
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"></link>
</head>

<body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <nav id="navibar" class="navbar fixed-top navbar-expand-sm navbar-dark bg-dark">
        <a>
            <img id="nav-img" src="./images/brand-white.png">
        </a>



        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <form class="form-inline my-2 my-lg-0" method="post" action="/web/search" accept-charset="utf-8">
                <input id="nav-search" name="name" class="form-control form-control-sm mr-sm-3" type="search" placeholder="搜索你感兴趣的内容" aria-label="Search">
                <button class="btn btn-primary btn-sm" method="post" action="/search" type="submit">search</button>
            </form>


        </div>
    </nav>


        <!-- <div class="row col-lg-offset-1 col-lg-10"> -->
                
        <div class="card movie-card">
            <div class="card-body">
                    <div class="media">
                        <img class="media-img" src="<%=movie.getPostPic()%>" alt="Generic placeholder image">
                            <div class="media-body">
                                <div class="movie-title"><%=movie.getMovieName()%>&nbsp;&nbsp;<span class="movie-info-item-text"><%=movie.getYear()%></span>&nbsp;&nbsp;<span class="movie-info-item-text"><%=movie.getGenre()%></span></div>
                                
                                <div class="movie-storyline"><%=movie.getIntroduction()%></div>
                                
                            </div>
                        </div>
            </div>
        </div>
        <div class="card movie-info-card">
                <div class="card-header">
                    Information
                </div>
                <div class="card-body">
                    <dl class="movie-info"></dl>
                    <dt>Director</dt>
                    <dd><%=movie.getDirector()%></dd>
                    <dt>Stars</dt>
                    <dd><%=movie.getStars()%></dd>
                    <dt>Genre</dt>
                    <dd><%=movie.getGenre()%></dd>
                    <dt>Country</dt>
                    <dd><%=movie.getCountry()%></dd>
                </div>
            </div>
        <div class="card movie-info-card">
                <div class="card-header">
                    Related Recommendations
                </div>
                <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                            <tr><th>Movie Name</th><th>Year</th><th>Genre</th><th>Director</th></tr>
                            </thead>
                            <%
                                for(JMovie removie : relatedMovies) {
                            %>
                            <tr><td><a href="/web/display?id=<%=removie.getMovieId()%>"><%=removie.getMovieName()%></a></td><td><%=removie.getYear()%></td><td><%=removie.getGenre()%></td><td><%=removie.getDirector()%></td></tr>
                            <%
                            }
                            %>
                        </table>
                </div>
            </div>
        <!-- </div> -->
    


</body>