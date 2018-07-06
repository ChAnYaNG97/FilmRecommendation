<%--
  Created by IntelliJ IDEA& Sophialee
  User: SophiaLLY
  Date: 2018/6/29
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html lang="en">
<%@ page language="java" pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="classes.JMovie" %>
<%@ page import="classes.JFilmDA" %>
<% ArrayList<JMovie> list = (ArrayList<JMovie>)request.getAttribute("list");%>

<head>
    <title>MovieFM</title>

    <!-- Required meta tags -->
    <meta charset="utf-8"></meta>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
          crossorigin="anonymous"></link>
    <link rel="stylesheet" href="./css/index.css"></link>
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
    <div class="welcome">
        <%if(session.getAttribute("userId") == null) {%>
            <div><a href="login.jsp">Login</a></div>
        <%}else{%>
            Welcome, <%=session.getAttribute("userId")%>
        <%
        }
        %>
</nav>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block" src="./images/bat_superlogo.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                    <h3>The Dark Knight</h3>
                    <p>When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.</p>
                </div>
            </div>
        <div class="carousel-item">
                <img class="d-block" src="./images/walle.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                <h3>Walle</h3>
                <p>In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.</p>
            </div>
        </div>

        <div class="carousel-item">
            <img class="d-block" src="./images/shaw2.jpeg" alt="Third slide">
            <div class="carousel-caption d-none d-md-block">
                <h3>The Shawshank Redemption</h3>
                <p>Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.</p>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="page-header" id="all-movie-header">
    <div class="header-content-wrapper">
        <h1>All Movies</h1>
    </div>
</div>
<div class="row">
    <%
        for(JMovie movie : list) {
    %>
    <div class="media">
        <img class="media-img" src="<%=movie.getPostPic()%>" alt="Generic placeholder image">
        <div class="media-body">
            <div class="movie-title"><a href="/web/display?id=<%=movie.getMovieId()%>" methods=""><%=movie.getMovieName()%></a></div>
            <div class="movie-info">
                <div class="movie-info-item"><%=movie.getYear()%></div>
                <div class="movie-info-item">Genre:<span class="movie-info-item-text"><%=movie.getGenre()%></span></div>
                <div class="movie-info-item">Director:<span class="movie-info-item-text"><%=movie.getDirector()%></span></div>
                <div class="movie-info-item">Stars:<span class="movie-info-item-text"><%=movie.getStars()%></span></div>
            </div>
        </div>
    </div>
    <%
        }
    %>

</div>

<div class="page-header" id="recommended-movie-header">
    <div class="header-content-wrapper">
        <h1>You may like</h1>
    </div>
</div>
<%
    if(session.getAttribute("userId") != null){
        int id = Integer.parseInt(session.getAttribute("userId").toString());
        System.out.println(id);
        String str = JFilmDA.FindMovieByUserId(id);
        String[] movieids = str.split(" ");
        ArrayList<JMovie> recmovies = new ArrayList<JMovie>();
        for(String ele : movieids) {
            recmovies.add(JMovie.FindMoviesById(Integer.parseInt(ele)));
        }


%>
<div class = "row">
    <%
        for(JMovie movie : recmovies) {
    %>
    <div class="media">
        <img class="media-img" src="<%=movie.getPostPic()%>" alt="Generic placeholder image">
        <div class="media-body">
            <div class="movie-title"><a href="/web/display?id=<%=movie.getMovieId()%>" methods=""><%=movie.getMovieName()%></a></div>

            <div class="movie-info">
                <div class="movie-info-item"><%=movie.getYear()%></div>
                <div class="movie-info-item">Genre:<span class="movie-info-item-text"><%=movie.getGenre()%></span></div>
                <div class="movie-info-item">Director:<span class="movie-info-item-text"><%=movie.getDirector()%></span></div>
                <div class="movie-info-item">Stars:<span class="movie-info-item-text"><%=movie.getStars()%></span></div>
            </div>
        </div>
    </div>
    <%
        }
    %>
    <%
        }
        else {
    %>
        <div class="page-header" id="all-movie-header">
            <p class="footer">Please <a href="login.jsp">Login</a> First</p>
        </div>
    <%
        }
    %>

</div>



<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>

<script src="https://cdn.bootcss.com/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
        crossorigin="anonymous"></script>
<script src="node_modules/jquery/dist/jquery.js">
</script>

</body>

</html>



