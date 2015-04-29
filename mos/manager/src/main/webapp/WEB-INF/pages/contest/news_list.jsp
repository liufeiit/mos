<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
    <title>新闻动态 - 景观云图后台管理系统</title>
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>设计比赛<small>新闻动态</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="contest/list">设计比赛</a></li>
        <li class="active">新闻动态</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">新闻动态</h3>
                <div class="clearfix ">&nbsp;</div>
              <sec:authorize url="/contest_news/addPage">
                <div class="box-operation">
                    <a href="contest_news/addPage" class="btn btn-primary pull-right">新建新闻</a>
                </div>
              </sec:authorize>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <tr>
                            <th>#</th>
                            <th>新闻标题</th>
                            <th>所属赛事</th>
                            <th>创建时间</th>
                            <th class="center">操作</th>
                        </tr>
                    <c:forEach items="${news_list}" var="news" varStatus="itemStatus">
                        <tr>
                            <td>${itemStatus.count}</td>
                            <td>${news.title}</td>
                            <td>${news.contest_title}</td>
                            <td>${news.gmt_created}</td>
                            <td class="operation-part center">
                                <a title="编辑" href="contest_news/editPage?id=${news.id}"><span class="glyphicon glyphicon-pencil"></span></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="box-footer clearfix">
                <c:set var="url" value="contest_news/list" />
                <%@ include file="../layout/pagination.jsp"%>
            </div>
        </div>
    </div>
</section>
