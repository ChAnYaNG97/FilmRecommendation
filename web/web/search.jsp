<!doctype html>
<html lang="en">
<%@ page language="java" pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="classes.JMovie" %>
    <% ArrayList<JMovie> list = (ArrayList<JMovie>)request.getAttribute("list");%>

<head>
    <title>Hello, world!</title>

    <!-- Required meta tags -->
    <meta charset="utf-8"></meta>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"></meta>

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
        crossorigin="anonymous"></link>
    <link rel="stylesheet" href="./css/search.css"></link>
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
                <button class="btn btn-primary btn-sm" method="post" type="submit">search</button>
            </form>
        </div>
        </nav>
        
            <div id="result-card" class="card mid-card">
                    <div class="page-header" id="recommended-movie-header">
                            <div class="header-content-wrapper">    
                                <h4>Find <%=list.size()%> movies</h4>
                            </div>
                        </div>
            <div class="row">
                <%
                    for(JMovie movie :list){
                %>
                    <div class="media">
                        <img class="media-img" src="<%=movie.getPostPic()%>" alt="Generic placeholder image">
                            <div class="media-body">
                                <div class="movie-title">
                                    <div class="movie-title"><a href="/web/display?id=<%=movie.getMovieId()%>" methods=""><%=movie.getMovieName()%></a></div>
                                </div>
    
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
        </div>




</body>