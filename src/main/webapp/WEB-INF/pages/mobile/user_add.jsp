<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<c:import url="head.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <c:import url="nav.jsp"/>
            <div class="row">
                <div class="col-sm-3">
                    <c:import url="left.jsp"/>
                </div>
                <div class="col-sm-9">
                    <h4 class="page-title">我的考试
                        <small>My Examines</small>
                    </h4>
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="widget">
                                <header>
                                    <div class="widget-controls">
                                    </div>
                                </header>
                                <div class="body">
                                    <form:form class="form-horizontal" commandName="AddUserForm">
                                        <fieldset>
                                            <legend class="section">帐号信息</legend>
                                            <div class="form-group">
                                                <label for="username" class="col-sm-2 control-label">用户名 *</label>

                                                <div class="col-sm-8">
                                                    <form:input required="required" data-parsley-trigger="change" data-parsley-minlength="5"
                                                                data-parsley-maxlength="20" class="form-control input-transparent" path="username"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="password" class="col-sm-2 control-label">密码 *</label>

                                                <div class="col-sm-8">
                                                    <form:password required="required" data-parsley-trigger="change" data-parsley-minlength="5"
                                                                   data-parsley-maxlength="20" class="form-control input-transparent"
                                                                   path="password"/>
                                                </div>
                                            </div>
                                            <legend class="section">基本信息</legend>
                                            <div class="form-group">
                                                <label for="name" class="col-sm-2 control-label">姓名 *</label>

                                                <div class="col-sm-8">
                                                    <form:input required="required" data-parsley-trigger="change" data-parsley-minlength="2"
                                                                data-parsley-maxlength="20" class="form-control input-transparent" path="name"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="institution" class="col-sm-2 control-label">机构</label>

                                                <div class="col-sm-8">
                                                    <form:select data-style="btn-default"
                                                                 class="selectpicker" path="institution"
                                                                 items="${sites}"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="col-sm-2 control-label">邮箱</label>

                                                <div class="col-sm-8">
                                                    <form:input class="form-control input-transparent" path="email"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="phone" class="col-sm-2 control-label">电话</label>

                                                <div class="col-sm-8">
                                                    <form:input class="form-control input-transparent" path="phone"/>
                                                </div>
                                            </div>
                                            <legend class="section">学业信息</legend>
                                            <div class="form-group">
                                                <label for="team" class="col-sm-2 control-label">班级</label>

                                                <div class="col-sm-8">
                                                    <form:input class="form-control input-transparent" path="team"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="grade" class="col-sm-2 control-label">年级</label>

                                                <div class="col-sm-8">
                                                    <form:input class="form-control input-transparent" path="grade"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="school" class="col-sm-2 control-label">学校</label>

                                                <div class="col-sm-8">
                                                    <form:input class="form-control input-transparent" path="school"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-1">
                                                    <button id="submit_button" type="button" class="btn btn-success">
                                                        提交
                                                    </button>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </form:form>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="bottom.jsp"/>
<script>
    $(function () {
        $('#AddUserForm').parsley();
        $('#submit_button').click(function () {
            $.ajax({
                cache: false,
                type: "POST",
                url: "/mobile/user/add",
                data: $('#AddUserForm').serialize(),
                async: false,
                error: function (XMLHttpRequest) {
                    Messenger().post({message: "error:" + XMLHttpRequest.status, type: "error"});
                },
                success: function (data) {
                    Messenger().post(data.message);
                }
            });
        });
    });
</script>
