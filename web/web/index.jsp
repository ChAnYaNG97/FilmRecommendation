<%--
  Created by IntelliJ IDEA& Sophialee
  User: SophiaLLY
  Date: 2018/6/29
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="classes.JMovie" %>
<%
    ArrayList<JMovie> list = new ArrayList<JMovie>();
    list = JMovie.FindTenMovies();
    Collections.shuffle(list);
%>
<% int num = list.size();%>
<% int count = 0;%>
<html lang="en">

<head>
    <title>Hello, world!</title>

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
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="./index.html">个人中心
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./profile.html">主页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">消息</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input id="nav-search" class="form-control form-control-sm mr-sm-3" type="search" placeholder="搜索你感兴趣的内容" aria-label="Search">
            <img class="mr-sm-3" id="nav-bell" src="./images/bell.png">
            <img class="mr-sm-3" id="nav-head" src="./images/head.jpg">
        </form>
    </div>
</nav>
<div class="row">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="./images/batman2.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <h3>The Dark Knight</h3>
                    <p>When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="./images/batman2.jpg" alt="Second slide">
                <div class="carousel-caption d-none d-md-block">
                    <h3>The Dark Knight</h3>
                    <p>When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="./images/batman.jpg" alt="Third slide">
                <div class="carousel-caption d-none d-md-block">
                    <h3>The Dark Knight</h3>
                    <p>When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.</p>
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
    <div class="card-deck">
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">嘟嘟嘟</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <% count ++;%>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">

                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <% count ++;%>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <% count ++;%>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <% count ++;%>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
    </div>
    <% count ++;%>
    <div class="card-deck">
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <% count ++;%>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <% count ++;%>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <% count ++;%>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <% count ++;%>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><%=list.get(count).getMovieName()%></h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
    </div>
    <% count = 0;%>




    <div class="page-header" id="recommended-movie-header">
        <div class="header-content-wrapper">
            <h1>Recommended Movies</h1>
        </div>
    </div>
    <div class="card-deck">
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Toy Story</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Toy Story</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Toy Story</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Toy Story</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Toy Story</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
    </div>

    <div class="card-deck">
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Toy Story</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Toy Story</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Toy Story</h5>
                <p class="card-text">Director:assdasd dsa </p>
                <p class="card-text"><small class="text-muted">2015</small></p>
            </div>
        </div>
    </div>
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
