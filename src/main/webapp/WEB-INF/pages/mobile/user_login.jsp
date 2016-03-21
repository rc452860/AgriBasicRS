<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<c:import url="head.jsp"/>
<div class="single-widget-container">
    <section class="widget login-widget">
        <header class="text-align-center">
            <h4>360多维测试平台</h4>
        </header>
        <div class="body">
            <form:form class="no-margin" commandName="LoginForm">
                <fieldset>
                    <div class="form-group">
                        <label for="username">帐号</label>

                        <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </span>
                            <form:input path="username" type="email" class="form-control input-lg input-transparent"
                                        placeholder="Your Account"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>

                        <div class="input-group input-group-lg">
                                    <span class="input-group-addon">
                                        <i class="fa fa-lock"></i>
                                    </span>
                            <form:input path="password" type="password" class="form-control input-lg input-transparent"
                                           placeholder="Your Password"/>
                        </div>
                    </div>
                </fieldset>
                <div class="form-actions">
                    <button id="submit_button" type="button" class="btn btn-block btn-lg btn-danger">
                        <span class="small-circle"><i class="fa fa-caret-right"></i></span>
                        <small>登录系统</small>
                    </button>
                    <a class="forgot" href="#">忘记密码？</a>
                </div>
            </form:form>
        </div>
        <footer>
            <div class="facebook-login">
                <a href="index.html"><span>注册新用户</span></a>
            </div>
        </footer>
    </section>
</div>
<c:import url="bottom.jsp"/>
<script>
    $(function () {
        $('#submit_button').click(function () {
            $.ajax({
                cache: false,
                type: "POST",
                url: "/mobile/login",
                data: $('#LoginForm').serialize(),
                async: false,
                error: function (XMLHttpRequest) {
                    alert("error:" + XMLHttpRequest.status);
                },
                success: function (data) {
                    if(data.message != null) alert(data.message);
                    if(data.url != null) window.location.href = data.url;
                }
            });
        });
    });
</script>
