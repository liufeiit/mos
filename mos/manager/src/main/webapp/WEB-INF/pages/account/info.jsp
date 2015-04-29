<%@ page language="java" pageEncoding="UTF-8"
    contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <title>账号信息- 景观云图后台管理系统</title>

    <script src="resources/account/info.js"></script>
</head>

<!-- Bread line. -->
<section class="content-header">
    <h1>账号信息</h1>
    <ol class="breadcrumb">
        <li><a href="homePage"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">账号信息</li>
    </ol>
</section>
<!-- Content. -->
<section class="content">
    <div class="row">
        <div class="alert alert-success" style="${success ? '' :'display: none;'}">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Well done!</strong> 密码修改成功!
        </div>
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">个人资料</h3>
            </div>
            <form role="form" autocomplete="off" action="password/change" method="POST">
                <div class="box-body">
                    <div class="form-group">
                        <label for="name">用户名</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </div>
                            <input name="name" type="text" class="form-control" id="name" value="${account.name}" disabled="disabled"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">电子邮件</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-inbox"></i>
                            </div>
                            <input name="email" type="text" class="form-control" id="email" value="${account.email}" disabled="disabled"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="roleName">角色</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </div>
                            <input name="roleName" type="text" class="form-control" id="roleName" value="${account.roleName}" disabled="disabled" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="passwrd">密码</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-key"></i>
                            </div>
                            <input name="passwrd" type="password" class="form-control" id="passwrd" placeholder="请输入密码" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirmPasswrd">确认密码</label>
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-key"></i>
                            </div>
                            <input name="confirmPasswrd" type="password" class="form-control" id="confirmPasswrd" placeholder="请再次输入密码">
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <div class="form-group">
                        <button type="submit" id="frm_submit" class="btn btn-primary">确认修改</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
