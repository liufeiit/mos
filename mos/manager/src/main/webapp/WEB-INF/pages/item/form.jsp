<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="form_type" value="${item.id > 0 ? '编辑景观案例' : '新建景观案例'}"/>

<head>
    <title>${form_type} - 景观云图后台管理系统</title>

    <script src="resources/item/form.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/libs/jquery/uploadify/uploadify.css" />
    <link rel="stylesheet" type="text/css" href="resources/item/form.css" />
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>景观案例管理<small>${form_type}</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="item/list"><i class="fa fa-user"></i> 景观案例管理</a></li>
        <li class="active">${form_type}</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div id="warning-box" class="alert alert-warning" style="display: none;">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Warning!</strong><span id="warning-content"></span>
        </div>
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">${form_type}</h3>
            </div>
            <form role="form" autocomplete="off" action="${item.id > 0 ? 'item/edit' : 'item/add'}" method="POST">
                <input type="hidden" name="id" value="${item.id}" />
                <input type="hidden" name="type" value="${empty item.id ? 2 : item.type}" />
                <div class="box-body">
	                <ul class="nav nav-tabs">
                        <li class="active"><a href="#item-general" data-toggle="tab">基本属性</a></li>
                        <li><a href="#item-media" data-toggle="tab">图片</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="item-general" class="tab-pane active">
                            <div class="form-group">
                                <label>标题<span class="required-flag">*</span></label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-edit"></i>
                                    </div>
                                    <input name="title" type="text" class="form-control" id="title" value="${item.title}" placeholder="标题">
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
                                            <option value="1" ${ 1 == item.status ? 'selected' : ''}>活动的</option>
                                            <option value="0" ${ 0 == item.status ? 'selected' : ''}>冻结的</option>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>分类</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-tag"></i>
                                    </div>
                                     <select name="category_id" class="form-control">
                                        <optgroup label="请选择分类">
                                          <c:forEach items="${categories}" var="category">
                                            <option value="${category.id}" ${ category.id == item.category_id ? 'selected' : ''}>${category.name}</option>
                                          </c:forEach>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>区域分类</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-sitemap"></i>
                                    </div>
                                     <select name="area_category_id" class="form-control">
                                        <optgroup label="请选择区域分类">
                                          <c:forEach items="${areaCategories}" var="areaCategory">
                                            <option value="${areaCategory.id}" ${ areaCategory.id == item.area_category_id ? 'selected' : ''}>${areaCategory.name}</option>
                                          </c:forEach>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>风格</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-thumb-tack"></i>
                                    </div>
                                     <select name="style_id" class="form-control">
                                        <optgroup label="请选择风格">
                                          <c:forEach items="${styles}" var="style">
                                            <option value="${style.id}" ${ style.id == item.style_id ? 'selected' : ''}>${style.name}</option>
                                          </c:forEach>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>设计师</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <input name="designer" type="text" class="form-control" id="designer" value="${item.designer}" placeholder="设计师">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>设计师联系方式</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-mobile"></i>
                                    </div>
                                    <input name="designer_contact" type="text" class="form-control" id="designer_contact" value="${item.designer_contact}" placeholder="设计师联系方式">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>施工者</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-users"></i>
                                    </div>
                                    <input name="constructor" type="text" class="form-control" id="constructor" value="${item.constructor}" placeholder="施工者">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>施工者联系方式</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-mobile"></i>
                                    </div>
                                    <input name="constructor_contact" type="text" class="form-control" id="constructor_contact" value="${item.constructor_contact}" placeholder="施工者联系方式">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>描述<span class="required-flag">*</span></label>
                                <div class="textarea">
                                    <textarea class="form-control" id="description" name="description" rows="6">${item.description}</textarea>
                                </div>
                            </div>
                        </div>
                        <div id="item-media" class="tab-pane">
                            <div class="form-group">
                                <label>封皮<span class="required-flag">*</span></label>
                                <div class="input-group">
                                    <div id="cover-img" style="padding-bottom: 10px">
                                        <input type="hidden" id="cover_media" name="cover_media" value="${item.cover_media.path}">
                                        <c:if test="${!empty item.cover_media}">
                                            <img style="height: 230px" src="${item.cover_media.url}" class="img-rounded"/>
                                        </c:if>
                                    </div>
                                    <div>
                                        <input type="file" class="select-image" id="select-icon">
                                    </div>
                                </div>
                            </div>
                            <!-- media start-->
                            <table id="media-list" class="table table-bordered table-list" data-max-count="8">
                                <thead>
                                    <tr>
                                        <th class="col-image">图片</th>
                                        <th class="col-action"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${item.medias}" var="media" varStatus="itemStatus">
                                    <tr data-index="${itemStatus.count - 1}">
                                        <td class="col-image">
                                            <input type="hidden" id="media-url-${itemStatus.count - 1}" name="medias" value="${media.path}">
                                            <div class="upload-container clearfix">
                                                <div class="image-group thumbnail ">
                                                    <span class="default-image fa fa-picture-o"></span>
                                                    <img class="preview-image" src="${media.url}">
                                                    <span class="image-delete"></span>
                                                </div>
                                                <div>
                                                    <input type="file" class="media-image-file" id="media-file-${itemStatus.count - 1}">
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-success remove-btn">删除</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="clearfix">
                                <button id="btn-add-media" type="button" class="btn btn-success">添加图片</button>
                            </div>
                            <!-- media end -->
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