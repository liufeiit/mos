<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="form_type" value="${contest_news.id > 0 ? '编辑新闻动态' : '新建新闻动态'}"/>
<head>
    <title>${form_type} - 景观云图后台管理系统</title>

    <script src="resources/contest/news_form.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/libs/kindeditor/themes/default/default.css" />
    <script src="resources/libs/kindeditor/kindeditor-min.js"></script>
    <script src="resources/libs/kindeditor/lang/zh_CN.js"></script>
    <script>
    KindEditor.ready(function(K) {
        K.create('textarea[name="content"]', {
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
            <form role="form" autocomplete="off" action="${contest_news.id > 0 ? 'contest_news/edit' : 'contest_news/add'}" method="POST">
                <input type="hidden" name="id" value="${contest_news.id}" />
                <div class="box-body">
                    <div class="form-group">
                        <label for="title">新闻标题<span class="required-flag">*</span></label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-edit"></i>
                            </div>
                            <input name="title" type="text" class="form-control" id="title" value="${contest_news.title}" placeholder="新闻标题">
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
                                    <option value="${contest.id}" ${contest.id == contest_news.contest_id ? 'selected' : ''}>${contest.title}</option>
                                  </c:forEach>
                                </optgroup>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content">新闻内容<span class="required-flag">*</span></label>
                        <div class="textarea">
                            <textarea class="form-control" id="content" name="content" rows="6">${contest_news.content}</textarea>
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