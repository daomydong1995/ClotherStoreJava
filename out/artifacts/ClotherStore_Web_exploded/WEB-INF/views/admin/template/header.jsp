<!DOCTYPE html>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>@ViewBag.Title</title>

  <link rel="stylesheet" href="/resources/admin/plugins/bootstrap/bootstrap.css">
  <link href="/resources/admin/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link href="/resources/admin/plugins/pace/pace-theme-big-counter.css" rel="stylesheet" />
  <link href="/resources/admin/css/style.css" rel="stylesheet" />
  <link href="/resources/admin/css/main-style.css" rel="stylesheet" />
  <link href="/resources/admin/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />
  <script src="/resources/admin/plugins/jquery-1.10.2.js"></script>
  <%--<script src="~/Content/ckfinder/ckfinder.js"></script>--%>
  <%--<script src="~/Scripts/ckeditor/ckeditor.js"></script>--%>
  <script src="/resources/assets/js/jquery.twbsPagination.js" type="text/javascript"></script>
</head>
<body class="body-content">
<!--  wrapper -->
<!--  wrapper -->
<div id="wrapper">
  <!-- navbar top -->
  <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar">
    <!-- navbar-header -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html">
        <img src="assets/img/logo.png" alt="" />
      </a>
    </div>
    <!-- end navbar-header -->
    <!-- navbar-top-links -->
    <ul class="nav navbar-top-links navbar-right">
      <!-- main dropdown -->
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
          <span class="top-label label label-danger">3</span><i class="fa fa-envelope fa-3x"></i>
        </a>
        <!-- dropdown-messages -->
        <ul class="dropdown-menu dropdown-messages">
          <li>
            <a href="#">
              <div>
                <strong><span class="label label-danger">Andrew Smith</span></strong>
                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
              </div>
              <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <strong><span class="label label-info">Jonney Depp</span></strong>
                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
              </div>
              <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <strong><span class="label label-success">Jonney Depp</span></strong>
                <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
              </div>
              <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a class="text-center" href="#">
              <strong>Read All Messages</strong>
              <i class="fa fa-angle-right"></i>
            </a>
          </li>
        </ul>
        <!-- end dropdown-messages -->
      </li>

      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
          <span class="top-label label label-success">4</span>  <i class="fa fa-tasks fa-3x"></i>
        </a>
        <!-- dropdown tasks -->
        <ul class="dropdown-menu dropdown-tasks">
          <li>
            <a href="#">
              <div>
                <p>
                  <strong>Task 1</strong>
                  <span class="pull-right text-muted">40% Complete</span>
                </p>
                <div class="progress progress-striped active">
                  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                    <span class="sr-only">40% Complete (success)</span>
                  </div>
                </div>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <p>
                  <strong>Task 2</strong>
                  <span class="pull-right text-muted">20% Complete</span>
                </p>
                <div class="progress progress-striped active">
                  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                    <span class="sr-only">20% Complete</span>
                  </div>
                </div>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <p>
                  <strong>Task 3</strong>
                  <span class="pull-right text-muted">60% Complete</span>
                </p>
                <div class="progress progress-striped active">
                  <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                    <span class="sr-only">60% Complete (warning)</span>
                  </div>
                </div>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <p>
                  <strong>Task 4</strong>
                  <span class="pull-right text-muted">80% Complete</span>
                </p>
                <div class="progress progress-striped active">
                  <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                    <span class="sr-only">80% Complete (danger)</span>
                  </div>
                </div>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a class="text-center" href="#">
              <strong>See All Tasks</strong>
              <i class="fa fa-angle-right"></i>
            </a>
          </li>
        </ul>
        <!-- end dropdown-tasks -->
      </li>

      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
          <span class="top-label label label-warning">5</span>  <i class="fa fa-bell fa-3x"></i>
        </a>
        <!-- dropdown alerts-->
        <ul class="dropdown-menu dropdown-alerts">
          <li>
            <a href="#">
              <div>
                <i class="fa fa-comment fa-fw"></i>New Comment
                <span class="pull-right text-muted small">4 minutes ago</span>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <i class="fa fa-twitter fa-fw"></i>3 New Followers
                <span class="pull-right text-muted small">12 minutes ago</span>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <i class="fa fa-envelope fa-fw"></i>Message Sent
                <span class="pull-right text-muted small">4 minutes ago</span>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <i class="fa fa-tasks fa-fw"></i>New Task
                <span class="pull-right text-muted small">4 minutes ago</span>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#">
              <div>
                <i class="fa fa-upload fa-fw"></i>Server Rebooted
                <span class="pull-right text-muted small">4 minutes ago</span>
              </div>
            </a>
          </li>
          <li class="divider"></li>
          <li>
            <a class="text-center" href="#">
              <strong>See All Alerts</strong>
              <i class="fa fa-angle-right"></i>
            </a>
          </li>
        </ul>
        <!-- end dropdown-alerts -->
      </li>

      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
          <i class="fa fa-user fa-3x"></i>
        </a>
        <!-- dropdown user-->
        <ul class="dropdown-menu dropdown-user">
          <li>
            <a href="#"><i class="fa fa-user fa-fw"></i>Thông tin</a>
          </li>
          <li>
            <a href="#"><i class="fa fa-gear fa-fw"></i>Cài đặt</a>
          </li>
          <li class="divider"></li>
          <li>
            <a href="#" onclick="location.href='/logout'"><i class="fa fa-sign-out fa-fw"></i>Thoát</a>
          </li>
        </ul>
        <!-- end dropdown-user -->
      </li>
      <!-- end main dropdown -->
    </ul>
    <!-- end navbar-top-links -->

  </nav>
  <!-- end navbar top -->
  <!-- navbar side -->
  <nav class="navbar-default navbar-static-side" role="navigation">
    <!-- sidebar-collapse -->
    <div class="sidebar-collapse">
      <!-- side-menu -->
      <ul class="nav" id="side-menu">
        <li>
          <!-- user image section-->
          <div class="user-section">
            <div class="user-section-inner">
              <img src="/resources/admin/img/user.png" alt="">
            </div>
            <div class="user-info">
              <c:if test="${pageContext.request.userPrincipal.name != null}">
                  Chào :${pageContext.request.userPrincipal.name}
              </c:if>
              <div class="user-text-online">
                <span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Online
              </div>
            </div>
          </div>
          <!--end user image section-->
        </li>
        <li class="sidebar-search">
          <!-- search section-->
          <div class="input-group custom-search-form">
            <input type="text" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
          </div>
          <!--end search section-->
        </li>
        <li>
          <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>QUẢN LÝ SẢN PHẨM<span class="fa arrow"></span></a>
          <ul class="nav nav-second-level">
            <li>
              <a href="/Admin/PRODUCT#">Sản phẩm</a>
            </li>
            <li>
              <a href="/Admin/CATEGORY#">Nhóm sản phẩm</a>
            </li>
            <li>
              <a href="/Admin/PARTNER#">Nhà cung cấp</a>
            </li>

          </ul>
          <!-- second-level-items -->
        </li>
        <li>
          <a href="timeline.html"><i class="fa fa-tasks fa-fw"></i>ĐƠN HÀNG<span class="fa arrow"></span></a>
          <ul class="nav nav-second-level">
            <li>
              <a href="/Admin/ORDER/">Đơn hàng</a>
            </li>
            <li>
              <a href="#">Vận chuyển</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="/Admin/CUSTOMER#"><i class="fa fa-user fa-fw"></i>Khách hàng</a>
        </li>
        <li>
          <a href="timeline.html"><i class="fa fa-search fa-fw"></i>KIỂM KÊ<span class="fa arrow"></span></a>
          <ul class="nav nav-second-level">
            <li>
              <a href="#">Nhà cung cấp</a>
            </li>
            <li>
              <a href="#">Theo loại</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="timeline.html"><i class="fa fa-dashboard fa-fw"></i>DOANH SỐ<span class="fa arrow"></span></a>
          <ul class="nav nav-second-level">
            <li>
              <a href="#">Theo hàng hóa</a>
            </li>
            <li>
              <a href="#">Theo thể loại</a>
            </li>
            <li>
              <a href="#">Theo tháng</a>
            </li>
            <li>
              <a href="#">Theo quý</a>
            </li>
            <li>
              <a href="#">Theo năm</a>
            </li>
          </ul>
        </li>
      </ul>
      <!-- end side-menu -->

    </div>

    <!-- end sidebar-collapse -->
  </nav>
  <!-- end navbar side -->
  <!--  page-wrapper -->
  <div id="page-wrapper" class="container">

    <div class="row">

      <!--End Page Header -->
    </div>

    <div class="row">
      <!-- Welcome -->
      <div class="col-md-12">