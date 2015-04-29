<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="form_type" value="${item.id > 0 ? '编辑植物手册' : '新建植物手册'}"/>

<head>
    <title>${form_type} - 景观云图后台管理系统</title>

    <script src="resources/plant/form.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/libs/jquery/uploadify/uploadify.css" />
    <link rel="stylesheet" type="text/css" href="resources/plant/form.css" />
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>植物手册管理<small>${form_type}</small></h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="plant/list">植物手册管理</a></li>
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
            <form role="form" autocomplete="off" action="${plant.id > 0 ? 'plant/edit' : 'plant/add'}" method="POST">
                <input type="hidden" name="id" value="${plant.id}" />
                <div class="box-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#item-general" data-toggle="tab">基本属性</a></li>
                        <li><a href="#item-link" data-toggle="tab">关系</a></li>
                        <li><a href="#item-media" data-toggle="tab">图片</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="item-general" class="tab-pane active">
                            <div class="form-group">
                                <label>学名（中文）<span class="required-flag">*</span></label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-edit"></i>
                                    </div>
                                    <input name="name_cn" type="text" class="form-control" id="name_cn" value="${plant.name_cn}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>学名（英文）</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-edit"></i>
                                    </div>
                                    <input name="name_en" type="text" class="form-control" id="name_en" value="${plant.name_en}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>别名</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-edit"></i>
                                    </div>
                                    <input name="alias_name" type="text" class="form-control" id="alias_name" value="${plant.alias_name}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>类型</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-tag"></i>
                                    </div>
                                     <select name="cat_id" class="form-control">
                                        <optgroup label="请选择类型">
                                          <c:forEach items="${plantCategories}" var="category">
                                            <option value="${category.id}" ${ category.id == plant.cat_id ? 'selected' : ''}>${category.name}</option>
                                          </c:forEach>
                                        </optgroup>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>科属</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-edit"></i>
                                    </div>
                                    <input name="genus" type="text" class="form-control" id="genus" value="${plant.genus}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>习性</label>
                                <div class="textarea">
                                    <textarea class="form-control" id="habits" name="habits" rows="6">${plant.habits}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>园林用途</label>
                                <div class="textarea">
                                    <textarea class="form-control" id="garden_utilization" name="garden_utilization" rows="6">${plant.garden_utilization}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>适用地区</label>
                                <div class="textarea">
                                    <textarea class="form-control" id="area_applicable" name="area_applicable" rows="6">${plant.area_applicable}</textarea>
                                </div>
                            </div>
                        </div>
                        <div id="item-link" class="tab-pane">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-color">观赏色</label>
                                <div class="col-sm-10">
                                    <input type="text" id="input-color" placeholder="观赏色" class="form-control">
                                    <ul id="plantColors" class="dropdown-menu" style="top: 35px; left: 15px; display: none;">
                                      <c:forEach items="${plantColors}" var="plantColor">
                                        <li data-value="${plantColor.id}" data-label="${plantColor.color}">${plantColor.color}</li>
                                      </c:forEach>
                                    </ul>
                                    <div id="plant-color" class="well well-sm" style="height: 150px; overflow: auto;">
                                      <c:forEach items="${plant.colors}" var="color">
                                        <div id="plant-color${color.id}"><i class="fa fa-minus-circle"></i> ${color.color}<input type="hidden" name="colors" value="${color.id}"></div>
                                      </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-period">观赏期</label>
                                <div class="col-sm-10">
                                    <input type="text" id="input-period" placeholder="观赏期" class="form-control">
                                    <ul id="plantPeriods" class="dropdown-menu" style="top: 35px; left: 15px; display: none;">
                                      <c:forEach items="${plantPeriods}" var="plantPeriod">
                                        <li data-value="${plantPeriod.id}" data-label="${plantPeriod.period}">${plantPeriod.period}</li>
                                      </c:forEach>
                                    </ul>
                                    <div id="plant-period" class="well well-sm" style="height: 150px; overflow: auto;">
                                      <c:forEach items="${plant.periods}" var="period">
                                        <div id="plant-period${period.id}"><i class="fa fa-minus-circle"></i> ${period.period}<input type="hidden" name="periods" value="${period.id}"></div>
                                      </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="item-media" class="tab-pane">
                            <div class="form-group">
                                <label>封皮<span class="required-flag">*</span></label>
                                <div class="input-group">
                                    <div id="cover-img" style="padding-bottom: 10px">
                                        <input type="hidden" id="cover_media" name="cover_media" value="${plant.cover_media.path}">
                                        <c:if test="${!empty plant.cover_media}">
                                            <img style="height: 230px" src="${plant.cover_media.url}" class="img-rounded"/>
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
                                    <c:forEach items="${plant.medias}" var="media" varStatus="itemStatus">
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