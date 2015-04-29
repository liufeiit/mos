<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="form_type" value="${contest.id > 0 ? '编辑比赛' : '新建比赛'}"/>
<head>
    <title>${form_type} - 景观云图后台管理系统</title>

    <script src="resources/contest/form.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/libs/kindeditor/themes/default/default.css" />
    <script src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>resources/libs/My97DatePicker/WdatePicker.js"></script>
    <script src="resources/libs/kindeditor/kindeditor-min.js"></script>
    <script src="resources/libs/kindeditor/lang/zh_CN.js"></script>
    <script>
    KindEditor.ready(function(K) {
        K.create('textarea[name="description"]', {
            uploadJson : 'image/file_upload',
            items : [
                     'source', '|', 'undo', 'redo', '|', 'preview', 'template', 'code', 'cut', 'copy', 'paste',
                     'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                     'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                     'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                     'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                     'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
                     'flash', 'media', 'insertfile', 'table', 'hr', 'baidumap', 'pagebreak',
                     'anchor', 'link', 'unlink'
            ],
            width : "80%",
            minHeight : 350,
            autoHeightMode : true,
            afterCreate : function() {
                this.loadPlugin('autoheight');
            }
        });
    });
    KindEditor.ready(function(K) {
        K.create('textarea[name="requirements"]', {
            uploadJson : 'image/file_upload',
            items : [
                     'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                     'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'unlink'
            ],
            width : "80%",
            minHeight : 200,
            autoHeightMode : true,
            afterCreate : function() {
                this.loadPlugin('autoheight');
            }
        });
    });
    KindEditor.ready(function(K) {
        K.create('textarea[name="timetable"]', {
            uploadJson : 'image/file_upload',
            items : [
                     'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                     'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'unlink'
            ],
            width : "80%",
            minHeight : 200,
            autoHeightMode : true,
            afterCreate : function() {
                this.loadPlugin('autoheight');
            }
        });
    });

    KindEditor.ready(function(K) {
        K.create('textarea[name="prizes"]', {
            uploadJson : 'image/file_upload',
            items : [
                     'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                     'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'unlink'
            ],
            width : "80%",
            minHeight : 200,
            autoHeightMode : true,
            afterCreate : function() {
                this.loadPlugin('autoheight');
            }
        });
    });
    KindEditor.ready(function(K) {
        K.create('textarea[name="committee"]', {
            uploadJson : 'image/file_upload',
            items : [
                     'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                     'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'unlink'
            ],
            width : "80%",
            minHeight : 200,
            autoHeightMode : true,
            afterCreate : function() {
                this.loadPlugin('autoheight');
            }
        });
    });
    KindEditor.ready(function(K) {
        K.create('textarea[name="host_organizers"]', {
            uploadJson : 'image/file_upload',
            items : [
                     'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                     'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'unlink'
            ],
            width : "80%",
            minHeight : 200,
            autoHeightMode : true,
            afterCreate : function() {
                this.loadPlugin('autoheight');
            }
        });
    });
    KindEditor.ready(function(K) {
        K.create('textarea[name="organizers"]', {
            uploadJson : 'image/file_upload',
            items : [
                     'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                     'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'unlink'
            ],
            width : "80%",
            minHeight : 200,
            autoHeightMode : true,
            afterCreate : function() {
                this.loadPlugin('autoheight');
            }
        });
    });
    KindEditor.ready(function(K) {
        K.create('textarea[name="co_organizers"]', {
            uploadJson : 'image/file_upload',
            items : [
                     'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                     'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                     'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'unlink'
            ],
            width : "80%",
            minHeight : 200,
            autoHeightMode : true,
            afterCreate : function() {
                this.loadPlugin('autoheight');
            }
        });
    });

    </script>
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
            <form role="form" autocomplete="off" action="${contest.id > 0 ? 'contest/edit' : 'contest/add'}" method="POST">
                <input type="hidden" name="id" value="${contest.id}" />
                <div class="box-body">
                    <div class="form-group">
                        <label for="title">大赛标题<span class="required-flag">*</span></label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-edit"></i>
                            </div>
                            <input name="title" type="text" class="form-control" id="title" value="${contest.title}" placeholder="大赛标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>状态</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-shield"></i>
                            </div>
                            <select name="status" class="form-control">
                                <optgroup label="请选择状态">
                                    <option value="1" ${contest.status == 1 ? 'selected' : ''}>筹备中</option>
                                    <option value="2" ${contest.status == 2 ? 'selected' : ''}>进行中</option>
                                    <option value="3" ${contest.status == 3 ? 'selected' : ''}>已结束</option>
                                </optgroup>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="start_time">开始时间<span class="required-flag">*</span></label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input id="start_time" type="text" class="form-control" name="start_time" value="${contest.start_time}" placeholder="开始时间">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="end_time">结束时间<span class="required-flag">*</span></label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar-o"></i>
                            </div>
                            <input id="end_time" type="text" class="form-control" name="end_time" value="${contest.end_time}" placeholder="结束时间">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="topic">大赛题目<span class="required-flag">*</span></label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-edit"></i>
                            </div>
                            <input name="topic" type="text" class="form-control" id="topic" value="${contest.topic}" placeholder="大赛题目">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description">大赛简介<span class="required-flag">*</span></label>
                        <div class="textarea">
                            <textarea class="form-control" id="description" name="description" rows="6">${contest.description}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="requirements">大赛要求</label>
                        <div class="textarea">
                            <textarea class="form-control" id="requirements" name="requirements" rows="6">${contest.requirements}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="timetable">大赛流程</label>
                        <div class="textarea">
                            <textarea class="form-control" id="timetable" name="timetable" rows="6">${contest.timetable}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="prizes">奖项设置</label>
                        <div class="textarea">
                            <textarea class="form-control" id="prizes" name="prizes" rows="6">${contest.prizes}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="committee">组委会简介</label>
                        <div class="textarea">
                            <textarea class="form-control" id="committee" name="committee" rows="6">${contest.committee}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="host_organizers">主办单位</label>
                        <div class="textarea">
                            <textarea class="form-control" id="host_organizers" name="host_organizers" rows="6">${contest.host_organizers}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="organizers">承办单位</label>
                        <div class="textarea">
                            <textarea class="form-control" id="organizers" name="organizers" rows="6">${contest.organizers}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="co_organizers">协办单位</label>
                        <div class="textarea">
                            <textarea class="form-control" id="co_organizers" name="co_organizers" rows="6">${contest.co_organizers}</textarea>
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