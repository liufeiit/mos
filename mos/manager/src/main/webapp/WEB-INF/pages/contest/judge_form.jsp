<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="form_type" value="${judge.id > 0 ? '编辑评委' : '新建评委'}"/>
<head>
    <title>${form_type} - 景观云图后台管理系统</title>

    <script src="resources/contest/judge_form.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/libs/jquery/uploadify/uploadify.css" />
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>设计比赛<small>${form_type}</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="contest/list">设计比赛</a></li>
        <li class="active">${form_type}</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">${form_type}</h3>
            </div>
            <form role="form" autocomplete="off" action="${judge.id > 0 ? 'contest_judge/edit' : 'contest_judge/add'}" method="POST">
                <input type="hidden" name="id" value="${judge.id}" />
                <div class="box-body">
                    <div class="form-group">
                        <label for="name">姓名<span class="required-flag">*</span></label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </div>
                            <input name="name" type="text" class="form-control" id="name" value="${judge.name}" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title">职称<span class="required-flag">*</span></label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-edit"></i>
                            </div>
                            <input name="title" type="text" class="form-control" id="title" value="${judge.title}" placeholder="职称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>所属赛事</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-edit"></i>
                            </div>
                            <select name="contest_id" class="form-control">
                                <optgroup label="请选择赛事">
                                  <c:forEach items="${contests}" var="contest">
                                    <option value="${contest.id}" ${contest.id == judge.contest_id ? 'selected' : ''}>${contest.title}</option>
                                  </c:forEach>
                                </optgroup>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>头像</label>
                        <div class="input-group">
                            <div id="cover-img" style="padding-bottom: 10px">
                                <input type="hidden" name="avatar" value="${judge.avatar}">
                                <c:if test="${!empty judge.avatar_url}">
                                    <img style="height: 230px" src="${judge.avatar_url}" class="img-rounded"/>
                                </c:if>
                            </div>
                            <div>
                                <input type="file" class="select-image" id="select-icon">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="profile">简介<span class="required-flag">*</span></label>
                        <div class="textarea">
                            <textarea class="form-control" id="profile" name="profile" rows="6">${judge.profile}</textarea>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <div class="form-group">
                        <button type="submit" id="frm_submit" class="btn btn-primary">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>