<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
    <title>专家评委 - 景观云图后台管理系统</title>
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>设计比赛<small>专家评委</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="contest/list">设计比赛</a></li>
        <li class="active">专家评委</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">专家评委</h3>
                <div class="clearfix ">&nbsp;</div>
              <sec:authorize url="/contest_judge/addPage">
                <div class="box-operation">
                    <a href="contest_judge/addPage" class="btn btn-primary pull-right">新建评委</a>
                </div>
              </sec:authorize>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <tr>
                            <th>#</th>
                            <th>头像</th>
                            <th>姓名</th>
                            <th>职称</th>
                            <th>所属赛事</th>
                            <th>创建时间</th>
                            <th class="center">操作</th>
                        </tr>
                    <c:forEach items="${judges}" var="judge" varStatus="itemStatus">
                        <tr>
                            <td>${itemStatus.count}</td>
                            <td><img src="${judge.avatar}" style="width: 50px;height: 50px;"></td>
                            <td>${judge.name}</td>
                            <td>${judge.title}</td>
                            <td>${judge.contest_title}</td>
                            <td>${judge.gmt_created}</td>
                            <td class="operation-part center">
                                <a title="编辑" href="contest_judge/editPage?id=${judge.id}"><span class="glyphicon glyphicon-pencil"></span></a>
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
