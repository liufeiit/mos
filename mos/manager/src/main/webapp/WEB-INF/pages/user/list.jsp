<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
    <title>设计师列表 - 景观云图后台管理系统</title>
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>设计师管理<small>设计师列表</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="user/list"><i class="fa fa-user"></i> 设计师管理</a></li>
        <li class="active">设计师列表</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div class="box">
            <div class="box-header">
                <form role="form" action="user/list" method="get">
                    <div class="box-search container">
                        <div class="col-lg-8" style="margin-top:10px;margin-bottom:20px;">
                            <div class="input-group">
                                <span class="input-group-addon">名称</span>
                                <input class="form-control" type="text" name="name" value="${request.name}" placeholder="输入搜索的名称">
                            </div>
                        </div>
                        <div class="col-lg-3" style="margin-top:10px;margin-bottom:20px;">
                            <div class="input-group">
                                <button type="submit" class="btn btn-primary">查询</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <tr>
                            <th>#</th>
                            <th>名称</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>手机</th>
                            <th>状态</th>
                            <th>特长</th>
                        </tr>
                    <c:forEach items="${users}" var="user" varStatus="itemStatus">
                        <tr>
                            <td>${itemStatus.count}</td>
                            <td>${user.name}</td>
                            <td>${user.fullname}</td>
                            <td>${user.email}</td>
                            <td>${user.mobile}</td>
                            <td><span class="label ${user.status == 1 ? 'label-success' : 'label-danger'}">${user.status == 1 ? '活动的' : '冻结的'}</span></td>
                            <td>${user.speciality}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="box-footer clearfix">
                <c:set var="url" value="user/list" />
                <%@ include file="../layout/pagination.jsp"%>
            </div>
        </div>
    </div>
</section>
