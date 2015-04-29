<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="me.mos.ti.ContextUtil"%>
<%@ page import="me.mos.ti.UserDetailsImpl"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    UserDetailsImpl user = ContextUtil.getUserDetail();
%>
<c:url value="<%=basePath%>" var="basePath" />

<!DOCTYPE html>
<html class="no-js">
    <head>
        <base href="<%=basePath%>" />
        <title><decorator:title /></title>
        <meta charset="UTF-8" />
        <meta http-equiv="cleartype" content="on" />
        <meta http-equiv="cache-control" content="no-cache" />

        <script data-main="resources/index/main" src="resources/require.js"></script>

        <link rel="stylesheet" type="text/css" href="resources/libs/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="resources/libs/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="resources/layout.css" />
        <link rel="stylesheet" type="text/css" href="resources/common.css" />

        <link rel="Shortcut Icon" href="<%=basePath%>favicon.ico" />

        <decorator:head />
    </head>
    <body class="skin-blue">
        <input type="hidden" id="basePath" value="<%=basePath%>" />
        <header id="header">
            <a href="homePage" class="logo">景观云图</a>
            <!--header-->
            <nav class="navbar navbar-static-top" role="navigation">
                <a href="javascript:void(0)" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i  class="glyphicon glyphicon-user"></i>
                                <span><%=user.getName()%> <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="resources/images/avatar.png" class="img-circle" alt="User Image">
                                    <p>
                                        <%=user.getName()%> - <%=user.getRoleName()%>
                                        <small><%=user.getEmail()%></small>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="account/info" class="btn btn-default">账号信息</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="logout" class="btn btn-default">退出</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. -->
            <aside class="left-side sidebar-offcanvas">
                <section class="sidebar">
                    <!-- Sidebar user panel. -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="resources/images/avatar.png" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Hello, <%=user.getName()%></p>
                            <a href="homePage"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- Sidebar menu. -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="homePage">
                                <i class="fa fa-dashboard"></i> <span>首页</span>
                            </a>
                        </li>
                      <sec:authorize url="/user/list">
                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span>设计师</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="user/list"><i class="fa fa-angle-double-right"></i> 设计师列表</a></li>
                            </ul>
                        </li>
                      </sec:authorize>
                      <sec:authorize url="/item/list">
                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-cube"></i>
                                <span>景观案例</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="item/list"><i class="fa fa-angle-double-right"></i> 景观案例列表</a></li>
                            </ul>
                        </li>
                      </sec:authorize>
                      <sec:authorize url="/plant/list">
                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-tree"></i>
                                <span>植物手册</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="plant/list"><i class="fa fa-angle-double-right"></i> 植物手册列表</a></li>
                            </ul>
                        </li>
                      </sec:authorize>
                      <sec:authorize url="/contest/list">
                        <li class="treeview active">
                            <a href="#">
                                <i class="fa fa-gift"></i>
                                <span>设计比赛</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="contest/list"><i class="fa fa-angle-double-right"></i> 比赛列表</a></li>
                                <li><a href="contest_news/list"><i class="fa fa-angle-double-right"></i> 新闻动态</a></li>
                                <li><a href="contest_judge/list"><i class="fa fa-angle-double-right"></i> 专家评委</a></li>
                            </ul>
                        </li>
                      </sec:authorize>
                    </ul>
                </section>
            </aside>
            <!-- Right side column. -->
            <aside class="right-side">
                <!-- Body, Bread line and content. -->
                <decorator:body />
            </aside>
        </div>
    </body>
</html>
