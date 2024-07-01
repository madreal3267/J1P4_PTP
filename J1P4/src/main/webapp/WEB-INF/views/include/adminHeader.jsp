<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery 2.1.4 -->
    <script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
    <style>
        .user-panel .info {
            padding-left: 15px;
        }
        .user-panel .info p {
            margin: 0;
            padding-top: 5px;
            font-weight: bold;
        }
    </style>
    
</head>
<body class="skin-blue sidebar-mini">
    <div class="wrapper">
        <header class="main-header">
            <!-- Logo -->
            <a href="/admin/main" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>A</b>LT</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>PTP</b> Admin Page</span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        
                        <!-- User Account: style can be found in dropdown.less -->
                  <li class="dropdown user user-menu">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                          <span class="hidden-xs">${sessionScope.manager.manager_nm}</span>
                      </a>
                      <ul class="dropdown-menu" style="width: auto; padding: 0;">
                          <!-- Menu Footer-->
                          <li class="user-footer" style="padding: 10px; text-align: center;">
                              <a href="/admin/logout" class="btn btn-default btn-flat" style="width: 100%;">Sign out</a>
                          </li>
                      </ul>
                  </li>
                        <!-- Control Sidebar Toggle Button -->
                        <!-- <li>
                            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                        </li> -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left info">
                        <p>${sessionScope.manager.manager_nm}</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>
                
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li class="header">MAIN NAVIGATION</li>
                    
                    <c:if test="${sessionScope.manager.manager_id == 'admin'}">
                       <li>
                           <a href="/admin/announcement/new"><i class="fa fa-edit"></i> <span>공지사항 작성</span></a>
                       </li>
                   </c:if>
                    <li>
                    <a href="/admin/notices">
                        <i class="fa fa-bell"></i> <span>공지사항</span>
                    </a>
                </li>
                    
                    <!-- 회원정보 관리 -->
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-user"></i>
                            <span>회원정보 관리</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/admin/users?type=all"><i class="fa fa-circle"></i> 전체</a></li>
                            <li><a href="/admin/users?type=clients"><i class="fa fa-circle-o"></i> 클라이언트</a></li>
                            <li><a href="/admin/users?type=freelancers"><i class="fa fa-circle-o"></i> 프리랜서</a></li>
                        </ul>
                    </li>
                    <!-- 회원정보 관리 -->
                    
                    <!-- 프로젝트 관리 -->
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-files-o"></i>
                            <span>프로젝트 관리</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/admin/projects"><i class="fa fa-circle"></i> 전체</a></li>
                        </ul>
                    </li>
                    <!-- 프로젝트 관리 -->
                    
                    <!-- 정산 관리 -->
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-usd"></i>
                            <span>정산 관리</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/admin/settlements"><i class="fa fa-circle-o"></i> 대금내역</a></li>
                            <li><a href="/admin/contracts"><i class="fa fa-circle-o"></i> 계약서</a></li>
                        </ul>
                    </li>
                    <!-- 정산 관리 -->
                    
                    <!-- 매니저 관리 -->
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-lock"></i>
                            <span>매니저 관리</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/admin/managers"><i class="fa fa-circle-o"></i> 담당매니저</a></li>
                        </ul>
                    </li>
                    <!-- 매니저 관리 -->
                    
                    

                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                
                
            </section>