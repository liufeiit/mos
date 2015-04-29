<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:url value="<%=basePath%>" var="basePath" />

<!DOCTYPE html>
<html class="no-js">
    <head>
        <base href="<%=basePath%>" />
        <title>景观云图后台管理系统</title>
        <meta charset="UTF-8" />
        <meta http-equiv="cleartype" content="on" />
        <meta http-equiv="cache-control" content="no-cache" />

        <link rel="Shortcut Icon" href="<%=basePath%>favicon.ico" />

        <link rel="stylesheet" type="text/css" href="resources/libs/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="resources/libs/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="resources/layout.css" />
        <link rel="stylesheet" type="text/css" href="resources/common.css" />
        <link rel="stylesheet" href="resources/index/index.css">

        <script data-main="resources/index/index" src="resources/require.js"></script>
    </head>
    <body>
        <div id="wrap" class="container">
            <div class="title">
                <p class="logo"></p>
                <h1>景观云图后台管理系统</h1>
            </div>
            <form class="well login" role="form" autocomplete="off" action="j_spring_security_check" method="post">
                <p class="error-message">${sessionScope['SPRING_SECURITY_LAST_EXCEPTION']}</p>
                <div class="form-group">
                    <input id="account" name="account" type="text" class="form-control" placeholder="电子邮件">
                </div>
                <div class="form-group">
                    <input id="password" name="password" type="password" class="form-control" placeholder="密码">
                </div>
                <button type="button" class="btn btn-success" id="signIn">登录</button>
                <div class="form-group">
                    <a href="">忘记密码</a>
                </div>
            </form>
        </div>
        <footer id="footer" class="site-footer">
            <div class="">© Copyright 2013-2014 ***有限公司</div>
        </footer>
    </body>
</html>