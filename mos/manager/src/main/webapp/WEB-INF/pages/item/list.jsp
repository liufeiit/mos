<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
    <title>景观案例列表 - 景观云图后台管理系统</title>

    <script src="resources/item/list.js"></script>
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>景观案例管理<small>景观案例列表</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="item/list"><i class="fa fa-file-word-o"></i> 景观案例管理</a></li>
        <li class="active">景观案例列表</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div class="box">
            <div class="box-header">
                <form role="form" action="item/list" method="get">
                    <div class="box-search container">
                        <div class="col-lg-8" style="margin-top:10px;margin-bottom:20px;">
                            <div class="input-group">
                                <span class="input-group-addon">标题</span>
                                <input class="form-control" type="text" name="title" value="${request.title}" placeholder="输入搜索的标题">
                            </div>
                        </div>
                        <div class="col-lg-3" style="margin-top:10px;margin-bottom:20px;">
                            <div class="input-group">
                                <button type="submit" class="btn btn-primary">查询</button>
                            </div>
                        </div>
                    </div>
                </form>
              <sec:authorize url="/item/addPage">
                <div class="box-operation">
                    <a href="item/addPage" class="btn btn-primary pull-right">新建景观案例</a>
                </div>
              </sec:authorize>
            </div>
            <div class="box-body">
                <table class="table table-bordered table-hover">
                    <tbody>
                        <tr>
                            <th>#</th>
                            <th>封皮</th>
                            <th>标题</th>
                            <th>设计师</th>
                            <th>类型</th>
                            <th>分类</th>
                            <th>区域分类</th>
                            <th>风格</th>
                            <th>评论数</th>
                            <th>赞数</th>
                            <th>收藏数</th>
                            <th>发布者</th>
                            <th>状态</th>
                            <th class="center">操作</th>
                        </tr>
                    <c:forEach items="${items}" var="item" varStatus="itemStatus">
                        <tr>
                            <td>${itemStatus.count}</td>
                            <td><img src="${item.cover_media}" style="width: 50px;height: 50px;"></td>
                            <td>${item.title}</td>
                            <td>${item.designer}</td>
                            <td>${item.type == 1 ? '原创' : '分享'}</td>
                            <td>${item.category}</td>
                            <td>${item.area_category}</td>
                            <td>${item.style}</td>
                            <td>${item.comment_count}</td>
                            <td>${item.praise_count}</td>
                            <td>${item.like_count}</td>
                            <td>${item.user_name}</td>
                            <td><span class="label ${item.status == 1 ? 'label-success' : 'label-danger'}">${item.status == 1 ? '活动的' : '冻结的'}</span></td>
                            <td class="operation-part center">
                                <a title="编辑" href="item/editPage?itemId=${item.id}"><span class="glyphicon glyphicon-pencil"></span></a>
                                <a title="删除" class="delete-item" data-item="${item.id}" href="javascript:void(0)"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="box-footer clearfix">
                <c:set var="url" value="item/list" />
                <%@ include file="../layout/pagination.jsp"%>
            </div>
        </div>
    </div>
</section>
