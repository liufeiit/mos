<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
    <title>植物手册列表 - 景观云图后台管理系统</title>

    <script src="resources/plant/list.js"></script>
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>植物手册管理<small>植物手册列表</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="plant/list">植物手册管理</a></li>
        <li class="active">植物手册列表</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div class="box">
            <div class="box-header">
                <form role="form" action="plant/list" method="get">
                    <div class="box-search container">
                        <div class="col-lg-8" style="margin-top:10px;margin-bottom:20px;">
                            <div class="input-group">
                                <span class="input-group-addon">名称</span>
                                <input class="form-control" type="text" name="name" value="${request.name}" placeholder="输入搜索的植物名称">
                            </div>
                        </div>
                        <div class="col-lg-3" style="margin-top:10px;margin-bottom:20px;">
                            <div class="input-group">
                                <button type="submit" class="btn btn-primary">查询</button>
                            </div>
                        </div>
                    </div>
                </form>
              <sec:authorize url="/plant/addPage">
                <div class="box-operation">
                    <a href="plant/addPage" class="btn btn-primary pull-right">新建植物手册</a>
                </div>
              </sec:authorize>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <tr>
                            <th>#</th>
                            <th>封皮</th>
                            <th>学名（中文）</th>
                            <th>学名（英文）</th>
                            <th>别名</th>
                            <th>类型</th>
                            <th>科属</th>
                            <th class="center">操作</th>
                        </tr>
                    <c:forEach items="${plants}" var="plant" varStatus="itemStatus">
                        <tr>
                            <td>${itemStatus.count}</td>
                            <td><img src="${plant.cover_media}" style="width: 50px;height: 50px;"></td>
                            <td>${plant.name_cn}</td>
                            <td>${plant.name_en}</td>
                            <td>${plant.alias_name}</td>
                            <td>${plant.category}</td>
                            <td>${plant.genus}</td>
                            <td class="operation-part center">
                                <a title="编辑" href="plant/editPage?id=${plant.id}"><span class="glyphicon glyphicon-pencil"></span></a>
                                <a title="删除" class="delete-item" data-item="${plant.id}" href="javascript:void(0)"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="box-footer clearfix">
                <c:set var="url" value="plant/list" />
                <%@ include file="../layout/pagination.jsp"%>
            </div>
        </div>
    </div>
</section>
