<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="/resources/spring.png">

  <title>Clother Store</title>
  <link href="/resources/admin/font-awesome/css/font-awesome.css" rel="stylesheet"/>
  <!-- Angular JS -->
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>

  <!-- JQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

  <!-- Data Table -->
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>


  <!-- Bootstrap core CSS -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

  <script type="application/x-javascript">
      addEventListener("load", function () {
          setTimeout(hideURLbar, 0);
      }, false);

      function hideURLbar() {
          window.scrollTo(0, 1);
      } </script>
  <!--//tags -->
  <link href="/resources/assets/jquery-ui.css" rel="stylesheet"/>
  <script type="text/javascript" src="/resources/assets/js/jquery-2.1.4.min.js"></script>
  <script src="/resources/assets/js/jquery-ui.js"></script>
  <link href="/resources/assets/css/bootstrap.css" rel="stylesheet"/>
  <link href="/resources/assets/css/style.css" rel="stylesheet" media="all"/>
  <link href="/resources/assets/css/font-awesome.css" rel="stylesheet"/>
  <link href="/resources/assets/css/easy-responsive-tabs.css" rel="stylesheet"/>
  <script src="/resources/assets/js/bootstrap.js"></script>
  <link rel="stylesheet" href="/resources/assets/css/flexslider.css" type="text/css" media="screen"/>
  <script src="/resources/assets/js/imagezoom.js"></script>
  <!-- Data Table CSS -->
  <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">


</head>
<!-- NAVBAR
================================================== -->
<body>
<body>
<!-- header -->
<div class="header navbar-fixed-top " id="home">
  <div class="container">
    <ul>

      <c:if test="${pageContext.request.userPrincipal.name != null}">
        <li><a>Xin chào :<i class="fa fa-user"></i>${pageContext.request.userPrincipal.name}</a></li>
        <li><i class="fa fa-address-book" aria-hidden="true"></i> <a href="mailto:daomydong1995@gmail.com">Lịch Sử</a>
        </li>
        <li><a class="btn-link" style="margin:6px;display:block;" href="/Cart/ShoppingCart"><i
            class="fa fa-shopping-cart"></i>[<b id="TTGioHang">0</b>] sản phẩm</a></li>
        <li><a href="#" onclick="location.href='/logout'" class="btn-link"><i class="fa fa-sign-out"></i> Thoát</a></li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name == null}">
        <li><a href="#" id="signin" data-toggle="modal" data-target="#myModal"><i class="fa fa-unlock-alt"
                                                                                  aria-hidden="true"></i> Sign In </a>
        </li>
        <li><a href="#" id="signup" onclick="location.href='/register'"><i class="fa fa-pencil-square-o"
                                                                                   aria-hidden="true"></i> Sign Up </a>
        </li>
        <li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:daomydong1995@gmail.com">daomydong1995@gmail.com</a>
        </li>
        <li><a class="btn-link" style="margin:6px;display:block;" href="/Cart/ShoppingCart"><i
            class="fa fa-shopping-cart"></i>[<b id="TTGioHang">0</b>] sản phẩm</a></li>
      </c:if>

    </ul>
  </div>
</div>
<!-- //header -->

<!-- header-bot -->
<div class="header-bot " style="margin-top:1cm">
  <div class="header-bot_inner_wthreeinfo_header_mid">
    <div class="col-md-4 header-middle">

      <div class="w3l_search">
        <form action="/HomeProduct/Search/" method="get">
          <input type="search" id="search"  name="keyword" value="@ViewBag.search" placeholder="Search here..." required="">
          <input type="submit" value=" ">
          <div class="clearfix"></div>
        </form>
      </div>
    </div>
    <!-- header-bot -->
    <div class="col-md-4 logo_agile">
      <h1><a href="/"><span>E</span>lite Shoppy</a></h1>
    </div>
    <!-- header-bot -->
    <div class="col-md-4 agileits-social top_content">
      <ul class="social-nav model-3d-0 footer-social w3_agile_social">
        <li class="share">Share On : </li>
        <li>
          <a href="#" class="facebook">
            <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
            <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
          </a>
        </li>
        <li>
          <a href="#" class="twitter">
            <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
            <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
          </a>
        </li>
        <li>
          <a href="#" class="instagram">
            <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
            <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
          </a>
        </li>
        <li>
          <a href="#" class="pinterest">
            <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
            <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
          </a>
        </li>
      </ul>

    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!-- //header-bot -->

