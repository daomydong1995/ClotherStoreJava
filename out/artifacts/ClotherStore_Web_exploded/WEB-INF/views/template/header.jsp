<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="../../favicon.ico">

  <title>Clother Store</title>

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
        <li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:daomydong1995@gmail.com">daomydong1995@gmail.com</a>
        </li>
        <li><a class="btn-link" style="margin:6px;display:block;" href="/Cart/ShoppingCart"><i
            class="fa fa-shopping-cart"></i>[<b id="TTGioHang">0</b>] sản phẩm</a></li>
        <li><a href="" onclick="location.href='/logout'" class="btn-link"><i class="fa fa-sign-out"></i> Thoát</a></li>
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
<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body modal-body-sub_agile">
        <div class="col-md-8 modal_body_left modal_body_left1">
          <h3 class="agileinfo_sign">Sign Up <span>Now</span></h3>
          <form action="#" method="post">
            <div class="styled-input agile-styled-input-top">
              <input type="text" name="Name" required="">
              <label>Name</label>
              <span></span>
            </div>
            <div class="styled-input">
              <input type="email" name="Email" required="">
              <label>Email</label>
              <span></span>
            </div>
            <div class="styled-input">
              <input type="password" name="password" required="">
              <label>Password</label>
              <span></span>
            </div>
            <div class="styled-input">
              <input type="password" name="Confirm Password" required="">
              <label>Confirm Password</label>
              <span></span>
            </div>
            <input type="submit" value="Sign Up">
          </form>
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
          <p><a href="#">By clicking register, I agree to your terms</a></p>

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