<!-- banner -->
<div class="ban-top">
  <div class="container">
    <div class="top_nav_left">
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse menu--shylock center-block" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav menu__list">
              <li class="active menu__item menu__item--current"><a class="menu__link" href="/">Home <span class="sr-only">(current)</span></a></li>
              <li class=" menu__item"><a class="menu__link" href="about.html">About</a></li>
              @Html.Action("liMenuMan", "Home")
              @Html.Action("liMenuWoMan", "Home")
              <li class=" menu__item">
                <a class="menu__link" href="contact.html">Contact</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </div>
</div>
<!-- //banner-top -->

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1" class=""></li>
    <li data-target="#myCarousel" data-slide-to="2" class=""></li>
    <li data-target="#myCarousel" data-slide-to="3" class=""></li>
    <li data-target="#myCarousel" data-slide-to="4" class=""></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <div class="container">
        <div class="carousel-caption">
          <h3>The Biggest <span>Sale</span></h3>
          <p>Special for today</p>
          <a class="hvr-outline-out button2" href="mens.html">Shop Now </a>
        </div>
      </div>
    </div>
    <div class="item item2">
      <div class="container">
        <div class="carousel-caption">
          <h3>Summer <span>Collection</span></h3>
          <p>New Arrivals On Sale</p>
          <a class="hvr-outline-out button2" href="mens.html">Shop Now </a>
        </div>
      </div>
    </div>
    <div class="item item3">
      <div class="container">
        <div class="carousel-caption">
          <h3>The Biggest <span>Sale</span></h3>
          <p>Special for today</p>
          <a class="hvr-outline-out button2" href="mens.html">Shop Now </a>
        </div>
      </div>
    </div>
    <div class="item item4">
      <div class="container">
        <div class="carousel-caption">
          <h3>Summer <span>Collection</span></h3>
          <p>New Arrivals On Sale</p>
          <a class="hvr-outline-out button2" href="mens.html">Shop Now </a>
        </div>
      </div>
    </div>
    <div class="item item5">
      <div class="container">
        <div class="carousel-caption">
          <h3>The Biggest <span>Sale</span></h3>
          <p>Special for today</p>
          <a class="hvr-outline-out button2" href="mens.html">Shop Now </a>
        </div>
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  <!-- The Modal -->
</div>

<!-- //Modal1 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body modal-body-sub_agile">
        <div class="col-md-8 modal_body_left modal_body_left1">
          <h3 class="agileinfo_sign">Sign In <span>Now</span></h3>
          <c:url value="/login" var="url"/>
          <form name="loginForm" action="${url}" method="post">
            <div class="styled-input agile-styled-input-top">
              <input id="username" type="text" name="username" required="">
              <label for="username">Username</label>
              <p><form:errors path="username" cssStyle="color: #ff0000;"/></p>
              <span></span>
            </div>
            <div class="styled-input">
              <input id="password" type="password" name="password" required="">
              <label for="password">Password</label>
              <p><form:errors path="password" cssStyle="color: #ff0000;"/></p>
              <span></span>
            </div>
            <button class="btn btn-danger" type="submit" value="Sign In">Sign In</button>
          </form>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <ul class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
            <li>
              <a href="#" class="facebook">
                <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
              </a>
            </li>
            <li>
              <a href="#" class="twitter">
                <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
              </a>
            </li>
            <li>
              <a href="#" class="instagram">
                <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
              </a>
            </li>
            <li>
              <a href="#" class="pinterest">
                <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
              </a>
            </li>
          </ul>
          <div class="clearfix"></div>
          <p><a href="#" data-toggle="modal" data-target="#myModal2"> Don't have an account?</a></p>

        </div>
        <div class="col-md-4 modal_body_right modal_body_right1">
          <img src="/resources/assets/images/log_pic.jpg" alt=" "/>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <!-- //Modal content-->
  </div>
</div>
<!-- //Modal1 -->
